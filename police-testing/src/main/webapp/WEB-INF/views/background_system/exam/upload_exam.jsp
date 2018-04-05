<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/jquery.form.js"></script>

</head>
<script type="text/javascript">
//上传试题文件
	function upload_file(){
		//得到上传文件的全路径
		var fileName = $("#uploadFile").val();
		//进行基本校验
		if (fileName == "") {
			alert("请上传文件!");
		} else {
			//对文件格式进行校验
			var d1 = /\.[^\.]+$/.exec(fileName);
			if (d1 == ".doc") {
				var value = $("#uploadForm").val();
	            var option = {
	        		   url:'${pageContext.request.contextPath}/testPaper/uploadTestPaper',//用于文件上传的服务器端请求地址
		               type : 'POST',
		               dataType : 'json',
		               headers : {"ClientCallMode" : "ajax"}, //添加请求头部
		               success : function(data) {
		            	    
		               },
		               error: function(data) {
		               }
		            };
               $("#uploadForm").ajaxSubmit(option);
               return false; //最好返回false，因为如果按钮类型是submit,则表单自己又会提交一次;返回false阻止表单再次提交
			}else {
				alert("清上传文件后缀为.doc的word文件！");
			}
		}
	}
</script>
<body>
<form id="uploadForm" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>
				试卷名称：
				<input id="testPaperName" name="testPaperName" type="text"/>
			</td>
			<td>
				试卷类型：
				<select id="testPaperType" name="testPaperType" >
					<option value="0">==请选择==</option>
					<option value="1">党政建设</option>
					<option value="2">普通考试</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				上传试题：<input id="uploadFile" name="uploadFile" type="file">
				 <a href="javascript:void(0);"  onclick="upload_file();">上传</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>