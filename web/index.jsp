<%--
  Created by IntelliJ IDEA.
  User: zhuxiang
  Date: 2018/3/7
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>素材交易平台</title>


    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  </head>
  <body>
    <form action="${pageContext.request.contextPath}/user/login" method="post">
      <label>username：</label><input type="text" name="username" /><br>
      <label>password：</label><input type="password" name="password"><br>
      <input type="submit" value="登录">
    </form>

    <script>
      $.ajax({
          url:'${pageContext.request.contextPath}/user/index',
          type: 'post',
          async: true,
          success: function (result) {
              console.log(result['password'])
              console.log(result.id)
          },
          error: function () {
              alert('error')
          }
      })
    </script>
  </body>
</html>
