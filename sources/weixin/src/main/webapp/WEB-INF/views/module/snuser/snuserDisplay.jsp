<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户管理</title>
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
<script type="text/javascript" src="js/module/sys/userDisplay.js"></script>

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
        <td class="td_background" width="30%"><label class="label">登陆账号</label></td>
        <td class="td_input" width="50%"><input type="text" value="${sysUser.loginname}" id="loginname" name="loginname"/></td>
       </tr>
       <tr>
        <td class="td_background" width="30%"><label class="label">用户名称</label></td>
        <td class="td_input" width="50%"><input type="text" value="${sysUser.username}" id="username" name="username" /></td>
       </tr>
       <tr>
        <td class="td_background" width="30%"><label class="label">所属机构</label></td>
        <td class="td_input" width="50%">
        	 <input type="text"  id="orgid" selectname="orgid" selectvalue="${sysUser.orgid }" selectwidth="193px" selectheight="100px" parentclick="true"/>
        </td>
       </tr>
        <tr>
      	<td class="td_background" width="30%"><label class="label">手机</label></td>
        <td class="td_input" width="50%"><input type="text" value="${sysUser.mobiletel}" id="mobiletel" name="mobiletel"/></td>
         </tr>
       <tr>
        <td class="td_background" width="30%"><label class="label">办公电话</label></td>
        <td class="td_input" width="50%"><input type="text" value="${sysUser.officetel}" id="officetel" name="officetel"/></td>
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
