<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible"content="IE=10;IE=EDGE"/>
<title>左侧</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
});	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>菜单导航</div>
    
    <dl class="leftmenu">
       <c:forEach items="${sysFuncs}" var="firstFunc">
	    	<c:if test="${firstFunc.funclevel==0 }">
	    		<dd id='${firstFunc.funcid }'>
		    		<div class="title">
			    		<span><img src="images/leftico01.png" /></span>${firstFunc.funcname}
			    	</div>
			    	<ul class="menuson">
				    	 <c:forEach items="${sysFuncs}" var="sencondFunc">
				    	 	<c:if test="${firstFunc.funcid==sencondFunc.parentid }">
				    	 	    <li><cite></cite><a href="${sencondFunc.funcurl }" target="rightFrame">${sencondFunc.funcname }</a><i></i></li>
				    	 	</c:if>
				    	 </c:forEach>
			    	  </ul>  
			    </dd>
	    	</c:if>
    	</c:forEach>
    </dl>
    
</body>
</html>
