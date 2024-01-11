<%-- 
    Document   : GDGioHang
    Created on : Nov 17, 2023, 10:09:15 AM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/gdgiohang.css" />" type="text/css" rel="stylesheet">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/asset/css/style.css" />" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" >
        <link rel="icon" type="image/x-icon" href="./asset/favicon/icons8-shop-color-96.png">
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        <title>JSP Page</title>
    </head>


    <body>
        <jsp:include page="../components/Header.jsp" ></jsp:include>

            <div class="padding-top">


            </div>


            <section id="shop_page_header">

                <h2>#stayhome</h2>

                <p>Save more with coupons & up to 70% off!</p>

            </section>

            <section id="cart" class="section-p1">
                <table with="100%">
                    <thead>
                        <tr>
                            <td>Remove</td>
                            <td>Image</td>
                            <td>Product</td>
                            <td>Price</td>
                            <td>Quantity</td>
                            <td>Subtotal</td>
                        </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="b" items="${requestScope.listCartItem}"  >
                        <tr>
                            <td>
                                <form action="giohang?action=delete&&product_id=${b.product.product_id}" method="post">
                                    <button class="btn btn-warning">Delete</button>

                                </form>
                            </td>
                            <td><img src="${b.product.image_url}" alt=""></td>
                            <td>${b.product.product_name}</td>
                            <td>$${b.total_price/b.quantity}</td>
                            <td>                                
                                <form action="giohang?action=update&&product_id=${b.product.product_id}" method="post">
                                    <input type="number" width="20px" value="${b.quantity}" min="1" max="${b.product.stock_quantity}" name="quantity"/>
                                    <button class=" normal">Update</button>

                                </form>
                            </td>
                            <td>$${b.total_price}</td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </section>

        <section id="cart-add" class="section-p1">

            <div class="subtotal">
                <h3><strong>Cart Totals</strong></h3>
                <table>
                    <tr>
                        <td>Cart Subtotal</td>
                        <td>$${requestScope.totalPrice}</td>
                    </tr>
                    <tr>
                        <td>Shipping</td>
                        <td>Free</td>
                    </tr>
                    <tr>
                        <td><strong>Total</strong></td>
                        <td><strong>$${requestScope.totalPrice}</strong></td>
                    </tr>
                </table>
                <button class="normal"><a style="color: #fff;text-decoration: none" href="dathang?action=order">Check Out</a></button>
            </div>
        </section>

    </div>

    <jsp:include page="../components/Footer.jsp"/>
</body>

</html>
