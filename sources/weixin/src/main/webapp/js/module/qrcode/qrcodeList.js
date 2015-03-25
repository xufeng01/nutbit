$(document).ready(function() {
	var columns = [[
						{field:'qrcodeid',title:'id',width:0,hidden:true},
						{field:'ticket',title:'ticket',width:0,hidden:true},
						{field:'qrcodetype',title:'二维码类型',width:$(window).width()*0.2,align:'center',
							formatter:function(v,r){
								if(v=="0"){
									return "永久二维码";
								}else{
									return "临时二维码";
								}
							}
						},
						{field:'qrcodedesc',title:'二维码详细信息',width:$(window).width()*0.2,align:'center'},
						{field:'qrcode',title:'二维码',width:$(window).width()*0.3,align:'center',
							formatter:function(v,r){
								if(r.ticket!=null&&r.ticket!=""){
									return "<img width='150' height='150' src='"+url+"rest/qrcode/downqrcode/"+r.qrcodeid+"'>";
								}
							}},
						{field:'sceneid',title:'场景值',width:$(window).width()*0.2,align:'center'},
						{field:'expireSeconds',title:'有效时间',width:$(window).width()*0.2,align:'center'},
						{field:'edit',title:'编辑',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"edit(\''+r.qrcodeid+'\');\"><img src=\'images/list_bj.png\' alt="编辑" /></a>';
							}	
						},
						{field:'del',title:'删除',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"del(\''+r.qrcodeid+'\');\"><img src=\'images/list_del.png\' alt="编辑" /></a>';
							}	
						}
						]];
	 $("#datagridList").datagrid({
		    autowidth:true,
	        nowrap: false,//是否只显示一行，即文本过多是否省略部分。
	        striped: true,
	        url:'rest/qrcode/list',
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
		    	},
		    	'-',{
					text:'获取二维码',
					iconCls:'icon-add',
					handler:function(){
							loadqrcode();
						}
			    	},
			    	'-',{
						text:'下载二维码',
						iconCls:'icon-add',
						handler:function(){
								downqrcode();
							}
				    	}	
		    ],
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
				showDialog(url+"rest/qrcode/add",500,250,"二维码新增");
			}else{
				alert(json.msg);
			}
			
			
		}
    });
}

function loadqrcode(){
	var rowData = $('#datagridList').datagrid('getSelected');
	if(!rowData){
		alert("请选择二维码");
	}else{
		 //ajax请求获取二维码
		$.ajax({ 
			url:"rest/qrcode/loadqrcode/"+rowData.qrcodeid,
			type:'post',
			dataType:'json',
			success: function(json){
				if(json.success==true){
					alert(json.msg);
					window.location=url+"rest/qrcode";
				}else{
					alert(json.msg);
				}
			}
	    });
	}
}

function downqrcode(){
	var rowData = $('#datagridList').datagrid('getSelected');
	if(!rowData){
		alert("请选择二维码");
	}else{
		//下载二维码 
		if(rowData.ticket!=''&&rowData.ticket!=null){
			window.location=url+"rest/qrcode/downqrcode/"+rowData.qrcodeid;
		}else{
			alert("没有二维码图片");
		}
	} 
}

//编辑
function edit(id){
	showDialog(url+"rest/qrcode/edit/"+id,500,250,"二维码编辑");
};
//删除
function del(id){
	
	$.messager.confirm("提示信息","确认删除吗？",function(flag){
		if(flag){
			$.ajax({ 
				url:"rest/qrcode/delete/"+id,
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

