$(function() {
	
	$("#dataform").validate({
        submitHandler:function(form){
        	$.ajax({
    			type : 'post',
    			url : 'rest/snuser/save',
    			dataType : 'json',
    			data : $("#dataform").serialize(),
    			async : true,
    			success : function(data) {
    				
    			  if(data.success==true){
    				alert(data.msg);
    				parent.window.location.href=url+"rest/snuser";	  
    				parent.closeDialog();
    			  }else{
    				  alert(data.msg)
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