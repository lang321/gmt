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