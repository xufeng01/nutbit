$(function() {
	SelectOption.loadNewsType("itemtype");
	if($('#itemtype').val()=="0"){
		$('#tr_content').show();
		$('#tr_url').hide();
	}else{
		$('#tr_content').hide();
		$('#tr_url').show();
	}
	$('#itemtype').bind("change",function(){
		if($('#itemtype').val()=="0"){
			$('#tr_content').show();
			$('#tr_url').hide();
		}else{
			$('#tr_content').hide();
			$('#tr_url').show();
		}
	});
	displayAttach("myfile");
	UE.getEditor('content');
	$("#dataform").validate({
        submitHandler:function(form){
        	$.ajaxFileUpload({
				url : "rest/message/newsitem/save",
	 		   	secureuri:false,
	 		    files : $("input[name='file']"),
	 		    dataformid:"dataform",
				dataType : 'json',
				success : function(json) {
					if(json == "1"){
						alert("保存成功");
						window.location=url+"rest/message/newstemplate";
					}else{
						alert("保存失败");
					}
				},
				error : function(data, status, e) {
					alert("网络异常");
				}
			});
            return false;
        }    
    });
	
	//返回
	$("#back").bind("click",function(){
		window.location=url+"rest/message/newstemplate";
	});	
	
		
});