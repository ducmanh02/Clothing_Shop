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
            <div class="container">
                <div class="pb-2">
                    <button class="normal" ><a style="color:#fff; text-decoration: none" href="giohang">Back</a></button>
                </div>

                <div class="row boxForm mb-5">
                    <div class="col-6">

                    <c:set var="u" value="${user}" />
                    <form action="dathang" method="post">
                        <h3 class="text-center">Thông tin người đặt</h3>

                        <div class="mb-3 row">
                            <label for="staticEmail" class="col-sm-4 col-form-label">Full Name:</label>
                            <div class="col-sm-8">
                                <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${u.getFull_name()}">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="staticEmail" class="col-sm-4 col-form-label">Address:</label>
                            <div class="col-sm-8">
                                <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${u.getAddress()}">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="staticEmail" class="col-sm-4 col-form-label">Phone Number:</label>
                            <div class="col-sm-8">
                                <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${u.getPhone()}">
                            </div>
                        </div>

                        <button class="normal">Confirm And Order</button>
                    </form>

                </div>
                <div class="col-6">
                    <h3 class="text-center">Thông tin Đơn Hàng Đặt</h3>
                    <h4 class="text-center">Danh sách Sản Phẩm</h4>

                    <div class="table-responsive">
                        <table class="table" width="100%">
                            <thead>
                                <tr>

                                    <td>Image</td>
                                    <td>Product</td>
                                    <td>Price</td>
                                    <td>Quantity</td>
                                    <td>Subtotal</td>
                                </tr>
                            </thead>
                            <tbody class="table-group-divider">

                                <c:forEach var="b" items="${requestScope.listCartItem}"  >
                                    <tr>

                                        <td><img style="width:100px;height: 100px;object-fit: cover" src="${b.product.image_url}" alt=""></td>
                                        <td>${b.product.product_name}</td>
                                        <td>$${b.total_price/b.quantity}</td>

                                        <td>${b.quantity}</td>

                                        <td>$${b.total_price}</td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <h4 style="margin: 20px 0">Total Price : $${requestScope.totalPrice}</h4>

                </div>

            </div>

        </div>
        <jsp:include page="../components/Footer.jsp"/>            
    </body>

</html>
