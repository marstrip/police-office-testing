$(document).ready(function () {
	console.log('ready');

	// 滚动条初始化
	window.gpsb = new PerfectScrollbar('.psb-here');
	// 底部初始化
	resetFooter();

	// resize触发更新滚动条数据、更新滚动条位置
	$(window).resize(function () {
		resetFooter();

		window.gpsb.update();
	});
});

// 当footer不在最底部，放在最底部，否则干掉
function resetFooter() {
	$('.footer').removeClass('to-bottom');
	if ($('.footer').offset().top < ($(window).height() - 99)) {
		$('.footer').addClass('to-bottom');
	} else {
		$('.footer').removeClass('to-bottom');
	}
}

//序列化表格元素为JSON  
$.fn.serializeJson = function () {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function () {
		if (o[this.name] !== undefined) {
			if (o[this.name] == null || !o[this.name].push) {
				o[this.name] = [o[this.name]];
			}
			o[this.name].push(this.value || null);
		} else {
			o[this.name] = this.value || '';
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

// 从url获取参数
function getUrlParam(name) {  
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象  
	var r = window.location.search.substr(1).match(reg);  //匹配目标参数  
	if (r != null) {
		return unescape(r[2]);  //返回参数值 
	} else {
		return null; 
	}
}

function go_index() {
	var passwd1 = document.getElementByName("pwd").value;
	var passwd2 = document.getElementByName("pwd_again").value;
	if (passwd1 != passwd2) {
		alert("密码不一致，请重新输入");
		return false;
	}
	location.href = 'demo-index.html';

}

function go_forum() {
	location.href = 'demo-forum.html';
}

function go_exam() {
	location.href = 'demo-exam.html';
}

function go_examList() {
	location.href = 'demo-exam-list.html';
}

function go_result() {
	location.href = 'demo-exam-result.html';
}

function go_wrongList() {
	location.href = 'demo-extra-fail-list.html';
}

function go_login() {
	location.href = 'demo-login.html';
}

function go_personalConfig() {
	location.href = 'demo-change-pwd.html'
}

// function login(btn) {
// 	var $form = $(btn).closest('form');
// 	var data = $form.serializeJson();
// 	console.log(data);
// 	if (data.policeId == '123456' && data.pwd == '123456') {
// 		go_index();
// 	} else {
// 		alert('登陆失败！');
// 	}
// }