<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="min-height: 100%; background: #f5f5f5;">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>考试</title>
	
	<script src="${pageContext.request.contextPath}/styles/node_modules/jquery/dist/jquery.min.js"></script>
	
	<!-- BS table -->
	<!-- 基础依赖 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap3/dist/css/bootstrap-theme.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap3/dist/js/bootstrap.min.js"></script>

	<!-- 图标 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/font-awesome/css/font-awesome.min.css">

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

		.judge.fa.right:after {
			content: "\f00c";
			color: green;
		}
		.judge.fa.wrong:after {
			content: "\f00d";
			color: red;
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
					<div class="icon-description" style="font-size: 12px;" id="timer"></div>
					<!-- <div class="weak small">
						共1题
					</div> -->
				</div>
				<button class="panel-footer hover btn btn-default" style="text-align: center; width: 100%; background: #fff; border-radius: 0; border: 0px solid #ddd; border-top-width: 1px; border-bottom-width: 1px;">
					<div class="icon">
						<i class="fa fa-arrow-circle-o-left fa-2x"></i>
					</div>
					<div class="icon-description" onclick="javascript:window.location.href='${pageContext.request.contextPath}/login/frontendIndex'">
						返回首页
					</div>
				</button>
				<!-- <button id="btn_pause" class="panel-footer hover btn btn-default" style="text-align: center; width: 100%; background: #fff; border-radius: 0; border: 0px solid #ddd; border-bottom-width: 1px;">
					<div class="icon">
						<i class="fa fa-pause-circle-o fa-2x"></i>
					</div>
					<div class="icon-description">
						暂停
					</div>
				</button> -->
				<button id="btn_submit" class="panel-footer hover btn btn-success" style="text-align: center; width: 100%; border: none;border-top-left-radius: 0; border-top-right-radius: 0;">
					<div class="icon">
						<i class="fa fa-check-circle-o fa-2x"></i>
					</div>
					<div class="icon-description">
						提交
					</div>
				</button>
			</div>
		</div>

		<!-- 答题区域 -->
		<div id="paperContainer">
			
		</div>
	</div>

</body>
<script type="text/javascript">
	//序列化表格元素为JSON  
	$.fn.serializeJson = function() {  
		var o = {};  
		var a = this.serializeArray();  
		$.each(a, function() {  
			if (o[this.name] !== undefined) {  
				if (o[this.name] == null || !o[this.name].push) {  
					o[this.name] = [o[this.name]];  
				}  
				o[this.name].push(this.value || null);  
			} else {  
				o[this.name] = this.value || null;  
			}  
		});  
		return o;  
	}  

	// 扩展String类型的原生方法，提供类似java或python的format方法
	String.prototype.format = function(args) {
		var result = this;
		if (arguments.length > 0) {
			if (arguments.length == 1 && typeof (args) == "object") {
				for (var key in args) {
					if(args[key]!=undefined){
						var reg = new RegExp("({" + key + "})", "g");
						result = result.replace(reg, args[key]);
					}
				}
			}
			else {
				for (var i = 0; i < arguments.length; i++) {
					if (arguments[i] != undefined) {
						var reg = new RegExp("({[" + i + "]})", "g");
						result = result.replace(reg, arguments[i]);
					}
				}
			}
		}
		return result;
	}

	var $paperContainer = $('#paperContainer');

	function getUrlParam(name) {  
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象  
		var r = window.location.search.substr(1).match(reg);  //匹配目标参数  
		if (r != null) {
			return unescape(r[2]);  //返回参数值 
		} else {
			return null; 
		}
	}
	// var testPaperId = 'TEST1f86946e-85b3-42e5-afc6-25eac00d5378';	// TODO:从url的参数取
	var testPaperId = getUrlParam('testPaperId');
	var type = getUrlParam('type');

	// 倒计时
	function countdown_init(MINITE, endCB) {
		var maxtime = MINITE * 60; //一个小时，按秒计算，自己调整!
		function CountDown() {
			if (maxtime >= 0) {
				minutes = Math.floor(maxtime / 60);
				seconds = Math.floor(maxtime % 60);
				msg = minutes + "分" + seconds + "秒";
				document.all["timer"].innerHTML = msg;
				// if (maxtime == 5 * 60) alert("还剩5分钟");
				--maxtime;
			} else {
				clearInterval(timer);
				alert("时间到，点击确定交卷");
				endCB();
			}
		}
		timer = setInterval(function() {
			CountDown();
		}, 1000);
	}

	function pureSubmit() {
		// 禁用提交按钮
		$('#btn_submit').prop('disabled', true);
		// 提交数据
		var formData = {
			testPaperId: testPaperId,
			answerList: []
		};

		var $forms = $('form');
		$.each($forms, function(idx) {
			var $form = $($forms[idx]);
			var fd = $form.serializeJson();
			console.log('fd', idx, '>>>', fd);

			var $qs = $form.find('input[type=hidden]');
			$.each($qs, function(_idx) {
				var $q = $($qs[_idx]);

				var qData = $.parseJSON($q.val().replace(/\'/g, '"'));
				qData['answer'] = fd[qData.testQuestionsId] || '';
				if ($.isArray(qData['answer'])) {
					qData['answer'] = qData['answer'].join('');
				}

				formData.answerList.push(qData);
			})
		});

		console.log('提交的数据>>>', formData);
		
		$.ajax({
			url: '${pageContext.request.contextPath}/testPaper/submitTesting',
			method: 'POST',
			dataType: 'JSON',
			data: { json: JSON.stringify(formData)},
			success: function(result) {
				if (result.status == 1) {
					var qIdInfoMap = {};
					$.each(result.testingResult, function(idx2) {
						var tr = result.testingResult[idx2];
						qIdInfoMap[tr.testQuestionsId] = {
							correctFlag: tr.correctFlag,
							rightAnswer: tr.rightAnswer
						}
					});

					var $qs = $('input[type=hidden]');
					$.each($qs, function(idx3) {
						var $q = $($qs[idx3]);
						var qData = $.parseJSON($q.val().replace(/\'/g, '"'));
						var qId = qData.testQuestionsId;
						var aData = qIdInfoMap[qId];
						var $checkAnswer = $q.closest('.q-select-answer').find('.check-answer');

						$checkAnswer.html(
							'<i class="judge fa {judgeClass}"></i>	正确答案: <span>{rightAnswer}</span>'.format({
								judgeClass: ((!!aData.correctFlag) ? 'right': 'wrong'),
								rightAnswer: aData.rightAnswer
							})
						);
					});

					// 总分
					$('#score').append('<span style="color: red;">' + result.score + '</span>/');

				} else {
					BootstrapDialog.alert({
						title: '注意',
						message: '提交数据成功，但是未按照预期反馈状态...',
						type: BootstrapDialog.TYPE_WARNING
					});
				}
			},
			error: function(d) {
				BootstrapDialog.alert({
					title: '错误',
					message: '提交数据失败',
					type: BootstrapDialog.TYPE_DANGER
				});
			},
			complete: function() {
				// 禁用提交按钮
				$('#btn_submit').prop('disabled', true);
			}
		})
	}

	// 页面初始化加载数据
	$(document).ready(function() {
		// 正式考试
		if (type == 'officialExam') {
			console.log('类型:', type);
			$.ajax({
				url: '${pageContext.request.contextPath}/testPaper/viewTestPaper',
				method: "POST",
				data: {
					testPaperId: testPaperId
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
						$paperContainer.genPaper(formData, result, false);

						countdown_init(formData.testTime, pureSubmit);
						// countdown_init(0.5, pureSubmit);
					}
				},
				error: function() {
					alert('发生异常！无法发送请求！！请刷新浏览器重试！！');
				}
			});
		}
		// 模拟考试
		else {
			console.log('类型:', type);
			$.ajax({
				url: '${pageContext.request.contextPath}/testCreate/randomGenerationTestPaper',
				method: "POST",
				data: {
					beginDate: null,
					endDate: null,
					uploadFileIds: null
				},
				success: function(d) {
					var result = $.parseJSON(d);
					console.log('>>>', result);

					if (result.status !== 1) {
						alert('请求成功，但是无法取得数据！!请刷新浏览器重试！！');
					} else {
						var formData = {
							testPaperName: '模拟考试',
							testTime: 60
						}
						$paperContainer.genPaper(formData, result, false);

						countdown_init(formData.testTime, pureSubmit);
						// countdown_init(0.5, pureSubmit);
					}
				},
				error: function() {
					alert('发生异常！无法发送请求！！请刷新浏览器重试！！');
				}
			});
		}
	});

	$('#btn_submit').on('click', function() {
		var $this = $(this);
		$this.prop('disabled', true);
		// 确认提交框
		var cfmPaper = BootstrapDialog.confirm({
			title: '请确认',
			message: '是否交卷？',
			type: BootstrapDialog.TYPE_WARNING,
			draggable: true,
			btnCancelLabel: '取消', 
			btnOKLabel: '确认',
			btnOKClass: 'btn-warning',
			callback: function(isYes) {
				if (isYes) {
					// 提交数据
					var formData = {
						testPaperId: testPaperId,
						type: type,
						answerList: []
					};

					var $forms = $('form');
					$.each($forms, function(idx) {
						var $form = $($forms[idx]);
						var fd = $form.serializeJson();
						console.log('fd', idx, '>>>', fd);

						var $qs = $form.find('input[type=hidden]');
						$.each($qs, function(_idx) {
							var $q = $($qs[_idx]);

							var qData = $.parseJSON($q.val().replace(/\'/g, '"'));
							qData['answer'] = fd[qData.testQuestionsId] || '';
							if ($.isArray(qData['answer'])) {
								qData['answer'] = qData['answer'].join('');
							}

							formData.answerList.push(qData);
						})
					});

					console.log('提交的数据>>>', formData);
					
					$.ajax({
						url: '${pageContext.request.contextPath}/testPaper/submitTesting',
						method: 'POST',
						data: { json: JSON.stringify(formData)},
						success: function(d) {
							// try {
								var result = $.parseJSON(d);
								if (result.status == 1) {
									// $('body').html('提交成功！请关闭页面');

									var qIdInfoMap = {};
									$.each(result.testingResult, function(idx2) {
										var tr = result.testingResult[idx2];
										qIdInfoMap[tr.testQuestionsId] = {
											correctFlag: tr.correctFlag,
											rightAnswer: tr.rightAnswer
										}
									});

									var $qs = $('input[type=hidden]');
									$.each($qs, function(idx3) {
										var $q = $($qs[idx3]);
										var qData = $.parseJSON($q.val().replace(/\'/g, '"'));
										var qId = qData.testQuestionsId;
										var aData = qIdInfoMap[qId];
										var $checkAnswer = $q.closest('.q-select-answer').find('.check-answer');

										$checkAnswer.html(
											'<i class="judge fa {judgeClass}"></i>	正确答案: <span>{rightAnswer}</span>'.format({
												judgeClass: ((!!aData.correctFlag) ? 'right': 'wrong'),
												rightAnswer: aData.rightAnswer
											})
										);
									});

									// 总分
									$('#score').append('<span style="color: red;">' + result.score + '</span>/');

								} else {
									BootstrapDialog.alert({
										title: '注意',
										message: '提交数据成功，但是未按照预期反馈状态...请刷新重试',
										type: BootstrapDialog.TYPE_WARNING
									});
									$this.prop('disabled', false);
								}
							// } catch(err) {
							// 	BootstrapDialog.alert({
							// 		title: '异常',
							// 		message: '提交数据成功，但是未按照预期反馈状态...请刷新重试',
							// 		type: BootstrapDialog.TYPE_WARNING
							// 	});
							// 	$this.prop('disabled', false);
							// }
						},
						error: function(d) {
							BootstrapDialog.alert({
								title: '错误',
								message: '提交数据失败',
								type: BootstrapDialog.TYPE_DANGER
							});
							$this.prop('disabled', false);
						}
					})
				} else {
					$this.prop('disabled', false);
				}
			}
		});
	});
</script>
</html>