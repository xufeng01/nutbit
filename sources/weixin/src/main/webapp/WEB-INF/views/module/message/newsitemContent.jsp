<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>微信公众平台</title>
<style type="text/css" >
 #activity-detail .page-content .text{font-size:16px;}
.page-bizinfo {
	padding-left: 15px;
	padding-right: 15px;
}

.activity-meta {
	display: inline-block;
	line-height: 16px;
	vertical-align: middle;
	margin-left: 8px;
	padding-top: 2px;
	padding-bottom: 2px;
	color: #8c8c8c;
	font-size: 11px
}

.activity-meta.no-extra {
	margin-left: 0
}

.activity-info .text-ellipsis {
	display: inline-block;
	vertical-align: middle;
	max-width: 104px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}
</style>
</head>
<body>
     <div class="page-bizinfo">
                <div class="header">
                    <h1 id="activity-name">
                        ${newsitem.title}
                    </h1>
                    <p class="activity-info">
                        <span id="post-date" class="activity-meta no-extra">
                            ${newsitem.updatetime}
                        </span>
                        <span class="activity-meta">
                            xxx社区
                        </span>
                        <span class="text-ellipsis">
                                ${newsitem.author}
                            </span>    
                    </p>
                </div>
            </div>
            <div id="page-content" class="page-content" lang="en">
                <div id="img-content">
                    <div class="media" id="media">
                        <img  src="<%=basePath%>rest/message/newsitem/download/${newsitem.itemid}"/>
                    </div>
                    <div class="text" id="js_content">
                        ${newsitem.content}
                    </div>
                </div>
            </div>
</body>
</html>
