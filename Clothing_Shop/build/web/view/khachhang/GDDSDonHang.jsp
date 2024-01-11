<%-- 
    Document   : GDDSDonHang
    Created on : Dec 25, 2023, 4:14:36 PM
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
            max-height: 800px;
            
        }


    </style>
    <body>
        <jsp:include page="../components/Header.jsp" ></jsp:include>
            <div class="container">
                <h1 class="text-center">Danh sách đơn hàng</h1>
                <button class="normal "><a style="text-decoration: none;color: #fff" href="chinhsp">Back</a></button>
                <table class="table mt-5 mb-5 align-middle">
                    <thead class="table-dark">
                        <th>Order ID</th>
                        <th>User Name</th>
                        <th>Total Amount</th>
                        <th>Order Date</th>
                        <th>Status</th>
                        <th>Đổi trạng thái</th>
                        <th>Xem chi tiết</th>
                    </thead>
                <c:forEach var="order" items="${orders}">
                    <tr >
                        <td>${order.order_id}</td>
                        <td>${order.user.username}</td>
                        <td>${order.total_amount}</td>
                        <td>${order.order_date}</td>
                        <td>${order.status} 
                        </td>
                        <td>
                            <c:if test="${order.status eq 'Pending'}">
                                <button class="btn btn-warning"><a style="text-decoration: none;color: #fff"  href="dathang?action=cancel&order_id=${order.order_id}">Cancel</a></button>
                                

                            </c:if>


                        </td>
                        <td>
                            <button class="normal"><a style="text-decoration: none;color: #fff" href="dathang?action=showItem&order_id=${order.order_id}">View Details</a></button>
                            
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <jsp:include page="../components/Footer.jsp"/>
    </body>
</html>
