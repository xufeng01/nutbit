<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<base href="<%=basePath%>"/>
<script>var url = '<%=basePath%>';</script>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>纳特比特</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
        
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="css/templatemo-style.css">
	<link rel="stylesheet" type="text/css" href="css/elements.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

        
    <script src="lib/jquery-1.8.1.min.js" type="text/javascript"></script>

    <!-- Demo page code -->
    
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	<script type="text/javascript">
		function toGetCode(){
			$('#myform').submit();
		}
	</script>
  </head>

 
  <body> 
  
   <div >
            <div class="site-top-overlay"></div>
            <c:if test="${wxSNUser.uid==null}">
			<div class="showcode-text2">
                <div  id="welcome" class="container text-center white-text">
                	<div class="col-xs-16">
                       <div class="sidebar-nav">
                       
                       		<div class="nav-header" data-toggle="collapse"   data-target="#uid-menu"><i class="icon-briefcase"></i>消息提示</div>
							<ul id="uid-menu" class="nav nav-list collapse in coming-soon">
								<li>
										<div class="container">
											<div class="row">
												<div class="span12">
												    <h3>请获取序列号！</h3>
												    <form action="rest/nofilter/oauth/toWelcome" method="post" id="myform">
													    <input type="hidden" name="openid" value="${wxSNUser.openid}"/>
								                        <input type="hidden" name="nickname" value="${wxSNUser.nickname}"/>
								                        <input type="hidden" name="sex" value="${wxSNUser.sex}"/>
								                        <input type="hidden" name="country" value="${wxSNUser.country}"/>
								                        <input type="hidden" name="province" value="${wxSNUser.province}"/>
								                        <input type="hidden" name="city" value="${wxSNUser.city}"/>
								                        <input type="hidden" name="headImgUrl" value="${wxSNUser.headImgUrl}"/>
												    </form>
												</div>
											</div>
								</div>
								</li>
								
							</ul>
							<ul id="uid-menu1" style="text-align: center;">
								<li>
										<div class="container">
											<div class="row">
												<div class="span12">
												   <a href="javascript:;" class="btn btn-primary btn-lg " style="text-align: center;" onclick="toGetCode();">
														<span class="network-name">获取序列号</span>
												 </a>
												    
												</div>
											</div>
									  </div>
								</li>
								
							</ul>
							 
		            </div>
		            </div>
		            </div>
            </div>
            </c:if>
            
             <c:if test="${wxSNUser.uid!=null}">
            <div class="showcode-text">
                <div  id="welcome" class="container text-center white-text">
                	<div class="col-xs-16">
                       <div class="sidebar-nav">
					<div class="nav-header" data-toggle="collapse"   data-target="#uid-menu"><i class="icon-briefcase"></i>会员ID</div>
						<ul id="uid-menu" class="nav nav-list collapse in coming-soon">
							<li>
								 
									<div class="container">
										<div class="row">
											<div class="span12">
											    <h1>${wxSNUser.uid}</h1>
											</div>
										</div>
								
										</div>
							</li>
						</ul>
						
						
						<div class="nav-header" data-toggle="collapse"  data-target="#cal-menu"><i class="icon-dashboard"></i>有效期</div>
						<ul id="cal-menu" class="nav nav-list collapse in coming-soon">
							<li>
								
								<div >
									<div class="container">
											<div class="span12">
												<div class="timer">
													<div class="days-wrapper">
														<span class="days">${year }</span> <br><span class="days1">年</span>
													</div>
													<div class="hours-wrapper">
														<span class="hours">${month }</span> <br><span class="days1">月</span>
													</div>
													<div class="minutes-wrapper">
														<span class="minutes">${day }</span> <br><span class="days1">日</span>
													</div>
												  
												</div>
											</div>
									</div>
								
							</div>
							</li>
						</ul>
						
						<div class="nav-header" data-toggle="collapse"  data-target="#day-menu"><i class="icon-exclamation-sign"></i>剩余天数</div>
						<ul id="day-menu" class="nav nav-list collapse in coming-soon">
							<li>
								
										<div class="container">
											<div class="row">
												<div class="span12">
													<h1>${days }</h1>
												</div>
											</div>
										</div>
								
							</li>
						</ul>
						
						<div class="nav-header" data-toggle="collapse"   data-target="#mcode-menu"><i class="icon-briefcase"></i>机器码</div>
						<ul id="mcode-menu" class="nav nav-list collapse in coming-soon">
							<li>
								
									<div class="container">
										<div class="row">
											<div class="span12">
											    <h1>${wxSNUser.mcode }</h1>
											</div>
										</div>
								
							</div>
							</li>
						</ul>
						
						<div class="nav-header" data-toggle="collapse"   data-target="#code-menu"><i class="icon-briefcase"></i>序列号</div>
						<ul id="code-menu" class="nav nav-list collapse in coming-soon">
							<li>
								
									<div class="container">
										<div class="row">
											<div class="span12">
											    <h1>${wxSNUser.sncode }</h1>
											</div>
										</div>
								
							</div>
							</li>
						</ul>
						
				</div>
                    </div>
                </div>
                
            </div>
            </c:if>
        </div> <!-- .site-top -->
    

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="lib/bootstrap/js/bootstrap.js"></script>
  

  </body>
</html>


