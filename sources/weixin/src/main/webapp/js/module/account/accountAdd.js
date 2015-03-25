$(function() {
	$("#dataform").validate({
        submitHandler:function(form){
        	$.ajax({
    			type : 'post',
    			url : 'rest/account/save',
    			dataType : 'json',
    			data : $("#dataform").serialize(),
    			async : true,
    			success : function(data) {
    			  if(data.success==true){
    				alert(data.msg);
    				window.location.href=url+"rest/account";	  
    			  }
    			},
    			error : function() {
    				alert("网络异常");
    			}
    		});	
            return false;
        }    
    });
	
});