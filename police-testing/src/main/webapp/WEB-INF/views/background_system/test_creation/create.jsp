<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title></title>
	<!-- jquery -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/jquery-3.3.1.min.js"></script>

	<!-- jquery.serializeJSON -->
	<script src="${pageContext.request.contextPath}/styles/vendors/jquery.serializeJSON/jquery.serializejson.min.js"></script>
	
	<!-- BS table -->
	<!-- 基础依赖 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap3/dist/css/bootstrap-theme.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/jquery/dist/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap3/dist/js/bootstrap.min.js"></script>

	<!-- bootstrap-table -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/bootstrap-table.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/bootstrap-table.min.js"></script>
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"></script>

	<!-- bootstrap-dialog -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/node_modules/bootstrap-dialog/dist/css/bootstrap-dialog.min.css">
	<script src="${pageContext.request.contextPath}/styles/node_modules/bootstrap-dialog/dist/js/bootstrap-dialog.min.js"></script>

	<!--  PAGINATION plugin -->
	<!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/bs_pagination/jquery.bs_pagination.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/styles/bs_pagination/jquery.bs_pagination.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/styles/bs_pagination/localization/en.min.js"></script> -->

	<!-- jquery -->
	<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/jquery.form.js"></script> -->

	<!-- bootstrap -->
	<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/bootstrap-3.3.7-dist/css/bootstrap.min.css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath}/styles/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> -->

	<!-- <script type="text/javascript">
		//查询上传
		function search_log(){
			var beginDate = "";
			var endDate = "";
			var uploadFileId = "";
			$.ajax({
				type: 'POST',
		        url: '${pageContext.request.contextPath}/allocation/save',
		        data : {
		        	beginDate : beginDate,
		        	endDate : endDate,
		        	uploadFileId : uploadFileId
		        },
		        dataType : 'json',
		        success: function(data){
		        	
		        } 
			})
		}
	</script> -->

</head>
<body>


	<!-- <div id="demo_pag1"></div>
	<form id="uploadForm" method="post">
		  <table>
				<tr>
					<td>
						试卷名称：<input id="testPaperName" name="testPaperName" type="text"/>				
					</td>
				</tr>
				<tr>
					<td>
						组题范围选择：
					</td>
					<td>
						按照上传数据时间组题：<input id="testCreateType" name="testCreateType" type="radio" value="1"/>
					</td>
					<td>
						选择上传文件记录组题：<input id="testCreateType" name="testCreateType" type="radio" value="2"/>	
					</td>
				</tr>
				<tr>
					<td>
						单选题个数：<input id="singleSelectCount" name="singleSelectCount" type="text" value="15"/>
					</td>
					<td>
						多选题个数：<input id="manySelectCount" name="manySelectCount" type="text" value="20"/>
					</td>
					<td>
						判断题个数：<input id="judgeCount" name="judgeCount" type="text" value="10"/>
					</td>
				</tr>
				<tr>
					<td>
						单选题分数：<input id="singleSelectScore" name="singleSelectScore" type="text" value="2"/>
					</td>
					<td>
						多选题个数：<input id="manySelectScore" name="manySelectScore" type="text" value="3"/>
					</td>
					<td>
						判断题个数：<input id="judgeScore" name="judgeScore" type="text" value="1"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						筛选：<input id="searchQuestion" name="searchQuestion" type="button" onclick="search_log();"/>
					</td>
				</tr>
		  </table>	

		  <table class="table table-striped">
		  	<tr>
		  		<td>
		  			序号
		  		</td>
		  		<td>
		  			试卷编号
		  		</td>
		  		<td>
					试卷名称		
		  		</td>
	  			<td>
	  				试卷类型
	  			</td>
	  			<td>
	  				创建人
	  			</td>
		  		<td>
					创建时间			
		  		</td>
		  		<td>
					更新时间			
		  		</td>
		  		<td>
					当前状态			
		  		</td>
		  	</tr>
		  </table>
	</form>	 -->

	
	<!-- 筛选 -->

	<div class="panel panel-default">
		<div class="panel-body">
			<div id="table_11_toolbar">
				<!-- <button id="table_11_add" class="btn btn-success">
					<i class="glyphicon glyphicon-plus"></i> 新增
				</button>
				<button id="table_11_edit" class="btn btn-warning" disabled>
					<i class="glyphicon glyphicon-edit"></i> 编辑
				</button>
				<button id="table_11_delete" class="btn btn-danger" disabled>
					<i class="glyphicon glyphicon-remove"></i> 删除
				</button>
				<button id="table_11_view" class="btn btn-primary" disabled>
					<i class="glyphicon glyphicon-eye-open"></i> 预览
				</button> -->
			</div>
			<table id="table_11"></table>

			<hr>

			<div id="selected"></div>
		</div>
	</div>	



</body>
<script type="text/javascript">
	$(document).ready(function(){
		var $table = $('#table_11');
		var selections = [];
		$table.bootstrapTable({
			url: '${pageContext.request.contextPath}/uploadLog/getList',
			method: 'GET',
			dataType: "json",
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

			singleSelect: false,		// 即使是checkbox，也只能选中一个

			// showToggle: true,			//是否显示 切换试图（table/card）按钮
			showColumns: true,		//是否显示 内容列下拉框
			showRefresh: true,
			toolbar: '#table_11_toolbar',	// 指定了toolbar的选择器，会把toolbar加入到table的container里来
			//buttonsToolbar				// 给toolbar外边再套一层，支持新建node

			pageNumber: 1,				//如果设置了分页，首页页码
			// showPaginationSwitch:true,		//是否显示 数据条数选择框
			pageSize: 20,				//如果设置了分页，页面数据条数
			pageList: [3, 5, 10, 20, 50],	//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。数据不够，不显示
			paginationPreText: '‹',		//指定分页条中上一页按钮的图标或文字,这里是<
			paginationNextText: '›',	//指定分页条中下一页按钮的图标或文字,这里是>
			// singleSelect: false,		//设置True 将禁止多选
			search: true,				//显示搜索框
			data_local: "zh-US",		//表格汉化
			sidePagination: "server",	//服务端处理分页
			queryParams: function (params) {
				//自定义参数，这里的参数是传给后台的，我这是是分页用的
				console.log('params:', params);
				return {
					//这里的params是table提供的
					offset: params.offset,		//从数据库第几条记录开始
					limit: params.limit,		//找多少条
					search: params.search		//筛选
				};
			},
			idField: "uploadFileId",			//指定主键列
			columns: [
				{
					field: 'state',
					checkbox: true,
					rowspan: 1,
					align: 'center',
					valign: 'middle'
				},
				{
					title: 'ID',		// id
					field: 'uploadFileId',
					align: 'center',
					visible: false
				},
				{
					title: '文件名称',			//表的列名
					field: 'fileName',	//json数据中rows数组中的属性名
					align: 'center'		//水平居中
				},
				{
					//EMAIL
					title: '创建时间',
					field: 'createDate',
					align: 'center'
				},
				{
					//部门名字
					title: '创建人',
					field: 'creatorName',		//可以直接取到属性里面的属性，赞
					align: 'center'
				}
			]
		});

		// 获取选中的ids
		function getIdSelections() {
			return $.map($table.bootstrapTable('getSelections'), function (row) {
				return row.uploadFileId
			});
		}
		// 获取选中的行
		function getIdSelectionsRows() {
			return $.map($table.bootstrapTable('getSelections'), function (row) {
				return row
			});
		}
		// 每次勾选更新已选中内容，更新按钮
		$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
			// save your data, here just save the current page
			selections = getIdSelections();
			console.log('selections:', selections);
			// push or splice the selections if you want to save all data selections

			$btn_delete.prop('disabled', !selections.length);
			$btn_edit.prop('disabled', selections.length !== 1);
			$btn_view.prop('disabled', selections.length !== 1);
		});
		
		/*// 异步加载数据
		$.ajax({
			url: '${pageContext.request.contextPath}/styles/fb_data/makePaper_form.json',
			success: function(d) {
				window.caseFormConf = d;
			}
		});*/
	});
</script>
</html>