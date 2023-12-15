<%-- 
    Document   : GDSuaSp
    Created on : Nov 18, 2023, 1:41:02 PM
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
        <h1>Trang Sửa Sản Phẩm</h1>
        
        <form action="qlsp?action=add" method="post"  >
            <label>Product Name</label> <br>
            <input type="text" name="product_name" charset="UTF-8" /><br>
            <label>Description</label><br>
            <input type="text" name="description" charset="UTF-8"/><br>
            <label>Price</label><br>
            <input type="number" name="price" charset="UTF-8"/><br>
            <label>Quantity</label><!-- comment --><br>
            <input type="number" name="stock_quantity" charset="UTF-8"/><br>
            <label>Brand</label><!-- comment --><br>
            <input type="text" name="brand_id" charset="UTF-8"/><br>
            <label>Category</label><br>
            <input type="text" name="category_id" charset="UTF-8"/><br>
            <label>Size</label><br>
            <input type="text" name="size" charset="UTF-8"/><br>
            <label>Image</label><br>
            <input type="file" name="image_url" /><br>
            <br>
            <input type="submit" value="Them" />
        </form>
    </body>
</html>
