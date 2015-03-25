$(document).ready(function() {
	
	SelectOption.loadEndstate("isend","请选择");
	
	var columns = [[
						{field:'uid',title:'uid',width:$(window).width()*0.1,align:'center'},
						{field:'openid',title:'微信openid',width:$(window).width()*0.1,align:'center'},
						{field:'nickname',title:'昵称',width:$(window).width()*0.2,align:'center'},
						{field:'mcode',title:'机器码',width:$(window).width()*0.2,align:'center'},
						{field:'sncode',title:'序列号',width:$(window).width()*0.2,align:'center'},
						{field:'endDate',title:'有效期',width:$(window).width()*0.2,align:'center'},
						{field:'daycount',title:'剩余天数',width:$(window).width()*0.1,align:'center',
							formatter:function(value,row,index){
								var myDate = new Date();
								var startTime=new Date(myDate.getFullYear(),myDate.getMonth(),myDate.getDate()).getTime();
								
								var arr1 = (row.endDate).split("-");  
								var endTime = new Date(arr1[0],parseInt(arr1[1])-1,arr1[2]).getTime();
								
								var dates = (endTime-startTime)/(1000*60*60*24); 
								if(dates<0){
									return "-";
								}else{
									return dates;
								}
							}
						},
						{field:'dataflag',title:'状态',width:$(window).width()*0.1,align:'center',
							formatter:function(value,row,index){
								var myDate = new Date();
								var mn=myDate.getMonth()+1;
								var m=mn>9?mn:'0'+mn;
								var d=myDate.getDate()>9?myDate.getDate().toString():'0'+myDate.getDate().toString();
								var str=myDate.getFullYear()+"-"+m+"-"+d; 
								if(row.endDate>=str){
									return "未过期";
								}else{
									return "已过期";
								}
							}
						},
						{field:'edit',title:'编辑有效期',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"edit(\''+r.uid+'\');\"><img src=\'images/list_bj.png\' alt="编辑" /></a>';
							}	
						}
						/*,
						{field:'del',title:'删除',width:$(window).width()*0.1,align:'center',
							formatter:function(v,r){//参数1点击只；参数2 整行对象
								return '<a href=\"javascript:;\" onclick=\"del(\''+r.userid+'\');\"><img src=\'images/list_del.png\' alt="编辑" /></a>';
							}	
						}*/
						]];
	 $("#datagridList").datagrid({
		    autowidth:true,
	        nowrap: false,//是否只显示一行，即文本过多是否省略部分。
	        striped: true,
	        rownumbers: true,
	        url:'rest/snuser/list',
	        queryParams:{nickname:"",mcode:"",isend:""},
	        pageList:[5,10,15,20,25],//每一页显示的记录数,对就后台接收的rows account
	        pageNumber:1,//当前页码
	        loadMsg:'正在加载......',
	        fitColumns: true,
	        singleSelect:true,
		    columns:columns,
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

//编辑
function edit(uid){
	showDialog(url+"rest/snuser/edit/"+uid,800,350,"修改有效期");
};
//删除
function del(id){
	
	$.messager.confirm("提示信息","确认删除吗？",function(flag){
		if(flag){
			$.ajax({ 
				url:"rest/sn/delete/"+id,
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
	showDialog(url+"rest/snuser/display/"+id,800,350,"会员信息查看");
}

//刷新datagrid
function reloadDataGrid(){
	 var nickname=$("#nickname").val();
	 var mcode=$("#mcode").val();
	 var isend=$("#isend").val();
	 $('#datagridList').datagrid('reload',{page:1,nickname:nickname,mcode:mcode,isend:isend});
}

