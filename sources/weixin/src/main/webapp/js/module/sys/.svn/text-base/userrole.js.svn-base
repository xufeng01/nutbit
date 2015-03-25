$(document).ready(function() {
	
	var columns = [[
	                	{filed:'ck',checkbox:true},
						{field:'roleid',title:'id',width:0,hidden:true},
						{field:'rolename',title:'角色名称',width:$(window).width()*0.1,align:'center'}
						]];
	 $("#datagridList").datagrid({
		    height:315,
	        nowrap: false,//是否只显示一行，即文本过多是否省略部分。
	        striped: true,
	        url:'rest/sys/role/list',
	        queryParams:{rolename:""},
	        pageList:[5,10,15,20,25],//每一页显示的记录数,对就后台接收的rows account
	        pageNumber:1,//当前页码
	        loadMsg:'正在加载......',
	        fitColumns: true,
		    columns:columns,
		    singleSelect:true,
		    toolbar:['-',{
				text:'选择',
				iconCls:'icon-reload',
				handler:function(){
					select();
				}
		    }],
		   pagination:true, //包含分页
		   onLoadSuccess:function(data){
			   var rows=data.rows;
			   for(var i=0;i<rows.length;i++){
				   if(rows[i].roleid==$('#roleid').val()){
					   $('#datagridList').datagrid("selectRow", i);
				   }
			   }
		   }
	 });
	 
});

//选择
function select(){
	var rows = $('#datagridList').datagrid('getSelections');
	if(rows.length==0){
		alert("请选择角色！");
		return;
	}
	
	$.ajax({
		type : 'post',
		url : 'rest/sys/user/userrole/save',
		dataType : 'json',
		data : {userid:$('#userid').val(),roleid:rows[0].roleid},
		async : true,
		success : function(data) {
		  if(data.success==true){
			alert(data.msg);
			parent.closeDialog();
		  }
		},
		error : function() {
			alert("网络异常");
		}
	});	
}