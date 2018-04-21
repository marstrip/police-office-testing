<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="min-height: 100%; background: #f5f5f5;">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title></title>
	<!-- jquery -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/jquery-3.3.1.min.js"></script>

	<!-- jquery.serializeJSON -->
	<script src="${pageContext.request.contextPath}/styles/vendors/jquery.serializeJSON/jquery.serializejson.min.js"></script>
	
	<!-- BS table -->
	<!-- 基础依赖 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap3/dist/css/bootstrap-theme.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/jquery/dist/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap3/dist/js/bootstrap.min.js"></script>

	<!-- bootstrap-table -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/bootstrap-table.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/bootstrap-table.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"></script>

	<!-- bootstrap-dialog -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap-dialog/dist/css/bootstrap-dialog.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-dialog/dist/js/bootstrap-dialog.min.js"></script>

	<!-- 日期选择控件 -->
	<link href="${pageContext.request.contextPath}/styles/vendors/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	<script src="${pageContext.request.contextPath}/styles/vendors/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/vendors/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

	<!-- jquery-validation -->
	<script src="${pageContext.request.contextPath}/styles/node_modules/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/node_modules/jquery-validation/dist/localization/messages_zh.js"></script>

	<!-- 组卷核心js -->
	<script src="${pageContext.request.contextPath}/styles/assets/gen-paper/genPaper.js"></script>

	<style>
		/*.datetimepicker {
			z-index: 9999!important;
		}

		.paper-preview-dialog .modal-dialog {
			width: 980px;
		}*/


		.paper {
			border: 1px solid #999;
			border-radius: 4px;
			background: #fff;
		}

		.panel-white {
		    border-color: #999;
		}

		.exam-header-item + .exam-header-item {
			border-left: 1px solid #ddd;
		}
	</style>

</head>
<body style="background: transparent;">
	
	<div class="mastbody" style="background: transparent;">
        <!-- 面板区域 -->
        <div style="width: 90px; margin-right: 25px; float: right; position: fixed; right: calc(50% - 600px);">
            <div class="panel panel-white" style="display: block; position: relative; overflow: hidden;">
                <div class="panel-body hover" style="text-align: center; background: #f5f5f5; display: block;">
                    <div class="icon">
                        <i class="fa fa-clock-o fa-4x"></i>
                    </div>
                    <div class="icon-description">
                        96分16秒
                    </div>
                    <div class="weak small">
                        共1题
                    </div>
                </div>
                <div class="panel-footer hover" style="text-align: center; background: #fff;" onclick="go_index();">
                    <div class="icon">
                        <i class="fa fa-arrow-circle-o-left fa-2x"></i>
                    </div>
                    <div class="icon-description">
                        返回首页
                    </div>
                </div>
                <div class="panel-footer hover" style="text-align: center; background: #fff;">
                    <div class="icon">
                        <i class="fa fa-pause-circle-o fa-2x"></i>
                    </div>
                    <div class="icon-description">
                        暂停
                    </div>
                </div>
                <div class="panel-footer hover btn-success" style="margin-left: -1px; text-align: center; background: #449d44;" onclick="go_result();">
                    <div class="icon">
                        <i class="fa fa-check-circle-o fa-2x"></i>
                    </div>
                    <div class="icon-description">
                        提交
                    </div>
                </div>
            </div>
        </div>

        <!-- 答题区域 -->
        <div id="paperContainer">
            
        </div>
	</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		var $paperContainer = $('#paperContainer');

		$.ajax({
			url: '${pageContext.request.contextPath}/testPaper/viewTestPaper',
			method: "POST",
			data: {
				testPaperId: 'TEST1f86946e-85b3-42e5-afc6-25eac00d5378'
			},
			success: function(d) {
				var result = $.parseJSON(d);
				console.log('>>>', result);

				if (result.status !== 1) {
					alert('请求成功，但是无法取得数据！!请刷新浏览器重试！！');
				} else {
					var formData = {
						testPaperName: result.testPaperName,
						testTime: result.testTime
					}
					$paperContainer.genPaper(formData, result, true);	// TODO: 改为false
				}
			},
			error: function() {
				alert('发生异常！无法发送请求！！请刷新浏览器重试！！');
			}
		});
	});
</script>
</html>