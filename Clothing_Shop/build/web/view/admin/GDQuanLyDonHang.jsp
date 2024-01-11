<%-- 
    Document   : GDQuanLyDonHang
    Created on : Nov 18, 2023, 1:41:24 PM
    Author     : ducmanh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
        <title>Orders</title>
    </head>
    <body>
        <jsp:include page="../components/NavbarAdmin.jsp" ></jsp:include>

        <div class="container">
            <h1 class="text-center">Quản lý đơn hàng</h1>
            <button class="normal"><a style="text-decoration: none;color: #fff"  href="admin">Trang chủ</a></button>
            <table class="table mt-5 mb-5 align-middle">
                <thead class="table-dark">
                    <th>Order ID</th>
                    <th>User ID</th>
                    <th>Username</th>
                    <th>Total Amount</th>
                    <th>Order Date</th>
                    <th>Status</th>
                    <th>Đổi trạng thái</th>
                    <th>Xem chi tiết</th>
                    <th>Thông báo </th>
                </thead>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.order_id}</td>
                        <td>${order.user.user_id}</td>
                        <td>${order.getUser().getUsername()}</td>
                        <td>${order.total_amount}</td>
                        <td>${order.order_date}</td>
                        <td>${order.status} 
                        </td>
                        <td>
                            <c:if test="${order.status eq 'Pending'  }">
                                <form action="qlorder" method="get">
                                    <input type="hidden" name="action" value="changeStatus" />
                                    <input type="hidden" name="order_id" value="${order.order_id}" />
                                    <select class="p-1" name="newStatus">
                                        <option value="Shipped">Shipped</option>
                                        <option value="Canceled">Cancelled</option>
                                    </select>
                                    <button class="normal">Save</button>
                                </form>

                            </c:if>
                            <c:if test="${order.status eq 'Shipped' }">
                                <form action="qlorder" method="get">
                                    <input type="hidden" name="action" value="changeStatus" />
                                    <input type="hidden" name="order_id" value="${order.order_id}" />
                                    <select class="p-1" name="newStatus">

                                        <option value="Delivered">Delivered</option>

                                    </select>
                                    <button class="normal">Save</button>
                                </form>

                            </c:if>



                        </td>
                        <td>
                            <button class="normal"><a style="text-decoration: none;color: #fff" href="qlorder?action=showItem&order_id=${order.order_id}">View Details</a></button>
                            
                            <%-- Check if the user has the permission to change order status --%>
                        </td>
                        <td><c:if test="${order.order_id eq error_order_id }">

                                <p style="color: red">${error}</p>
                            </c:if></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        
        
        
    </body>
</html>
