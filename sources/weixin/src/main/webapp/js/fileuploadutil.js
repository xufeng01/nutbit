
function displayAttach(filediv){
	if($('#'+filediv).attr("id")){
		//初始化
		$('#'+filediv).append($("<div id='fileshow' style='display:none;'/>"));
		$('#'+filediv).append($("<div id='fileselect' style='display:none;'/>"));
		
		//file form提交的 name
		var formname=$('#'+filediv).attr("formname");
		if(!formname){
			alert("formname属性不存在！")
			return;
		}

		//显示文件名
		var filename=$('#'+filediv).attr("filename");
		
		//文件地址
		var fileurl=$('#'+filediv).attr("fileurl");
		if(filename){
			//存在文件名称
			$('#fileshow').append($("<img src='"+fileurl+"?"+new Date()+"' alt='"+filename+"'/> <input type='button' value='删除' onclick=deleteImage('"+filediv+"')   /> "));
			$('#fileshow').show();
		}else{
			$('#fileselect').append($("<input  id='"+formname+"' type='file' name='"+formname+"' style='width:300px;' />"));
			$('#fileselect').show();
		}
	}
}

function deleteImage(filediv){
	$('#fileshow').hide();
	//显示文件名
	var filedelete=$('#'+filediv).attr("filedelete");
	if(!filedelete){
		alert("filedelete属性不存在！");
	}
	//file form提交的 name
	var formname=$('#'+filediv).attr("formname");
	if(!formname){
		alert("formname属性不存在！")
		return;
	}
	$('#fileselect').append($("<input id='"+formname+"' type='file' name='"+formname+"'  style='width:400px;'/>"));
	$('#fileselect').show();
	$('#'+filediv).append($("<input type='hidden' name='"+filedelete+"' value='true'/>"));
}

