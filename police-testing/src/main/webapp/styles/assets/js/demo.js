$(document).ready(function () {
	console.log('ready');

	window.gpsb = new PerfectScrollbar('.psb-here');
	// resize触发更新滚动条数据
	$(window).resize(function () {
		window.gpsb.update();
	});

	var lessonTreeData = [{
		text: "Parent 1",
		icon: "fa fa-folder-o",
		nodes: [{
			text: "Child 1",
			icon: "fa fa-folder-o",
			nodes: [{
				text: "Grandchild 1"
			}, {
				text: "Grandchild 2"
			}]
		}, {
			text: "Child 2"
		}]
	}, {
		text: "Node 1",
		dataId: "xxx_111", // 自定义参数，所有参数，在获取node的时候都可以取得
		icon: "fa fa-folder-o",
		color: "#00FF00",
		backColor: "#FF0000",
		href: "#node-1",
		selectable: true, // 当前节点不可选中，可展开
		state: {
			checked: true, // ???
			disabled: false, // 禁用节点，无法操作，不继续渲染内部
			expanded: true, // 是否已经展开
			selected: false // 是否已经选中
		},
		tags: ['available'], // ???
		nodes: [{
			text: "Parent 2"
		}]
	}, {
		text: "Parent 3"
	}, {
		text: "Parent 4"
	}, {
		text: "Parent 5"
	}];

	$('#lessonTree').treeview({
		data: lessonTreeData,
		collapseIcon: "fa fa-minus-square-o",
		expandIcon: "fa fa-plus-square-o",
		nodeIcon: "fa fa-file-o"
	});

	$('#lessonTree').on('nodeSelected', function (event, node) {
		console.log('select NODE:', node);
	});
});

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