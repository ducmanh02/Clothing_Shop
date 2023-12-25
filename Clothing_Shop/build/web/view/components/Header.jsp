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
<!--        <link href="../../asset/css/style.css" type="text/css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="icon" type="image/x-icon" href="./asset/favicon/icons8-shop-color-96.png">
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        <title>JSP Page</title>
    </head>

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
                        <h4><a href="dathang?action=showAll">Xem đơn hàng</a></h4>
                        <h4> <a href="user?action=update&user_name=${sessionScope.account.username}">Cập nhật thông tin cá nhân</a></h4>
                        <div class="item">
                            <a href="user?action=logout">Log Out</a>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.account eq null}">

                        <div class="item">
                            <a href="user?action=login">Log In</a>
                        </div>
                        <div class="item">
                            <a href="user?action=signup">Sign Up</a>
                        </div>
                    </c:if>


                </div>
            </div>
        </div>

    </body>
</html>
