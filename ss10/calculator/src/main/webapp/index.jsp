<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Simple Calculator" %>
</h1>
<br>
<form action="calculator" method="post">
    <p>First operand: </p>
    <input type="number" id="firstOperand" name="firstOperand"> <br>
    <p>Operator</p>
    <select name="operator">
        <option value="+">addtion</option>
        <option value="-">subtraction</option>
        <option value="*">multiplication</option>
        <option value="/">division</option>
    </select> <br>
    <p>Second operand: </p>
    <input type="number" id="secondOperand" name="secondOperand"> <br>
    <button type="submit">Calculate</button>
</form>
</body>
</html>