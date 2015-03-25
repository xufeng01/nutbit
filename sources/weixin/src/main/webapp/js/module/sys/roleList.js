$(document).ready(function() {
	
	var columns = [[
	                	{filed:'ck',checkbox:true},
						{field:'roleid',title:'id',width:0,hidden:true},
						{field:'rolename',title:'角色名称',width:$(window).width()*0.2,align:'center',
							formatter:function(value,row,index){
								return '<a href="javascript:;" onclick="display(\''+row.roleid+'\')">'+value+'</a>';
							}
						},
						{field:'edit',title:'编辑',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"edit(\''+r.roleid+'\');\"><img src=\'images/list_bj.png\' alt="编辑" /></a>';
							}	
						},
						{field:'del',title:'删除',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"del(\''+r.roleid+'\');\"><img src=\'images/list_del.png\' alt="编辑" /></a>';
							}	
						}
						]];
	 $("#datagridList").datagrid({
		    autowidth:true,
	        nowrap: false,//是否只显示一行，即文本过多是否省略部分。
	        striped: true,
	        rownumbers: true,
	        url:'rest/sys/role/list',
	        queryParams:{rolename:""},
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
		    },'-',{
				text:'分配权限',
				iconCls:'icon-tip',
				handler:function(){
					toFunc();
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
	showDialog(url+"rest/sys/role/add",800,350,"角色信息新增");
}

function toFunc(){
	var rows = $('#datagridList').datagrid('getSelections');
	if(rows.length==0){
		alert("请选择角色！");
		return;
	}
	showDialog(url+"rest/sys/role/rolefunc/"+rows[0].roleid,230,400,"分配权限");
}

//编辑
function edit(id){
	showDialog(url+"rest/sys/role/edit/"+id,800,350,"角色信息编辑");
};
//删除
function del(id){
	
	$.messager.confirm("提示信息","确认删除吗？",function(flag){
		if(flag){
			$.ajax({ 
				url:"rest/sys/role/delete/"+id,
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
//显示
function display(id){
	showDialog(url+"rest/sys/role/display/"+id,800,350,"角色信息查看");
}

//刷新datagrid
function reloadDataGrid(){
	 var rolename=$("#rolename").val();
	 $('#datagridList').datagrid('reload',{page:1,rolename:rolename});
}

