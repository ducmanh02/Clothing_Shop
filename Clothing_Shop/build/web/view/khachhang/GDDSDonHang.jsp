<%-- 
    Document   : GDDSDonHang
    Created on : Dec 25, 2023, 4:14:36 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/dsdonhang.css" />" type="text/css" rel="stylesheet">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
              <h1>Danh sách đơn hàng</h1>
        <a href="chinhsp">Back</a>
        <table>
        <tr>
            <th>Order ID</th>
            <th>User ID</th>
            <th>Total Amount</th>
            <th>Order Date</th>
            <th>Status</th>
            <th>Đổi trạng thái</th>
            <th>Xem chi tiết</th>
        </tr>
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.order_id}</td>
                <td>${order.user.user_id}</td>
                <td>${order.total_amount}</td>
                <td>${order.order_date}</td>
                <td>${order.status} 
                </td>
                <td>
                    <c:if test="${order.status eq 'Pending'}">
                        <a href="dathang?action=cancel&order_id=${order.order_id}">Cancel</a>

                    </c:if>
                    
                    
                </td>
                <td>
                    <a href="dathang?action=showItem&order_id=${order.order_id}">View Details</a>
                    <%-- Check if the user has the permission to change order status --%>
                </td>
            </tr>
        </c:forEach>
        </table>
        </div>
      
    </body>
</html>
