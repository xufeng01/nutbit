$(document).ready(function() {
	
	var columns = [[
						{field:'templateid',title:'id',width:0,hidden:true},
						{field:'templatename',title:'模板名称',width:$(window).width()*0.2,align:'center'},
						{field:'edit',title:'编辑',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"edit(\''+r.templateid+'\');\"><img src=\'images/list_bj.png\' alt="编辑" /></a>';
							}	
						},
						{field:'del',title:'删除',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"del(\''+r.templateid+'\');\"><img src=\'images/list_del.png\' alt="编辑" /></a>';
							}	
						}
						]];
	 $("#datagridList").datagrid({
		    autowidth:true,
	        nowrap: false,//是否只显示一行，即文本过多是否省略部分。
	        striped: true,
	        rownumbers: true,
	        url:'rest/message/texttemplate/list',
	        queryParams:{templatename:""},
	        pageList:[5,10,15,20,25],//每一页显示的记录数,对就后台接收的rows account
	        pageNumber:1,//当前页码
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
		   pagination:true //包含分页
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
				showDialog(url+"rest/message/texttemplate/add",500,250,"模板新增");
			}else{
				alert(json.msg);
			}
		}
    });

}

//编辑
function edit(id){
	showDialog(url+"rest/message/texttemplate/edit/"+id,500,250,"模板编辑");
};
//删除
function del(id){
	
	$.messager.confirm("提示信息","确认删除吗？",function(flag){
		if(flag){
			$.ajax({ 
				url:"rest/message/texttemplate/delete/"+id,
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
	 var templatename=$("#templatename").val();
	 $('#datagridList').datagrid('reload',{page:1,templatename:templatename});
}

