;(function (factory) {
	'use strict';
	if (typeof define === "function" && define.amd) {
		// AMD模式
		define(['jquery'], factory);
	} else {
		// 全局模式
		factory(jQuery);
	}
}(function ($) {
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

	$.fn.genPaper = function(formData, result, readonly) {
		var $this = $(this);
		console.log('gen paper ...', formData, result);

		var opt = $.extend({}. formData, result);

		var $paper = $(`
			<div style="width: 960px; margin: 20px auto; white-space: initial; padding: 0 20px;">
				<style>
					.q-type-mark {
						margin-top: 40px;
					}
					.q-container {
						display: inline-block;
					}
					.q-name {
						font-size: 18px;
					}
					.q-answer {
						font-size: 18px;
					}
					.q-select-answer {
						font-size: 18px;
						padding-left: 40px;
					}
					ul.q-select-items {
						list-style-type: none;
						-webkit-padding-start: 0px;
					}
					.q-group {
						margin-bottom: 20px;
					}
				</style>
				<div class="p anel p anel-white" style="display: block;">
					<div class="p anel-body" style="display: block;">
						<!-- 试卷头 -->
						<div class="text-center">
							<h2>{testPaperName}</h2>
							<div class="col-sm-8 col-sm-offset-2">
								<hr>
								<div>
									<div class="col-sm-4 text-center exam-header-item">
										<p>本试卷共有</p>
										<p><strong>{qCount}</strong> 题目</p>
									</div>
									<div class="col-sm-4 text-center exam-header-item">
										<p>卷面总分</p>
										<p><strong>100</strong> 分</p>
									</div>
									<div class="col-sm-4 text-center exam-header-item">
										<p>答题时间</p>
										<p><strong>{testTime}</strong> 分钟</p>
									</div>
								</div>
							</div>
							<div style="clear: left;">
								<div class="col-sm-12">
						   			<hr>
						   		</div>
							</div>
						</div>

						<!-- 题目 -->
						<div class="q-select exam-area">
							<h3 class="q-type-mark">一、单选题</h3>
							<div id="singleContainer" class="q-container">
							</div>

							<h3 class="q-type-mark">二、多选题</h3>
							<div id="multiContainer" class="q-container">
							</div>

							<h3 class="q-type-mark">三、判断题</h3>
							<div id="judgeContainer" class="q-container">
							</div>
						</div>
					</div>
				</div>
			</div>
		`.format({
			testPaperName: formData.testPaperName,
			qCount: result.list.length,
			testTime: formData.testTime
		}));

		var $singleContainer = $paper.find('#singleContainer');
		var $multiContainer = $paper.find('#multiContainer');
		var $judgeContainer = $paper.find('#judgeContainer');

		var readOnlyTemplate_select = `
			<div class="col-sm-12 q-group">
				<p class="q-name">{idx}、{testQuestionsName}</p>
				<div class="q-select-answer">
					<ul class="no-style q-select-items">
					</ul>
				</div>
			</div>
		`;

		var readOnlyTemplate_singleSelectItem = `
			<li>
				{testQuestionSelectItem}
			</li>
		`;

		var readOnlyTemplate_multiSelectItem = `
			<li>
				{testQuestionSelectItem}
			</li>
		`;

		var readOnlyTemplate_judge = `
			<div class="col-sm-12 q-group">
				<p class="q-name">{idx}、{testQuestionsName}</p>
				<div class="q-select-answer">
					<span>是</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span>否</span>
				</div>
			</div>
		`;

		var singleIdx = 0;
		var multiIdx = 0;
		var judgeIdx = 0;


		if (!!readonly) {
			$.each(result.list, function(idx) {
				var q = result.list[idx];

				switch(q.testQuestionType) {
					case "1":
						// 单选
						singleIdx += 1;
						var $q = $(readOnlyTemplate_select.format({
							idx: (idx + 1),
							testQuestionsName: q.testQuestionsName
						}));

						var options = q.testQuestionSelects.replace(/\&[^\&\;]*\;/g, '').split(';');
						$.each(options, function(_idx) {
							$q.find('.q-select-items').append($(readOnlyTemplate_singleSelectItem.format({
								testQuestionSelectItem: options[_idx]
							})));
						});

						$singleContainer.append($q);
						break;

					case "2":
						// 多选
						multiIdx += 1;
						var $q = $(readOnlyTemplate_select.format({
							idx: (idx + 1),
							testQuestionsName: q.testQuestionsName
						}));

						var options = q.testQuestionSelects.replace(/\&[^\&\;]*\;/g, '').split(';');
						$.each(options, function(_idx) {
							$q.find('.q-select-items').append($(readOnlyTemplate_multiSelectItem.format({
								testQuestionSelectItem: options[_idx]
							})));
						});

						$multiContainer.append($q);
						break;

					case "3":
						// 判断
						judgeIdx += 1;
						var $q = $(readOnlyTemplate_judge.format({
							idx: (idx + 1),
							testQuestionsName: q.testQuestionsName
						}));

						$judgeContainer.append($q);
						break;

				}
			});

			$this.append($paper);
		}

		else {

		}


		
	}
}));