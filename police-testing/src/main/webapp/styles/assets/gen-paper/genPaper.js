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
			<div class="paper" style="width: 960px; margin: 20px auto; white-space: initial; padding: 20px;">
				<style>
					.q-type-mark {
						margin-top: 40px;
					}
					.q-container {
						display: inline-block;
						width: 100%;
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
							<h1>{testPaperName}</h1>
							<div class="col-sm-8 col-sm-offset-2">
								<hr>
								<div>
									<div class="col-sm-4 text-center exam-header-item">
										<p>本试卷共有</p>
										<p><strong>{qCount}</strong> 题目</p>
									</div>
									<div class="col-sm-4 text-center exam-header-item">
										<p>卷面总分</p>
										<p><span id="score"></span><strong>100</strong> 分</p>
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
							<form id="singleContainer" class="q-container">
							</form>

							<h3 class="q-type-mark">二、多选题</h3>
							<form id="multiContainer" class="q-container">
							</form>

							<h3 class="q-type-mark">三、判断题</h3>
							<form id="judgeContainer" class="q-container">
							</form>
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

		// 只读
		var readonlyTemplate_select = `
			<div class="col-sm-12 q-group">
				<p class="q-name">{idx}、{testQuestionsName}</p>
				<div class="q-select-answer">
					<ul class="no-style q-select-items">
					</ul>
				</div>
			</div>
		`;
		var readonlyTemplate_singleSelectItem = `
			<li>
				{testQuestionSelectItem}
			</li>
		`;
		var readonlyTemplate_multiSelectItem = `
			<li>
				{testQuestionSelectItem}
			</li>
		`;
		var readonlyTemplate_judge = `
			<div class="col-sm-12 q-group">
				<p class="q-name">{idx}、{testQuestionsName}</p>
				<div class="q-select-answer">
					<span>是</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span>否</span>
				</div>
			</div>
		`;


		// 正式
		var examTemplate_select = `
			<div class="col-sm-12 q-group">
				<p class="q-name">{idx}、{testQuestionsName}</p>
				<div class="q-select-answer">
					<input type="hidden" value="{'testQuestionsId':'{testQuestionsId}','testQuestionType':'{testQuestionType}'}" />
					<ul class="no-style q-select-items">
					</ul>
					<div class="check-answer"></div>
				</div>
			</div>
		`;

		// 单选样式替换 --START--
		/*var examTemplate_singleSelectItem = `
			<li>
				<input type="radio" name="{testQuestionsId}" value="{value}" />
				{testQuestionSelectItem}
			</li>
		`;*/
		var examTemplate_singleSelectItem = 
			'<div class="radio clip-radio radio-primary">' +
				'<input type="radio" name="{testQuestionsId}" value="{value}" id="{itemId}">' +
				'<label for="{itemId}">{testQuestionSelectItem}</label>' +
			'</div>';
		// 单选样式替换 --END--

		// 多选样式替换 --START--
		/*var examTemplate_multiSelectItem = `
			<li>
				<input type="checkbox" name="{testQuestionsId}" value="{value}" />
				{testQuestionSelectItem}
			</li>
		`;*/
		var examTemplate_multiSelectItem =
			'<div class="checkbox clip-check check-primary">' +
				'<input type="checkbox" name="{testQuestionsId}" value="{value}" id="{itemId}">' +
				'<label for="{itemId}">{testQuestionSelectItem}</label>' +
			'</div>';
		// 多选样式替换 --END--

		// 判断样式替换 --START--
		/*var examTemplate_judge = `
			<div class="col-sm-12 q-group">
				<p class="q-name">{idx}、{testQuestionsName}</p>
				<div class="q-select-answer">
					<input type="hidden" value="{'testQuestionsId':'{testQuestionsId}','testQuestionType':'{testQuestionType}'}" />
					<span><input type="radio" name="{testQuestionsId}" value="Yes" />是</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span><input type="radio" name="{testQuestionsId}" value="No" />否</span>
					<div class="check-answer"></div>
				</div>
			</div>
		`;*/
		var examTemplate_judge = `
			<div class="col-sm-12 q-group">
				<p class="q-name">{idx}、{testQuestionsName}</p>
				<div class="q-select-answer">
					<input type="hidden" value="{'testQuestionsId':'{testQuestionsId}','testQuestionType':'{testQuestionType}'}" />
					<div class="radio clip-radio radio-primary radio-inline">
						<input type="radio" name="{testQuestionsId}" value="Yes" id="{testQuestionsId}_yes">
						<label for="{testQuestionsId}_yes">是</label>
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="radio clip-radio radio-primary radio-inline">
						<input type="radio" name="{testQuestionsId}" value="No" id="{testQuestionsId}_no">
						<label for="{testQuestionsId}_no">否</label>
					</div>
					<div class="check-answer"></div>
				</div>
			</div>
		`;

		// 判断样式替换 --END--

		var singleIdx = 0;
		var multiIdx = 0;
		var judgeIdx = 0;

		// 只读
		if (!!readonly) {
			$.each(result.list, function(idx) {
				var q = result.list[idx];

				switch(q.testQuestionType) {
					case "1":
						// 单选
						singleIdx += 1;
						var $q = $(readonlyTemplate_select.format({
							idx: (idx + 1),
							testQuestionsName: q.testQuestionsName
						}));

						var options = q.testQuestionSelects.replace(/\&[^\&\;]*\;/g, '').split(';');
						$.each(options, function(_idx) {
							$q.find('.q-select-items').append($(readonlyTemplate_singleSelectItem.format({
								testQuestionSelectItem: options[_idx]
							})));
						});

						$singleContainer.append($q);
						break;

					case "2":
						// 多选
						multiIdx += 1;
						var $q = $(readonlyTemplate_select.format({
							idx: (idx + 1),
							testQuestionsName: q.testQuestionsName
						}));

						var options = q.testQuestionSelects.replace(/\&[^\&\;]*\;/g, '').split(';');
						$.each(options, function(_idx) {
							$q.find('.q-select-items').append($(readonlyTemplate_multiSelectItem.format({
								testQuestionSelectItem: options[_idx]
							})));
						});

						$multiContainer.append($q);
						break;

					case "3":
						// 判断
						judgeIdx += 1;
						var $q = $(readonlyTemplate_judge.format({
							idx: (idx + 1),
							testQuestionsName: q.testQuestionsName
						}));

						$judgeContainer.append($q);
						break;

				}
			});

			$this.append($paper);
		}
		// 正式
		else {
			$.each(result.list, function(idx) {
				var q = result.list[idx];

				switch(q.testQuestionType) {
					case "1":
						// 单选
						singleIdx += 1;
						var $q = $(examTemplate_select.format({
							idx: (idx + 1),
							testQuestionsName: q.testQuestionsName,
							testQuestionsId: q.testQuestionsId,
							testQuestionType: q.testQuestionType
						}));

						var options = q.testQuestionSelects.replace(/\&[^\&\;]*\;/g, '').split(';');
						$.each(options, function(_idx) {
							var $optionItem = $(examTemplate_singleSelectItem.format({
								testQuestionSelectItem: options[_idx],
								testQuestionsId: q.testQuestionsId,
								value: options[_idx][0],
								itemId: q.testQuestionsId + '_' + _idx
							}));
							$q.find('.q-select-items').append($optionItem);
						});

						$singleContainer.append($q);
						break;

					case "2":
						// 多选
						multiIdx += 1;
						var $q = $(examTemplate_select.format({
							idx: (idx + 1),
							testQuestionsName: q.testQuestionsName,
							testQuestionsId: q.testQuestionsId,
							testQuestionType: q.testQuestionType
						}));

						var options = q.testQuestionSelects.replace(/\&[^\&\;]*\;/g, '').split(';');
						$.each(options, function(_idx) {
							var $optionItem = $(examTemplate_multiSelectItem.format({
								testQuestionSelectItem: options[_idx],
								testQuestionsId: q.testQuestionsId,
								value: options[_idx][0],
								itemId: q.testQuestionsId + '_' + _idx
							}));
							$q.find('.q-select-items').append($optionItem);
						});

						$multiContainer.append($q);
						break;

					case "3":
						// 判断
						judgeIdx += 1;
						var $q = $(examTemplate_judge.format({
							idx: (idx + 1),
							testQuestionsName: q.testQuestionsName,
							testQuestionsId: q.testQuestionsId
						}));

						$judgeContainer.append($q);
						break;

				}
			});

			$this.append($paper);
		}


		
	}

	$.fn.genQuestion = function(q) {
		var $this = $(this);
		// 只读
		var readonlyTemplate_select = `
			<div>
				<p class="q-name">{idx}、{testQuestionsName}</p><div class="q-select-answer"><ul class="no-style q-select-items"></ul></div>
				<p class="check-answer">【正确答案】{correctAnswer}</p>
			</div>
		`;
		var readonlyTemplate_singleSelectItem = `
			<li><p>{testQuestionSelectItem}</p></li>
		`;
		var readonlyTemplate_multiSelectItem = `
			<li><p>{testQuestionSelectItem}</p></li>
		`;
		var readonlyTemplate_judge = `
			<div>
				<p class="q-name">{idx}、{testQuestionsName}</p><p class="q-select-answer"><span>是</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>否</span></p>
				<p class="check-answer">【正确答案】{correctAnswer}</p>
			</div>
		`;

		var singleIdx = 0;
		var multiIdx = 0;
		var judgeIdx = 0;
		var idx = 0;

		switch(q.testQuestionType) {
			case "1":
				// 单选
				singleIdx += 1;
				var $q = $(readonlyTemplate_select.format({
					idx: (idx + 1),
					testQuestionsName: q.testQuestionsName,
					testQuestionsId: q.testQuestionsId,
					testQuestionType: q.testQuestionType,
					correctAnswer: q.correctAnswer
				}));

				var options = q.testQuestionSelects.replace(/\&[^\&\;]*\;/g, '').split(';');
				$.each(options, function(_idx) {
					$q.find('.q-select-items').append($(readonlyTemplate_singleSelectItem.format({
						testQuestionSelectItem: options[_idx],
						testQuestionsId: q.testQuestionsId,
						value: options[_idx][0]
					})));
				});

				$this.append($q);
				break;

			case "2":
				// 多选
				multiIdx += 1;
				var $q = $(readonlyTemplate_select.format({
					idx: (idx + 1),
					testQuestionsName: q.testQuestionsName,
					testQuestionsId: q.testQuestionsId,
					testQuestionType: q.testQuestionType,
					correctAnswer: q.correctAnswer
				}));

				var options = q.testQuestionSelects.replace(/\&[^\&\;]*\;/g, '').split(';');
				$.each(options, function(_idx) {
					$q.find('.q-select-items').append($(readonlyTemplate_multiSelectItem.format({
						testQuestionSelectItem: options[_idx],
						testQuestionsId: q.testQuestionsId,
						value: options[_idx][0]
					})));
				});

				$this.append($q);
				break;

			case "3":
				// 判断
				judgeIdx += 1;
				var $q = $(readonlyTemplate_judge.format({
					idx: (idx + 1),
					testQuestionsName: q.testQuestionsName,
					testQuestionsId: q.testQuestionsId,
					correctAnswer: q.correctAnswer
				}));

				$this.append($q);
				break;

		}
	}
}));