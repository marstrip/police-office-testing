<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title></title>
	<!-- jquery -->
	<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/jquery-3.3.1.min.js"></script> -->
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

	<!-- 组卷核心js -->
	<script src="${pageContext.request.contextPath}/styles/assets/gen-paper/genPaper.js"></script>

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
				<button id="table_11_upload" class="btn btn-success">
					<i class="glyphicon glyphicon-upload"></i> 上传
				</button>
			</div>
			<span id="table_11_rightHack">
				<div class="input-group pull-left" style="width: 482px;">
					<span class="input-group-addon">日期从</span>
					<input type="text" class="form-control" style="width: 100px;" placeholder="开始日期" name="beginDate" id="beginDate">
					<span class="input-group-addon">至</span>
					<input type="text" class="form-control" style="width: 100px;" placeholder="结束日期" name="endDate" id="endDate">
				<!-- </div>
				<div class="input-group pull-left" style="width: 200px; margin-left: 10px;"> -->
					<span class="input-group-addon">关键字</span>
					<input type="text" class="form-control" style="width: 150px;" placeholder="模糊查询" name="search" id="search">

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

		var $btn_upload = $('#table_11_upload');
		var $btn_selected = $('#btn_selected');
		var $btn_check = $('#btn_check');
		var $btn_search = $('#btn_search');
		var $btn_next = $('#btn_next');

		var $checked = $('#checked');
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
			$checked.html('检查中...');
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
			$table.bootstrapTable('refresh', {silent: false});
		});


		$btn_upload.click(function() {
			$btn_upload.prop('disabled', true);

			BootstrapDialog.show({
				onshown: function() {
					$btn_upload.prop('disabled', false);
				},
				title: '上传试题',
				message: function() {
					var $message = $(
						'<form id="dataForm_upload" style="display: inline-block; width: 100%;"></form>'
					);

					var fb_conf = {
						"label": "上传试题",
						"type": "form",
						"items": [
							{
								"label": "请选择文件",
								"type": "form-group",
								"groupId": "group0",

								"outerWidth": "col-sm-12",
								"labelWidth": "col-sm-2",
								"contentWidth": "col-sm-10",

								"items": [
									{
										"name": "uploadFile",
										"type": "image"
									}
								]
							}
						],
						"rules": {
							"uploadFile":{
								"required": true
							}
						},
						"events": [
						],
						"values": {
						},
						"isRead": false,
						"groupDefaultSplit": false
					}

					$message.renderForm(fb_conf);
					return $message;
				}
			})
		})

		
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
			$btn_next.prop('disabled', true);
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
						dialog.enableButtons(false);
						
						var isValid = $('#dataForm').valid();

						if (isValid) {

							// 整合数据-生成试卷
							var formData = $('#dataForm').serializeJson();
							formData = $.extend({}, {
								uploadFileIds: selections.join(',').trim(),
								beginDate: $('#beginDate').val().trim(),
								endDate: $('#endDate').val().trim()
							}, formData);
							console.log('save formData', formData);
							$('#dataForm').find(':input').prop('disabled', true);

							$.ajax({
								url: '${pageContext.request.contextPath}/testCreate/randomGenerationTestPaper',
								method: "POST",
								data: formData,
								success: function(d) {
									var result = $.parseJSON(d);
									console.log('提交成功，结果:', d, result);

									console.log('生成试卷预览TODO');

									// TODO ....
									if (result.status == 1) {
										dialog.enableButtons(false);
										dialog.setClosable(false);
										
										// 弹出预览页面
										BootstrapDialog.show({
											title: '试卷预览',
											cssClass: 'paper-preview-dialog',
											message: function() {
												var $message = $('<div></div>');
												// 渲染试卷方法
												$message.genPaper(formData, result, true);
												return $message;
											},
											closable: false,
											buttons: [{
												label: '保存试卷',
												icon: 'glyphicon glyphicon-send',
												autospin: false,
												cssClass: "btn-primary",
												action: function(dialogPaper, evt) {
													var $buttonPaper = this;
													$buttonPaper.spin();
													dialogPaper.enableButtons(false);
													
													// 确认提交框
													var cfmPaper = BootstrapDialog.confirm({
														title: '确认',
														message: '请确认是否生成该试卷？',
														type: BootstrapDialog.TYPE_WARNING,
														draggable: true,
														btnCancelLabel: '取消', 
														btnOKLabel: '确认',
														btnOKClass: 'btn-warning',
														callback: function(isYes) {
															if (isYes) {
																// 保存页面
																$.ajax({
																	url: '${pageContext.request.contextPath}/testCreate/feedbackTestPaper',
																	method: 'POST',
																	data: {
																		testPaperId: result.testPaperId,
																		operateFlag: "affirm",
																		testDate: formData.testDate,
																		testPaperName: formData.testPaperName,
																		testTime: formData.testTime
																	},
																	success: function(dd) {
																		var _result = $.parseJSON(dd);
																		if (result.status == 1) {
																			dialog.close();
																			dialogPaper.close();
																			BootstrapDialog.alert({
																				title: '结果',
																				message: '保存成功',
																				type: BootstrapDialog.TYPE_SUCCESS
																			});
																		} else {
																			$buttonPaper.stopSpin();
																			dialogPaper.enableButtons(true);
																			BootstrapDialog.alert({
																				title: '结果',
																				message: '保存失败',
																				type: BootstrapDialog.TYPE_DANGER
																			});
																		}
																		
																	},
																	error: function(dd) {
																		$buttonPaper.stopSpin();
																		dialogPaper.enableButtons(true);
																		BootstrapDialog.alert({
																			title: '错误',
																			message: '上传失败',
																			type: BootstrapDialog.TYPE_DANGER
																		});
																	},
																	complete: function() {
																		$buttonPaper.stopSpin();
																		dialogPaper.enableButtons(true);
																	}
																});
															} else {
																$buttonPaper.stopSpin();
																dialogPaper.enableButtons(true);
															}
														}
													});
													cfmPaper.$modalDialog.css('width', '300px');
												}
											}, {
												label: '取消并清空临时数据',
												action: function(dialogPaper) {
													dialogPaper.close();

													// 取消页面-清空缓存
													$.ajax({
														url: '${pageContext.request.contextPath}/testCreate/feedbackTestPaper',
														method: 'POST',
														data: {
															testPaperId: result.testPaperId,
															operateFlag: "cancle",
															testDate: formData.testDate,
															testPaperName: formData.testPaperName,
															testTime: formData.testTime
														},
														success: function(dd) {
															var _result = $.parseJSON(dd);
															if (result.status == 1) {
																dialogPaper.close();
																BootstrapDialog.alert({
																	title: '结果',
																	message: '清空临时数据成功',
																	type: BootstrapDialog.TYPE_SUCCESS
																});
															} else {
																$buttonPaper.stopSpin();
																dialogPaper.enableButtons(true);
																BootstrapDialog.alert({
																	title: '结果',
																	message: '清空临时数据失败',
																	type: BootstrapDialog.TYPE_DANGER
																});
															}
															
														},
														error: function(dd) {
															$buttonPaper.stopSpin();
															dialogPaper.enableButtons(true);
															BootstrapDialog.alert({
																title: '错误',
																message: '清空临时数据请求失败',
																type: BootstrapDialog.TYPE_DANGER
															});
														},
														complete: function() {
															$buttonPaper.stopSpin();
															dialogPaper.enableButtons(true);
														}
													});

													dialog.enableButtons(true);
													dialog.setClosable(true);
												}
											}]
										});	// END OF BootstrapDialog.show

									} else {
										BootstrapDialog.alert({
											title: '结果',
											message: '生成试卷预览失败。' + result.message,
											type: BootstrapDialog.TYPE_DANGER
										});
										$button.stopSpin();
										dialog.enableButtons(true);
									}
								},
								error: function(d) {
									BootstrapDialog.alert({
										title: '错误',
										message: '上传失败',
										type: BootstrapDialog.TYPE_DANGER
									});
								},
								complete: function() {
									$button.stopSpin();
									dialog.enableButtons(true);
									$('#dataForm').find(':input').prop('disabled', false);
								}
							});

						} else {
							$button.stopSpin();
							dialog.enableButtons(true);
						}
					}
				}, {
					label: '取消',
					action: function(dialog) {
						dialog.close();
					}
				}]
			});

			$btn_next.prop('disabled', false);
		});
	});
</script>
</html>