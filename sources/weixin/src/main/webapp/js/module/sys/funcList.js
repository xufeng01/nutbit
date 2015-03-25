$(document).ready(function() {
	
	//树设置参数配置
	var setting = {
		data : {
			simpleData : {
				enable : true
			}
		},
		callback: {
			onClick: onClick
		}
	};
	
	// 单击叶子事件
	function onClick(event, treeId, treeNode, clickFlag) {
		$('#funcid').val(treeNode.id);
		 reloadDataGrid();
	};	
	
	//加载左侧树
	$.ajax({//加载行政区划树
		type : 'Get',
		url : 'rest/sys/func/loadFuncTree',
		cache : false,
		dataType : 'json',
		global : false,
		async : false,
		success : function(map) {
			var treeObj=$.fn.zTree.init($("#ztree"), setting, map);
			treeObj.selectNode(treeObj.getNodes()[0]);
			treeObj.expandAll(true);
			$('#funcid').val(0);
		},
		error : function() {
			alert("网络异常");
		}
	});
	
	var columns = [[
						{field:'funcid',title:'id',width:0,hidden:true},
						{field:'funcname',title:'权限名称',width:$(window).width()*0.2,align:'center'},
						{field:'funcurl',title:'菜单链接',width:$(window).width()*0.2,align:'center'},
						{field:'funclevel',title:'菜单级别',width:$(window).width()*0.1,align:'center',
							formatter:function(value,row,index){
								if(value==0){
									return "一级菜单";
								}else{
									return "二级菜单";
								}
							}
						},
						{field:'funcorder',title:'排序',width:$(window).width()*0.1,align:'center'},
						{field:'edit',title:'编辑',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"edit(\''+r.funcid+'\');\"><img src=\'images/list_bj.png\' alt="编辑" /></a>';
							}	
						},
						{field:'del',title:'删除',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"del(\''+r.funcid+'\');\"><img src=\'images/list_del.png\' alt="编辑" /></a>';
							}	
						}
						]];
	 $("#datagridList").datagrid({
		    autowidth:true,
	        nowrap: false,//是否只显示一行，即文本过多是否省略部分。
	        striped: true,
	        rownumbers: true,
	        url:'rest/sys/func/list',
	        queryParams:{funcname:"",funcid:"0"},
	        pageList:[5,10,15,20,25],//每一页显示的记录数,对就后台接收的rows account
	        pageNumber:1,//当前页码
	        loadMsg:'正在加载......',
	        fitColumns: true, 
	        animate:true,
	        collapsible:true,
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
	$('#datagridList').resizeDataGrid2();  
	// 当窗口大小发生变化时，调整DataGrid的大小  
	$(window).resize(function() {  
	     $('#datagridList').resizeDataGrid2();  
	}); 	  
});

//新增
function add(){
	showDialog(url+"rest/sys/func/add/"+$('#funcid').val(),800,350,"权限信息新增");
}

//编辑
function edit(id){
	showDialog(url+"rest/sys/func/edit/"+id,800,350,"权限信息编辑");
};
//删除
function del(id){
	
	$.messager.confirm("提示信息","确认删除吗？",function(flag){
		if(flag){
			$.ajax({ 
				url:"rest/sys/func/delete/"+id,
				type:'post',
				dataType:'json',
				success: function(json){
					if(json.success==true){
						alert(json.msg);
						window.location.href=url+"rest/sys/func";
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
	showDialog(url+"rest/sys/func/display/"+id,800,350,"权限信息查看");
}

//刷新datagrid
function reloadDataGrid(){
	 var funcname=$("#funcname").val();
	 var funcid=$("#funcid").val();
	 $('#datagridList').datagrid('reload',{page:1,funcname:funcname,funcid:funcid});
}

