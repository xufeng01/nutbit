$(document).ready(function() {
	
	var columns = [[
	                	{filed:'ck',checkbox:true},
						{field:'userid',title:'id',width:0,hidden:true},
						{field:'username',title:'用户名称',width:$(window).width()*0.2,align:'center',
							formatter:function(value,row,index){
								return '<a href="javascript:;" onclick="display(\''+row.userid+'\')">'+value+'</a>';
							}
						},
						{field:'loginname',title:'登陆账户',width:$(window).width()*0.1,align:'center'},
						{field:'orgname',title:'机构名称',width:$(window).width()*0.1,align:'center'},
						{field:'edit',title:'编辑',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"edit(\''+r.userid+'\');\"><img src=\'images/list_bj.png\' alt="编辑" /></a>';
							}	
						},
						{field:'del',title:'删除',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"del(\''+r.userid+'\');\"><img src=\'images/list_del.png\' alt="编辑" /></a>';
							}	
						}
						]];
	 $("#datagridList").datagrid({
		    autowidth:true,
	        nowrap: false,//是否只显示一行，即文本过多是否省略部分。
	        striped: true,
	        rownumbers: true,
	        url:'rest/sys/user/list',
	        queryParams:{username:""},
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
				text:'分配角色',
				iconCls:'icon-tip',
				handler:function(){
					toRole();
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
	showDialog(url+"rest/sys/user/add",800,350,"用户信息新增");
}

function toRole(){
	var rows = $('#datagridList').datagrid('getSelections');
	if(rows.length==0){
		alert("请选择用户！");
		return;
	}
	showDialog(url+"rest/sys/user/userrole/"+rows[0].userid,800,350,"分配角色");
}

//编辑
function edit(id){
	showDialog(url+"rest/sys/user/edit/"+id,800,350,"用户信息编辑");
};
//删除
function del(id){
	
	$.messager.confirm("提示信息","确认删除吗？",function(flag){
		if(flag){
			$.ajax({ 
				url:"rest/sys/user/delete/"+id,
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
	showDialog(url+"rest/sys/user/display/"+id,800,350,"用户信息查看");
}

//刷新datagrid
function reloadDataGrid(){
	 var username=$("#username").val();
	 $('#datagridList').datagrid('reload',{page:1,username:username});
}

