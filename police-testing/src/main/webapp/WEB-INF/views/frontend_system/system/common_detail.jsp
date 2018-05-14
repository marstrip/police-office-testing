<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<title id="title"></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/jquery.perfect-scrollbar-1.3.0/css/perfect-scrollbar.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/assets/css/demo-all.css">

	<script src="${pageContext.request.contextPath}/styles/vendors/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/vendors/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/vendors/jquery.perfect-scrollbar-1.3.0/dist/perfect-scrollbar.min.js"></script>

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

                <div class="thin-body">
                    <div class="mastbody">
                        <ol class="breadcrumb">
                            <li>
                                <a href="${pageContext.request.contextPath}/login/frontendIndex">首页</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" id="spBreadCrumb"></a>
                            </li>
                            <li>
                                正文
                            </li>
                        </ol>

                        <!-- 左右留白 -->
                        <div style="padding: 0px 20px;">
                            <h1 style="text-align: center;" id="name">
                                标题
                            </h1>
                            <div class="text-info" style="text-align: center;">
                                <span>发布日期：</span>
                                <span id="createDate"></span>
								&nbsp;&nbsp;&nbsp;&nbsp;
                                <span>发布人：</span>
                                <span id="creatorName"></span>
                            </div>
                            <br/>
                            <article class="text-content" id="content">
                                <p>
                                    正文
                                </p>
                            </article>

                        </div>
                        <br/>
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
    </div>

    <script>
		var switchPage = getUrlParam('switchPage');
		var id = getUrlParam('id');

		var spTextMap = {
			caseAnalyze: '案例分析',
			informNotice: '通知公告',
			//staticDataLogin: '系统参与排名',
			testSelf: '课件超市'
		}
		var spHrefMap = {
			caseAnalyze: '${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=caseAnalyze',
			informNotice: '${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=informNotice',
			//staticDataLogin: '${pageContext.request.contextPath}/infrontend/bjCommonJsp?switchPage=staticDataLogin',
			testSelf: '${pageContext.request.contextPath}/infrontend/superMarketJsp'
		}

		$('#title').html(spTextMap[switchPage]);
		$('#spBreadCrumb').html(spTextMap[switchPage]);
		$('#spBreadCrumb').attr('href', spHrefMap[switchPage]);

		$.ajax({
			url: '${pageContext.request.contextPath}/infrontend/commonView',
			method: 'POST',
			dataType: 'JSON',
			data: {
				switchPage: switchPage,
				id: id
			},
			success: function(result) {
				console.log('result>>>', result);
				if (result.status !== 1) {
					document.write('请关闭页面，从列表页进入');
				} else {
					$.each(result.info, function(k, v) {
						$('#' + k).html(v);
					});
				}
			},
			error: function() {
				document.write('请关闭页面，从列表页进入');
			},
            complete: function() {
                // 完成选然后，重置footer，更新gpsb高度
                resetFooter();
                window.gpsb.update();
            }
		});
    </script>
</body>
</html>