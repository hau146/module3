<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 29/08/2023
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="product">Trang chủ</a>
<fieldset>
    <legend>Thêm sản phẩm</legend>
    <form action="product?action=create" method="post">
        <label for="name">Tên sản phẩm</label>
        <input type="text" id="name" name="name"><br>
        <label for="price">Giá sản phẩm</label>
        <input type="number" id="price" name="price"><br>
        <label for="describe">Mô tả sản phẩm</label>
        <input type="text" id="describe" name="describe"><br>
        <label for="producer">Nhà sản xuất</label>
        <input type="text" id="producer" name="producer"><br>
        <button type="submit">Thêm sản phẩm</button>
    </form>
</fieldset>
</body>
</html>
