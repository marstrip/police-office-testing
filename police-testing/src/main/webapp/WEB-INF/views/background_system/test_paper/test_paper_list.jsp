<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
	<!-- jquery -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/jquery-3.3.1.min.js"></script>

	<!-- 王editor -->
	<script src="${pageContext.request.contextPath}/styles/vendors/wangEditor-3.1.1/release/wangEditor.min.js"></script>
	<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/wangEditor-3.1.1/release/wangEditor.min.css"> -->

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

	<!-- jquery-validation -->
	<script src="${pageContext.request.contextPath}/styles/node_modules/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/node_modules/jquery-validation/dist/localization/messages_zh.js"></script>

	<!-- fb 组件 -->
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/fb.baseContainer.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/containers/form.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/containers/form-group.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/containers/multimedia.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/containers/stream.js"></script>

	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/fb.baseComponent.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/components/textarea.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/components/text.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/components/select.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/components/audio.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/components/radio.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/components/checkbox.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/components/datetimepicker.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/components/image.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/components/number.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/components/multiselect.js"></script>

	<!-- fb 额外 -->
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/extra/qiniuCustomized.js"></script>
	<link href="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/css/popup.css" rel="stylesheet" type="text/css"/>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/extra/popup.js"></script>

	<!-- fb 核心文件 -->
	<link href="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/css/form-builder-2.css" rel="stylesheet" type="text/css"/>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/fb.eventBinds.js"></script>
	<script src="${pageContext.request.contextPath}/styles/assets/form-builder-2/src/fb-bs/js/fb.core.js"></script>

	<!-- 组卷核心js -->
	<script src="${pageContext.request.contextPath}/styles/assets/gen-paper/genPaper.js"></script>

	<style type="text/css">
		h1{
			font-family: "微软雅黑";
			font-weight: normal;
		}
		.btn {
			display: inline-block;
			*display: inline;
			padding: 4px 12px;
			margin-bottom: 0;
			*margin-left: .3em;
			font-size: 14px;
			line-height: 20px;
			color: #333333;
			text-align: center;
			text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
			vertical-align: middle;
			cursor: pointer;
			background-color: #f5f5f5;
			*background-color: #e6e6e6;
			background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
			background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
			background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
			background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
			background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
			background-repeat: repeat-x;
			border: 1px solid #cccccc;
			*border: 0;
			border-color: #e6e6e6 #e6e6e6 #bfbfbf;
			border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
			border-bottom-color: #b3b3b3;
			-webkit-border-radius: 4px;
			-moz-border-radius: 4px;
			border-radius: 4px;
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
			filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
			*zoom: 1;
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

		.modal-dialog {
			min-width: 800px;
			width: 90%;
		}
	</style>
</head>
<body>
	
	<div class="panel panel-default">
		<div class="panel-body">
			<div id="table_11_toolbar">
				<!-- <button id="table_11_add" class="btn btn-success">
					<i class="glyphicon glyphicon-plus"></i> 新增
				</button> -->
				<button id="table_11_edit" class="form-control-static btn btn-warning" disabled>
					<i class="glyphicon glyphicon-export"></i> 导出成绩
				</button>
				<button id="table_11_delete" class="form-control-static btn btn-danger" disabled>
					<i class="glyphicon glyphicon-check"></i> 设置状态
				</button>
				<button id="table_11_view" class="form-control-static btn btn-primary" disabled>
					<i class="glyphicon glyphicon-eye-open"></i> 预览
				</button>
                <button id="table_11_test" class="form-control-static btn btn-danger" disabled>
                    <i class="glyphicon glyphicon-eye-open"></i> 开始考试
                </button>
                <button id="table_11_stoptest" class="form-control-static btn btn-danger" disabled>
                    <i class="glyphicon glyphicon-eye-open"></i> 考试结束
                </button>

			</div>
			<table id="table_11"></table>
		</div>
	</div>

  <!-- <table>
  	<tr>
  		<td>
  			<textarea id="myEditor" rows= 30" cols="100"></textarea>
  		</td>
  	</tr>
  	<tr>
  		<td>
			<button class="btn" unselected="on" onclick="getAllHtml()">获得整个html的内容</button>
  		</td>
  	</tr>
  </table> -->
</body>
<script type="text/javascript">

	$(document).ready(function(){
		var $btn_add = $('#table_11_add');
		var $btn_edit = $('#table_11_edit');
		var $btn_delete = $('#table_11_delete');
		var $btn_view = $('#table_11_view');
		//立即考试按钮
		var $btn_test = $('#table_11_test');
		var $btn_stoptest = $('#table_11_stoptest');

		var $table = $('#table_11');
		var selections = [];
		$table.bootstrapTable({
			url: '${pageContext.request.contextPath}/testPaper/getList',
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

			singleSelect: true,		// 即使是checkbox，也只能选中一个

			// showToggle: true,			//是否显示 切换试图（table/card）按钮
			// showColumns: true,		//是否显示 内容列下拉框
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
			search: true,				//显示搜索框
			data_local: "zh-US",		//表格汉化
			sidePagination: "server",	//服务端处理分页
			queryParams: function (params) {
				//自定义参数，这里的参数是传给后台的，我这是是分页用的
				console.log('params:', params);
				return {
					//这里的params是table提供的
					offset: params.offset,		//从数据库第几条记录开始
					limit: params.limit,		//找多少条
					search: params.search		//筛选
				};
			},
			idField: "testPaperId",			//指定主键列
			columns: [
				{
					field: 'state',
					checkbox: true,
					rowspan: 1,
					align: 'center',
					valign: 'middle'
				},
				{
					title: 'ID',		// id
					field: 'testPaperId',
					align: 'center',
					visible: false
				},
				{
					title: '试卷名称',			//表的列名
					field: 'testPaperName',	//json数据中rows数组中的属性名
					align: 'center'		//水平居中
				},
				{
					title: '考试开始时间',			//表的列名
					field: 'beginDate',	//json数据中rows数组中的属性名
					align: 'center'		//水平居中
				},
				{
					title: '考试结束时间',			//表的列名
					field: 'testDate',	//json数据中rows数组中的属性名
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
				},
				{
					//部门名字
					title: '状态',
					field: 'enable',		//可以直接取到属性里面的属性，赞
					align: 'center',
					formatter: function (value, row, index) {//自定义显示，这三个参数分别是：value该行的属性，row该行记录，index该行下标
						return row.enable == 1 ? "可用" :"不可用";
					}
				}
			]
		});

		// 刷新按钮细节补全
		$('button[name=refresh]').addClass('form-control-static').css({
			"margin-left": "10px",
			"border-top-left-radius": "4px",
			"border-bottom-left-radius": "4px"
		});

		// 获取选中的ids
		function getIdSelections() {
			return $.map($table.bootstrapTable('getSelections'), function (row) {
				return row.testPaperId
			});
		}
		 
		// 获取选中的行
		function getIdSelectionsRows() {
			return $.map($table.bootstrapTable('getSelections'), function (row) {
				return row
			});
		}
		// 每次勾选更新已选中内容，更新按钮
		$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
			// save your data, here just save the current page
			selections = getIdSelections();
			console.log('selections:', selections);
			// push or splice the selections if you want to save all data selections

			$btn_delete.prop('disabled', !selections.length);
			$btn_edit.prop('disabled', selections.length !== 1);
			$btn_view.prop('disabled', selections.length !== 1);
			//立即考试
			$btn_test.prop('disabled', selections.length !== 1);
            $btn_stoptest.prop('disabled', selections.length !== 1);
		});

		// 刷新时，清空所有已选项
		$table.on('refresh.bs.table', function(params) {
			// save your data, here just save the current page
			selections = [];
			console.log('selections:', selections);
			// push or splice the selections if you want to save all data selections

			$btn_delete.prop('disabled', !selections.length);
			$btn_edit.prop('disabled', selections.length !== 1);
			$btn_view.prop('disabled', selections.length !== 1);
            $btn_test.prop('disabled', selections.length !== 1);
            $btn_stoptest.prop('disabled', selections.length !== 1);
		});
		

		//导出成绩
		$btn_edit.click(function() {
			// 确认框
			var cfm = BootstrapDialog.confirm({
				title: '确认',
				message: '请确认导出？',
				type: BootstrapDialog.TYPE_DANGER, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
				// closable: true, // <-- Default value is false
				draggable: true, // <-- Default value is false
				btnCancelLabel: '取消', // <-- Default value is 'Cancel',
				btnOKLabel: '确认', // <-- Default value is 'OK',
				btnOKClass: 'btn-danger', // <-- If you didn't specify it, dialog type will be used,
				callback: function(isYes) {
					if (isYes) {
						// 整合数据
						/* var formData = {
							testPaperId: getIdSelections()[0]
						}; */
						var testPaperId = getIdSelections()[0];
						window.location.href='${pageContext.request.contextPath}/exportFile/exportFileByTestPaperId?testPaperId=' + testPaperId; 
						/* $.ajax({
							url: '${pageContext.request.contextPath}/exportFile/exportFileByTestPaperId',
							data : formData,
							success: function(d) {
								var result = $.parseJSON(d);
								console.log('提交', d, result.message, result.status);

								if (result.status == 1) {
									var alt = BootstrapDialog.alert({
										title: '成功',
										message: result.message,
										type: BootstrapDialog.TYPE_SUCCESS
									});
									alt.$modalDialog.css('width', '100px');
									$table.bootstrapTable('refresh', {silent: false});
								} else {
									var alt = BootstrapDialog.alert({
										title: '失败',
										message: result.message,
										type: BootstrapDialog.TYPE_DANGER
									});
									alt.$modalDialog.css('width', '100px');
									$table.bootstrapTable('refresh', {silent: false});
								}
							},
							error: function(d) {
								BootstrapDialog.alert('提交删除请求失败');
							}
						}); */
					}
					
				}
			});
			cfm.$modalDialog.css('width', '300px');
		});
		
		
		// 删
		$btn_delete.click(function() {
			// 确认框
			var cfm = BootstrapDialog.confirm({
				title: '确认',
				message: '请确认是否重置？（如果当前状态为：“可用”，则修改为“不可用”。如果当前状态为“不可用”，则修改为“可用”）',
				type: BootstrapDialog.TYPE_DANGER, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
				// closable: true, // <-- Default value is false
				draggable: true, // <-- Default value is false
				btnCancelLabel: '取消', // <-- Default value is 'Cancel',
				btnOKLabel: '确认', // <-- Default value is 'OK',
				btnOKClass: 'btn-danger', // <-- If you didn't specify it, dialog type will be used,
				callback: function(isYes) {
					if (isYes) {
						// 整合数据
						var formData = {
							testPaperId: getIdSelections()[0],
							enable : getIdSelectionsRows()[0].enable
						};

						$.ajax({
							url: '${pageContext.request.contextPath}/testPaper/deleteData',
							data : formData,
							success: function(d) {
								var result = $.parseJSON(d);
								console.log('提交', d, result.message, result.status);

								if (result.status == 1) {
									var alt = BootstrapDialog.alert({
										title: '成功',
										message: result.message,
										type: BootstrapDialog.TYPE_SUCCESS
									});
									alt.$modalDialog.css('width', '100px');
									$table.bootstrapTable('refresh', {silent: false});
								} else {
									var alt = BootstrapDialog.alert({
										title: '失败',
										message: result.message,
										type: BootstrapDialog.TYPE_DANGER
									});
									alt.$modalDialog.css('width', '100px');
									$table.bootstrapTable('refresh', {silent: false});
								}
							},
							error: function(d) {
								BootstrapDialog.alert('提交删除请求失败');
							}
						});
					}
					
				}
			});
			cfm.$modalDialog.css('width', '300px');
		});

		// 查看详情
		$btn_view.click(function() {
			$.ajax({
				url: '${pageContext.request.contextPath}/testPaper/viewTestPaper',
				dataType: "JSON",
				data: {
					testPaperId: getIdSelections()[0],
				},
				success: function(result) {
					BootstrapDialog.show({
						title: '预览',
						message: function() {
							var $message = $('<div></div>');
							var formData = {
								testPaperName: result.testPaperName,
								testTime: result.testTime
							};
							$message.genPaper(formData, result, true);
							return $message;
						},
						draggable: true // <-- Default value is false
					});
				},
				error: function(result) {
					BootstrapDialog.alert({
						title: '查看详情失败',
						message: result.message,
						type: BootstrapDialog.TYPE_DANGER
					});
				}
			});
		});

        // 立即考试
        $btn_test.click(function() {
            // 确认框
            var cfm = BootstrapDialog.confirm({
                title: '确认',
                message: '请确认是否立即开始考试？',
                type: BootstrapDialog.TYPE_DANGER, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
                // closable: true, // <-- Default value is false
                draggable: true, // <-- Default value is false
                btnCancelLabel: '取消', // <-- Default value is 'Cancel',
                btnOKLabel: '确认', // <-- Default value is 'OK',
                btnOKClass: 'btn-danger', // <-- If you didn't specify it, dialog type will be used,
                callback: function(isYes) {
                    if (isYes) {
                        // 整合数据
                        var formData = {
                            testPaperId: getIdSelections()[0],
                        };

                        $.ajax({
                            url: '${pageContext.request.contextPath}/testPaper/immediatelyTest',
                            data : formData,
                            success: function(d) {
                                var result = $.parseJSON(d);
                                console.log('提交', d, result.message, result.status);

                                if (result.status == 1) {
                                    var alt = BootstrapDialog.alert({
                                        title: '成功',
                                        message: result.message,
                                        type: BootstrapDialog.TYPE_SUCCESS
                                    });
                                    alt.$modalDialog.css('width', '100px');
                                    $table.bootstrapTable('refresh', {silent: false});
                                } else {
                                    var alt = BootstrapDialog.alert({
                                        title: '失败',
                                        message: result.message,
                                        type: BootstrapDialog.TYPE_DANGER
                                    });
                                    alt.$modalDialog.css('width', '100px');
                                    $table.bootstrapTable('refresh', {silent: false});
                                }
                            },
                            error: function(d) {
                                BootstrapDialog.alert('提交删除请求失败');
                            }
                        });
                    }

                }
            });
            cfm.$modalDialog.css('width', '300px');
        });

        // 立即停止考试
        $btn_stoptest.click(function() {
            // 确认框
            var cfm = BootstrapDialog.confirm({
                title: '确认',
                message: '请确认是否将考试状态设置为结束？',
                type: BootstrapDialog.TYPE_DANGER, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
                // closable: true, // <-- Default value is false
                draggable: true, // <-- Default value is false
                btnCancelLabel: '取消', // <-- Default value is 'Cancel',
                btnOKLabel: '确认', // <-- Default value is 'OK',
                btnOKClass: 'btn-danger', // <-- If you didn't specify it, dialog type will be used,
                callback: function(isYes) {
                    if (isYes) {
                        // 整合数据
                        var formData = {
                            testPaperId: getIdSelections()[0],
                        };

                        $.ajax({
                            url: '${pageContext.request.contextPath}/testPaper/stopTest',
                            data : formData,
                            success: function(d) {
                                var result = $.parseJSON(d);
                                console.log('提交', d, result.message, result.status);

                                if (result.status == 1) {
                                    var alt = BootstrapDialog.alert({
                                        title: '成功',
                                        message: result.message,
                                        type: BootstrapDialog.TYPE_SUCCESS
                                    });
                                    alt.$modalDialog.css('width', '100px');
                                    $table.bootstrapTable('refresh', {silent: false});
                                } else {
                                    var alt = BootstrapDialog.alert({
                                        title: '失败',
                                        message: result.message,
                                        type: BootstrapDialog.TYPE_DANGER
                                    });
                                    alt.$modalDialog.css('width', '100px');
                                    $table.bootstrapTable('refresh', {silent: false});
                                }
                            },
                            error: function(d) {
                                BootstrapDialog.alert('提交删除请求失败');
                            }
                        });
                    }

                }
            });
            cfm.$modalDialog.css('width', '300px');
        });
	});
  </script>
</html>