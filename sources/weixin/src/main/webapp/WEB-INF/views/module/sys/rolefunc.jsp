<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="pragma" content="no-cache"/>
<title>角色管理</title>
<%@include file="../../include.jsp"%>
<!-- ztree -->
<link rel="stylesheet" type="text/css" href="js/lib/ztree/css/zTreeStyle.css"/>
<link rel="stylesheet" type="text/css" href="js/lib/ztree/css/ztree.css"/>
<script type="text/javascript" src="js/lib/ztree/jquery.ztree.all-3.5.min.js"></script>

<script type="text/javascript" src="js/module/sys/rolefunc.js"></script>
</head>
<body>
		<div>
			<input type="hidden" id="roleid" value="${roleid }" />
			<input type="hidden" id="funcids" value="${funcids }"/>
			<ul id='ztree' class="ztree" style="width:200px;height:320px;margin: 0px;"></ul>
			<input id="btnSave" type="button" class="scbtn" value="分配权限" style="margin-left:60px;"/>
		</div>
		
</body>
</html>
