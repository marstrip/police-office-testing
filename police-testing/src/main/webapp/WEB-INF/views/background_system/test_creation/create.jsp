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


	<script type="text/javascript">
		$(document).ready(function(){

		});
	</script>

</body>
</html>