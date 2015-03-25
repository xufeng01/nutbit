var SelectOption = function() {

};


/**
 * 加载一级菜单
 */
SelectOption.loadFirstFunc = function loadFirstFunc(code,defvalue){
	SelectOption.loadBaseCodeFromDB(url + 'rest/sys/func/loadFirstFunc', code,defvalue);
};

/**
 * 菜单级别
 * @param code
 */
SelectOption.loadFuncLevel = function loadFuncLevel(code,defvalue) {
	var data=SelectOption.getFuncLevelData();
	SelectOption.loadBaseCode(data, code,defvalue);
};
SelectOption.getFuncLevelData = function getFuncLevelData() {
	var data=new Array();
	data.push({code:0,name:'一级菜单'});
	data.push({code:1,name:'二级菜单'});
	return data;
};


/**
 * 模板类型
 * @param code
 */
SelectOption.loadTemlateType = function loadTemlateType(code,defvalue) {
	var data=SelectOption.getTemlateTypeData();
	SelectOption.loadBaseCode(data, code,defvalue);
};
SelectOption.getTemlateTypeData = function getTemlateTypeData() {
	var data=new Array();
	data.push({code:'text',name:'文本模板'});
	data.push({code:'news',name:'图文模板'});
	return data;
};

/**
 * 图文类型
 * @param code
 */
SelectOption.loadNewsType = function loadNewsType(code,defvalue) {
	var data=SelectOption.getNewsTypeData();
	SelectOption.loadBaseCode(data, code,defvalue);
};
SelectOption.getNewsTypeData = function getNewsTypeData() {
	var data=new Array();
	data.push({code:'0',name:'内部链接'});
	data.push({code:'1',name:'外部链接'});
	return data;
};

/**
 * 加载模板
 */
SelectOption.loadTemplate = function loadTemplate(code,msgtype,defvalue){
	if(msgtype=='text'){
		SelectOption.loadBaseCodeFromDB(url + 'rest/message/texttemplate/loadTemplate', code,defvalue);
	}else if(msgtype=='news'){
		SelectOption.loadBaseCodeFromDB(url + 'rest/message/newstemplate/loadTemplate', code,defvalue);
	}
};

/**
 * 菜单类型
 * @param code
 */
SelectOption.loadMenuType = function loadMenuType(code,defvalue) {
	var data=SelectOption.getMenuTypeData();
	SelectOption.loadBaseCode(data, code,defvalue);
};
SelectOption.getMenuTypeData = function getMenuTypeData() {
	var data=new Array();
	data.push({code:'click',name:'消息触发'});
	data.push({code:'view',name:'网页链接'});
	return data;
};


/**
 * 模板类型
 * @param code
 */
SelectOption.loadQrcodeType = function loadQrcodeType(code,defvalue) {
	var data=SelectOption.getQrcodeTypeData();
	SelectOption.loadBaseCode(data, code,defvalue);
};
SelectOption.getQrcodeTypeData = function getQrcodeTypeData() {
	var data=new Array();
	data.push({code:'0',name:'永久二维码'});
	return data;
};


/**
 * 过期状态
 * @param code
 */
SelectOption.loadEndstate = function loadEndstate(code,defvalue) {
	var data=SelectOption.getEndstateData();
	SelectOption.loadBaseCode(data, code,defvalue);
};
SelectOption.getEndstateData = function getEndstateData() {
	var data=new Array();
	data.push({code:'0',name:'未过期'});
	data.push({code:'1',name:'已过期'});
	return data;
};


/************************************************* base start*******************************************************************************/
/**
 * 加载报告状态 code：界面对应的ID
 */
SelectOption.getCodeName=function getCodeName(data,code){
	for(var i=0;i<data.length;i++){
		if(data[i].code==code){
			return data[i].name
		}
	}
}

/**
 * 加载code
 * 
 * @param loadurl
 *            访问地址
 * @param code
 *            界面ID
 * @return
 */
SelectOption.loadBaseCodeFromDB = function loadBaseCodeFromDB(loadurl, code,defvalue) {
	var value = $('#' + code).attr("selectvalue");
	$.ajax( {
		type : "get",
		cache : false,
		url : loadurl,
		dataType : 'json',
		success : function(json) {
			if (json.length > 0) {
				if(defvalue){
					var o = new Option('请选择', '');
					$("#" + code)[0].options.add(o);
				}
				
				$("#" + code).empty();
				for ( var i = 0; i < json.length; i++) {
					var t = new Option(json[i].name, json[i].code);
					$("#" + code)[0].options.add(t);
						if (value == json[i].code) {
							$("#" + code).val(value);
						}
				}
			}
		}
	});
};

/**
 * 加载code
 * 
 * @param data
 *            数据
 * @param code
 *            界面ID
 * @return
 */
SelectOption.loadBaseCode = function loadBaseCode(data, code,defvalue) {
	var value = $('#' + code).attr("selectvalue");
	if (data.length > 0) {
		$("#" + code).empty();
		if(defvalue){
			var o = new Option(defvalue, '');
			$("#" + code)[0].options.add(o);
		}
		
		for ( var i = 0; i < data.length; i++) {
			var t = new Option(data[i].name, data[i].code);
			$("#" + code)[0].options.add(t);
			if (value) {
				if (value == data[i].code) {
					$("#" + code).val(value);
				}
			}
		}
	}
};
/************************************************* base end*******************************************************************************/
