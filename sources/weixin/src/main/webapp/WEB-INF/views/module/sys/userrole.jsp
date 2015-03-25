<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="pragma" content="no-cache"/>
<title>角色管理</title>
<%@include file="../../include.jsp"%>

<script type="text/javascript" src="js/module/sys/userrole.js"></script>
</head>
<body>
		<div>
			<input type="hidden" id="roleid" value="${roleid}"/>
			<input type="hidden" id="userid" value="${userid}"/>
			<div id="datagridList"></div> 
		</div>
		
</body>
</html>
