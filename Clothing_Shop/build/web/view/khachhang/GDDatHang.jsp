<%-- 
    Document   : GDDatHang
    Created on : Nov 20, 2023, 11:23:11 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/gddathang.css" />" type="text/css" rel="stylesheet"><!-- comment -->
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
        <jsp:include page="../components/Header.jsp" ></jsp:include>
            <div class="container">
                <a href="giohang">Back</a>
            <div class="head">
                
                <c:set var="u" value="${user}" />
                <form action="dathang" method="post">
                    <h3>Thông tin người đặt</h3>
                    <table>
                        <tr>
                            <td><label>Full Name:</label></td>
                            <td><input type="text" name="full_name" value="${u.getFull_name()}" readonly> </td>
                        </tr>
                        <tr>
                            <td><label>Address:</label></td>
                            <td><input type="text" name="address" value="${u.getAddress()}" readonly>  </td>
                        </tr>
                        <tr>
                            <td><label>Phone Number:</label> </td>
                            <td><input type="text" name="phone" value="${u.getPhone()}" readonly>  </td>
                        </tr>
                    </table>
                    <input type="submit" value="Xác Nhận Đặt Hàng">
                </form>

            </div>
                    <div class="mid">
                        <h3>Thông tin Đơn Hàng Đặt</h3>
                        <h4>Danh sách Sản Phẩm</h4>
                        <table >
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
                
            </div>

                
        </body>

    </html>
