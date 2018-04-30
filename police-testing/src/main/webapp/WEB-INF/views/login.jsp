<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>登录页</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/jquery.perfect-scrollbar-1.3.0/css/perfect-scrollbar.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/assets/css/demo-all.css">

	<script src="${pageContext.request.contextPath}/styles/vendors/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/vendors/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/vendors/jquery.perfect-scrollbar-1.3.0/dist/perfect-scrollbar.min.js"></script>

	<script src="${pageContext.request.contextPath}/styles/assets/js/demo.js"></script>
	<!-- <script src="vendor/Chart.js/Chart.js"></script> -->
	<!-- <script src="assets/js/mysite.js"></script> -->
	<script type="text/javascript">
		//登录
		function login(flag){
			var form = document.forms[0];
			if(flag == 1){//前台系统
				form.action = "${pageContext.request.contextPath}/login/frontendLogin"
			}else if(flag == 2){//后台系统
				form.action = "${pageContext.request.contextPath}/login/backgroundSystem"
			}
			form.submit();
		}
	</script>
</head>

<body>
	<div class="psb-container psb-here">
		<div class="psb-content">
			<div class="mastbg">
				<div class="masthead">
					<div class="thin-body masthead-bg">
					</div>
				</div>

				<div class="thin-body">
					<div class="mastbody">
						<div class="login-left-area" style="margin-top:20px;">
							<!-- <img src="${pageContext.request.contextPath}/styles/assets/img/police5.png"> -->
							<img src="${pageContext.request.contextPath}/styles/assets/img/police6.png">
						</div>

						<div class="login-right-area">
							<div class="panel panel-white">
								<div class="panel-body" style="padding-top: 0;">
									<div class="row">
										<div class="col-sm-8 col-sm-offset-2" style="margin-top: 20px;">
											<h1 class="text-center">
												<!-- <i class="fa fa-sign-in fa-2x"></i>&nbsp; -->
												<span>欢迎您！</span>
											</h1>
										</div>
										<!-- <hr style="clear: both; margin-left: 30px; margin-right: 30px;"> -->
										<form id="mainForm" name="mainForm" method="post"> 
											<div class="col-sm-10 col-sm-offset-1">
												<div class="input-group form-group" style="margin: 25px 0;">
													<span class="input-group-addon">警号</span>
													<input type="text" class="form-control" name="loginId" placeholder="警号" style="color:black">
												</div>
												<div class="input-group form-group" style="margin: 40px 0;">
													<span class="input-group-addon">密码</span>
													<input type="password" class="form-control" name="password" placeholder="密码" style="color:black">
												</div>
												<p>
													<label style="color: red">${message }</label>                                
                                				</p>
												<div class="form-group text-right" style="margin-bottom: 20px;">
													<button type="button" class="btn btn-success" onclick="login(1);" style="background-color:#65b2e5;border-color:#65b2e5">登录</button>
													<button type="button" class="btn btn-success" onclick="login(2);" style="background-color:#65b2e5;border-color:#65b2e5">登录管理后台</button>
												</div>
											</div>
										</form>
										<!-- <hr style="clear: both; margin-left: 30px; margin-right: 30px;"> -->
									</div>
								</div>
							</div>
						</div>

						<br>
					</div>
				</div>

				<footer class="footer">
					<div class="container">
						<div class="row">
							<ul class="text-center no-style" style="padding: 25px 0;">
								<li>
									<span>北京市公安局东城分局</span>
								</li>
								<li>
									<span>建议使用Chrome浏览器 &nbsp; 推荐分辨率：1366&times;768</span>
								</li>
							</ul>
						</div>
					</div>
				</footer>
			</div>
		</div>
	</div>

</body>

</html>