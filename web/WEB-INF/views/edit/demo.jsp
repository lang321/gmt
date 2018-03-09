<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>KindEditor JSP</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/kindeditor-master/themes/default/default.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/kindeditor-master/plugins/code/prettify.css" />


	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script charset="utf-8" src="${pageContext.request.contextPath}/resource/kindeditor-master/kindeditor-all.js"></script>
	<script charset="utf-8" src="${pageContext.request.contextPath}/resource/kindeditor-master/lang/zh-CN.js"></script>
	<script charset="utf-8" src="${pageContext.request.contextPath}/resource/kindeditor-master/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '${pageContext.request.contextPath}/resource/kindeditor-master/plugins/code/prettify.css',
				uploadJson : '${pageContext.request.contextPath}/edit/fileUpload',
				fileManagerJson : '${pageContext.request.contextPath}/edit/fileManager',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
            editor1.html('<p>\n' +
                '\t<img src="/images/image/20180309/20180309185054_144.png" />发生发顺丰\n' +
                '</p>\n' +
                '<p>\n' +
                '\t法法师\n' +
                '</p>');
		});
	</script>
</head>
<body>
	<%=htmlData%>
	<form name="example" method="post" action="${pageContext.request.contextPath}/edit/upload">
		<textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
		<br />
		<input type="submit" name="button" value="提交内容" /> (提交快捷键: Ctrl + Enter)
	</form>
	<script>
//		$(function(){
//		    $("body.ke-content").append($("<img src=\"/gmt/images/image/20180309/20180309200113_432.png\" alt=\"\" /><br />"));
//		})
	</script>
</body>
</html>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>