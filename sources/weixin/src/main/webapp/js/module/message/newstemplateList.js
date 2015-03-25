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
	        url:'rest/message/newstemplate/list',
	        queryParams:{templatename:""},
	        pageList:[5,10,15,20,25],//每一页显示的记录数,对就后台接收的rows account
	        pageNumber:1,//当前页码
	        loadMsg:'正在加载......',
	        fitColumns: true,
	        singleSelect:true,
		    columns:columns,
		    toolbar:['-',{
				text:'添加模板',
				iconCls:'icon-add',
				handler:function(){
					add();
				}
		    }],
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
	$('#datagridList').resizeCurrentDataGrid();  
	// 当窗口大小发生变化时，调整DataGrid的大小  
	$(window).resize(function() {  
	     $('#datagridList').resizeCurrentDataGrid();  
	});
	
	
	var columns2 = [[
					{field:'itemid',title:'id',width:0,hidden:true},
					{field:'templateid',title:'templateid',width:0,hidden:true},
					{field:'title',title:'标题',width:$(window).width()*0.2,align:'center'},
					{field:'edit',title:'编辑',width:$(window).width()*0.1,align:'center',
						formatter:function(v,r){//参数1点击只；参数2 整行对象
							return '<a href=\"javascript:;\" onclick=\"editItem(\''+r.itemid+'\');\"><img src=\'images/list_bj.png\' alt="编辑" /></a>';
						}	
					},
					{field:'del',title:'删除',width:$(window).width()*0.1,align:'center',
						formatter:function(v,r){//参数1点击只；参数2 整行对象
							return '<a href=\"javascript:;\" onclick=\"delItem(\''+r.itemid+'\',\''+r.templateid+'\');\"><img src=\'images/list_del.png\' alt="编辑" /></a>';
						}	
					}
					]];
	 $("#itemgridList").datagrid({
		    autowidth:true,
	        nowrap: false,//是否只显示一行，即文本过多是否省略部分。
	        striped: true,
	        rownumbers: true,
	        url:'rest/message/newsitem/list',
	        queryParams:{templatename:""},
	        pageNumber:1,//当前页码
	        loadMsg:'正在加载......',
	        fitColumns: true,
	        singleSelect:true,
		    columns:columns2,
		    toolbar:['-',{
				text:'添加图文项',
				iconCls:'icon-add',
				handler:function(){
					addItem();
				}
		    }],
	 });
 
	 //第一次加载时自动变化大小  
	$('#itemgridList').resizeCurrentDataGrid();  
	// 当窗口大小发生变化时，调整DataGrid的大小  
	$(window).resize(function() {  
	     $('#itemgridList').resizeCurrentDataGrid();  
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
				showDialog(url+"rest/message/newstemplate/add",500,250,"模板新增");
			}else{
				alert(json.msg);
			}
		}
    });

}

//编辑
function edit(id){
	showDialog(url+"rest/message/newstemplate/edit/"+id,500,250,"模板编辑");
};
//删除
function del(id){
	
	$.messager.confirm("提示信息","确认删除吗？",function(flag){
		if(flag){
			$.ajax({ 
				url:"rest/message/newstemplate/delete/"+id,
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

//刷新图文项
function reloadItemGrid(templateid){
	 $('#itemgridList').datagrid('reload',{templateid:templateid});
}

function addItem(){
	 var rowData = $('#datagridList').datagrid('getSelected');
	 if(!rowData){
		 alert("请选择图文模板");
	 }else{
		 //弹出框
		 $.ajax({ 
				url:"rest/message/newsitem/list",
				type:'post',
				data:{'templateid':rowData.templateid},
				dataType:'json',
				success: function(json){
					if(json.length<10){
						window.location=url+"rest/message/newsitem/add/"+rowData.templateid;
					}else{
						alert("最多只能生成10条图文项!");
					}
				}
		    });
	 }
}

//编辑
function editItem(id){
	window.location=url+"rest/message/newsitem/edit/"+id;
};
//删除
function delItem(id,templateid){
	
	$.messager.confirm("提示信息","确认删除吗？",function(flag){
		if(flag){
			$.ajax({ 
				url:"rest/message/newsitem/delete/"+id,
				type:'post',
				dataType:'json',
				success: function(json){
					if(json.success==true){
						alert(json.msg);
						reloadItemGrid(templateid);
					}else{
						alert(json.msg);
					}
				}
		    });
		}
	});
}


$.fn.extend({
	/** 
     * 修改DataGrid对象的默认大小，以适应页面宽度。 
     *  
     * @param heightMargin 
     *            高度对页内边距的距离。 
     * @param widthMargin 
     *            宽度对页内边距的距离。 
     * @param minHeight 
     *            最小高度。 
     * @param minWidth 
     *            最小宽度。 
     *  
     */  
	 resizeCurrentDataGrid : function() {  
	        var height = $(parent.document.body).height()*0.72;  
	        var width = $(document.body).width()-15;  
	  
	        $(this).datagrid('resize', {  
	            height : height/2,  
	            width : width
	        });  
	    }  
}); 

