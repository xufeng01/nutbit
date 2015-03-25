$(document).ready(function() {
	var setting = {
			check : {
				enable : true
			},
			data : {
				simpleData : {
					enable : true
				}
			},
			callback : {
				onCheck : function() {
					
				}
			}
		};
	
	$.ajax({
			type : "POST",
			url : url+"rest/sys/func/rolefunc/"+$('#roleid').val(),
			dataType : 'json',
			global : false,
			async : false,
			cache: false,
			success : function(json) {
				var tree = $.fn.zTree.init($("#ztree"), setting, json);
				tree.expandAll(true);
				var funcids = $('#funcids').val().split(",");
				if (($.trim(funcids)).length > 0) {
					for ( var i = 0; i < funcids.length; i++) {
						var funcid = funcids[i];
						var node = tree.getNodeByParam("id", funcid, null);
						tree.checkNode(node, true, false);
					}
				}
			},
			error : function() {
	
			}
		});
	
	$('#btnSave').bind("click",function(){
		var treeObj = $.fn.zTree.getZTreeObj("ztree");
		var nodes = treeObj.getCheckedNodes(true);
		var t="";
		for(var i=0;i<nodes.length;i++){
			t+=","+nodes[i].id;
		}
		if(t.length>0){
			t=t.substring(1);
		}
		
		$.ajax({
			type : 'post',
			url : 'rest/sys/role/rolefunc/save',
			dataType : 'json',
			data : {roleid:$('#roleid').val(),funcids:t},
			async : true,
			success : function(data) {
			  if(data.success==true){
				alert(data.msg);
				parent.closeDialog();
			  }
			},
			error : function() {
				alert("网络异常");
			}
		});	
	});
});