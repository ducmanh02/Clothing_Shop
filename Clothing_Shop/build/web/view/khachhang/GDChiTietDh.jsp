<%-- 
    Document   : GDChitietDh
    Created on : Dec 25, 2023, 3:34:06 PM
    Author     : ducmanh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="<c:url value="/asset/css/dsdonhang.css" />" type="text/css" rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order Detail</title>
</head>
<body>
    <div class="container">
         <h1>Chi Tiết Đơn hàng</h1>
    <a href="dathang?action=showAll">Back</a>
    <table>
        <tr>
            <th>Order Item ID</th>
            <th>Product Name</th>
            <th>Product Image</th>
            <th>Product Price</th>
            
            <th>Quantity</th>
            <th>Total Price</th>
        </tr>
        <c:forEach var="orderItem" items="${requestScope.orders}">
            <tr>
                <td>${orderItem.getOrder_item_id()}</td>
                <td>${orderItem.getProduct().getProduct_name()}</td>
                <td>
                    <img style="width:200px" src="${orderItem.getProduct().getImage_url()}" alt="alt"/>
                </td>
                <td>${orderItem.getProduct().getPrice()}</td>
                <td>${orderItem.getQuantity()}</td>
                <td>${orderItem.getTotal_price()}</td>
            </tr>
        </c:forEach>
    </table>
    </div>
   
</body>
</html>