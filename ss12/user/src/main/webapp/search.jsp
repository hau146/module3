<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 30/08/2023
  Time: 8:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách user</h1>
<a href="user">Quay lại trang chủ</a>
table border="1px" style="padding: 12px; border-collapse: collapse">
<thead>
<tr>
    <th>STT</th>
    <th>Tên user</th>
    <th>Email</th>
    <th>Quốc gia</th>
</tr>
</thead>
<tbody>
<c:forEach var="user" items="${userList}" varStatus="loop">
    <tr>
        <td><c:out value="${loop.count}"/></td>
        <td><c:out value="${user.name}"/></td>
        <td><c:out value="${user.email}"/></td>
        <td><c:out value="${user.country}"/></td>
    </tr>
</c:forEach>
</tbody>
</table>
</body>
</html>
