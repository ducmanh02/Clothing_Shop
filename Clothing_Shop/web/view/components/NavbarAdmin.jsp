<%-- 
    Document   : GDChinhAdmin
    Created on : Nov 15, 2023, 4:24:59 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Admin Page</title>

    </head>
    <style>
        .container {
            padding: 20px;

        }
    </style>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">DashBoard</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="admin">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="qluser">Quản Lý User</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="qlsp">Quản Lý Sản phẩm</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="qlcategory">Quản Lý Category</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="qlbrand">Quản Lý Brand</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="qlorder?action=showAll">Quản Lý Đơn hàng</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="qlfeedback?action=showAll">Quản Lý FeedBack</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" aria-disabled="true">Hello, ${sessionScope.account.username}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="user?action=logout">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>       
    </body>
</html>
