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

        <title>Add Product</title>
    </head>
    <body>


        <jsp:include page="../components/NavbarAdmin.jsp" ></jsp:include>
            <div class="container d-flex justify-content-center ">

                <form class="boxForm w-50 " action="qlsp?action=add" method="post" enctype="multipart/form-data" >
                    <h1 class="text-center p-3">Add Product</h1>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Product Name" name="product_name" charset="UTF-8" required >
                        <label for="floatingInput">Product Name</label>
                    </div>
                    <div class="form-floating mb-3">                       
                        <textarea type="text" class="form-control" id="floatingInput" placeholder="Product Name" name="product_name" charset="UTF-8" required rows="3" ></textarea>
                        <label for="floatingInput">Description </label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="floatingInput" name="price" min="1" charset="UTF-8" required >
                        <label for="floatingInput">Price : ($)</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="floatingInput" type="number" name="stock_quantity" min="1" charset="UTF-8" required >
                        <label for="floatingInput">Quantity </label>
                    </div>


                    <label class="p-2" for="brand">Choose Brand:</label>
                    <select class="form-select" aria-label="Default select example" id="brand" name="brand_id">
                    <c:forEach items="${requestScope.listBrands}" var="c" >
                        <option value="${c.brand_id}">${c.brand_name}</option>
                    </c:forEach>
                </select>

                <label class="p-2" for="category">Choose Category:</label>
                <select class="form-select" id="category" name="category_id">

                    <c:forEach items="${requestScope.listCategories}" var="c">
                        <option value="${c.category_id}">${c.category_name}</option>
                    </c:forEach>
                    Thêm các option khác nếu cần 
                </select>

                <label class="p-2" for="size">Choose size:</label>
                <select class="form-select"  id="size" name="size">
                    <option value="S">Size S</option>
                    <option value="M">Size M</option>
                    <option value="L">Size L</option>
                    <option value="XL">Size XL</option>
                    Thêm các option khác nếu cần 
                </select>
                <label class="p-2">Image</label><br>
                <div class="input-group mb-3">
                    <label class="input-group-text" for="inputGroupFile01">Upload</label>
                    <input type="file" class="form-control" id="inputGroupFile01" name="image_url">
                </div>
                <span style="color: red">${requestScope.error}</span>
                <div class="mt-3 text-center">
                    <button class="normal ">Add</button>
                </div>



            </form>



        </div>
    </body>
</html>
