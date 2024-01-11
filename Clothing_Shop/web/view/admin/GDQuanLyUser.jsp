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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="<c:url value="/asset/css/style.css" />" type="text/css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <link rel="icon" type="image/x-icon" href="./asset/favicon/icons8-shop-color-96.png">
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        <title>Users</title>
        <script type="text/javascript">
            function doDelete(username) {
                if (confirm("Are you sure to delete with user_id = " + username)) {
                    window.location = "qluser?action=delete&username=" + username;
                }
            }
        </script>
    </head>
    <body>

        <jsp:include page="../components/NavbarAdmin.jsp" ></jsp:include>
            <div class="container mt-5">

                <h1 class="text-center m-4">Danh sách người dùng</h1>

                <div class="d-flex justify-content-between my-4">
                    <button class="normal"><a style="text-decoration: none;color: #fff"  href="admin">Trang chủ</a></button>
                    <button class="normal"><a style="text-decoration: none;color: #fff"  href="qluser?action=add">Create User</a></button>
                </div>
                <table class="table align-middle my-5">
                    <thead class="table-dark align-middle">

                    <th>User ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Full Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Is Admin</th>
                    <th>Action</th>

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
                                <div>
                                    <button class="btn btn-primary">
                                        <a style="text-decoration: none;color: #fff" href="qluser?action=update&user_id=${user.user_id}">Update</a>
                                    </button>
                                    <button class="btn btn-warning">
                                        <a style="text-decoration: none;color: #fff" href="#" onclick="doDelete('${user.username}')" ">Delete</a>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>

    </body>
</html>
