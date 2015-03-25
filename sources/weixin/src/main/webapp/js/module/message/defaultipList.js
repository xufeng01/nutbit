$(document).ready(function() {
	var columns = [[
						{field:'defaultid',title:'id',width:0,hidden:true},
						{field:'templatename',title:'模板名称',width:$(window).width()*0.2,align:'center'},
						{field:'msgtype',title:'模板类型',width:$(window).width()*0.2,align:'center',
							formatter:function(v,r){
								if(v=="text"){
									return "文本";
								}else{
									return "图文";
								}
							}
						},
						{field:'edit',title:'编辑',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"edit(\''+r.defaultid+'\');\"><img src=\'images/list_bj.png\' alt="编辑" /></a>';
							}	
						},
						{field:'del',title:'删除',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"del(\''+r.defaultid+'\');\"><img src=\'images/list_del.png\' alt="编辑" /></a>';
							}	
						}
						]];
	 $("#datagridList").datagrid({
		    autowidth:true,
	        nowrap: false,//是否只显示一行，即文本过多是否省略部分。
	        striped: true,
	        url:'rest/message/defaultip/list',
	        loadMsg:'正在加载......',
	        fitColumns: true,
	        singleSelect:true,
		    columns:columns,
		    toolbar:['-',{
				text:'添加',
				iconCls:'icon-add',
				handler:function(){
					add();
				}
		    }],
	 });
	 
	//查询按钮单击事件
	 $("#btn_search").bind("click" ,function(){
	 	reloadDataGrid();
	 });
	 
	// 第一次加载时自动变化大小  
	$('#datagridList').resizeDataGrid();  
	// 当窗口大小发生变化时，调整DataGrid的大小  
	$(window).resize(function() {  
	     $('#datagridList').resizeDataGrid();  
	}); 	  
});

//新增
function add(){
	$.ajax({ 
		url:"rest/account/validate",
		type:'post',
		dataType:'json',
		success: function(json){
			if(json.success==true){
				$.ajax({ 
					url:"rest/message/defaultip/list",
					type:'post',
					dataType:'json',
					success: function(json){
						if(json.length>0){
							alert("只能设置一条关默认提示信息！");
						}else{
							showDialog(url+"rest/message/defaultip/add",500,250,"默认提示新增");
						}
					}
				});
				
			}else{
				alert(json.msg);
			}
			
			
		}
    });

}

//编辑
function edit(id){
	showDialog(url+"rest/message/defaultip/edit/"+id,500,250,"默认提示编辑");
};
//删除
function del(id){
	
	$.messager.confirm("提示信息","确认删除吗？",function(flag){
		if(flag){
			$.ajax({ 
				url:"rest/message/defaultip/delete/"+id,
				type:'post',
				dataType:'json',
				success: function(json){
					if(json.success==true){
						alert(json.msg);
						reloadDataGrid();
					}else{
						alert(json.msg);
					}
				}
		    });
		}
	});
}

//刷新datagrid
function reloadDataGrid(){
	 $('#datagridList').datagrid('reload',{});
}

