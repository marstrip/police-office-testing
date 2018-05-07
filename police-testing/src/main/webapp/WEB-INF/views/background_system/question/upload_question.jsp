<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>批量上传试卷</title>
<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/jquery.form.js"></script> -->

	<script src="${pageContext.request.contextPath}/styles/node_modules/jquery/dist/jquery.min.js"></script>

	<!-- jquery.serializeJSON -->
	<script src="${pageContext.request.contextPath}/styles/vendors/jquery.serializeJSON/jquery.serializejson.min.js"></script>

	<!-- BS table -->
	<!-- 基础依赖 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap3/dist/css/bootstrap-theme.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap3/dist/js/bootstrap.min.js"></script>

	<!-- bootstrap-table -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/bootstrap-table.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/bootstrap-table.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"></script>

	<!-- bootstrap-dialog -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap-dialog/dist/css/bootstrap-dialog.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-dialog/dist/js/bootstrap-dialog.min.js"></script>

	<style>
		.datetimepicker {
			z-index: 9999!important;
		}

		.paper-preview-dialog .modal-dialog {
			width: 980px;
		}

		.btn {
			margin-bottom: 0;
			font-size: 14px;
			line-height: 20px;
			color: #333333;
			text-align: center;
			text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
			vertical-align: middle;
			cursor: pointer;
			background-color: #f5f5f5;
			background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
			background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
			background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
			background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
			background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
			background-repeat: repeat-x;
			border: 1px solid #cccccc;
			border-color: #e6e6e6 #e6e6e6 #bfbfbf;
			border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
			border-bottom-color: #b3b3b3;
			-webkit-border-radius: 4px;
			-moz-border-radius: 4px;
			border-radius: 4px;
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
			filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
			-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
			-moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
			box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
		}

		.btn:hover,
		.btn:focus,
		.btn:active,
		.btn.active,
		.btn.disabled,
		.btn[disabled] {
			color: #333333;
			background-color: #e6e6e6;
			*background-color: #d9d9d9;
		}

		.btn:active,
		.btn.active {
			background-color: #cccccc \9;
		}

		.btn:first-child {
			*margin-left: 0;
		}

		.btn:hover,
		.btn:focus {
			color: #333333;
			text-decoration: none;
			background-position: 0 -15px;
			-webkit-transition: background-position 0.1s linear;
			-moz-transition: background-position 0.1s linear;
			-o-transition: background-position 0.1s linear;
			transition: background-position 0.1s linear;
		}

		.btn:focus {
			outline: thin dotted #333;
			outline: 5px auto -webkit-focus-ring-color;
			outline-offset: -2px;
		}

		.btn.active,
		.btn:active {
			background-image: none;
			outline: 0;
			-webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
			-moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
			box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
		}

		.btn.disabled,
		.btn[disabled] {
			cursor: default;
			background-image: none;
			opacity: 0.65;
			filter: alpha(opacity=65);
			-webkit-box-shadow: none;
			-moz-box-shadow: none;
			box-shadow: none;
		}

		/* 上传文件用 */
		.fake-file-btn {
			position: relative;
			display: inline-block;
			/*background: #D0EEFF;
			border: 1px solid #99D3F5;*/
			border-radius: 4px;
			padding: 6px 12px;
			overflow: hidden;
			/*color: #1E88C7;*/
			text-decoration: none;
			text-indent: 0;
			line-height: 20px;
		}
		.fake-file-btn:active {
			box-shadow: 0 1px 5px 1px rgba(0, 255, 255, 0.3) inset;
		}
		.fake-file-btn input[type=file] {
			position: absolute;
			font-size: 100px;
			right: 0;
			top: 0;
			opacity: 0;
			filter: alpha(opacity=0);
			cursor: pointer
		}
	</style>

</head>
<!-- <script type="text/javascript">
//上传试题文件
	function upload_file(){
		//得到上传文件的全路径
		var fileName = $("#uploadFile").val();
		//进行基本校验
		if (fileName == "") {
			alert("请上传文件!");
		} else {
			//对文件格式进行校验
			var d1 = /\.[^\.]+$/.exec(fileName);
			if (d1 == ".doc") {
				var value = $("#uploadForm").val();
				var option = {
						url:'${pageContext.request.contextPath}/question/uploadQuestion',//用于文件上传的服务器端请求地址
						type : 'POST',
						dataType : 'json',
						headers : {"ClientCallMode" : "ajax"}, //添加请求头部
						success : function(data) {
							if(data.status == -1){
								alert(data.message);
							}else {
								alert("上传题目总数:" + data.sum + ";单选题个数：" + data.singleSelectCount + ";多选题个数："+ data.manySelectCount +";判断题个数：" + data.judgeCount);
							}
						},
						error: function(data) {
							alert("上传失败，请联系管理员！")
						}
					};
				$("#uploadForm").ajaxSubmit(option);
				return false; //最好返回false，因为如果按钮类型是submit,则表单自己又会提交一次;返回false阻止表单再次提交
			}else {
				alert("清上传文件后缀为.doc的word文件！");
			}
		}
	}
</script> -->
<body>
<!-- <form id="uploadForm" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>
				上传试题：<input id="uploadFile" name="uploadFile" type="file">
				 <a href="javascript:void(0);"  onclick="upload_file();">上传</a>
			</td>
		</tr>
	</table>
</form> -->

<div class="panel panel-default">
	<div class="panel-body">
		<div id="table_11_toolbar">
			<span id="table_11_upload" class="btn btn-success fake-file-btn">
				<i class="glyphicon glyphicon-upload"></i> 上传
				<input type="file" id="uploadFile" accept="application/msword">
			</span>
		</div>

		<table id="table_11"></table>
	</div>	
</div>
<script type="text/javascript">
	$(document).ready(function(){
		var $table = $('#table_11');
		var selections = [];

		$table.bootstrapTable({
			url: '${pageContext.request.contextPath}/uploadLog/getList',
			method: 'GET',
			dataType: "json",
			striped: true,				//设置为 true 会有隔行变色效果  
			undefinedText: "空",		//当数据为 undefined 时显示的字符  
			pagination: true,			//分页  
			// paginationLoop:true,		//设置为 true 启用分页条无限循环的功能。
			icons: {
				paginationSwitchDown: 'glyphicon-collapse-down icon-chevron-down',
				paginationSwitchUp: 'glyphicon-collapse-up icon-chevron-up',
				refresh: 'glyphicon-refresh icon-refresh',
				toggle: 'glyphicon-list-alt icon-list-alt',
				columns: 'glyphicon-th icon-th',
				detailOpen: 'glyphicon-plus icon-plus',
				detailClose: 'glyphicon-minus icon-minus'
			},

			singleSelect: false,		// 即使是checkbox，也只能选中一个

			// showToggle: true,			//是否显示 切换试图（table/card）按钮
			showColumns: false,		//是否显示 内容列下拉框
			showRefresh: true,
			toolbar: '#table_11_toolbar',	// 指定了toolbar的选择器，会把toolbar加入到table的container里来
			//buttonsToolbar				// 给toolbar外边再套一层，支持新建node

			pageNumber: 1,				//如果设置了分页，首页页码
			// showPaginationSwitch:true,		//是否显示 数据条数选择框
			pageSize: 20,				//如果设置了分页，页面数据条数
			pageList: [3, 5, 10, 20, 50],	//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。数据不够，不显示
			paginationPreText: '‹',		//指定分页条中上一页按钮的图标或文字,这里是<
			paginationNextText: '›',	//指定分页条中下一页按钮的图标或文字,这里是>
			// singleSelect: false,		//设置True 将禁止多选
			search: false,				//显示搜索框
			data_local: "zh-US",		//表格汉化
			sidePagination: "server",	//服务端处理分页
			queryParams: function (params) {
				//自定义参数，这里的参数是传给后台的，我这是是分页用的
				console.log('params:', params);
				return {
					//这里的params是table提供的
					offset: params.offset,		//从数据库第几条记录开始
					limit: params.limit			//找多少条
				};
			},
			idField: "uploadFileId",			//指定主键列
			columns: [
				// {
				// 	field: 'state',
				// 	checkbox: true,
				// 	rowspan: 1,
				// 	align: 'center',
				// 	valign: 'middle'
				// },
				{
					title: 'ID',		// id
					field: 'uploadFileId',
					align: 'center',
					visible: false
				},
				{
					title: '文件名称',			//表的列名
					field: 'fileName',	//json数据中rows数组中的属性名
					align: 'center'		//水平居中
				},
				{
					//EMAIL
					title: '创建时间',
					field: 'createDate',
					align: 'center'
				},
				{
					//部门名字
					title: '创建人',
					field: 'creatorName',		//可以直接取到属性里面的属性，赞
					align: 'center'
				}
			]
		});
		// 刷新按钮细节补全
		$('button[name=refresh]').addClass('form-control-static').css({
			"margin-left": "10px",
			"border-top-left-radius": "4px",
			"border-bottom-left-radius": "4px"
		});

		// 上传按钮事件绑定
		$(".fake-file-btn").on("change", "input[type='file']", function() {
			// 得到上传文件的全路径
			var fileName = $("#uploadFile").val();
			
			// 对文件格式进行校验
			var d1 = /\.[^\.]+$/.exec(fileName);
			if (d1 == ".doc") {
				var formData = new FormData();
				//追加文件数据
				var file = document.getElementById('uploadFile').files;
				formData.append("uploadFile", file[(file.length - 1)]);

				$.ajax({
					url: "${pageContext.request.contextPath}/question/uploadQuestion",
					type: 'POST',
					dataType : 'JSON',
					timeout: 30 * 1000,
					data: formData,
					processData: false,
					contentType: false,
					success: function(data) {
						if(data.status == -1){
							failAlert(data.message);
						} else {
							successAlert("上传题目总数：" + data.sum + "<br />单选题个数：" + data.singleSelectCount + "<br />多选题个数："+ data.manySelectCount +"<br />判断题个数：" + data.judgeCount);
							$table.bootstrapTable('refresh', {silent: false});
						}
					},
					error: function(data) {
						failAlert("上传失败，请联系管理员！")
					},
					complete: function() {
						$("#uploadFile").val('');	// 删掉已选文件
					}
				});
			} else {
				failAlert("请上传文件后缀为.doc的word文件！");
				$("#uploadFile").val('');	// 删掉已选文件
			}
		});
	});

	function failAlert(msg) {
		BootstrapDialog.alert({
			title: '上传失败',
			message: function() {
				return msg;
			},
			type: BootstrapDialog.TYPE_DANGER
		});
	}
	function successAlert(msg) {
		BootstrapDialog.alert({
			title: '上传成功',
			message: function() {
				return msg;
			},
			type: BootstrapDialog.TYPE_SUCCESS
		});
	}
</script>
</body>
</html>