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
		$('#menuid').val(treeNode.id);
		 reloadDataGrid();
	};	
	
	//加载左侧树
	$.ajax({//加载行政区划树
		type : 'Get',
		url : 'rest/menu/loadMenuTree',
		cache : false,
		dataType : 'json',
		global : false,
		async : false,
		success : function(map) {
			var treeObj=$.fn.zTree.init($("#ztree"), setting, map);
			treeObj.selectNode(treeObj.getNodes()[0]);
			treeObj.expandAll(true);
			$('#menuid').val(0);
		},
		error : function() {
			alert("网络异常");
		}
	});
	
	var columns = [[
						{field:'menuid',title:'id',width:0,hidden:true},
						{field:'name',title:'菜单名称',width:$(window).width()*0.2,align:'center'},
						{field:'type',title:'菜单类型',width:$(window).width()*0.2,align:'center',
							formatter:function(v,r){
								return SelectOption.getCodeName(SelectOption.getMenuTypeData(),v);
							}	
						},
						{field:'orders',title:'排序',width:$(window).width()*0.1,align:'center'},
						{field:'edit',title:'编辑',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"edit(\''+r.menuid+'\');\"><img src=\'images/list_bj.png\' alt="编辑" /></a>';
							}	
						},
						{field:'del',title:'删除',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"del(\''+r.menuid+'\');\"><img src=\'images/list_del.png\' alt="编辑" /></a>';
							}	
						}
						]];
	 $("#datagridList").datagrid({
		    autowidth:true,
	        nowrap: false,//是否只显示一行，即文本过多是否省略部分。
	        striped: true,
	        rownumbers: true,
	        url:'rest/menu/list',
	        queryParams:{name:"",menuid:"0"},
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
			    },'-',{
					text:'菜单同步到微信',
					iconCls:'icon-redo',
					handler:function(){
						synchronous();
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
	$.ajax({ 
		url:"rest/account/validate",
		type:'post',
		dataType:'json',
		success: function(json){
			if(json.success==true){
				 var rows = $("#datagridList").datagrid("getRows");
				 if($('#menuid').val()=='0'&&rows.length==3){
					  alert("只能创建3个一级菜单！");
				 }else if($('#menuid').val()!='0'&&rows.length==5){
					 alert("只能创建5个二级菜单！");
				 }else{
					 showDialog(url+"rest/menu/add/"+$('#menuid').val(),800,350,"菜单信息新增");
				 }
			}else{
				alert(json.msg);
			}
		}
    });
}

//菜单同步到微信
function synchronous(){
	$.ajax({ 
		url:"rest/account/validate",
		type:'post',
		dataType:'json',
		success: function(json){
			if(json.success==true){
				$.ajax({ 
					url:"rest/menu/synchronous",
					type:'post',
					dataType:'json',
					success: function(json){
						if(json.success==true){
							alert(json.msg);
						}else{
							alert(json.msg);
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
	showDialog(url+"rest/menu/edit/"+id,800,350,"菜单信息编辑");
};
//删除
function del(id){
	
	$.messager.confirm("提示信息","确认删除吗？",function(flag){
		if(flag){
			$.ajax({ 
				url:"rest/menu/delete/"+id,
				type:'post',
				dataType:'json',
				success: function(json){
					if(json.success==true){
						alert(json.msg);
						window.location.href=url+"rest/menu";
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
	 var name=$("#name").val();
	 var menuid=$("#menuid").val();
	 $('#datagridList').datagrid('reload',{page:1,name:name,menuid:menuid});
}

