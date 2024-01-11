<%-- 
    Document   : GDChitietDh
    Created on : Dec 25, 2023, 3:34:06 PM
    Author     : ducmanh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="<c:url value="/asset/css/gdquanlyadmin.css" />" type="text/css" rel="stylesheet">

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
        <jsp:include page="../components/NavbarAdmin.jsp" ></jsp:include>
            <div class="container">
                <h1 class="text-center mb-5">Chi Tiết Đơn hàng</h1>
                <button class="normal"><a style="text-decoration: none;color: #fff" href="qlorder?action=showAll">Back</a></button>
                <table class="table align-middle mt-5">
                    <thead class="table-dark">
                    <th>Order Item ID</th>
                    <th>Product Name</th>
                    <th>Product Image</th>
                    <th>Product Price</th>

                    <th>Quantity</th>
                    <th>Total Price</th>
                    </thead>
                <c:forEach var="orderItem" items="${requestScope.orders}">
                    <tr>
                        <td>${orderItem.getOrder_item_id()}</td>
                        <td>${orderItem.getProduct().getProduct_name()}</td>
                        <td>
                            <img style="width:150px" src="${orderItem.getProduct().getImage_url()}" alt="alt"/>
                        </td>
                        <td>$${orderItem.getTotal_price()/orderItem.getQuantity()}</td>
                        <td>${orderItem.getQuantity()}</td>
                        <td>$${orderItem.getTotal_price()}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

    </body>
</body>
</html>