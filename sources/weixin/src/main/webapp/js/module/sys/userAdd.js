$(function() {
	
	SelectTree.loadOrgSelect("orgid","请选择");
	if($('#userid').val()!=""){//编辑界面
		$('#loginname').attr("readOnly","true");
		$("#passwordlabel").html("重置密码");
		$("#password").val("");
		$('#password').attr("class","");
	}
	
	$("#dataform").validate({
        submitHandler:function(form){
        	$.ajax({
    			type : 'post',
    			url : 'rest/sys/user/save',
    			dataType : 'json',
    			data : $("#dataform").serialize(),
    			async : true,
    			success : function(data) {
    			  if(data.success==true){
    				alert(data.msg);
    				parent.window.location.href=url+"rest/sys/user";	  
    				parent.closeDialog();
    			  }
    			},
    			error : function() {
    				alert("网络异常");
    			}
    		});	
            return false;
        }    
    });
	
	//返回
	$("#back").bind("click",function(){
		parent.closeDialog();
	});	
	
		
});