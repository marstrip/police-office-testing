<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<title>课件超市</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/jquery.perfect-scrollbar-1.3.0/css/perfect-scrollbar.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/assets/css/demo-all.css">

	<script src="${pageContext.request.contextPath}/styles/vendors/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/vendors/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/vendors/jquery.perfect-scrollbar-1.3.0/dist/perfect-scrollbar.min.js"></script>

	<!-- bootstrap-table -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/bootstrap-table.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/bootstrap-table.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"></script>
	
	<!-- bootstrap-dialog -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap-dialog/dist/css/bootstrap-dialog.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-dialog/dist/js/bootstrap-dialog.min.js"></script>
	
	<!-- bootstrap-treeview -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/vendors/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.css">
	<script src="${pageContext.request.contextPath}/styles/vendors/bootstrap-treeview-1.2.0/dist/bootstrap-treeview.min.js"></script>

	<script src="${pageContext.request.contextPath}/styles/assets/js/demo.js"></script>
	
	<style>
		.list-group-item {
			border-radius: 0px;
			border-top-right-radius: 0px!important;
    		border-top-left-radius: 0px!important;
			border-bottom-right-radius: 0px!important;
    		border-bottom-left-radius: 0px!important;
		}
		.list-group-item:first-child {
    		border-top-width: 0px;
		}
		.list-group-item + .list-group-item {
			border-radius: 0px;
			border-top-right-radius: 0px!important;
    		border-top-left-radius: 0px!important;
			border-bottom-right-radius: 0px!important;
    		border-bottom-left-radius: 0px!important;
    		border-bottom-width: 0px;
		}
	</style>
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
					<div class="mastbody">
						<ol class="breadcrumb">
	                        <li>
	                            <a href="${pageContext.request.contextPath}/login/frontendIndex">首页</a>
	                        </li>
	                        <li>
	                            课件超市
	                        </li>
	                    </ol>

						<div class="left-area-quicklink">
							<div class="panel panel-white">
								<div class="panel-heading">
									<h3 class="panel-title">
										快速导航
									</h3>
								</div>
								<div class="panel-body" style="padding: 0;">
									<div class="tree" id="lessonTree">
										https://www.npmjs.com/package/bootstrap-treeview
									</div>
								</div>
							</div>
						</div>

						<div class="right-area">
							<div class="panel panel-white">
								<div class="panel-heading">
									<h3 class="panel-title">
										课件列表
									</h3>
								</div>
								<div class="panel-body">
									<div class="notice-list">
										<table id="table_11"></table>
									</div><!-- end of .notice-list -->
								</div>
							</div>
						</div>

						<br>	
					</div>
				</div>

				<footer class="footer">
					<div class="row">
						<ul class="text-center no-style">
							<li>
								<span>北京市公安局东城分局</span>
							</li>
							<li>
								<span>建议使用Chrome浏览器 &nbsp; 推荐分辨率：1366&times;768</span>
							</li>
						</ul>
					</div>
				</footer>

			</div>
		</div>
		
	</div>
	<script>
		var $table = $('#table_11');
		var testSelfLevel = '';
		var testSelfType = '';
		var onlyUnselect = true;
		$(document).ready(function() {

			var lessonTreeData = [{
				text: "执法资格等级考试",
				icon: "fa fa-folder-o",
				selectable: false, // 当前节点不可选中，可展开
				nodes: [{
					text: "基本级",
					testSelfLevel: '基本级',
					testSelfType: '执法资格等级考试',
					href: '#'
				}, {
					text: "中级",
					testSelfLevel: '中级',
					testSelfType: '执法资格等级考试',
					href: '#'
				}, {
					text: "高级",
					testSelfLevel: '高级',
					testSelfType: '执法资格等级考试',
					href: '#'
				}]
			}, {
				text: "法律法规",
				testSelfLevel: '',
				testSelfType: '法律法规',
				href: "#"
			}, {
				text: "党的建设",
				testSelfLevel: '',
				testSelfType: '党的建设',
				href: "#"
			}, {
				text: "办案指引",
				testSelfLevel: '',
				testSelfType: '办案指引',
				href: "#"
			}];

			$('#lessonTree').treeview({
				data: lessonTreeData,
				collapseIcon: "fa fa-minus-square-o",
				expandIcon: "fa fa-plus-square-o",
				nodeIcon: "fa fa-file-o"
			});

			$('#lessonTree').on('nodeSelected', function (event, node) {
				console.log('select NODE:', node);
				testSelfLevel = node.testSelfLevel;
				testSelfType = node.testSelfType;

				// 更新右边列表
				$table.bootstrapTable('refresh', {silent: false});
				onlyUnselect = false;
			});


			$('#lessonTree').on('nodeUnselected', function (event, node) {
				console.log('Unselect NODE:', node);
				testSelfLevel = '';
				testSelfType = '';

				onlyUnselect = true;
				setTimeout(function() {
					if (onlyUnselect) {
						// 更新右边列表
						$table.bootstrapTable('refresh', {silent: false});
					}
				}, 200);
			});
		});

		$table.bootstrapTable({
			url: '${pageContext.request.contextPath}/testSelf/getList',
			method: 'GET',
			dataType: "JSON",
			striped: true,				//设置为 true 会有隔行变色效果  
			undefinedText: "空",		//当数据为 undefined 时显示的字符  
			pagination: true,			//分页  
			// paginationLoop:true,		//设置为 true 启用分页条无限循环的功能。
			icons: {
				paginationSwitchDown: 'glyphicon-collapse-down icon-chevron-down',
				paginationSwitchUp: 'glyphicon-collapse-up icon-chevron-up',
				refresh: 'glyphicon-refresh icon-refresh',
				toggle: 'glyphicon-list-alt icon-list-alt',
				columns: 'glyphicon-th icon-th',
				detailOpen: 'glyphicon-plus icon-plus',
				detailClose: 'glyphicon-minus icon-minus'
			},

			pageNumber: 1,				//如果设置了分页，首页页码
			// showPaginationSwitch:true,		//是否显示 数据条数选择框
			pageSize: 20,				//如果设置了分页，页面数据条数
			pageList: [3, 5, 10, 20, 50],	//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。数据不够，不显示
			paginationPreText: '‹',		//指定分页条中上一页按钮的图标或文字,这里是<
			paginationNextText: '›',	//指定分页条中下一页按钮的图标或文字,这里是>
			// singleSelect: false,		//设置True 将禁止多选
			data_local: "zh-US",		//表格汉化
			sidePagination: "server",	//服务端处理分页
			queryParams: function (params) {
				//自定义参数，这里的参数是传给后台的，我这是是分页用的
				console.log('params:', params);
				return {
					//这里的params是table提供的
					offset: params.offset,		//从数据库第几条记录开始
					limit: params.limit,		//找多少条
					search: params.search,		//筛选
					testSelfLevel: testSelfLevel,
					testSelfType: testSelfType
				};
			},
			idField: "testSelfId",			//指定主键列
			columns: [
				{
					title: '课件名称',		//表的列名
					field: 'testSelfName',	//json数据中rows数组中的属性名
					align: 'center',		//水平居中
					formatter: function (value, row, index) {//自定义显示，这三个参数分别是：value该行的属性，row该行记录，index该行下标
						return '<a href="${pageContext.request.contextPath}/infrontend/commonDetailJsp?switchPage=testSelf&id=' + row.testSelfId + '">' + row.testSelfName + '</a>';
					}
				},
				{
					title: 'testSelfId',
					field: 'testSelfId',
					align: 'center',
					visible: false
				},
				{
					title: '创建时间',
					field: 'createDate',
					align: 'center'
				}
			]
		});

		// 加载数据成功
		$table.on('load-success.bs.table', function() {
			// 重置footer，更新gpsb高度
			resetFooter();
			window.gpsb.update();
		});
	</script>
</body>
</html>