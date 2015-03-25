$(function() {
	
	SelectTree.loadOrgSelect("orgid","请选择");
	//返回
	$("#back").bind("click",function(){
		parent.closeDialog();
	});	
	
		
});