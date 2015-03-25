<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.xuh.platform.module.sys.entity.SysUser"%>
<%@page import="com.xuh.platform.base.constants.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	SysUser sessionUser=(SysUser)request.getSession().getAttribute(Constants.SESSION_USER_KEY);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible"content="IE=10;IE=EDGE"/>
<title>左侧</title>
<base href="<%=basePath%>"/>
<script>var url = '<%=basePath%>';</script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="js/util.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	});
});	

function loginout(){
	$$.getFrame("rightFrame").$.messager.confirm("提示信息","确定退出系统吗？",function(flag){
		if(flag){
			parent.window.location='<%=basePath%>rest/index/loginout';
		}
	});
}
</script>


</head>

<body style="background:url(images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="javascript:;" target="_parent"><img src="images/logo.png" title="纳特比特" /></a>
    </div>
        
            
    <div class="topright">    
    <ul>
    <li><a href="javascript:;" onclick="loginout();" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span>登陆用户：<%=sessionUser!=null? sessionUser.getUsername():"未登录" %></span>
    </div>    
    
    </div>

</body>
</html>
