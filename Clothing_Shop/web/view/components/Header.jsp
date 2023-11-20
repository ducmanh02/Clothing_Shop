<%-- 
    Document   : Header
    Created on : Nov 15, 2023, 4:24:35 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href='<c:url value="${pageContext.request.contextPath}/asset/css/style.css" />'/>
        <link rel="stylesheet" href="./asset/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="icon" type="image/x-icon" href="./asset/favicon/icons8-shop-color-96.png">
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        <title>JSP Page</title>
    </head>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: "Poppins";
            box-sizing: border-box;
        }

        .header {
            height: 10vh;
            background-color: #fff;
            -webkit-box-shadow: 8px 8px 24px -11px rgba(66, 68, 90, 1);
            -moz-box-shadow: 8px 8px 24px -11px rgba(66, 68, 90, 1);
            box-shadow: 8px 8px 24px -11px rgba(66, 68, 90, 1);
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 50px;
            position: fixed;
            
        }
        .header .logo i {
            font-size: 38px;
        }
        .header .menu {
            display: flex;
            gap: 40px;
        }
        .header .menu .item a {
            text-decoration: none;
            font-size: 18px;
            color: black;
            font-weight: 600;
            text-transform: uppercase;
        }
        .header .menu .item a:hover {
            color: #ca1515;
        }

        .header .button {
            display: flex;
            gap: 30px;
            font-size: 18px;
            justify-content:center ;
            align-items: center;
        }

        .header .button i {
            text-align: center;
            font-size: 20px;
        }

        .header .button .user{
            display: flex;
            gap: 20px;
        }
        .header .button .user .item{
            border: 2px solid #ca1515;
            padding: 5px;
        }
        .header .button .user .item:hover{
            background-color: #ca1515;

        }
        .header .button .user .item a:hover{
            color: #fff
        }
        .header .button .user .item a{
            text-decoration: none;
            color: black;
        }
        .header .button .search  a{
            text-decoration: none;
            color: black;

        }
        



        .main {
            height: 1000px;
            background-color: #f1a9a9;
            padding: 0 150px;
        }
        .main .product{

            height: 800px;
            background-color: #fff;
        }

        .footer {
            height: 15vh;
            -webkit-box-shadow: 8px -10px 24px -11px rgba(66, 68, 90, 1);
            -moz-box-shadow: 8px -10px 24px -11px rgba(66, 68, 90, 1);
            box-shadow: 8px -10px 24px -11px rgba(66, 68, 90, 1);
        }

    </style>
    <body>
        <div class="header">
            <div class="logo">
                <i class="fa-solid fa-shop"></i>
            </div>
            <div class="menu">
                <div class="item"><a href="/Clothing_Shop">Home</a></div>
                <div class="item"><a href="#">Men's</a></div>
                <div class="item"><a href="#">Woman's</a></div>
                <div class="item"><a href="#">Category</a></div>
                <div class="item"><a href="chinhsp">Product</a></div>
            </div>
            <div class="button">
                <div class="search"><a href="giohang">
                        <i class="fa-solid fa-cart-shopping"></i>
                    </a></div>
                <div class="user">
                    <c:if test="${sessionScope.account ne null}">
                        <h3>Hello, ${sessionScope.account.username}</h3>
                        <div class="item">
                            <a href="logout">Log Out</a>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.account eq null}">

                        <div class="item">
                            <a href="login">Log In</a>
                        </div>
                        <div class="item">
                            <a href="signup">Sign Up</a>
                        </div>
                    </c:if>


                </div>
            </div>
        </div>

    </body>
</html>
