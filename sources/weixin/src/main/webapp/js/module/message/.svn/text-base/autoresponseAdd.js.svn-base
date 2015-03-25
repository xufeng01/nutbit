$(function() {
	
	SelectOption.loadTemlateType("msgtype");
	var msgtype=$('#msgtype').val();
	if(msgtype=='news'){
		SelectOption.loadTemplate("templateid","news");
	}else{
		SelectOption.loadTemplate("templateid","text");
	}
	
	$('#msgtype').bind("change",function(){
		SelectOption.loadTemplate("templateid",$('#msgtype').val());
	});
	
	$("#dataform").validate({
        submitHandler:function(form){
        	$.ajax({
    			type : 'post',
    			url : 'rest/message/autoresponse/save',
    			dataType : 'json',
    			data : $("#dataform").serialize(),
    			async : true,
    			success : function(data) {
    			  if(data.success==true){
    				alert(data.msg);
    				parent.window.location.href=url+"rest/message/autoresponse";	  
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