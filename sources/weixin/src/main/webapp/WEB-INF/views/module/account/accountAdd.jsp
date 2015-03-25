<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>公众账号管理</title>
<%@include file="../../include.jsp"%>

<!-- 下拉框 -->
<script type="text/javascript" src="js/select_option.js"></script>

<!-- 验证 -->
<script type="text/javascript" src="js/lib/validate/jquery.validate.js"></script>
<script type="text/javascript" src="js/lib/validate/jquery.metadata.js"></script>
<script type="text/javascript" src="js/lib/validate/jquery.validate.self.js"></script>
<!-- 模块 -->
<script type="text/javascript" src="js/module/account/accountAdd.js"></script>
</head>
<body>
    <div class="e_cont_all">
    <div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="rest/frame/main" target="_parent">首页</a></li>
		    <li>公众账号管理</li>
	    </ul>
    </div>
  <form name="dataform"  id="dataform" action=""  method="post">
  	<input type="hidden" name="accountid" value="${wxBaseAccount.accountid }" id="accountid"/>
    <table class="" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td class="td_background" width="30%"><label class="label"><font color="red">*</font>公众帐号名称</label></td>
        <td class="td_input" width="50%"><input type="text" value="${wxBaseAccount.accountname}" id="accountname" name="accountname" class="{required:true}" maxlength="80"/></td>
       </tr>
       <tr>
        <td class="td_background" width="30%"><label class="label"><font color="red">*</font>公众账号TOKEN</label></td>
        <td class="td_input" width="50%"><input type="text" value="${wxBaseAccount.accounttoken}" id="accounttoken" name="accounttoken" class="{required:true}" maxlength="100"/></td>
       </tr>
       <tr>
        <td class="td_background" width="30%"><label class="label"><font color="red">*</font>公众微信号</label></td>
        <td class="td_input" width="50%"><input type="text" value="${wxBaseAccount.accountnumber}" id="accountnumber" name="accountnumber" class="{required:true}" maxlength="25"/></td>
       </tr>
       <tr>
        <td class="td_background" width="30%"><label class="label"><font color="red">*</font>原始ID</label></td>
        <td class="td_input" width="50%"><input type="text" value="${wxBaseAccount.wxAccountid}" id="wxAccountid" name="wxAccountid" class="{required:true}" maxlength="30"/></td>
       </tr>
       <tr>
        <td class="td_background" width="30%"><label class="label">公众帐号APPID</label></td>
        <td class="td_input" width="50%"><input type="text" value="${wxBaseAccount.accountappid}" id="accountappid" name="accountappid" maxlength="100"/></td>
       </tr>
       <tr>
        <td class="td_background" width="30%"><label class="label">公众帐号APPSECRET</label></td>
        <td class="td_input" width="50%"><input type="text" value="${wxBaseAccount.accountappsecret}" id="accountappsecret" name="accountappsecret" maxlength="250"/></td>
       </tr>
        <tr>
        <td class="td_background" width="30%"><label class="label">电子邮箱</label></td>
        <td class="td_input" width="50%"><input type="text" value="${wxBaseAccount.accountemail}" id="accountemail" name="accountemail" maxlength="50"/></td>
       </tr>
       <tr>
        <td class="td_background" width="30%"><label class="label">公众帐号描述</label></td>
        <td class="td_input" width="50%">
        	<textarea id="accountdesc" name="accountdesc" class="{maxlength:250}">${wxBaseAccount.accountdesc}</textarea>
        </td>
       </tr>
       
       <tr>
        <td colspan="2" align="center">
         <div class="btn_div">
	        <input type="submit" name="button" id="save" value="" class="save_btn"/>
	     </div> 
        </td>
       </tr>
    </table>
  </form>
</div>
</body>
</html>
