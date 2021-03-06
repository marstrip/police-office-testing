<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<title class="spText">loading...</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/jquery.perfect-scrollbar-1.3.0/css/perfect-scrollbar.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/assets/css/demo-all.css">

	<script src="${pageContext.request.contextPath}/styles/vendors/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/vendors/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/vendors/jquery.perfect-scrollbar-1.3.0/dist/perfect-scrollbar.min.js"></script>

	<!-- bootstrap-table -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/bootstrap-table.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/bootstrap-table.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"></script>
	
	<!-- bootstrap-dialog -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap-dialog/dist/css/bootstrap-dialog.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-dialog/dist/js/bootstrap-dialog.min.js"></script>
	
	<!-- bootstrap-treeview -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.css">
	<script src="${pageContext.request.contextPath}/styles/vendors/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.js"></script>

	<script src="${pageContext.request.contextPath}/styles/assets/js/demo.js"></script>

	<!-- 组卷核心js -->
	<script src="${pageContext.request.contextPath}/styles/assets/gen-paper/genPaper.js"></script>
	
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
	                            <a href="${pageContext.request.contextPath}/login/frontendIndex">首页</a>
	                        </li>
	                        <li class="spText">
	                            当前页
	                        </li>
	                    </ol>

						<div class="left-area-quicklink">
							<div class="panel panel-white">
								<div class="panel-heading">
									<h3 class="panel-title">
										快速导航
									</h3>
								</div>
								<div class="panel-body">
									<div class="dropdown dropdown-preview">
										<ul class="dropdown-menu" id="menu">
											<li class="informNotice">
												<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=informNotice">通知公告</a>
											</li>
											<li class="caseAnalyze">
												<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=caseAnalyze">案例评析</a>
											</li>
											<li class="testPaper">
												<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=testPaper">考试列表</a>
											</li>
											<li class="score">
												<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=score">成绩查询</a>
											</li>
											<li>
												<a class="disabled" href="javascript:void(0);" disabled>问卷调查</a>
											</li>
											<li class="divider"></li>
											<li class="staticDataSimulateExam">
												<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=staticDataSimulateExam">参与自学排名</a>
											</li>
											<li class="staticDataOfficialExam">
												<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=staticDataOfficialExam">累计考试排名</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/infrontend/tjExamResultJsp">考试参与排名</a>
											</li>
											<li class="staticDataLogin">
												<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=staticDataLogin">系统参与排名</a>
											</li>
											<li class="divider"></li>
											<li class="qa">
												<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=qa">答疑互动</a>
											</li>
											<li class="staticDataByQuestionFail">
												<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=staticDataByQuestionFail">错题集</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="right-area">
							<div class="panel panel-white">
								<div class="panel-heading">
									<h3 class="panel-title spText">
										列表
									</h3>
								</div>
								<div class="panel-body">
									<div id="table_11_toolbar"></div>
									<table id="table_11"></table>
								</div>
							</div>

						</div>

						<br>	
					</div>
				</div>

				<footer class="footer">
					<div class="row">
						<ul class="text-center no-style">
							<li>
								<span>北京市公安局东城分局</span>
							</li>
							<li>
								<span>建议使用Chrome浏览器 &nbsp; 推荐分辨率：1366&times;768</span>
							</li>
						</ul>
					</div>
				</footer>
			</div>
		</div>
	</div>
	<script>
		var switchPage = getUrlParam('switchPage');

		var spTextMap = {
			caseAnalyze: '案例分析',
			informNotice: '通知公告',
			staticDataSimulateExam: '参与自学排名',
			staticDataOfficialExam: '累计考试排名',
			staticDataLogin: '系统参与排名',
			testPaper: '考试列表',
			score: '成绩查询',
			staticDataByQuestionFail: '错题集',
			qa: '答疑互动'
		}

		$('.spText').html(spTextMap[switchPage]);
		$('.' + switchPage).addClass('active');

		var $toolbar = $('#table_11_toolbar');
		var $table = $('#table_11');
		
		var opt_common = {
			url: '${pageContext.request.contextPath}/infrontend/commonGetList',
			method: 'GET',
			dataType: "JSON",
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

			pageNumber: 1,				//如果设置了分页，首页页码
			// showPaginationSwitch:true,		//是否显示 数据条数选择框
			pageSize: 20,				//如果设置了分页，页面数据条数
			pageList: [3, 5, 10, 20, 50],	//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。数据不够，不显示
			paginationPreText: '‹',		//指定分页条中上一页按钮的图标或文字,这里是<
			paginationNextText: '›',	//指定分页条中下一页按钮的图标或文字,这里是>
			// singleSelect: false,		//设置True 将禁止多选
			data_local: "zh-US",		//表格汉化
			sidePagination: "server",	//服务端处理分页
			onLoadSuccess: function() {
				$(window).trigger('resize');
			},
			queryParams: function (params) {
				//自定义参数，这里的参数是传给后台的，我这是是分页用的
				console.log('params:', params);
				return {
					//这里的params是table提供的
					offset: params.offset,		//从数据库第几条记录开始
					limit: params.limit,		//找多少条
					search: params.search,		//筛选
					switchPage: switchPage
				};
			}
		};

		var spOptMap = {
			caseAnalyze: {
				idField: "caseId",				//指定主键列
				columns: [
					{
						title: '案例名称',		//表的列名
						field: 'caseName',		//json数据中rows数组中的属性名
						align: 'center',		//水平居中
						formatter: function (value, row, index) {//自定义显示，这三个参数分别是：value该行的属性，row该行记录，index该行下标
							return '<a href="${pageContext.request.contextPath}/infrontend/commonDetailJsp?switchPage=' + switchPage + '&id=' + row.caseId + '">' + row.caseName + '</a>';
						}
					},
					{
						//EMAIL
						title: '创建时间',
						field: 'createDate',
						align: 'center'
					}
				]
			},
			informNotice: {
				idField: "informId",				//指定主键列
				columns: [
					{
						title: '通告标题',		//表的列名
						field: 'informName',	//json数据中rows数组中的属性名
						align: 'center',		//水平居中
						formatter: function (value, row, index) {//自定义显示，这三个参数分别是：value该行的属性，row该行记录，index该行下标
							return '<a href="${pageContext.request.contextPath}/infrontend/commonDetailJsp?switchPage=' + switchPage + '&id=' + row.informId + '">' + row.informName + '</a>';
						}
					},
					{
						//EMAIL
						title: '创建时间',
						field: 'createDate',
						align: 'center'
					}
				]
			},
			staticDataSimulateExam: {
				columns: [
					{
						title: '单位',		//表的列名
						field: 'departmentName',	//json数据中rows数组中的属性名
						align: 'center'
					},
					{
						title: '参与自学次数',
						field: 'sumCount',
						align: 'center'
					}
				]
			},
			staticDataOfficialExam: {
				columns: [
					{
						title: '单位',		//表的列名
						field: 'departmentName',	//json数据中rows数组中的属性名
						align: 'center'
					},
					{
						title: '参与考试次数',
						field: 'officialCount',
						align: 'center'
					}
				]
			},
			staticDataLogin: {
				idField: "departmentId",				//指定主键列
				columns: [
					{
						title: '单位',		//表的列名
						field: 'departmentName',	//json数据中rows数组中的属性名
						align: 'center'
					},
					{
						title: '系统登录次数',
						field: 'loginCount',
						align: 'center'
					}
				]
			},
			testPaper: {
				url: '${pageContext.request.contextPath}/testPaper/fronendList',
				idField: "testPaperId",				//指定主键列
				columns: [
					{
						title: '考试名称',			//表的列名
						field: 'testPaperName',		//json数据中rows数组中的属性名
						align: 'center'
					},
					{
						title: '开始时间',
						field: 'beginDate',
						align: 'center',
						formatter: function(value, row, index) {
							return value.split(' ')[0] ? value.split(' ')[0] : '未设置'
						}
					},
					{
						title: '结束时间',
						field: 'testDate',
						align: 'center',
						formatter: function(value, row, index) {
							return value.split(' ')[0] ? value.split(' ')[0] : '未设置'
						}
					},
					{
						title: '操作',			//表的列名
						field: 'flagExam',		//json数据中rows数组中的属性名
						align: 'center',		//水平居中
						formatter: function (value, row, index) {//自定义显示，这三个参数分别是：value该行的属性，row该行记录，index该行下标
							var opMap = {
								'1': '参加考试',
								'0': '已结束',
								'2': '未开始'
							};
							if ((row.flagExam + '') == '1') {
								return '<a href="${pageContext.request.contextPath}/testPaper/fronendJsp?testPaperId=' + row.testPaperId + '&type=officalExam">' + opMap[row.flagExam + ''] + '</a>';
							} else {
								return '<a href="javascript:void(0);" onclick="testPaper_pop(\'' + row.flagExam + '\');">' + opMap[row.flagExam + ''] + '</a>';
							}
						}
					}
				]
			},
			score: {
				idField: "autoId",				//指定主键列
				columns: [
					{
						title: '考试内容',			//表的列名
						field: 'testPaperName',		//json数据中rows数组中的属性名
						align: 'center'
					},
					{
						title: '成绩',
						field: 'score',
						align: 'center'
					}
				]
			},
			staticDataByQuestionFail: {
				idField: "informId",				//指定主键列
				columns: [
					{
						title: '题目内容',		//表的列名
						field: 'questionName',	//json数据中rows数组中的属性名
						align: 'left',		//水平居中
						formatter: function (value, row, index) {//自定义显示，这三个参数分别是：value该行的属性，row该行记录，index该行下标
							return '<a href="javascript:void(0);" onclick="staticDataByQuestionFail_pop(\'' + row.questionId + '\');">' + row.questionName + '</a>';
						}
					},
					{
						//EMAIL
						title: '答错次数',
						field: 'failCount',
						align: 'center'
					}
				]
			},
			qa: {
				search: true,
				toolbar: '#table_11_toolbar',
				idField: "informId",				//指定主键列
				columns: [
					{
						title: '问题',		//表的列名
						field: 'questionName',	//json数据中rows数组中的属性名
						align: 'left',		//水平居中
						formatter: function (value, row, index) {//自定义显示，这三个参数分别是：value该行的属性，row该行记录，index该行下标
							return '<a href="javascript:void(0);" onclick="qa_pop(\'' + row.qaId + '\');">' + row.questionContent + '</a>';
						}
					}
				]
			}
		}

		// 考试列表详情
		function testPaper_pop(flagExam) {
			switch(flagExam) {
				case '0':
					BootstrapDialog.alert({
						title: '提示',
						message: '当前考试已结束'
					});
					break;
				case '2':
					BootstrapDialog.alert({
						title: '提示',
						message: '当前考试未开始'
					});
					break;
			}
		}

		// 错误题目详情
		function staticDataByQuestionFail_pop(id) {
			var q = undefined;
			$.ajax({
				url: '${pageContext.request.contextPath}/question/view',
				async: false,
				dataType: 'JSON',
				data: {
					testQuestionsId: id
				},
				success: function(d) {
					q = d.info;
				}
			});
			
			var $message = $('<div></div>');
			$message.genQuestion(q);

			BootstrapDialog.alert({
				title: '题目详情',
				message: $message.html()
			});
		}

		// 问答详情
		function qa_pop(id) {
			$.ajax({
				url: '${pageContext.request.contextPath}/qa/view',
				async: false,
				dataType: 'JSON',
				data: {
					qaId: id
				},
				success: function(d) {
					q = d.info;
				}
			});
			
			var $message = $((
				'<div class="psb-here"><div class="psb-content">' +
					'<label>问题：</label>' +
					'<p class="text-indent-2em">{questionContent}</p>' +
					'<br />' +
					'<label>回答：</label>' +
					'<p class="text-indent-2em">{questionAnswer}</p>' +
				'</div></div>'
			).format(q));

			/*BootstrapDialog.alert({
				title: '问答详情',
				message: $message[0].outerHTML
			});*/

			BootstrapDialog.show({
				title: '题目详情',
				cssClass: "modal-sp",
				closable: false,
				message: $message.html(),
				buttons: [
					{
						label: '确定',
						action: function(dialogRef, evt) {
							dialogRef.close();
						}
					}
				],
				onshown: function(dialogRef) {
					new PerfectScrollbar('.modal-sp .modal-body');
				}
			});
		}

		$(document).ready(function() {
			if (switchPage == 'qa') {
				var $btn_add = $('<button id="table_11_add" class="form-control-static btn btn-primary">提问</button>');
				$btn_add.click(function() {
					$btn_add.prop('disabled', true);
					BootstrapDialog.show({
						title: '请输入您的问题',
						cssClass: "modal-sp",
						closable: false,
						message: function() {
							var $message = $('<textarea class="form-control" name="qaContent" id="qaContent" style="width: 100%; resize: none;" rows="13"></textarea>');
							$message.on('input', function() {
								if ($('#qaContent').val().trim().length == 0) {
									$('.btn-ask').prop('disabled', true);
								} else {
									$('.btn-ask').prop('disabled', false);
								}
							});
							return $message;
						},
						onshown: function() {
							if ($('#qaContent').val().trim().length == 0) {
								$('.btn-ask').prop('disabled', true);
							} else {
								$('.btn-ask').prop('disabled', false);
							}
						},
						buttons: [{
							label: '提交',
							icon: 'glyphicon glyphicon-send',
							autospin: false,
							cssClass: "btn-primary btn-ask",
							action: function(dialog, evt) {
								var $button = this;
								$button.spin();
								dialog.enableButtons(false);
								var qaContent = $('#qaContent').val();
								
								$.ajax({
									url: '${pageContext.request.contextPath}/qa/saveData',
									method: 'POST',
									dataType: 'JSON',
									data: {
										qaContent: qaContent
									},
									success: function(result) {
										if (result.status == 1) {
											BootstrapDialog.alert({
												title: '成功',
												message: '提问成功',
												type: BootstrapDialog.TYPE_SUCCESS
											});
											dialog.close();

											reload_qa();
										} else {
											BootstrapDialog.alert({
												title: '警告',
												message: '提问请求成功，未按照预期返回结果',
												type: BootstrapDialog.TYPE_WARNING
											});
											$button.stopSpin();
											dialog.enableButtons(true);
										}
									},
									error: function(e) {
										BootstrapDialog.alert({
											title: '失败',
											message: '提问请求失败',
											type: BootstrapDialog.TYPE_DANGER
										});
										$button.stopSpin();
										dialog.enableButtons(true);
									}
								});
							}
						}, {
							label: '取消',
							action: function(dialog) {
								dialog.close();
							}
						}]
					});

					$btn_add.prop('disabled', false);
				});

				$toolbar.append($btn_add);
			}

			var bstOpt = $.extend({}, opt_common, spOptMap[switchPage]);

			$table.bootstrapTable(bstOpt);
		});
	</script>
</body>
</html>