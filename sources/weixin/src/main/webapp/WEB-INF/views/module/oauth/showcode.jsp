<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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

  </head>

 
  <body> 
 
   <div >
            <div class="site-top-overlay"></div>

            <div class="showcode-text">
                <div  id="welcome" class="container text-center white-text">
                	<div class="col-xs-16">
                       <div class="sidebar-nav">
					<div class="nav-header" data-toggle="collapse"   data-target="#code-menu"><i class="icon-briefcase"></i>序列号</div>
					<ul id="code-menu" class="nav nav-list collapse in coming-soon">
							<li>
									<div class="container">
										<div class="row">
											<div class="span12">
											    <h1>${sncode }</h1>
											</div>
										</div>
								</div>
							
							</li>
						</ul>
						
						<div class="nav-header" data-toggle="collapse"  data-target="#cal-menu"><i class="icon-dashboard"></i>有效期</div>
						<ul id="cal-menu" class="nav nav-list collapse in coming-soon">
							<li>
									<div class="container">
											<div class="span12">
												<div class="timer">
													<div class="days-wrapper">
														<span class="days">${year }</span> <br><span class="days1">年</span>
													</div>
													<div class="hours-wrapper">
														<span class="hours">${month }</span> <br><span class="days1">月</span>
													</div>
													<div class="minutes-wrapper">
														<span class="minutes">${day }</span> <br><span class="days1">日</span>
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
												<div class="span12" >
													<h1>${days }</h1>
												</div>
											</div>
								</div>
										
							</li>
						</ul>
				</div>
                    </div>
                </div>
                
            </div>
        </div> <!-- .site-top -->
    

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="lib/bootstrap/js/bootstrap.js"></script>
  

  </body>
</html>


