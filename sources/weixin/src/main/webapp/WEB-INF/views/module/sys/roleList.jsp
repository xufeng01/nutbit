<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="pragma" content="no-cache"/>
<title>角色管理</title>
<%@include file="../../include.jsp"%>

<script type="text/javascript" src="js/module/sys/roleList.js"></script>
</head>
<body>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="rest/frame/main" target="_parent">首页</a></li>
		    <li>角色</li>
	    </ul>
    </div>
    <div class="formbody">
    	<div id="usual1" class="usual"> 
		    <div>
			    <ul class="seachform">
				    <li><label>角色名称</label><input id="rolename" name="rolename" type="text" class="scinput" /></li>
				    <li><label>&nbsp;</label><input name="" id="btn_search" type="button" class="scbtn" value="查询"/></li>
				</ul>
		    </div>
		</div>
		<div>
			<div id="datagridList"></div> 
		</div>
	</div>
		
</body>
</html>
