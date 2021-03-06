<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>考试参与排名</title>
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
											<li>
												<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=staticDataSimulateExam">参与自学排名</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=staticDataOfficialExam">累计考试排名</a>
											</li>
											<li class="active">
												<a class="active" href="${pageContext.request.contextPath}/infrontend/tjExamResultJsp">考试参与排名</a>
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
									<table id="table_11"></table>
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
						<span>北京市公安局东城分局</span>
					</li>
					<li>
						<span>建议使用Chrome浏览器 &nbsp; 推荐分辨率：1366&times;768</span>
					</li>
				</ul>
			</div>
		</footer>
	</div>
	<script>
		$('.spText').html('考试参与排名');

		var $table = $('#table_11');

		var opt_common = {
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
			queryParams: function (params) {
				//自定义参数，这里的参数是传给后台的，我这是是分页用的
				console.log('params:', params);
				return {
					//这里的params是table提供的
					offset: params.offset,		//从数据库第几条记录开始
					limit: params.limit,		//找多少条
					search: params.search//,		//筛选
					// switchPage: switchPage
				};
			}
		};

		var spOpt = {
			url: '${pageContext.request.contextPath}/testPaper/getList',
			idField: "testPaperId",				//指定主键列
			columns: [
				{
					title: '考试名称',		//表的列名
					field: 'testPaperName',	//json数据中rows数组中的属性名
					align: 'center',		//水平居中
					formatter: function (value, row, index) {//自定义显示，这三个参数分别是：value该行的属性，row该行记录，index该行下标
						return '<a href="javascript:void(0);" onclick="popDetail(\'' + row.testPaperId + '\', \'' + row.testPaperName + '\');">' + row.testPaperName + '</a>';
					}
				},
				{
					title: '结束日期',		//表的列名
					field: 'testDate',	//json数据中rows数组中的属性名
					align: 'center'
				}
			]
		};

		$(document).ready(function() {
			var bstOpt = $.extend({}, opt_common, spOpt);

			$table.bootstrapTable(bstOpt);
		});

		// 错误题目详情
		function popDetail(id, testPaperName) {
			BootstrapDialog.show({
				title: '考试详情 - ' + testPaperName,
				cssClass: "modal-sp modal-table",
				closable: false,
				message: function() {
					var $message = $(
						'<div class="psb-here"><div class="psb-content">' +
							'<table id="table_detail"></table>' +
						'</div></div>');
					var $table_detail = $message.find('#table_detail');

					// 表格
					var _detailOpt = {
						url: '${pageContext.request.contextPath}/staticData/staticDataOfficialExamAndPaperId',
						queryParams: function (params) {
							return {
								offset: params.offset,		//从数据库第几条记录开始
								limit: params.limit,		//找多少条
								testPaperId: id,
								excellentSorce: 90,
								passSorce: 60
							};
						},
						pageSize: 10,					//如果设置了分页，页面数据条数
						pageList: [3, 5, 10, 20, 50],	//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。数据不够，不显示

						idField: "testPaperId",				//指定主键列
						columns: [
							{
								title: '单位',		//表的列名
								field: 'departmentName',	//json数据中rows数组中的属性名
								align: 'center'
							},
							{
								title: '参与人数',		//表的列名
								field: 'officialCount',	//json数据中rows数组中的属性名
								align: 'center'
							},
							{
								title: '优秀人数',		//表的列名
								field: 'excellentCount',	//json数据中rows数组中的属性名
								align: 'center'
							},
							{
								title: '及格人数',		//表的列名
								field: 'passCount',	//json数据中rows数组中的属性名
								align: 'center'
							}
						]
					};

					var detailOpt = $.extend({}, opt_common, _detailOpt);

					$table_detail.bootstrapTable(detailOpt);

					return $message;
				},
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

		/*function popDetail(testPaperId) {
			console.log('POP-DETAIL>>>', testPaperId);

			// $.ajax({
			// 	url: '${pageContext.request.contextPath}/staticData/staticDataOfficialExamAndPaperId',
			// 	dataType: 'JSON',
			// 	data: {
			// 		testPaperId: testPaperId,
			// 		excellentSorce: 90,
			// 		passSorce: 60,
			// 		offset: 0,
			// 		limit: null
			// 	}
			// });

			// 以下接口调3次，score对应80, 60, 0
			/*$.ajax({
				url: '${pageContext.request.contextPath}/infrontend/staticDataByTestingCountAndScore',
				dataType: 'JSON'
				data: {
					testPaperId: ,
					score: 60,
					offset: null,
					limit: null
				}
			})* /
			// TODO: 弹框显示
		}*/
	</script>
</body>
</html>