<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String homePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort();
	String basePath = homePath + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>在线考试系统后台</title>
	
	<!-- 插件css部分 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/font-awesome/css/font-awesome.min.css">
	
	<!-- 基于bootstrap的菜单，自制 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/assets/plugins/bootstrap-sidebar/css/bootstrap-sidebar.css">

	<!-- 本站自用css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/assets/css/mysite.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="base-container">

		<!-- 上方导航条部分 -->
		<nav class="navbar navbar-default no-radius no-margin" role="navigation">
	        <div class="navbar-header">
	        	<!-- 小屏幕按钮 -->
	        	<div class="pull-left menu-container">
	        		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sideme">
		                <!-- <span class="sr-only">切换导航</span> -->
		                <span class="bar"></span>
		                <span class="bar"></span>
		                <span class="bar"></span>
		            </button>
		        </div>
	            
	            <a class="navbar-brand v-middle title-block" href="#">
	                <span class="fa fa-codepen fa-2x">
	                    <!-- <img src="assets/img/logo2.gif" style="height: 50px; width: 50px"/> -->
	                </span>
	                <span>管理平台</span>
	            </a>
	        </div>
	    </nav>
		
		<!-- 左侧小屏用菜单 -->
		<div class="sidebar sidebar-left sidebar-animate sidebar-md-show side-menu collapse hide-out-xs" id="sideme">
		</div>

		<!-- 左侧大屏用菜单 -->
		<div class="sidebar sidebar-left sidebar-animate sidebar-md-show side-menu hide-in-xs">
		</div>

		<!-- 右侧内容区域 -->
		<div class="frame-container">
			<iframe src="" frameborder="0" id="mainFrame"></iframe>
		</div>
	</div>

	<!-- 插件js部分 -->
	<script src="${pageContext.request.contextPath}/styles/vendors/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/vendors/bootstrap/js/bootstrap.min.js"></script>

	<!-- 基于bootstrap的菜单，自制 -->
	<script src="${pageContext.request.contextPath}/styles/assets/plugins/bootstrap-sidebar/js/bootstrap-sidebar.js"></script>

	<!-- 渲染菜单方法 -->
	<script>
	$(document).ready(function(){
		$.ajax({
			type : "post",
		    url : "${pageContext.request.contextPath}/getMenu",
            dataType : "json",
            success: function(data){
            	console.log(data);
            	 $('.side-menu').sidebar({
						"iframeId": "mainFrame",
						"data": data
					});
           	}
          });
	});
	
	/* $('.side-menu').sidebar({
		"iframeId": "mainFrame",
		"data": [
			{
				"text": "着陆页",
				"href": "landpage.html"
			},
			{
				"text": "可展开菜单",
				"href": "#",
				"children": [
					{
						"text": "百度",
						"href": "http://www.baidu.com"
					}, {
						"text": "新浪",
						"href": "http://www.sina.com"
					}
				]
			},
			{
				"text": "谷歌",
				"href": "page-a.html"
			}
		],
	}); */
	</script>
</body>
</html>