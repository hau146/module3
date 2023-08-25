<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 25/08/2023
  Time: 4:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="discount-servlet" method="post">
    <label for="ProductDescription">Product Description</label>
    <input type="text" id="ProductDescription" name="ProductDescription">
    <label for="ListPrice">List Price</label>
    <input type="text" id="ListPrice" name="ListPrice">
    <label for="DiscountPercent">Discount Percent</label>
    <input type="text" id="DiscountPercent" name="DiscountPercent">
    <button type="submit">Calculate Discount</button>
</form>
</body>
</html>
