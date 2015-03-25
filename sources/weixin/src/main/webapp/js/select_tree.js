var SelectTree = function() {

};


/**
 * 加载组织机构
 * code:定义选择后的ID值
 * defValue 默认值
 */
SelectTree.loadOrgSelect = function loadOrgSelect(code,defValue) {
	SelectTree.loadBaseSelect(url+"rest/sys/org/loadOrgTree",code,defValue,true);
};

/**
 * 加载弹出树
 * loadurl:弹出树请求地址
 * code:定义选择后的ID值
 * defValue 默认值
 */
SelectTree.loadBaseSelect = function loadBaseSelect(loadurl,code,defValue,expand) {
	// 生成树的DIV
	
	$('#'+code).attr("readOnly","true");
	
	if(defValue!=null&&defValue!=""&&defValue!=undefined){
		$('#'+code).val(defValue);
	}
	//获取是否多选
	var isMuti=$('#'+code).attr("selectmulti");
	if(isMuti=='true'||isMuti==true){
		isMuti=true;
	}else{
		isMuti=false;
	}
	
	//获取父节点是否可点
	var parentClick =$('#'+code).attr('parentclick');
	if(parentClick=='true'||parentClick==true){
		parentClick=true;
	}else{
		parentClick=false;
	}
	
	var w=$('#'+code).attr('selectwidth');
	var h=$('#'+code).attr('selectheight');
		
	var hide_div='hide_div_tree'+code;
	var hide_tree='hide_tree_id'+code;
	var treeDIV = $('<div id='+hide_div+' class="hide_div_tree" style="display:none; position: absolute;z-index: 9000;overflow: auto;"><ul id='+hide_tree+' class="ztree" style="margin-top:0; width:'+w+';height:'+h+';border:1px solid #83d2f6;overflow: auto;"></ul></div>"');
	$(document.body).append(treeDIV);

	var resultcode=code+"_select";
	var resultname=$('#'+code).attr("selectname");
	if(resultname==""||resultname==undefined){
		alert(code+"未定义selectname");
		return;
	}
	
	var hideIdDIV = $('<input id="'
			+ resultcode
			+ '"  name="'
			+ resultname
			+ '" type="text" readonly value="" style="width:120px; display: none"/>');
	$("#" + code).after(hideIdDIV);

	$("#" + code)
			.bind(
					"click",
					function() {
						var nameObj = $("#" + code);
						var nameObjOffset = $("#" + code).offset();
						$("#"+hide_div).css(
								{
									left : nameObjOffset.left + "px",
									top : nameObjOffset.top
											+ nameObj.outerHeight() + "px"
								}).slideDown("fast");
						$("body")
								.bind(
										"mousedown",
										function(event) {
											if (!(event.target.id == "menuBtn"
													|| event.target.id == hide_div || $(
													event.target).parents(
													"#"+hide_div).length > 0)) {
												$("#"+hide_div).fadeOut(
														"fast");
												$("body")
														.unbind(
																"mousedown",
																function(event) {
																	SelectTree
																			.onBodyDown(event,code);
																});
											}
										});
					});

	var setting = {
		check : {
			enable : isMuti
		},
		view : {
			dblClickExpand : false
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			beforeClick : function(treeId, treeNode) {
				if(!parentClick){
					var check = (treeNode && !treeNode.isParent);
					if (treeNode.id == "0") {
						check = true;
					}
					return check;
				}
				
			},
			onCheck : function() {
				var zTree = $.fn.zTree.getZTreeObj(hide_tree), nodes = zTree
						.getCheckedNodes(true), v = "";
				var eventId = "";
				nodes.sort(function compare(a, b) {
					return a.id - b.id;
				});
				for ( var i = 0, l = nodes.length; i < l; i++) {
					if (!nodes[i].isParent) {
						v += nodes[i].name + ",";
						eventId += nodes[i].id + ",";
					}

				}
				if (v.length > 0)
					v = v.substring(0, v.length - 1);
				if (eventId.length > 0)
					eventId = eventId.substring(0, eventId.length - 1);
				$("#" + code).val(v);
				$('#'+code).attr("selectvalue",eventId);
				$('#' + resultcode).val(eventId);

			},
			onClick : function(event, treeId, treeNode, clickFlag) {
				$("#" + code).val();
				$("#" + resultcode).val();
				$("#" + code).val(treeNode.name);
				$("#" + resultcode).val(treeNode.id);
				$('#'+code).attr("selectvalue",treeNode.id);
				SelectTree.hideMenu(event,code);
			}
		}
	};
	$.ajax( {
		type : "GET",
		url : loadurl,
		dataType : 'json',
		global : false,
		async : false,
		cache: false,
		success : function(json) {
			var tree = $.fn.zTree.init($("#"+hide_tree), setting, json);
			if(expand){
				tree.expandAll(true);
			}
			var selnames="";
			var selIds = $('#' + code).attr('selectvalue');
			$("#" + resultcode).val(selIds);
			if(selIds==""||selIds==null||selIds=='null'){
				selnames=defValue;
			}else{
				if(isMuti){
					if (selIds != null && selIds != "" && tree.setting.check.enable) {
						var ids = selIds.split(",");
						if (ids.length > 0) {
							for ( var i = 0; i < ids.length; i++) {
								var id = ids[i];
								var node = tree.getNodeByParam("id", id, null);
								tree.checkNode(node, true, false);
								selnames+=','+node.name;
							}
						}
		
					}
				}else{
					var node = tree.getNodeByParam("id", selIds, null);
					if(node!=undefined){
						selnames+=','+node.name;
					}
				}
				selnames=selnames.substring(1);
			}
			
			$('#'+code).val(selnames);
			

		},
		error : function() {

		}
	});
};

SelectTree.hideMenu = function hideMenu(event,code) {
	$("#hide_div_tree"+code).fadeOut("fast");
	$("body").unbind("mousedown", SelectTree.onBodyDown(event,code));
};
SelectTree.onBodyDown = function onBodyDown(event,code) {
	if (!(event.target.id == "menuBtn" || event.target.id == "hide_div_tree"+code || $(
			event.target).parents("#hide_div_tree"+code).length > 0)) {
		SelectTree.hideMenu(event,code);
	}
};
