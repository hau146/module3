<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<form action="discount" method="post">
  <label for="ProductDescription">Product Description</label>
  <input type="text" id="ProductDescription" name="ProductDescription">
  <label for="ListPrice">List Price</label>
  <input type="text" id="listPrice" name="listPrice">
  <label for="DiscountPercent">Discount Percent</label>
  <input type="text" id="discountPercent" name="discountPercent">
  <button type="submit">Calculate Discount</button>
</form>
</body>
</html>