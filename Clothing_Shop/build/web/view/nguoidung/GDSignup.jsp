<%-- 
    Document   : GDSignup
    Created on : Nov 17, 2023, 10:28:19 AM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/login.css" />" type="text/css" rel="stylesheet"><!-- comment -->

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
    </head>
    <style>
        .container{
            padding-top: 15vh;
        }
    </style>
    <body>
        <jsp:include page="../components/Header.jsp" ></jsp:include>



        <div class="container d-flex justify-content-center ">

            <form class="boxForm w-50 " action="user?action=signup" method="post">
                <h1 class="text-center p-3">Sign Up</h1>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="username" name="username">
                    <label for="floatingInput">Username:</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control mt-3" id="floatingPassword" placeholder="Password" name="password_repeat">
                    <label for="floatingPassword">Repeat Password</label>
                </div>
                <span style="color: red">${requestScope.error}</span>
                <div class="mt-3 text-center">
                    <button class="normal ">Sign Up</button>
                </div>

                <a href="user?action=login">Đã có tài khoản</a>

            </form>



        </div>
        <jsp:include page="../components/Footer.jsp"/>     
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</html>
