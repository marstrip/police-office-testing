$(document).ready(function() {
	console.log('ready');

	new PerfectScrollbar('html');
});

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
			o[this.name] = this.value || '';
		}
	});
	return o;
}

function go_index() {
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

function login(btn) {
	var $form = $(btn).closest('form');
	var data = $form.serializeJson();
	console.log(data);
	if (data.policeId == '123456' && data.pwd == '123456') {
		go_index();
	} else {
		alert('登陆失败！');
	}
}