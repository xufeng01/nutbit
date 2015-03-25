<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="pragma" content="no-cache"/>
<title>会员管理</title>
<%@include file="../../include.jsp"%>
<script type="text/javascript" src="js/select_option.js"></script>
<script type="text/javascript" src="js/module/snuser/snuserList.js"></script>
</head>
<body>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="rest/frame/main" target="_parent">首页</a></li>
		    <li>会员管理</li>
	    </ul>
    </div>
    <div class="formbody">
    	<div id="usual1" class="usual"> 
		    <div>
			    <ul class="seachform">
				    <li><label>昵称</label><input id="nickname" name="nickname" type="text" class="scinput" /></li>
				    <li><label>机器码</label><input id="mcode" name="mcode" type="text" class="scinput" /></li>
				    <li><label>状态</label>
				    	<select id="isend" name="isend" class="scinput"></select>
				    </li>
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
