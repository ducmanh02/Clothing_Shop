<%-- 
    Document   : GDThankYou
    Created on : Nov 20, 2023, 11:37:23 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/thanhcong.css" />" type="text/css" rel="stylesheet"><!-- comment -->
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
        .container {
            padding-top: 15vh;

        }
    </style>
    <body>
        <jsp:include page="../components/Header.jsp" ></jsp:include>
        <div class="container d-flex justify-content-center ">
            <div class="text-center">
            <h3 class="mb-5">Đặt Hàng Thành Công</h3>
            <button class="normal mr-5"><a href="dathang?action=showAll" style="text-decoration: none;color:#fff">Danh sách đơn hàng</a></button>
            <button class="normal mr-5"><a href="/Clothing_Shop/home" style="text-decoration: none;color:#fff">Tiếp tục mua sắm</a></button>
            </div>
        </div> 
        <jsp:include page="../components/Footer.jsp"/> 
    </body>
</html>
