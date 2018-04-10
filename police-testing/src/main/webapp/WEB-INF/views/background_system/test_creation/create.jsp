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
<script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/jquery.form.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/bootstrap-3.3.7-dist/css/bootstrap.min.css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/styles/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<!--  PAGINATION plugin -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/bs_pagination/jquery.bs_pagination.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/styles/bs_pagination/jquery.bs_pagination.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/styles/bs_pagination/localization/en.min.js"></script>

</head>
<script type="text/javascript">
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
</script>
<body>
<div id="demo_pag1"></div>
<form id="uploadForm" method="post">
	  <table>
			<!-- <tr>
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
			</tr> -->
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
	  	<c:forEach items="${list}" var="item">
		  	<tr>
		  		<td>
		  			
		  		</td>
		  		<td>
		  			${item.testPaperId }
		  		</td>
		  		<td>
		  			${item.testPaperName }
		  		</td>
		  		<td>
		  			${item.testPaperType }
		  		</td>
		  		<td>
		  			${item.creatorName }
		  		</td>
		  		<td>
		  			${item.createDate }
		  		</td>
		  		<td>
		  			${item.updateDate }
		  		</td>
		  		<td>
		  			${item.enable }
		  		</td>
		  	</tr>
	  	</c:forEach>
	  </table>
</form>	
</body>
</html>