<%-- 
    Document   : GDDatHang
    Created on : Nov 20, 2023, 11:23:11 PM
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
                <h1>Trang Đặt Hàng</h1>
            <c:set var="u" value="${sessionScope.account}" />
                <form action="dathang" method="post">
                    <h3>Thông tin người đặt</h3>
                    <label>Full Name:</label>
                    <input type="text" name="full_name" required> 
                    <label>Address:</label>
                    <input type="text" name="address" required> 
                    <label>Phone Number:</label> 
                    <input type="text" name="phone" required> 
                    <input type="submit" value="Xác Nhận Đặt Hàng">
                </form>

                <h3>Thông tin Đơn Hàng Đặt</h3>
                <h4>Danh sách Sản Phẩm</h4>
                <table border="1px">
                    <tr>
                        <th>Cart Item id</th>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        
                    </tr>
                    <c:forEach var="b" items="${requestScope.listCartItem}"  >
                        <tr>
                            <td>${b.cart_item_id}</td>
                            <td>${b.product.product_id}</td>
                            <td>${b.quantity}</td>
                            <td>${b.total_price}</td>
                            
                        </tr>
                    </c:forEach>

                </table>
                <h4 style="margin: 20px 0">Tổng tiền : ${requestScope.totalPrice}</h4>
            </div>
            <a href="view/khachhang/GDDatHangThanhCong.jsp">OKOKO</a>

        </body>
    </html>
