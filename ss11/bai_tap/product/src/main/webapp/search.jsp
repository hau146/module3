<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 30/08/2023
  Time: 11:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách sản phẩm</h1>
<a href="product">Quay lại trang chủ</a>
<br><br>
<form action="product?action=search" method="post">
    <input type="text" name="name" id="name" placeholder="Nhập tên sản phẩm...">
    <button type="submit">Search</button>
</form>

<table border="1px" style="padding: 12px; border-collapse: collapse">
    <thead>
    <tr>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Nhà sản xuất</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${list}" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${product.name}"/></td>
            <td><c:out value="${product.price}"/></td>
            <td><c:out value="${product.describe}"/></td>
            <td><c:out value="${product.producer}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
