<%-- 
    Document   : GDQuanLySp
    Created on : Nov 18, 2023, 1:15:32 PM
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
        <h1>Trang Quan Ly San Pham</h1>
        <h3><a href="qlsp?action=add">Thêm Sản Phẩm</a></h3>
        <h3>Tim Kiem san pham</h3>
        <form action="qlsp?action=search" method="post">
            <input type="text" name="tuKhoa" placeholder="Nhap tu khoa">
            <input type="submit" value="Search">
        </form>
        <br>
        <table border="1px">
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
                <th>Action</th>
            </tr>


            <c:forEach items="${requestScope.listProduct}" var="c">
                <tr>
                    <td>${c.product_id}</td><!-- comment -->
                    <td>${c.product_name}</td><!-- comment -->
                    <td>${c.description}</td>
                    <td>${c.price}</td> 
                    <td>${c.stock_quantity}</td>  
                    <td>${c.brand.brand_name} </td>  
                    <td>${c.category.category_name}</td>  
                    <td>${c.size}</td>
                    <td><img src="${c.image_url}" alt="${c.product_name}"></td>
                    <td><a href="qlsp?action=update&&product_id=${c.product_id}" >Update</a> &nbsp; &nbsp; &nbsp; 
                        <a href="qlsp?action=delete&&product_id=${c.product_id}" > Delete</a>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>
