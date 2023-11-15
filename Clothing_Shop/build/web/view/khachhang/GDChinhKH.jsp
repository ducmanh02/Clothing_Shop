<%-- 
    Document   : GDChinhKH
    Created on : Nov 15, 2023, 4:23:46 PM
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
        <h1>GD Chinh Khách Hàng</h1>
        
        
        <table>
            <tr>
            <th>ID</th><!-- comment -->
            <th>Name</th><!-- comment -->
            <th>Description</th>
            <th>Price</th> 
            <th>Stock quantity</th>  
            <th>Brand </th>  
            <th>category</th>  
            <th>size</th>
            <th>Image</th>
            </tr>
        
        
            <c:forEach items="${requestScope.listProduct}" var="c">
            <tr>
            <td>${c.product_id}</td><!-- comment -->
            <td>${c.product_name}</td><!-- comment -->
            <td>${c.description}</td>
            <td>${c.price}</td> 
            <td>${c.stock_quantity}</td>  
            <td>${c.brand_id} </td>  
            <td>${c.category_id}</td>  
            <td>${c.size}</td>
            <td><img url="${c.image_url}" /></td>
            </tr>
        </c:forEach>
            </table>
    </body>
</html>
