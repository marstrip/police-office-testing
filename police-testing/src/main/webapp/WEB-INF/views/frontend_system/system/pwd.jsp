<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>修改密码</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/jquery.perfect-scrollbar-1.3.0/css/perfect-scrollbar.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/assets/css/demo-all.css">

	<script src="${pageContext.request.contextPath}/styles/vendors/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/vendors/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/vendors/jquery.perfect-scrollbar-1.3.0/dist/perfect-scrollbar.min.js"></script>

	<!-- bootstrap-dialog -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap-dialog/dist/css/bootstrap-dialog.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-dialog/dist/js/bootstrap-dialog.min.js"></script>	

	<script src="${pageContext.request.contextPath}/styles/assets/js/demo.js"></script>
	<!-- <script src="vendor/Chart.js/Chart.js"></script> -->
	<!-- <script src="assets/js/mysite.js"></script> -->
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
						<ol class="breadcrumb">
							<li>
								<a href="${pageContext.request.contextPath}/login/frontendIndex">首页</a>
							</li>
							<li>
								修改密码
							</li>
						</ol>
						<div>
							<br>
							<br>
							<div class="col-sm-4 col-sm-offset-4">
								<div class="form-group">
									<input type="password" id="pwd_old" name="pwd_old" class="form-control" placeholder="旧密码">
								</div>
								<div class="form-group">
									<input type="password" id="pwd" name="pwd" class="form-control" placeholder="新密码">
								</div>
								<div class="form-group">
									<input type="password" id="pwd_again" name="pwd_again" class="form-control" placeholder="请再次输入新密码">
								</div>
								<div class="form-group text-center">
									<button class="btn btn-primary" onclick="check_pwd();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
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
	<script>
		function check_pwd() {
			var $btn = $(this);
			$btn.prop('disabled', true);
			var passwd1 = document.getElementById("pwd").value;
			var passwd2 = document.getElementById("pwd_again").value;
			if (passwd1 != passwd2) {
				BootstrapDialog.alert({
					title: '失败',
					message: '新密码两次输入不一致，请重新输入！',
					type: BootstrapDialog.TYPE_DANGER
				});
				$btn.prop('disabled', false);
				return false;
			} else {
				var pData = {
					oldPassword: document.getElementById("pwd_old").value,
					newPassword: document.getElementById("pwd").value
				}

				$.ajax({
					url: "${pageContext.request.contextPath}/user/updatePassword",
					method: 'POST',
					dataType: "JSON",
					async: false,
					data: pData,
					success: function(result) {
						if (result.status == 1) {
							BootstrapDialog.alert({
								title: '成功',
								message: '更新成功，请重新登录！',
								type: BootstrapDialog.TYPE_SUCCESS,
								callback: function(result) {
									window.location = "${pageContext.request.contextPath}/logout";
					            }
							});
						}
						else if (result.status == 2) {
							BootstrapDialog.alert({
								title: '失败',
								message: '新密码或原密码不能为空！',
								type: BootstrapDialog.TYPE_DANGER
							});
							$btn.prop('disabled', false);
							return false;
						}
						else if (result.status == 3) {
							BootstrapDialog.alert({
								title: '失败',
								message: '新密码不能与原密码相同！',
								type: BootstrapDialog.TYPE_DANGER
							});
							$btn.prop('disabled', false);
							return false;
						}
						else if (result.status == -1) {
							BootstrapDialog.alert({
								title: '失败',
								message: '原密码错误，请重新输入！',
								type: BootstrapDialog.TYPE_DANGER
							});
							$btn.prop('disabled', false);
							return false;
						}
						else {
							BootstrapDialog.alert({
								title: '警告',
								message: '提问请求成功，未按照预期返回结果',
								type: BootstrapDialog.TYPE_DANGER
							});
							$btn.prop('disabled', false);
							return false;
						}
					},
					error: function(e) {
						BootstrapDialog.alert({
							title: '失败',
							message: '提问请求失败',
							type: BootstrapDialog.TYPE_DANGER
						});
						$btn.prop('disabled', false);
						return false;
					}
				})
			}
		}
	</script>
</body>

</html>