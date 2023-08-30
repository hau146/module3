<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 30/08/2023
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1><p><a href="user">Trang chủ</a></p></h1>
<form method="post" action="user?action=update">
    <fieldset>
        <legend>update user</legend>
        <label>ID : </label>
        <input type="number" name="id" value="${user.id}" readonly><br>
        <label>Tên user : </label>
        <input type="text" name="name"  value="${user.name}"><br>
        <label>Email : </label>
        <input type="email" name="email"  value="${user.email}"><br>
        <label>Quốc Gia : </label>
        <input type="text" name="country" value="${user.country}"><br>
        <input type="submit" value="Sửa User">
    </fieldset>
</form>
</body>
</html>
