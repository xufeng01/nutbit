<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户管理</title>
<%@include file="../../include.jsp"%>

<!-- 附件上传 -->
<script type="text/javascript" src="js/lib/ajaxfileupload.js"></script>
<script type="text/javascript" src="js/fileuploadutil.js"></script>

<script type="text/javascript" src="js/select_option.js"></script>

<!--UEditor-->
  <script type="text/javascript"  charset="utf-8" src="js/lib/ueditor/ueditor.config.js"></script>
  <script type="text/javascript"  charset="utf-8" src="js/lib/ueditor/ueditor.all.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="js/lib/ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- 验证 -->
<script type="text/javascript" src="js/lib/validate/jquery.validate.js"></script>
<script type="text/javascript" src="js/lib/validate/jquery.metadata.js"></script>
<script type="text/javascript" src="js/lib/validate/jquery.validate.self.js"></script>
<!-- 模块 -->
<script type="text/javascript" src="js/module/message/newsitemAdd.js"></script>
</head>
<body>
    <div class="e_cont_all">
    <div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="rest/frame/main" target="_parent">首页</a></li>
		    <li>文本消息模板</li>
	    </ul>
    </div>
  <form name="dataform"  id="dataform" action=""  method="post">
  	<input type="hidden" name="templateid" value="${templateid}" id="templateid"/>
  	<input type="hidden" name="itemid" value="${newsitem.itemid}" id="itemid"/>
    <table class="" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td class="td_background" width="30%"><label class="label"><font color="red">*</font>标题</label></td>
        <td class="td_input" width="50%"><input type="text" value="${newsitem.title}" id="title" name="title" class="{required:true}" maxlength="50"/></td>
       </tr>
       <tr>
        <td class="td_background" width="30%"><label class="label">作者</label></td>
        <td class="td_input" width="50%"><input type="text" value="${newsitem.author}" id="author" name="author"  maxlength="50"/></td>
       </tr>
      <tr>
      	<td class="td_background" width="30%"><label class="label">图片</label></td>
        <td class="td_input" width="50%">
        	<div id="myfile" formname='file' filename="${newsitem.imagepath}" fileurl="<%=basePath%>rest/message/newsitem/download/${newsitem.itemid}" filedelete='filedelete'></div>	
        </td>
       </tr>
        <tr>
      	<td class="td_background" width="30%"><label class="label">摘要</label></td>
        <td class="td_input" width="50%"><input type="text" value="${newsitem.description}" id="description" name="description" maxlength="100"/></td>
         </tr>
        <tr>
        <td class="td_background" width="30%"><label class="label">图文类型</label></td>
        <td class="td_input" width="50%">
        	<select id="itemtype" name="itemtype" selectvalue="${newsitem.itemtype }"></select>
        </td>
       </tr>  
       <tr id="tr_url" style="display: none;">
        <td class="td_background" width="30%"><label class="label">外部链接</label></td>
        <td class="td_input" width="50%"><input type="text" value="<c:out value="${newsitem.url}"/>"  id="url" name="url" maxlength="100"/></td>
       </tr>
       <tr id="tr_content">
        <td class="td_background" width="30%"><label class="label">正文内容</label></td>
        <td class="td_input" width="50%">
        	<textarea id="content" name="content" style="width:520px;height:200px;">${newsitem.content}</textarea>
        </td>
       </tr>
       <tr>
        <td colspan="2" align="center">
         <div class="btn_div">
	        <input type="submit" name="button" id="save" value="" class="save_btn"/>
	        <input type="button" name="button" id="back" value="" class="back_btn"/>
	     </div> 
        </td>
       </tr>
    </table>
  </form>
</div>
</body>
</html>
