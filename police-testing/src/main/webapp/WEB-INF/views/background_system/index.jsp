<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

	<style>
		.sidebar-tabs {
			margin-right: 105px;
		}
		.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
			border-bottom-color: white;
			z-index: 99999999;
		}
	</style>
    <script type="text/javascript">
        //从服务器上获取初始时间
        var currentDate = new Date(<%=new java.util.Date().getTime()%>);
        function run()
        {
            currentDate.setSeconds(currentDate.getSeconds()+1);
            var time = "";
            var year = currentDate.getFullYear();
            var month = currentDate.getMonth() + 1;
            var day = currentDate.getDate();
            var hour = currentDate.getHours();
            var minute = currentDate.getMinutes();
            var second = currentDate.getSeconds();
            if(hour < 10){
                time += "0" + hour;
            }else{
                time += hour;
            }
            time += ":";
            if(minute < 10){
                time += "0" + minute;
            }else{
                time += minute;
            }
            time += ":";
            if(second < 10){
                time += "0" + second;
            }else{
                time += second;
            }
            document.getElementById("time").innerHTML = year+"年"+month+"月"+day+"日" + time;
        }
        window.setInterval("run();", 1000);

    function checkTime(i){
            if (i<10)
            {i="0" + i}
            return i
        }
    </script>
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
					<span style="padding-left: 10px;">在线考试管理系统</span>
				</a>
			</div>

			<div class="navbar-body" id="myTab">
				<a href="${pageContext.request.contextPath}/logout" class="btn btn-warning pull-right" style="margin: 8px 15px;"><i class="glyphicon glyphicon-log-out"></i> 退出</a>
                <label class="pull-right" style="margin: 14px 15px;" id="time"></label>
            </div>
		</nav>
		
		<!-- 左侧小屏用菜单 -->
		<div class="sidebar sidebar-left sidebar-animate sidebar-md-show side-menu collapse hide-out-xs" id="sideme">
		</div>

		<!-- 左侧大屏用菜单 -->
		<div class="sidebar sidebar-left sidebar-animate sidebar-md-show side-menu hide-in-xs">
		</div>

		<!-- 右侧内容区域 -->
		<div class="frame-container" id="myTabContent">
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
			type: "post",
			url: "${pageContext.request.contextPath}/getMenu",
			dataType : "json",
			success: function(data){
				console.log(data);
				 $('.side-menu').sidebar({
						// "iframeId": "mainFrame",
						"tabsId": "myTab",					// 放置标签的容器id
						"tabsContentId": "myTabContent",	// 放置标签页内容的容器id
						"data": data
					});
			}
		});
	});
	</script>
</body>
</html>