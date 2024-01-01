<%-- 
    Document   : GDThemSp
    Created on : Nov 18, 2023, 1:40:46 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/gdupdate.css" />" type="text/css" rel="stylesheet"><!-- comment --><!DOCTYPE html>
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
        <h1>Trang Thêm Sản Phẩm</h1>
        <form action="qlsp?action=add" method="post" enctype="multipart/form-data"  >
            <label>Product Name</label> <br>
            <input type="text" name="product_name" charset="UTF-8" required /><br>
            <label>Description</label><br>
            <input type="text" name="description" charset="UTF-8"/><br>
            <label>Price</label><br>
            <input type="number" name="price" min="1" charset="UTF-8"/><br>
            <label>Quantity</label><!-- comment --><br>
            <input type="number" name="stock_quantity" min="1" charset="UTF-8"/><br>


            <label for="brand">Choose Brand:</label>
            <select id="brand" name="brand_id">

                <c:forEach items="${requestScope.listBrands}" var="c">
                    <option value="${c.brand_id}">${c.brand_name}</option>
                </c:forEach>
                <!-- Thêm các option khác nếu cần -->
            </select>
            <br>

            <label for="category">Choose Category:</label>
            <select id="category" name="category_id">

                <c:forEach items="${requestScope.listCategories}" var="c">
                    <option value="${c.category_id}">${c.category_name}</option>
                </c:forEach>
                <!-- Thêm các option khác nếu cần -->
            </select>
            <br>


            <label for="size">Choose size:</label>
            <select id="size" name="size">
                <option value="S">Size S</option>
                <option value="M">Size M</option>
                <option value="L">Size L</option>
                <option value="XL">Size XL</option>
                <!-- Thêm các option khác nếu cần -->
            </select>
            <label>Image</label><br>
            <input type="file" name="image_url"  /><br>
            <br>
            <input type="submit" value="Thêm" />
            <a href="qlsp">Back</a>
        </form>
    </body>
</html>
