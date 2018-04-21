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
			<div style="margin: 0 15px; width: 960px; margin: 20px auto; white-space: initial;">
				<style>
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
					.q-select-answer ul {
						list-style-type: none;
						-webkit-padding-start: 0px;
					}
				</style>
				<div class="panel panel-white" style="display: block;">
					<div class="panel-body" style="display: block; padding-bottom: 50px;">
						<!-- 试卷头 -->
						<div class="text-center">
							<h2>2018年第一次月考</h2>
							<div class="col-sm-8 col-sm-offset-2">
								<hr>
								<div>
									<div class="col-sm-4 text-center exam-header-item">
										<p>本试卷共有</p>
										<p><strong>30</strong> 题目</p>
									</div>
									<div class="col-sm-4 text-center exam-header-item">
										<p>卷面总分</p>
										<p><strong>100</strong> 分</p>
									</div>
									<div class="col-sm-4 text-center exam-header-item">
										<p>答题时间</p>
										<p><strong>100</strong> 分钟</p>
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
							<h3>一、单选题</h3>
							<div id="singleContainer">
								
							</div>

							<h3>二、多选题</h3>
							<div id="multiContainer">
								
							</div>

							<h3>三、判断题</h3>
							<div id="judgeContainer">
								
								<div class="col-sm-12">
									<h3>1、(17年新增试题)吴某（聋哑人）涉嫌抢劫罪被逮捕，辩护律师孔某和翻译人员毛某到看守所要求会见，看守所查验了孔某的律师执业证书、律师事务所证明、委托书和毛某的身份证件后安排了会见，同时通知了办案部门。</h3>
									<div class="q-select-answer">
										<ul class="no-style">
											<li>
												<input type="radio" name="q1"> 正确
											</li>
											<li>
												<input type="radio" name="q1"> 错误
											</li>
										</ul>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		`);

		var $singleContainer = $paper.find('#singleContainer');
		var $multiContainer = $paper.find('#multiContainer');
		var $judgeContainer = $paper.find('#judgeContainer');

		var readOnlyTemplate_SingleSelect = `
			<div class="col-sm-12">
				<p class="q-name">{idx}、{testQuestionsName}</p>
				<div class="q-select-answer">
					<ul class="no-style q-select-items">
					</ul>
				</div>
			</div>
		`;

		var readOnlyTemplate_SingleSelectItem = `
			<li>
				{testQuestionSelectItem}
			</li>
		`;


		if (!!readonly) {
			$.each(result.list, function(idx) {
				var q = result.list[idx];

				switch(q.testQuestionType) {
					case "1":
						// 单选
						var $q = $(readOnlyTemplate_SingleSelect.format({
							idx: idx,
							testQuestionsName: q.testQuestionsName
						}));

						var options = q.testQuestionSelects.replace(/\&[^\&\;]*\;/g, '').split(';');
						$.each(options, function(_idx) {
							$q.append($(readOnlyTemplate_SingleSelectItem.format({
								testQuestionSelectItem: options[_idx]
							})));
						});

						$singleContainer.append($q);
						break;
					case "2":
						// 多选
						break;
					case "3":
						// 判断
						break;
				}
			});

			$this.append($paper);
		}

		else {

		}


		
	}
}));