<%-- 
    Document   : GDThankYou
    Created on : Nov 20, 2023, 11:37:23 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./asset/css/style.css">
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
        <jsp:include page="../components/Header.jsp" ></jsp:include>
        <div class="container">
            <h4>Đặt Hàng Thành Công</h4>
            <a href="/Clothing_Shop">Tiếp tục mua sắm</a>
        </div> 

    </body>
</html>
