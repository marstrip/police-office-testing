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
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										个人信息
									</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<!-- <div class="pull-left" style="width: 90px; height: 90px; padding-left: 15px;">
										<img src="assets/img/People.png" alt="" class="avatar">
									</div> -->
										<div class="func-item func-item-2x no-border" style="padding: 20px 10px;">
											<ul class="no-style">
												<li>
													<b>欢迎您！</b>
												</li>
												<li class="police-name">${userName}</li>
												<li class="police-id">${userId}</li>
											</ul>
										</div>
									</div>
									<!-- 功能 -->
									<div class="row">
										<!-- <div class="col-lg-4 col-md-6"> -->

										<div class="func-item">
											<div class="icon">
												<i class="fa fa-3x fa-bars"></i>
											</div>
											<div class="desciption">
												成绩查询
											</div>
										</div>
										<div class="func-item">
											<div class="icon">
												<i class="fa fa-3x fa-user"></i>
											</div>
											<div class="desciption">
												个人设置
											</div>
										</div>
										<div class="func-item">
											<div class="icon">
												<i class="fa fa-3x fa-sign-out"></i>
											</div>
											<div class="desciption">
												退出
											</div>
										</div>
										<!-- <div class="func-item func-item-2x no-border">
										<div class="info">
											<ul class="no-style">
												<li>已通过课程：10门</li>
												<li>未通过课程：4门</li>
											</ul>
										</div>
									</div> -->
									</div>
								</div>
							</div>



							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										快速导航
										<!-- <a href="demo-extra-fail-list.html" class="pull-right">更多</a> -->
									</h3>
								</div>
								<div class="panel-body">

									<div class="quick-link" style="padding: 30px 40px;">
										<a class="black" href="${pageContext.request.contextPath}/infrontend/superMarketJsp">
											<div class="func-item func-item-bar">
												<div class="icon pull-left">
													<i class="fa fa-2x fa-shopping-cart"></i>
												</div>
												<div class="desciption pull-left">
													课&nbsp;件&nbsp;超&nbsp;市
												</div>
											</div>
										</a>
										<a class="black" href="${pageContext.request.contextPath}/testPaper/fronendJsp?type=simulateExam">
											<div class="func-item func-item-bar">
												<div class="icon pull-left">
													<i class="fa fa-2x fa-paperclip"></i>
												</div>
												<div class="desciption pull-left">
													执法培训模拟考试
												</div>
											</div>
										</a>
										<a class="black" href="${pageContext.request.contextPath}/#">
											<div class="func-item func-item-bar">
												<div class="icon pull-left">
													<i class="fa fa-2x">☭</i>
												</div>
												<div class="desciption pull-left">
													党的建设模拟考试
												</div>
											</div>
										</a>
									</div>

								</div>
							</div>

							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										问卷调查
										<a href="#" class="pull-right">更多</a>
									</h3>
								</div>
								<div class="panel-body">
									<span style="color:gray;">功能开发中</span>
								</div>
							</div>

							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										单位排行榜
										<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=staticDataLogin" class="pull-right">更多</a>
									</h3>
								</div>
								<div class="panel-body">
									<table class="table">
										<thead>
											<tr>
												<th style="text-align: center; width: 82px;">名次</th>
												<th style="text-align: center;">派出所</th>
												<th style="text-align: center; width: 82px;">次数</th>
											</tr>
										</thead>
										<tbody id="useRankBody">
											<tr>
												<td>加载中...</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

								<script>
									var useRankTmp =
										'<tr>' +
											'<td style="text-align: center;">' +
												'<span>{idx}</span>' +
											'</td>' +
											'<td class="fix-text fix-text-200" style="width: 640px;">' +
												'{departmentName}' +
											'</td>' +
											'<td style="">{loginCount}</td>' +
										'</tr>';
									$.ajax({
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
										}
									});
								</script>

						</div>

						<div class="right-area">
							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										通知公告
										<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=informNotice" class="pull-right">更多</a>
									</h3>
								</div>
								<div class="panel-body" style="padding-top: 0;">
									<div class="notice-list">
										<table class="table">
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
											'<td class="fix-text" style="width: 640px;">' +
												'<a href="javascript:void(0);">{informName}</a>' +
											'</td>' +
											'<td style="">{createDate}</td>' +
										'</tr>';
									$.ajax({
										url: '${pageContext.request.contextPath}/informNotice/getList',
										dataType: "json",
										data: {
											offset: 0,
											limit: 5
										},
										success: function(d) {
											var rows = d.rows;
											var $nbody = $('#noticeBody');

											$nbody.html('');
											$.each(rows, function(idx) {
												var $item = $(informTmp.format(rows[idx]));
												$item.find('a').data('idx', idx);
												$item.find('a').on('click', function() {
													var _idx = $(this).data('idx');
													BootstrapDialog.alert({
														title: rows[_idx].informName,
														message: rows[_idx].informContent
													});
												});
												$nbody.append($item);
											});
										}
									});
								</script>
							</div>

							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										案例评析
										<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=caseAnalyze" class="pull-right">更多</a>
									</h3>
								</div>
								<div class="panel-body" style="padding-top: 0;">
									<div class="notice-list">
										<table class="table">
											<tbody id="caseBody">
												<tr>
													<td>加载中...</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- end of .notice-list -->
								</div>
								<script>
									var caseTmp =
										'<tr>' +
											'<td class="fix-text" style="width: 640px;">' +
												'<a href="javascript:void(0);">{caseName}</a>' +
											'</td>' +
											'<td style="">{createDate}</td>' +
										'</tr>';
									$.ajax({
										url: '${pageContext.request.contextPath}/caseAnalyze/getList',
										dataType: "json",
										data: {
											offset: 0,
											limit: 5
										},
										success: function(d) {
											var rows = d.rows;
											var $nbody = $('#caseBody');

											$nbody.html('');
											$.each(rows, function(idx) {
												var $item = $(caseTmp.format(rows[idx]));
												$item.find('a').data('idx', idx);
												$item.find('a').on('click', function() {
													var _idx = $(this).data('idx');
													BootstrapDialog.alert({
														title: rows[_idx].caseName,
														message: rows[_idx].caseContent
													});
												});
												$nbody.append($item);
											});
										}
									});
								</script>
							</div>

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
													<th style="text-align: left; width: 500px;">考试内容</th>
													<th style="text-align: left;">结束时间</th>
													<th style="text-align: left;">操作</th>
												</tr>
											</thead>
											<tbody id="examBody">
												<tr>
													<td>加载中...</td>
												</tr>
												<!-- <tr>
													<td>
														<span>2018年第一次考试</span>
													</td>
													<td>
														<span>2018/2/19</span>
													</td>
													<td>
														<a href="demo-exam-paper.html">参加考试</a>
													</td>
												</tr>
												<tr>
													<td>
														<span>2018年第二次考试</span>
													</td>
													<td>
														<span>2018/2/19</span>
													</td>
													<td>
														<a href="demo-exam-paper.html">已结束</a>
													</td>
												</tr> -->
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
												'<span>{testDate}</span>' +
											'</td>' +
											'<td>' +
												// '{op}'
												//'<a href="demo-exam-paper.html">参加考试</a>' +
												'<a href="javascript:void(0);" idx="{idx}">{op}</a>' +
											'</td>' +
										'</tr>';
										/*'<tr>' +
											'<td class="fix-text" style="width: 640px;">' +
												'<a href="javascript:void(0);">{questionContent}</a>' +
											'</td>' +
											'<td style="">{createDate}</td>' +
										'</tr>';*/
									$.ajax({
										url: '${pageContext.request.contextPath}/testPaper/fronendList',
										dataType: "json",
										data: {
											offset: 0,
											limit: 5
										},
										success: function(d) {
											var rows = d.rows;
											var $nbody = $('#examBody');

											$nbody.html('');
											$.each(rows, function(idx) {
												var opMap = {
													'1': '参加考试',
													'0': '已结束'
												};

												var rdata = $.extend({}, rows[idx], {
													op: opMap[rows[idx].flagExam]
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
													}
												});
												$nbody.append($item);
											});
										}
									});
								</script>
							</div>

							<div class="panel panel-white panel-static-height">
								<div class="panel-heading">
									<h3 class="panel-title">
										答疑互动
										<a href="${pageContext.request.contextPath}/infrontend/bjCommonJsp" class="pull-right">更多</a>
									</h3>
								</div>
								<div class="panel-body" style="padding-top: 0;">
									<div class="notice-list">
										<table class="table">
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
											'<td class="fix-text" style="width: 640px;">' +
												'<a href="javascript:void(0);">{questionContent}</a>' +
											'</td>' +
											'<td style="">{createDate}</td>' +
										'</tr>';
									$.ajax({
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
													BootstrapDialog.alert({
														title: rows[_idx].questionContent,
														message: rows[_idx].questionAnswer
													});
												});
												$nbody.append($item);
											});
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
									<span>北京市公安局东城分局政治处</span>
								</li>
								<li>
									<span>建议使用Chrome以上浏览器 &nbsp; 推荐分辨率：1366&times;768</span>
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