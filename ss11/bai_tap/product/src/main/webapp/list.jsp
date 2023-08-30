<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 29/08/2023
  Time: 12:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="product?action=showFormCreate">Thêm sản phẩm</a> <br>
<a href="product?action=showFormSearch&name=${product.name}">Tìm kiếm sản phẩm</a> <br>
<br><br>
<table border="1px" style="padding: 12px; border-collapse: collapse">
    <thead>
    <tr>
        <th>STT</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Nhà sản xuất</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productList}" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${product.name}"/></td>
            <td><c:out value="${product.price}"/></td>
            <td><c:out value="${product.describe}"/></td>
            <td><c:out value="${product.producer}"/></td>
            <td><a href="product?action=showFormEdit&id=${product.id}">sửa</a></td>
            <td><a href="product?action=showFormDelete&id=${product.id}">Xóa</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
