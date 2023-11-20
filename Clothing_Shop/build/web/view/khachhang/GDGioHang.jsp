<%-- 
    Document   : GDGioHang
    Created on : Nov 17, 2023, 10:09:15 AM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h1>Trang Giỏ Hàng</h1>

                <h4>${requestScope.error}</h3>
                <h3>Giỏ Hàng</h3>

                <table border="1px">
                    <tr>
                        <th>Cart Item id</th>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>action</th>
                    </tr>
                    <c:forEach var="b" items="${requestScope.listCartItem}"  >
                        <tr>
                            <td>${b.cart_item_id}</td>
                            <td>${b.product.product_id}</td>
                            <td>   
                                <form action="giohang?action=update&&product_id=${b.product.product_id}" method="post">
                                    <input type="number" width="20px" value="${b.quantity}" name="quantity"/>
                                    <input type="submit" value="update"/>

                                </form></td>
                                <td>${b.total_price}</td>
                            <td>
                                
                                <form action="giohang?action=delete&&product_id=${b.product.product_id}" method="post">
                                    <input type="submit" value="delete"/>

                                </form></td>
                        </tr>
                    </c:forEach>
                        
                </table>
                <h4 style="margin: 20px 0">Tổng tiền : ${requestScope.totalPrice}</h4>
                <a href="dathang">Đặt Hàng</a>
        </div>
    </body>
</html>
