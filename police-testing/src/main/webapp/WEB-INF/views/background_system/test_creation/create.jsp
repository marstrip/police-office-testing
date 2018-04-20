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

	<style>
		.datetimepicker {
			z-index: 9999!important;
		}
	</style>

	<!--  PAGINATION plugin -->
	<!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/bs_pagination/jquery.bs_pagination.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/styles/bs_pagination/jquery.bs_pagination.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/styles/bs_pagination/localization/en.min.js"></script> -->

	<!-- jquery -->
	<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/jquery.form.js"></script> -->

	<!-- bootstrap -->
	<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/bootstrap-3.3.7-dist/css/bootstrap.min.css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath}/styles/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> -->

	<!-- <script type="text/javascript">
		//查询上传
		function search_log(){
			var beginDate = "";
			var endDate = "";
			var uploadFileId = "";
			$.ajax({
				type: 'POST',
		        url: '${pageContext.request.contextPath}/allocation/save',
		        data : {
		        	beginDate : beginDate,
		        	endDate : endDate,
		        	uploadFileId : uploadFileId
		        },
		        dataType : 'json',
		        success: function(data){
		        	
		        } 
			})
		}
	</script> -->

</head>
<body>


	<!-- <div id="demo_pag1"></div>
	<form id="uploadForm" method="post">
		  <table>
				<tr>
					<td>
						试卷名称：<input id="testPaperName" name="testPaperName" type="text"/>				
					</td>
				</tr>
				<tr>
					<td>
						组题范围选择：
					</td>
					<td>
						按照上传数据时间组题：<input id="testCreateType" name="testCreateType" type="radio" value="1"/>
					</td>
					<td>
						选择上传文件记录组题：<input id="testCreateType" name="testCreateType" type="radio" value="2"/>	
					</td>
				</tr>
				<tr>
					<td>
						单选题个数：<input id="singleSelectCount" name="singleSelectCount" type="text" value="15"/>
					</td>
					<td>
						多选题个数：<input id="manySelectCount" name="manySelectCount" type="text" value="20"/>
					</td>
					<td>
						判断题个数：<input id="judgeCount" name="judgeCount" type="text" value="10"/>
					</td>
				</tr>
				<tr>
					<td>
						单选题分数：<input id="singleSelectScore" name="singleSelectScore" type="text" value="2"/>
					</td>
					<td>
						多选题个数：<input id="manySelectScore" name="manySelectScore" type="text" value="3"/>
					</td>
					<td>
						判断题个数：<input id="judgeScore" name="judgeScore" type="text" value="1"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						筛选：<input id="searchQuestion" name="searchQuestion" type="button" onclick="search_log();"/>
					</td>
				</tr>
		  </table>	

		  <table class="table table-striped">
		  	<tr>
		  		<td>
		  			序号
		  		</td>
		  		<td>
		  			试卷编号
		  		</td>
		  		<td>
					试卷名称		
		  		</td>
	  			<td>
	  				试卷类型
	  			</td>
	  			<td>
	  				创建人
	  			</td>
		  		<td>
					创建时间			
		  		</td>
		  		<td>
					更新时间			
		  		</td>
		  		<td>
					当前状态			
		  		</td>
		  	</tr>
		  </table>
	</form>	 -->

	
	<!-- 筛选 -->

	<div class="panel panel-default">
		<div class="panel-body">
			<div id="table_11_toolbar">
				<!-- <button id="table_11_add" class="btn btn-success">
					<i class="glyphicon glyphicon-plus"></i> 新增
				</button>
				<button id="table_11_edit" class="btn btn-warning" disabled>
					<i class="glyphicon glyphicon-edit"></i> 编辑
				</button>
				<button id="table_11_delete" class="btn btn-danger" disabled>
					<i class="glyphicon glyphicon-remove"></i> 删除
				</button>
				<button id="table_11_view" class="btn btn-primary" disabled>
					<i class="glyphicon glyphicon-eye-open"></i> 预览
				</button> -->
				
					

			</div>
			<span id="table_11_rightHack">
				<div class="input-group pull-left" style="width: 482px;">
					<span class="input-group-addon">日期从</span>
					<input type="text" class="form-control" style="width: 87px;" placeholder="开始日期" name="beginDate" id="beginDate">
					<span class="input-group-addon">至</span>
					<input type="text" class="form-control" style="width: 87px;" placeholder="结束日期" name="endDate" id="endDate">
				<!-- </div>
				<div class="input-group pull-left" style="width: 200px; margin-left: 10px;"> -->
					<span class="input-group-addon">关键字</span>
					<input type="text" class="form-control" style="width: 133px;" placeholder="模糊查询" name="search" id="search">

					<span class="btn btn-default input-group-addon" style="width: 54px;" id="btn_search">
						查找
					</span>
				</div>
			</span>
			<table id="table_11"></table>
				
			<hr>

			<div class="row">
				<div class="col-sm-6">
					<div class="panel panel-default">
						<div class="panel-heading">已选中</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-sm-12" id="btn_selected">
									无选中
								</div>
							</div>
							<hr>
							<button class="btn btn-default" id="btn_check" disabled>检查已选中题目</button>
						</div>
					</div>
				</div>

				<div class="col-sm-6">
					<div class="panel panel-default">
						<div class="panel-heading">检查结果</div>
						<div class="panel-body">
							<div class="" id="checked">
								未检查
							</div>
							<hr>
							<button class="btn btn-default" id="btn_next" disabled>下一步</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>	
	</div>


</body>
<script type="text/javascript">
	$(document).ready(function(){
		/*// 日期 自定义校验 
		jQuery.validator.addMethod("isDate", function(value, element){  
		    var ereg = /^(\d{1,4})(-|\/)(\d{1,2})(-|\/)(\d{1,2})$/;  
		    var r = value.match(ereg);  
		    if (r == null) {  
		        return false;  
		    }  
		    var d = new Date(r[1], r[3] - 1, r[5]);  
		    var result = (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[5]);  
		      
		    return this.optional(element) || (result);  
		}, "请输入正确的日期");
		  */

		$('input[name="beginDate"], input[name="endDate"]').datetimepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });

		var $btn_selected = $('#btn_selected');
		var $btn_check = $('#btn_check');
		var $btn_search = $('#btn_search');
		var $btn_next = $('#btn_next');

		var $checked = $('#checked');
		var $table = $('#table_11');
		var selections = [];
		$table.bootstrapTable({
			url: '${pageContext.request.contextPath}/uploadLog/getList?',
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
					limit: params.limit,		//找多少条
					search: $('#search').val().trim(),		//筛选
					beginDate: $('#beginDate').val().trim(),
					endDate: $('#endDate').val().trim()
					// TODO: 加校验
				};
			},
			idField: "uploadFileId",			//指定主键列
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
		$('.columns.columns-right.btn-group.pull-right').prepend($('#table_11_rightHack'));

		// 获取选中的ids
		function getIdSelections() {
			return $.map($table.bootstrapTable('getSelections'), function (row) {
				return row.uploadFileId
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

			$btn_check.prop('disabled', selections.length < 1);

			$checked.html('未检查');
			$btn_next.prop('disabled', true).removeClass('btn-success').addClass('btn-default');	// 每次改变，都需要重新检查

			$btn_selected.html('');
			$.map($table.bootstrapTable('getSelections'), function (row) {
				$btn_selected.append(
					'<div class="form-control-static">' +
						'<div class="col-sm-8">' + row.fileName + '</div>' +
						'<div class="col-sm-4">' + row.createDate + '</div>' +
					'</div>'
				);
			});
			if (selections.length == 0) {
				$btn_selected.html('无选中');
			}
		});

		$btn_check.click(function() {
			$btn_check.prop('disabled', true);
			$.ajax({
				url: '${pageContext.request.contextPath}/testCreate/searchLog',
				data: {
					uploadFileIds: selections.join(',')
				},
				success: function(d) {
					console.log('请求成功>', d);
					var result = $.parseJSON(d);
					var checkedResult = 
						'<div class="form-control-static">' +
							'已选择单选题：' + result.singleSelectCount + '道' +
						'</div>' +
						'<div class="form-control-static">' +
							'已选择多选题：' + result.manySelectCount + '道' +
						'</div>' +
						'<div class="form-control-static">' +
							'已选择判断题：' + result.judgeCount + '道' +
						'</div>' +
						'<div class="form-control-static">' +
							'检查结果：<span class="status ' + (result.status == 1 ? 'btn-success' : 'btn-danger') + '">' + (result.status == 1 ? '通过' : '未通过') + '</span>' +
						'</div>'
						;
					$checked.html(checkedResult);

					
					if (result.status == 1) {
						$btn_next.prop('disabled', false).removeClass('btn-default').addClass('btn-success');
					} else {
						$btn_next.prop('disabled', true).addClass('btn-default').removeClass('btn-success');
					}
				},
				error: function(d) {
					console.log('请求失败>', d);					
					$checked.html('请求失败');
				},
				complete: function(req, txtStatus) {
					$btn_check.prop('disabled', selections.length < 1);
				}
			});
		});

		$btn_search.click(function() {
			$table.bootstrapTable('refresh', {silent: true});
		});




		
		// 异步加载数据
		$.ajax({
			url: '${pageContext.request.contextPath}/styles/fb_data/makePaper_form.json',
			success: function(d) {
				window.paperFormConf = d;
			},
			error: function(req, txtStatus) {
				console.error('加载fb数据失败', req, txtStatus);
			}
		});

		$btn_next.click(function() {
			BootstrapDialog.show({
				title: '请输入以下信息',
				message: function() {
					var $message = $(
						'<form id="dataForm" style="display: inline-block; width: 100%;"></form>'
					);

					$message.renderForm(paperFormConf);
					return $message;
				},
				buttons: [{
					label: '生成预览',
					icon: 'glyphicon glyphicon-send',
					autospin: false,
					cssClass: "btn-primary",
					action: function(dialog, evt) {
						var $button = this;
						$button.spin();
						
						var isValid = $('#dataForm').valid();

						if (isValid) {

							// 确认提交框
							var cfm = BootstrapDialog.confirm({
								title: '确认',
								message: '请确认是否提交？',
								type: BootstrapDialog.TYPE_WARNING, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
								// closable: true, // <-- Default value is false
								draggable: true, // <-- Default value is false
								btnCancelLabel: '取消', // <-- Default value is 'Cancel',
								btnOKLabel: '确认', // <-- Default value is 'OK',
								btnOKClass: 'btn-warning', // <-- If you didn't specify it, dialog type will be used,
								callback: function(isYes) {
									// isYes will be true if button was click, while it will be false if users close the dialog directly.
									if (isYes) {
										
										// 整合数据
										var formData = $('#dataForm').serializeJson();
										formData = $.extend({}, {
											uploadFileIds: selections.join(',').trim(),
											beginDate: $('#beginDate').val().trim(),
											endDate: $('#endDate').val().trim()
										}, formData);
										console.log('save formData', formData);

										$.ajax({
											url: '${pageContext.request.contextPath}/testCreate/randomGenerationTestPaper',
											method: "POST",
											data : formData,
											success: function(d) {
												var result = $.parseJSON(d);
												console.log('提交成功，结果:', d, result);

												console.log('生成试卷预览TODO');

												/*if (result.status == 1) {
													$table.bootstrapTable('refresh', {silent: true});

													dialog.enableButtons(false);
													dialog.setClosable(false);
													dialog.getModalBody().html(result.message);

													setTimeout(function(){
														dialog.close();
													}, 3000);
												} else {
													BootstrapDialog.alert({
														title: '结果',
														message: result.message,
														type: BootstrapDialog.TYPE_DANGER
													});
													$button.stopSpin();
												}*/
											},
											error: function(d) {
												BootstrapDialog.alert({
													title: '错误',
													message: '上传失败',
													type: BootstrapDialog.TYPE_DANGER
												});
												$button.stopSpin();
											}
										});
									} else {
										$button.stopSpin();
									}
								}
							});
							cfm.$modalDialog.css('width', '300px');
							// console.log(cfm);
						} else {
							$button.stopSpin();
						}
					}
				}, {
					label: '取消',
					action: function(dialog) {
						dialog.close();
					}
				}]
			});
		});
	});
</script>
</html>