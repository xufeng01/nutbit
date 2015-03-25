<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>机构管理</title>
<%@include file="../../include.jsp"%>

<!-- ztree -->
<link rel="stylesheet" type="text/css" href="js/lib/ztree/css/zTreeStyle.css"/>
<link rel="stylesheet" type="text/css" href="js/lib/ztree/css/ztree.css"/>
<script type="text/javascript" src="js/lib/ztree/jquery.ztree.all-3.5.min.js"></script>

<!-- 下拉框 -->
<script type="text/javascript" src="js/select_tree.js"></script>
<script type="text/javascript" src="js/select_option.js"></script>

<!-- 工具 -->
<script type="text/javascript" src="js/util.js"></script>

<!-- 模块 -->
<script type="text/javascript" src="js/module/sys/orgDisplay.js"></script>

<script type="text/javascript">
	$(function(){
		initDisplayPage();
	})
</script>
</head>
<body>
    <div class="e_cont_all">
  <form name="dataform"  id="dataform" action=""  method="post">
    <table class="" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td class="td_background" width="30%"><label class="label"><font color="red">*</font>机构名称</label></td>
        <td class="td_input" width="50%"><input type="text" value="${sysOrg.orgname}" id="orgname" name="orgname" class="{required:true}" maxlength="16"/></td>
       </tr>
       <tr>
        <td class="td_background" width="30%"><label class="label">父机构</label></td>
        <td class="td_input" width="50%">
        	<input type="text"  id="parentid" selectname="parentid" selectvalue="${sysOrg.parentid }" selectwidth="193px" selectheight="100px" parentclick="true" class="{required:true,selecttree:true}"/>
        </td>
       </tr>
        <tr>
      	<td class="td_background" width="30%"><label class="label">机构描述</label></td>
        <td class="td_input" width="50%"><textarea id="orgdesc" name="orgdesc">${sysOrg.orgdesc }</textarea></td>
         </tr>
       <tr>
        <td colspan="2" align="center">
         <div class="btn_div">
	        <input type="button" name="button" id="back" value="" class="back_btn"/>
	     </div> 
        </td>
       </tr>
    </table>
  </form>
</div>
</body>
</html>
