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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders</title>
    </head>
    <body>
        <h1>Hiển thị đơn hàng</h1>
        <a href="admin">Back</a>
        <table border="1">
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
                    <td>${order.getUser().getUsername()}</td>
                    <td>${order.total_amount}</td>
                    <td>${order.order_date}</td>
                    <td>${order.status} 
                    </td>
                    <td>
                        <c:if test="${order.status ne 'canceled' && order.status ne 'Shipped' && order.status ne 'Delivered' }">
                            <form action="qlorder" method="get">
                                <input type="hidden" name="action" value="changeStatus" />
                                <input type="hidden" name="order_id" value="${order.order_id}" />
                                <select name="newStatus">
                                    
                                    <option value="Pending">Pending</option>
                                    <option value="Shipped">Shipped</option>
                                    <option value="Delivered">Delivered</option>
                                    <option value="Canceled">Cancelled</option>
                                </select>
                                <input type="submit" value="Save" />
                            </form>

                        </c:if>
                        <c:if test="${order.status eq 'Shipped' && order.status ne 'canceled' }">
                            <form action="qlorder" method="get">
                                <input type="hidden" name="action" value="changeStatus" />
                                <input type="hidden" name="order_id" value="${order.order_id}" />
                                <select name="newStatus">
                                    
                                    
                                    
                                    <option value="Delivered">Delivered</option>
                                    
                                </select>
                                <input type="submit" value="Save" />
                            </form>

                        </c:if>
                        


                    </td>
                    <td>
                        <a href="qlorder?action=showItem&order_id=${order.order_id}">View Details</a>
                        <%-- Check if the user has the permission to change order status --%>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
