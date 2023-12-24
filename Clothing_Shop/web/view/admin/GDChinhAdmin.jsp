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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/asset/css/style.css" />" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="icon" type="image/x-icon" href="./asset/favicon/icons8-shop-color-96.png">
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        <title>JSP Page</title>

    </head>
    <style>
        .container {
            padding-top: 15vh;

        }
    </style>
    <body>
        <div class="container">
            <h1>Trang Admin!</h1>
            <h3>Hello, ${sessionScope.account.username}</h3>
            <h3>Thong ke san pham ban chay se o day</h3>
            
            <br>
            <hr><!-- comment -->
            <h3><a href="qluser">Quan Ly User</a></h3>
            <h3><a href="qlbrand">Quan Ly Category</a></h3>
            <h3><a href="qlcategory">Quan ly Brand</a></h3>
            <h3><a href="qlsp" >Quan ly san pham</a></h3>
            <h3><a href="qlorder">Quan ly Don Hang</h3>
        </div>

    </body>
</html>
