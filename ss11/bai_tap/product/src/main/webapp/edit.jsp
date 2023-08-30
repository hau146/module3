<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 29/08/2023
  Time: 9:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Sửa sản phẩm</h1>
<p>
    <c:if test='${requestScope["tin nhắn"]} != null'>
        <span class="message">${requestScope["tin nhắn"]}</span>
    </c:if>
</p>
<p><a href="product">Trang chủ</a></p>
<form method="post" action="product?action=edit">
    <fieldset>
        <legend>product information</legend>
        <input type="hidden" name="id" id="id" value="${requestScope["product"].getId()}"><br>
        <label for="name">Tên sản phẩm : </label>
        <input type="text" name="name" id="name" value="${requestScope["product"].getName()}"><br>
        <label for="price">Giá sản phẩm : </label>
        <input type="number" name="price" id="price" value=""${requestScope["product"].getPrice()}><br>
        <label for="describe">Mô tả sản phẩm : </label>
        <input type="text" name="describe" id="describe" value=""${requestScope["product"].getDescribe()}><br>
        <label for="producer">Nhà sản xuất : </label>
        <input type="text" name="producer" id="producer" value=""${requestScope["product"].getProducer()}>
        <input type="submit" value="Sửa sản phẩm">
    </fieldset>
</form>

</body>
</html>
