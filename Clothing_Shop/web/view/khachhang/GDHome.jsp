<%-- 
    Document   : GDHome
    Created on : Nov 17, 2023, 11:05:35 AM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="<c:url value="/asset/css/style.css" />" type="text/css" rel="stylesheet">
<!--        <link href="../../asset/css/style.css" type="text/css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="icon" type="image/x-icon" href="./asset/favicon/icons8-shop-color-96.png">
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        <title>Shop Clothing</title>
    </head>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f4f4f4;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        max-width: 1200px;
        margin: 0 auto;
        margin-top: 100px;
    }

    .banner {
        margin: 10px;
        
    }

    .banner img {
        max-width: 100%;
        height: auto;
        border-radius: 5px;
    }
</style>
    <body>

        <jsp:include page="../components/Header.jsp" ></jsp:include>
        <div class="container">
            <div class="banner">
                    <img src="asset/img_product/banner.jpg" alt="banner img">
            </div>
            <div class="banner">
                    <img src="asset/img_product/banner-thoi-trang-con-nit.jpg" alt="banner img"/>
            </div>
            <div class="banner">
                    <img src="asset/img_product/banner-thoi-trang-men.jpg" alt="banner img"/>
            </div>
            <div class="banner">
                <img src="asset/img_product/banner-thoi-trang-nam-dep.jpg" alt="banner img"/>
            </div>
        </div>
                <jsp:include page="../components/Footer.jsp"/>

        </body>
    </html>
