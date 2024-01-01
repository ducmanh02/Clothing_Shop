<%-- 
    Document   : GDQuanLyUser
    Created on : Dec 24, 2023, 5:22:22 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/gdquanlyadmin.css" />" type="text/css" rel="stylesheet">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function doDelete(username) {
                if (confirm("Are you sure to delete with user_id = " + username)) {
                    window.location = "qluser?action=delete&username=" + username;
                }
            }
        </script>
    </head>
    <body>
        <h1>Trang Quản Lý User</h1>
        <h2>Danh sách người dùng</h2>
        <div class="container">
            <a href="admin">Trang chủ</a>
            <a href="qluser?action=add">Create User</a>
        
        <table>
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Username</th>

                    <th>Email</th>
                    <th>Full Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Is Admin</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>

                <c:forEach var="user" items="${listUsers}">

                    <tr>
                        <td>${user.user_id}</td>
                        <td>${user.username}</td>

                        <td>${user.email}</td>
                        <td>${user.full_name}</td>
                        <td>${user.address}</td>
                        <td>${user.phone}</td>
                        <td>${user.is_admin}</td>
                        <td>
                            <a href="#" onclick="doDelete('${user.username}')" ">Delete</a>
                            <a href="qluser?action=update&user_id=${user.user_id}">Update</a>
                        </td>
                    </tr>
                </c:forEach>
            
        </tbody>
    </table>
        </div>
       
</body>
</html>
