$(document).ready(function() {
	
	var columns = [[
					{field:'textid',title:'id',width:0,hidden:true},
					{field:'textcontent',title:'接收内容',width:$(window).width()*0.2,align:'center'},
					{field:'addtimeStr',title:'接收时间',width:$(window).width()*0.2,align:'center'}
					]];
	 $("#datagridList").datagrid({
		    autowidth:true,
	        nowrap: false,//是否只显示一行，即文本过多是否省略部分。
	        striped: true,
	        rownumbers: true,
	        url:'rest/message/receivetext/list',
	        queryParams:{textcontent:""},
	        pageList:[5,10,15,20,25],//每一页显示的记录数,对就后台接收的rows account
	        pageNumber:1,//当前页码
	        loadMsg:'正在加载......',
	        fitColumns: true,
	        singleSelect:true,
		    columns:columns,
		    onClickRow: function (rowIndex, rowData) {
		    	reloadItemGrid(rowData.templateid);
            },
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


//刷新datagrid
function reloadDataGrid(){
	 var keyword=$("#textcontent").val();
	 $('#datagridList').datagrid('reload',{page:1,textcontent:textcontent});
}
