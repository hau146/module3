<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 28/08/2023
  Time: 1:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    img{
        width: 100px;
        height: 100px;
    }
</style>
<body>
<h1>Danh sách khách hàng</h1>
<table border="1px">
    <thead>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa Chỉ</th>
        <th>Ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="c" items="${list}" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${c.name}"/></td>
            <td><c:out value="${c.birthDay}"/></td>
            <td><c:out value="${c.address}"/></td>
            <td><img src="${c.img}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
