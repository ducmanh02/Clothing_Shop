<%-- 
    Document   : GDThemSp
    Created on : Nov 18, 2023, 1:40:46 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/asset/css/style.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="icon" type="image/x-icon" href="./asset/favicon/icons8-shop-color-96.png">
       
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Trang Them San Pham</h1>
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
