<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>首页</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/bootstrap/css/bootstrap.min.css">
	<!-- <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap-theme.min.css"> -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/jquery.perfect-scrollbar-1.3.0/css/perfect-scrollbar.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/assets/css/demo-all.css">

	<script src="${pageContext.request.contextPath}/styles/vendors/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/vendors/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/vendors/jquery.perfect-scrollbar-1.3.0/dist/perfect-scrollbar.min.js"></script>

	<!-- bootstrap-dialog -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap-dialog/dist/css/bootstrap-dialog.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-dialog/dist/js/bootstrap-dialog.min.js"></script>

	<script src="${pageContext.request.contextPath}/styles/assets/js/demo.js"></script>

	<!-- 组卷核心js -->
	<script src="${pageContext.request.contextPath}/styles/assets/gen-paper/genPaper.js"></script>
	
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
						<!-- <ol class="breadcrumb">
						<li><a href="demo-index.html">首页</a></li>
					</ol> -->

						<div class="left-area">
							<!-- 个人信息 -->
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										个人信息
									</h3>
								</div>
								<div class="panel-body" style="padding: 0 15px;">
									<div class="row">
										<div class="func-item func-item-2x" style="padding: 12px 18px;">
											<ul class="no-style">
												<li class="police-info">
													<b>欢迎您！</b>
													<i><img src="${pageContext.request.contextPath}/styles/assets/img/smile.png" style="vertical-align: text-bottom;"></i>
												</li>
												<li class="police-info police-name">${userName}</li>
												<li class="police-info police-id">${userId}</li>
											</ul>
										</div>
									</div>
									<!-- 功能 -->
									<div class="row">
										<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=score">
											<div class="func-item func-item-btn">
												<img src="${pageContext.request.contextPath}/styles/assets/img/uibtn_01.png">
											</div>
										</a>
										<a href="javascript:void(0)">
											<div class="func-item func-item-btn">
												<img src="${pageContext.request.contextPath}/styles/assets/img/uibtn_02.png">
											</div>
										</a>
										<a href="${pageContext.request.contextPath}/logout">
											<div class="func-item func-item-btn">
												<img src="${pageContext.request.contextPath}/styles/assets/img/uibtn_03.png">
											</div>
										</a>
									</div>
								</div>
							</div>

							<!-- 快速导航 -->
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										快速导航
										<!-- <a href="demo-extra-fail-list.html" class="pull-right">更多</a> -->
									</h3>
								</div>
								<div class="panel-body">

									<div class="quick-link">
										<a href="${pageContext.request.contextPath}/infrontend/superMarketJsp">
											<img src="${pageContext.request.contextPath}/styles/assets/img/qlbtn_01.png">
										</a>
									</div>
									<div class="quick-link">
										<a href="${pageContext.request.contextPath}/testPaper/fronendJsp?type=simulateExam">
											<img src="${pageContext.request.contextPath}/styles/assets/img/qlbtn_02.png">
										</a>
									</div>
									<div class="quick-link">
										<a href="javascript:void(0);">
											<img src="${pageContext.request.contextPath}/styles/assets/img/qlbtn_03.png">
										</a>
									</div>
									<div class="quick-link">
										<a href="javascript:void(0);">
											<img src="${pageContext.request.contextPath}/styles/assets/img/qlbtn_04.png">
										</a>
									</div>
								</div>
							</div>

							<!-- 参与自学排名 -->
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										参与自学排名
										<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=staticDataSimulateExam" class="pull-right">更多</a>
									</h3>
								</div>
								<div class="panel-body">
									<table class="table">
										<thead>
											<tr>
												<th style="text-align: center; width: 48px;">排行</th>
												<th style="text-align: center; width: 213px;">单位</th>
												<th style="text-align: center; width: 112px;">参与自学次数</th>
											</tr>
										</thead>
										<tbody id="selfLearnRankBody">
											<tr>
												<td colspan="3">加载中...</td>
											</tr>
										</tbody>
									</table>
								</div>
								<script>
									var selfLearnRankTmp =
										'<tr>' +
											'<td style="text-align: center;">' +
												'<span>{idx}</span>' +
											'</td>' +
											'<td class="fix-text fix-text-210">' +
												'{departmentName}' +
											'</td>' +
											'<td style="text-align: center;">{simulateExamCount}</td>' +
										'</tr>';
									$.ajax({
										method: 'POST',
										url: '${pageContext.request.contextPath}/infrontend/commonGetList',
										dataType: "json",
										data: {
											offset: 0,
											limit: 5,
											beginDate: '',
											endDate: '',
											switchPage: 'staticDataSimulateExam'
										},
										success: function(d) {
											var rows = d.rows;
											var $nbody = $('#selfLearnRankBody');

											$nbody.html('');
											$.each(rows, function(idx) {
												var rdata = $.extend({}, rows[idx], {idx: idx + 1});
												var $item = $(selfLearnRankTmp.format(rdata));
												$nbody.append($item);
											});

											if (rows.length == 0) {
												$nbody.append(
													'<tr>' +
														'<td colspan="3" style="text-align: center;">' +
															'<span>-- 暂无数据 --</span>' +
														'</td>' +
													'</tr>'
												);
											}
										},
										error: function() {
											var $nbody = $('#selfLearnRankBody');
											$nbody.html('');
											$nbody.append(
												'<tr>' +
													'<td colspan="3" style="text-align: center; color: red;">' +
														'<span>-- 后台发生错误 --</span>' +
													'</td>' +
												'</tr>'
											);
										}
									});
								</script>
							</div>

							<!-- 累计考试排名 -->
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										累计考试排名
										<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=staticDataOfficialExam" class="pull-right">更多</a>
									</h3>
								</div>
								<div class="panel-body">
									<table class="table">
										<thead>
											<tr>
												<th style="text-align: center; width: 48px;">排行</th>
												<th style="text-align: center; width: 213px;">单位</th>
												<th style="text-align: center; width: 112px;">参与考试次数</th>
											</tr>
										</thead>
										<tbody id="examRankBody">
											<tr>
												<td colspan="3">加载中...</td>
											</tr>
										</tbody>
									</table>
								</div>
								<script>
									var examRankTmp =
										'<tr>' +
											'<td style="text-align: center;">' +
												'<span>{idx}</span>' +
											'</td>' +
											'<td class="fix-text fix-text-210">' +
												'{departmentName}' +
											'</td>' +
											'<td style="text-align: center;">{officialCount}</td>' +
										'</tr>';
									$.ajax({
										method: 'POST',
										url: '${pageContext.request.contextPath}/infrontend/commonGetList',
										dataType: "json",
										data: {
											offset: 0,
											limit: 5,
											beginDate: '',
											endDate: '',
											switchPage: 'staticDataOfficialExam'
										},
										success: function(d) {
											var rows = d.rows;
											var $nbody = $('#examRankBody');

											$nbody.html('');
											$.each(rows, function(idx) {
												var rdata = $.extend({}, rows[idx], {idx: idx + 1});
												var $item = $(examRankTmp.format(rdata));
												$nbody.append($item);
											});

											if (rows.length == 0) {
												$nbody.append(
													'<tr>' +
														'<td colspan="3" style="text-align: center;">' +
															'<span>-- 暂无数据 --</span>' +
														'</td>' +
													'</tr>'
												);
											}
										},
										error: function() {
											var $nbody = $('#examRankBody');
											$nbody.html('');
											$nbody.append(
												'<tr>' +
													'<td colspan="3" style="text-align: center; color: red;">' +
														'<span>-- 后台发生错误 --</span>' +
													'</td>' +
												'</tr>'
											);
										}
									});
								</script>
							</div>
						</div>

						<div class="center-area">
							<!-- 考试中心 -->
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										考试中心
										<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=testPaper" class="pull-right">更多</a>
									</h3>
								</div>
								<div class="panel-body" style="padding-top: 0;">
									<div class="notice-list">
										<table class="table">
											<thead>
												<tr>
													<th style="text-align: center; width: 300px;">考试内容</th>
													<th style="text-align: left;">开始时间</th>
													<th style="text-align: left;">结束时间</th>
													<th style="text-align: left;">操作</th>
												</tr>
											</thead>
											<tbody id="examBody">
												<tr>
													<td>加载中...</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- end of .notice-list -->
								</div>
								<script>
									var examTmp =
										'<tr>' +
											'<td>' +
												'<span>{testPaperName}</span>' +
											'</td>' +
											'<td>' +
												'<span>{beginDate}</span>' +
											'</td>' +
											'<td>' +
												'<span>{testDate}</span>' +
											'</td>' +
											'<td>' +
												'<a href="javascript:void(0);" idx="{idx}">{op}</a>' +
											'</td>' +
										'</tr>';
									$.ajax({
										method: 'POST',
										url: '${pageContext.request.contextPath}/testPaper/fronendList',
										dataType: "json",
										data: {
											offset: 0,
											limit: 6
										},
										success: function(d) {
											var rows = d.rows;
											var $nbody = $('#examBody');

											$nbody.html('');
											$.each(rows, function(idx) {
												var opMap = {
													'1': '参加考试',
													'0': '已结束',
													'2': '未开始'
												};

												var rdata = $.extend({}, rows[idx], {
													op: opMap[rows[idx].flagExam],
													testDate: rows[idx].testDate.split(' ')[0],
													beginDate: rows[idx].beginDate ? rows[idx].beginDate.split(' ')[0] : 'undefined'
												});
												var $item = $(examTmp.format(rdata));
												$item.find('a').data('idx', idx);
												$item.find('a').on('click', function() {
													var _idx = $(this).data('idx');
													
													// 做特殊操作
													console.log('>>>', _idx, rows[idx].testPaperId);
													switch(rows[idx].flagExam) {
														case '1':
															window.open('${pageContext.request.contextPath}/testPaper/fronendJsp?testPaperId=' + rows[idx].testPaperId + '&type=officialExam');
															break;
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
												});
												$nbody.append($item);
											});

											if (rows.length == 0) {
												$nbody.append(
													'<tr>' +
														'<td colspan="4" style="text-align: center;">' +
															'<span>-- 暂无数据 --</span>' +
														'</td>' +
													'</tr>'
												);
											}
										}
									});
								</script>
							</div>

							<!-- 案例评析 -->
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										案例评析
										<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=caseAnalyze" class="pull-right">更多</a>
									</h3>
								</div>
								<div class="panel-body" style="padding-top: 0;">
									<div class="notice-list">
										<table class="table sp-row-height">
											<tbody id="caseBody">
												<tr>
													<td>加载中...</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<script>
									var caseTmp =
										'<tr>' +
											'<td class="td-icon-holder"><i class="td-icon icon-pencil"></i></td>' +
											'<td class="fix-text fix-text-430">' +
												'<a href="${pageContext.request.contextPath}/infrontend/commonDetailJsp?switchPage=caseAnalyze&id={caseId}">{caseName}</a>' +
											'</td>' +
											'<td class="date-colume">{createDate}</td>' +
										'</tr>';
									$.ajax({
										method: 'POST',
										url: '${pageContext.request.contextPath}/caseAnalyze/getList',
										dataType: "json",
										data: {
											offset: 0,
											limit: 9
										},
										success: function(d) {
											var rows = d.rows;
											var $nbody = $('#caseBody');

											$nbody.html('');
											$.each(rows, function(idx) {
												var df = $.extend({}, rows[idx], {createDate: rows[idx].createDate.split(' ')[0]});
												var $item = $(caseTmp.format(df));
												/*$item.find('a').data('idx', idx);
												$item.find('a').on('click', function() {
													var _idx = $(this).data('idx');
													BootstrapDialog.alert({
														title: rows[_idx].caseName,
														message: rows[_idx].caseContent
													});
												});*/
												$nbody.append($item);
											});

											if (rows.length == 0) {
												$nbody.append(
													'<tr>' +
														'<td colspan="4" style="text-align: center;">' +
															'<span>-- 暂无数据 --</span>' +
														'</td>' +
													'</tr>'
												);
											}
										}
									});
								</script>
							</div>
							
							<!-- 错题集 -->
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										错题集
										<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=staticDataByQuestionFail" class="pull-right">更多</a>
									</h3>
								</div>
								<div class="panel-body">
									<table class="table">
										<thead>
											<tr>
												<th style="text-align: center; width: 460px;">问题列表</th>
												<th style="text-align: center;">答错次数</th>
											</tr>
										</thead>
										<tbody id="failBody">
											<tr>
												<td>加载中...</td>
											</tr>
										</tbody>
									</table>
								</div>
								<script>
									var failTmp =
										'<tr>' +
											'<td class="fix-text fix-text-460">' +
												'<a href="javascript: void(0);">' +
													'{questionName}' +
												'</a>' +
											'</td>' +
											'<td style="text-align: center;">' +
												'{failCount}' +
											'</td>' +
										'</tr>';
									$.ajax({
										method: 'POST',
										url: '${pageContext.request.contextPath}/infrontend/commonGetList',
										dataType: "json",
										data: {
											offset: 0,
											limit: 5,
											beginDate: '',
											endDate: '',
											switchPage: 'staticDataByQuestionFail'
										},
										success: function(d) {
											var rows = d.rows;
											var $nbody = $('#failBody');

											$nbody.html('');
											$.each(rows, function(idx) {
												var rdata = $.extend({}, rows[idx], {idx: idx + 1});
												var $item = $(failTmp.format(rdata));
												$item.find('a').on('click', function() {
													var _idx = $(this).data('idx');
													fail_pop(rows[idx].questionId);
												});
												$nbody.append($item);
											});

											if (rows.length == 0) {
												$nbody.append(
													'<tr>' +
														'<td colspan="2" style="text-align: center;">' +
															'<span>-- 暂无数据 --</span>' +
														'</td>' +
													'</tr>'
												);
											}
										},
										error: function() {
											var $nbody = $('#failBody');
											$nbody.html('');
											$nbody.append(
												'<tr>' +
													'<td colspan="2" style="text-align: center; color: red;">' +
														'<span>-- 后台发生错误 --</span>' +
													'</td>' +
												'</tr>'
											);
										}
									});
									// 错误题目详情
									function fail_pop(id) {
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
										
										var $message = $('<div class="psb-here"><div class="psb-content"></div></div>');
										$message.find('.psb-content').genQuestion(q);

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
								</script>
							</div>

							<!-- 答疑互动 -->
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										答疑互动
										<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=qa" class="pull-right">更多</a>
										<a href="javascript:void(0);" class="pull-right" id="btn_qa_add">提问</a>
									</h3>
								</div>
								<div class="panel-body" style="padding-top: 0;">
									<div class="notice-list">
										<table class="table">
											<thead>
												<tr>
													<th style="text-align: center;">问题列表</th>
												</tr>
											</thead>
											<tbody id="qaBody">
												<tr>
													<td>加载中...</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- end of .notice-list -->
								</div>
								<script>
									var qaTmp =
										'<tr>' +
											'<td class="fix-text fix-text-560">' +
												'<a href="javascript:void(0);">{questionContent}</a>' +
											'</td>' +
										'</tr>';
									function reload_qa() {
										$.ajax({
											method: 'POST',
											url: '${pageContext.request.contextPath}/qa/getList',
											dataType: "json",
											data: {
												offset: 0,
												limit: 5
											},
											success: function(d) {
												var rows = d.rows;
												var $nbody = $('#qaBody');

												$nbody.html('');
												$.each(rows, function(idx) {
													var $item = $(qaTmp.format(rows[idx]));
													$item.find('a').data('idx', idx);
													$item.find('a').on('click', function() {
														var _idx = $(this).data('idx');
														qa_pop(rows[idx].qaId);
													});
													$nbody.append($item);
												});

												if (rows.length == 0) {
													$nbody.append(
														'<tr>' +
															'<td colspan="1" style="text-align: center;">' +
																'<span>-- 暂无数据 --</span>' +
															'</td>' +
														'</tr>'
													);
												}
											},
											error: function() {
												var $nbody = $('#qaBody');
												$nbody.html('');
												$nbody.append(
													'<tr>' +
														'<td colspan="1" style="text-align: center; color: red;">' +
															'<span>-- 后台发生错误 --</span>' +
														'</td>' +
													'</tr>'
												);
											}
										});
									}
									reload_qa();
									
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

									// 提问
									var $btn_qa_add = $('#btn_qa_add');
									$btn_qa_add.click(function() {
										$btn_qa_add.prop('disabled', true);
										BootstrapDialog.show({
											title: '请输入您的问题',
											cssClass: "modal-sp",
											closable: false,
											message: function() {
												var $message = $('<textarea class="form-control" name="qaContent" id="qaContent" style="width: 100%; resize: none;" rows="13"></textarea>');
												return $message;
											},
											buttons: [{
												label: '提交',
												icon: 'glyphicon glyphicon-send',
												autospin: false,
												cssClass: "btn-primary",
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

										$btn_qa_add.prop('disabled', false);
									});
								</script>
							</div>
						</div>

						<div class="right-area">
							<!-- 通知公告 -->
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										通知公告
										<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=informNotice" class="pull-right">更多</a>
									</h3>
								</div>
								<div class="panel-body" style="padding-top: 0;">
									<div class="notice-list">
										<table class="table sp-row-height">
											<tbody id="noticeBody">
												<tr>
													<td>加载中...</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- end of .notice-list -->
								</div>
								<script>
									var informTmp =
										'<tr>' +
											'<td class="td-icon-holder"><i class="td-icon icon-speaker"></i></td>' +
											'<td class="fix-text fix-text-230">' +
												'<a href="${pageContext.request.contextPath}/infrontend/commonDetailJsp?switchPage=informNotice&id={informId}">{informName}</a>' +
											'</td>' +
											'<td class="date-colume">{createDate}</td>' +
										'</tr>';
									$.ajax({
										method: 'POST',
										url: '${pageContext.request.contextPath}/informNotice/getList',
										dataType: "json",
										data: {
											offset: 0,
											limit: 9
										},
										success: function(d) {
											var rows = d.rows;
											var $nbody = $('#noticeBody');

											$nbody.html('');

											$.each(rows, function(idx) {
												var df = $.extend({}, rows[idx], {createDate: rows[idx].createDate.split(' ')[0]});
												var $item = $(informTmp.format(df));
												/*$item.find('a').data('idx', idx);
												$item.find('a').on('click', function() {
													var _idx = $(this).data('idx');
													BootstrapDialog.alert({
														title: rows[_idx].informName,
														message: rows[_idx].informContent
													});
												});*/
												$nbody.append($item);
											});

											if (rows.length == 0) {
												$nbody.append(
													'<tr>' +
														'<td colspan="3" style="text-align: center;">' +
															'<span>-- 暂无数据 --</span>' +
														'</td>' +
													'</tr>'
												);
											}
										},
										error: function() {
											var $nbody = $('#noticeBody');
											$nbody.html('');
											$nbody.append(
												'<tr>' +
													'<td colspan="3" style="text-align: center; color: red;">' +
														'<span>-- 后台发生错误 --</span>' +
													'</td>' +
												'</tr>'
											);
										}
									});
								</script>
							</div>

							<!-- 问卷调查 -->
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										问卷调查
										<a href="#" class="pull-right">更多</a>
									</h3>
								</div>
								<div class="panel-body">
									<div style="color:gray; padding: 20px;">功能开发中</div>
								</div>
							</div>

							<!-- 考试参与排名 -->
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										考试参与排名
										<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=staticDataLogin" class="pull-right">更多</a>
									</h3>
								</div>
								<div class="panel-body">
									<table class="table">
										<thead>
											<tr>
												<th style="text-align: center;">考试内容</th>
											</tr>
										</thead>
										<tbody id="paperRankBody">
											<tr>
												<td>加载中...</td>
											</tr>
										</tbody>
									</table>
								</div>
								<script>
									var paperRankTmp =
										'<tr>' +
											// '<td style="text-align: center;">' +
											// 	'<span>{idx}</span>' +
											// '</td>' +
											'<td class="fix-text fix-text-350">' +
												'<span>{departmentName}TODO</span>' +
											'</td>' +
											// '<td style="text-align: center;">{loginCount}</td>' +
										'</tr>';
									$.ajax({
										method: 'POST',
										url: '${pageContext.request.contextPath}/infrontend/commonGetList',
										dataType: "json",
										data: {
											offset: 0,
											limit: 5,
											beginDate: '',
											endDate: '',
											switchPage: 'staticDataLogin'
										},
										success: function(d) {
											var rows = d.rows;
											var $nbody = $('#paperRankBody');

											$nbody.html('');
											$.each(rows, function(idx) {
												var rdata = $.extend({}, rows[idx], {idx: idx + 1});
												var $item = $(paperRankTmp.format(rdata));
												$nbody.append($item);
											});

											if (rows.length == 0) {
												$nbody.append(
													'<tr>' +
														'<td colspan="1" style="text-align: center;">' +
															'<span>-- 暂无数据 --</span>' +
														'</td>' +
													'</tr>'
												);
											}
										},
										error: function() {
											var $nbody = $('#paperRankBody');
											$nbody.html('');
											$nbody.append(
												'<tr>' +
													'<td colspan="1" style="text-align: center; color: red;">' +
														'<span>-- 后台发生错误 --</span>' +
													'</td>' +
												'</tr>'
											);
										}
									});
								</script>
							</div>

							<!-- 系统参与排名 -->
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										系统参与排名
										<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=staticDataLogin" class="pull-right">更多</a>
									</h3>
								</div>
								<div class="panel-body">
									<table class="table">
										<thead>
											<tr>
												<th style="text-align: center; width: 48px;">排行</th>
												<th style="text-align: center; width: 213px;">单位</th>
												<th style="text-align: center; width: 112px;">系统登录次数</th>
											</tr>
										</thead>
										<tbody id="useRankBody">
											<tr>
												<td>加载中...</td>
											</tr>
										</tbody>
									</table>
								</div>
								<script>
									var useRankTmp =
										'<tr>' +
											'<td style="text-align: center;">' +
												'<span>{idx}</span>' +
											'</td>' +
											'<td class="fix-text fix-text-210">' +
												'{departmentName}' +
											'</td>' +
											'<td style="text-align: center;">{loginCount}</td>' +
										'</tr>';
									$.ajax({
										method: 'POST',
										url: '${pageContext.request.contextPath}/infrontend/commonGetList',
										dataType: "json",
										data: {
											offset: 0,
											limit: 5,
											beginDate: '',
											endDate: '',
											switchPage: 'staticDataLogin'
										},
										success: function(d) {
											var rows = d.rows;
											var $nbody = $('#useRankBody');

											$nbody.html('');
											$.each(rows, function(idx) {
												var rdata = $.extend({}, rows[idx], {idx: idx + 1});
												var $item = $(useRankTmp.format(rdata));
												$nbody.append($item);
											});

											if (rows.length == 0) {
												$nbody.append(
													'<tr>' +
														'<td colspan="3" style="text-align: center;">' +
															'<span>-- 暂无数据 --</span>' +
														'</td>' +
													'</tr>'
												);
											}
										},
										error: function() {
											var $nbody = $('#useRankBody');
											$nbody.html('');
											$nbody.append(
												'<tr>' +
													'<td colspan="3" style="text-align: center; color: red;">' +
														'<span>-- 后台发生错误 --</span>' +
													'</td>' +
												'</tr>'
											);
										}
									});
								</script>
							</div>
						</div>

						<br>

					</div>
				</div>

				<footer class="footer">
					<div class="container">
						<div class="row">
							<ul class="text-center no-style" style="padding: 25px 0;">
								<li>
									<span>北京市公安局东城分局</span>
								</li>
								<li>
									<span>建议使用Chrome浏览器 &nbsp; 推荐分辨率：1366&times;768</span>
								</li>
							</ul>
						</div>
					</div>
				</footer>
			</div>
		</div>

		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
	            </div> -->
					<div class="modal-body" style="padding-left: 30px; padding-top: 20px;">
						<p>点击关闭按钮检查事件功能。</p>
						<ul class="no-style">
							<li>A、对其予以罚款，收缴证件后准予出境</li>
							<li>B、对其予以罚款，阻止出境</li>
							<li>C、对其予以罚款，准予出境</li>
							<li>D、对其予以罚款，收缴证件后不予出境</li>
						</ul>
						<p>【正确答案】C</p>
					</div>
					<div class="modal-footer">
						<button class="btn btn-success" data-dismiss="modal">&nbsp;&nbsp;确定&nbsp;&nbsp;</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<script>
			$('.show-detail').on('click', function () {
				$('#myModal').modal('show');
			});
		</script>

		<!-- /.modal -->
		<div class="modal fade" id="qa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body" style="padding-left: 30px; padding-top: 20px;">
						<h1>问题</h1>
						<p>问题标题</p>
						<p>问题内容</p>
						<h1>回答</h1>
						<p>回答内容</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">&nbsp;&nbsp;确定&nbsp;&nbsp;</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<script>
			$('.show-qa').on('click', function () {
				$('#qa').modal('show');
			});
		</script>
</body>
</html>