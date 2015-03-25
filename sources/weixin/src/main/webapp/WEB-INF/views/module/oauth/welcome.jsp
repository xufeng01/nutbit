<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<base href="<%=basePath%>"/>
<script>var url = '<%=basePath%>';</script>
<!DOCTYPE html>
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>纳特比特</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='http://fonts.useso.com/css?family=Roboto:400,300,500,700,900' rel='stylesheet' type='text/css'>
        
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/owl-carousel.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/templatemo-style.css">
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.min.js"></script>
        <script>
        	function toGetCode(){
        		var r = /^\d{10}$/;
        	    if(r.test($('#mcode').val())){
        	    	$('#myform').submit();
        	    }else{
        	    	$('#msg').show();
        	    }
        		
        	}
        	
        	function checkField(str){
        		str= str.replace(/[^\d]/g, "");
        		$('#mcode').val(str);
        	}
        	
        	function pastedata(){
        		clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''));
        	}
        	
        	
        </script>
    </head>
    <body >
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        
        <!-- SITE HEADER -->
        <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">    
			<img src="images/bg1.jpg" height="100%" width="100%"/>    
		</div>  
        <div >
            <div class="welcome-text">
                <div  id="welcome" class="container text-center white-text">
                	<div class="col-xs-16">
                        <div class="row">
	                        <form action="rest/nofilter/oauth/showcode" method="post" class="contact-form" id="myform">
	                        <input type="hidden" name="uid" value="${wxSNUser.uid}"/>
	                        <input type="hidden" name="openid" value="${wxSNUser.openid}"/>
	                        <input type="hidden" name="nickname" value="${wxSNUser.nickname}"/>
	                        <input type="hidden" name="sex" value="${wxSNUser.sex}"/>
	                        <input type="hidden" name="country" value="${wxSNUser.country}"/>
	                        <input type="hidden" name="province" value="${wxSNUser.province}"/>
	                        <input type="hidden" name="city" value="${wxSNUser.city}"/>
	                        <input type="hidden" name="headImgUrl" value="${wxSNUser.headImgUrl}"/>
	                        
		                        <fieldset class="col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4">
		                            <c:if test='${wxSNUser.uid!=null}'>
		                            	<input type="text"   id="mcode" name="mcode"  value="${wxSNUser.mcode }" readonly="readonly" class="form-control text-center" placeholder="输入10位安装码">
		                        	</c:if>
		                        	<c:if test='${wxSNUser.uid==null}'>
		                            	<input type="text"   id="mcode" name="mcode" value="${wxSNUser.mcode }" onkeyup="checkField(this.value)"  onbeforepaste="pastedata()" maxlength="10" class="form-control text-center" placeholder="输入10位安装码">
		                        	</c:if>
		                        	<c:if test='${error==1}'>
		                            	<div id="error" class="alert alert-warning alert-dismissible" role="alert">
									  <button onclick="$('#error').hide();" type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									  <strong>获取序列号失败，请重新获取！</strong>
									</div>
		                        	</c:if>
		                        	
		                        	<div id="msg" style="display: none;" class="alert alert-warning alert-dismissible" role="alert">
									  <button onclick="$('#msg').hide();" type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									  <strong>请输入10位数字！</strong>
									</div>
		                        </fieldset>
	                    	</form>
                        </div>
                        <div class="row">
	                        <a href="javascript:;" class="btn btn-primary btn-lg" onclick="toGetCode();">
								<i class="fa fa-twitter fa-fw"></i>
								<span class="network-name">获取序列号</span>
							</a>
						</div>
                    </div>
                </div>
                
            </div>
        </div> <!-- .site-top -->
        

		
        <script src="js/vendor/jquery-1.10.2.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>