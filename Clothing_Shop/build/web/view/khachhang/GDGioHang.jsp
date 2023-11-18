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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Trang Giỏ Hàng</h1>
        <c:if test="${sessionScope.account ne null}">
            <h3>Hello, ${sessionScope.account.username}</h3>
            <h4><a href="logout">Logout</a></h4>
        </c:if>
        <c:if test="${sessionScope.account eq null}">

            <h4><a href="login">Login</a></h4>
            <h4><a href="signup">Sign Up</a></h4>
        </c:if>
        <h4>${requestScope.error}</h3>
        <h3>Giỏ Hàng</h3>

        <table border="1px">
            <tr>
                <th>Cart Item id</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>action</th>
            </tr>
            <c:forEach var="b" items="${requestScope.listCartItem}" >
                <tr>
                    <td>${b.cart_item_id}</td>
                    <td>${b.product.product_name}
                        <form action="action" method="post">
                            <td><input type="number" value="${b.quantity}" /></td>
                            <td><input type="submit" value="update"/>

                            </td>
                        </form></td>
                </tr>
            </c:forEach>

        </table>
        <a href="url">Đặt Hàng</a>
</body>
</html>
