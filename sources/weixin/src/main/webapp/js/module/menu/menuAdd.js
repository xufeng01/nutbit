$(function() {
	
	SelectOption.loadMenuType("type");
	if($('#type').val()=='click'){
		$('#tr_msgtype').show();
		$('#tr_templateid').show();
		$('#tr_url').hide();
		$('#url').val("");
		SelectOption.loadTemlateType("msgtype");
		var msgtype=$('#msgtype').val();
		if(msgtype=='news'){
			SelectOption.loadTemplate("templateid","news");
		}else{
			SelectOption.loadTemplate("templateid","text");
		}
	}else{
		$('#tr_msgtype').hide();
		$('#msgtype').val("");
		$('#tr_templateid').hide();
		$('#templateid').val("");
		$('#tr_url').show();
	}
	$('#type').bind("change",function(){
		if($('#type').val()=='text'){
			$('#tr_msgtype').show();
			$('#tr_templateid').show();
			$('#tr_url').hide();
			$('#url').val("");
			SelectOption.loadTemlateType("msgtype");
			var msgtype=$('#msgtype').val();
			if(msgtype=='news'){
				SelectOption.loadTemplate("templateid","news");
			}else{
				SelectOption.loadTemplate("templateid","text");
			}
		}else{
			$('#tr_msgtype').hide();
			$('#msgtype').val("");
			$('#tr_templateid').hide();
			$('#templateid').val("");
			$('#tr_url').show();
		}
	});
	
	
	$('#msgtype').bind("change",function(){
		SelectOption.loadTemplate("templateid",$('#msgtype').val());
	});
	
	
	$("#dataform").validate({
        submitHandler:function(form){
        	$.ajax({
    			type : 'post',
    			url : 'rest/menu/save',
    			dataType : 'json',
    			data : $("#dataform").serialize(),
    			async : true,
    			success : function(data) {
    			  if(data.success==true){
    				alert(data.msg);
    				parent.window.location.href=url+"rest/menu";	  
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