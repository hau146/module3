<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 30/08/2023
  Time: 2:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="user">Quay lại trang chủ</a>
<fieldset>
  <legend>Thêm user</legend>
  <form action="user?action=create" method="post">
    <label for="name">Tên user</label>
    <input type="text" id="name" name="name"><br>
    <label for="email">Email</label>
    <input type="text" id="email" name="email"><br>
    <label for="country">Quốc gia</label>
    <input type="text" id="country" name="country"><br>
    <button type="submit">Thêm user</button>
  </form>
</fieldset>
</body>
</html>
