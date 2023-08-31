<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 30/08/2023
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
        button a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<button class="btn btn-secondary"><a href="user?action=showFormCreate" style="color: black">Thêm user</a></button>
<form action="user?action=search" method="post">
    <input type="text" name="name" id="name" placeholder="Nhập quốc gia user...">
    <button class="btn btn-secondary" type="submit">Search</button>
</form>
<button class="btn btn-secondary"><a href="user?action=showFormSortUp" style="color: black">Sắp xếp tăng</a></button>
<button class="btn btn-secondary"><a href="user?action=showFormSortDown" style="color: black">Sắp xếp giảm</a></button>
<button class="btn btn-secondary"><a href="user" style="color: black">Quay lại ban đầu</a></button>
<br><br>
<table class="table table-hover">
    <thead>
    <tr>
        <th>STT</th>
        <th>Tên user</th>
        <th>Email</th>
        <th>Quốc gia</th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${userList}" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${user.name}"/></td>
            <td><c:out value="${user.email}"/></td>
            <td><c:out value="${user.country}"/></td>
            <td>
                <button type="submit" class="btn btn-primary text-dark"><a href="user?action=showFormUpdate&id=${user.id}" style="color: black">sửa</a></button>
                <button type="submit" class="btn btn-primary text-dark" data-bs-toggle="modal"
                        data-bs-target="#exampleModal" onclick="sendInfoToModal('${user.id}','${user.name}')">
                    xóa
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<%--modal--%>
<div class="modal" tabindex="-1" id="exampleModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="user?action=delete" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Xóa user</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="id_delete" name="id_delete">
                    Bạn có chắc muốn xóa <span id="name_delete" class="text-danger"></span> ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
    function sendInfoToModal(id,name){
        document.getElementById("name_delete").innerText = name;
        document.getElementById("id_delete").value = id;
    }
</script>

</body>
</html>
