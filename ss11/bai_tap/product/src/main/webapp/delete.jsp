<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 30/08/2023
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Quay lại trang chủ</h1>
<form action="product?action=delete&id=${product.getId()}" method="post">
    <fieldset>
        <legend>product information</legend>
        <label>Tên sản phẩm : </label>
        <label>${requestScope["product"].getName()}</label><br>
        <label>Giá sản phẩm : </label>
        <label>${requestScope["product"].getPrice()}</label><br>
        <label>Mô tả sản phẩm : </label>
        <label>${requestScope["product"].getDescribe()}</label><br>
        <label>Nhà sản xuất : </label>
        <label>${requestScope["product"].getProducer()}</label><br>
        <input type="submit" value="Xóa sản phẩm">
    </fieldset>
</form>
</body>
</html>
