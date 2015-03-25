$(function() {
	$("#dataform").validate({
        submitHandler:function(form){
        	$.ajax({
    			type : 'post',
    			url : 'rest/message/newstemplate/save',
    			dataType : 'json',
    			data : $("#dataform").serialize(),
    			async : true,
    			success : function(data) {
    			  if(data.success==true){
    				alert(data.msg);
    				parent.window.location.href=url+"rest/message/newstemplate";	  
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