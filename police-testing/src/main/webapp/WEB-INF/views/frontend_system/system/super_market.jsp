<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<title>插件超市</title>
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
	
	<!-- bootstrap-treeview -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.css">
	<script src="${pageContext.request.contextPath}/styles/vendors/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.js"></script>

	<style>
		.list-group-item {
			border-radius: 0px;
			border-top-right-radius: 0px!important;
    		border-top-left-radius: 0px!important;
			border-bottom-right-radius: 0px!important;
    		border-bottom-left-radius: 0px!important;
		}
		.list-group-item:first-child {
    		border-top-width: 0px;
		}
		.list-group-item + .list-group-item {
			border-radius: 0px;
			border-top-right-radius: 0px!important;
    		border-top-left-radius: 0px!important;
			border-bottom-right-radius: 0px!important;
    		border-bottom-left-radius: 0px!important;
    		border-bottom-width: 0px;
		}
	</style>
</head>
<body>
	<div class="psb-container psb-here">
		<div class="psb-content">

			<div class="mastbg">
				<div class="masthead">
					<div class="thin-body masthead-bg">
					</div>
				</div>

				<div class="thin-body mastbody-pre">
					<div class="mastbody" style="">
						<ol class="breadcrumb">
	                        <li>
	                            <a href="${pageContext.request.contextPath}/login/frontendLogin">首页</a>
	                        </li>
	                        <li>
	                            课件超市
	                        </li>
	                    </ol>

						<div class="left-area">
							<div class="panel panel-white">
								<div class="panel-heading">
									<h3 class="panel-title">
										快速导航
									</h3>
								</div>
								<div class="panel-body" style="padding: 0;">
									<div class="tree" id="lessonTree">
										https://www.npmjs.com/package/bootstrap-treeview
									</div>
								</div>
							</div>
						</div>

						<div class="right-area">
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										课件列表
									</h3>
								</div>
								<div class="panel-body" style="padding-top: 0;">
									<div class="notice-list">
										<table class="table">
											<tbody>
												<tr>
													<td class="fix-text" style="border-top-color: transparent;">
														<a href="" onclick="return false;">2008年奥运会将在北京举行！关于上级领导的指示关于上级领导的指示关于上级领导的指示</a>
													</td>
													<td style="border-top-color: transparent;">2005/07/09</td>
												</tr>
												<tr>
													<td class="fix-text">
														<a href="" onclick="return false;">2008年奥运会将在北京举行！发票清算。</a>
													</td>
													<td>2005/07/09</td>
												</tr>
												<tr>
													<td class="fix-text">
														<a href="" onclick="return false;">2008年奥运会将在北京举行！关于上级领导的指示</a>
													</td>
													<td>2005/07/09</td>
												</tr>
												<tr>
													<td class="fix-text">
														<a href="" onclick="return false;">2008年奥运会将在北京举行！关于上级领导的指示关于上级领导的指示</a>
													</td>
													<td>2005/07/09</td>
												</tr>
												<tr>
													<td class="fix-text">
														<a href="" onclick="return false;">2008年奥运会将在北京举行！</a>
													</td>
													<td>2005/07/09</td>
												</tr>
											</tbody>
										</table>
									</div><!-- end of .notice-list -->
								</div>
							</div>

						</div>

						<br>	
					</div>

				</div>

			</div>
		</div>

		<footer class="footer">
			<div class="row">
				<ul class="text-center no-style">
					<li>
						<span>北京市公安局东城分局政治处</span>
					</li>
					<li>
						<span>建议使用Chrome浏览器 &nbsp; 推荐分辨率：1366&times;768</span>
					</li>
				</ul>
			</div>
		</footer>
	</div>
	<script>
		$(document).ready(function() {

			var lessonTreeData = [{
				text: "执法资格等级考试",
				icon: "fa fa-folder-o",
				selectable: false, // 当前节点不可选中，可展开
				nodes: [{
					text: "基本级",
					dataFolder: '',
					dataFile: '',
					href: '#'
				}, {
					text: "中级",
					dataFolder: '',
					dataFile: '',
					href: '#'
				}, {
					text: "高级",
					dataFolder: '',
					dataFile: '',
					href: '#'
				}]
			}, {
				text: "法律法规",
				dataFolder: '',
				dataFile: '',
				href: "#"
			}, {
				text: "党的建设",
				dataFolder: '',
				dataFile: '',
				href: "#"
			}];

			$('#lessonTree').treeview({
				data: lessonTreeData,
				collapseIcon: "fa fa-minus-square-o",
				expandIcon: "fa fa-plus-square-o",
				nodeIcon: "fa fa-file-o"
			});

			$('#lessonTree').on('nodeSelected', function (event, node) {
				console.log('select NODE:', node);

				// 更新右边列表
			});
		});
	</script>
</body>
</html>