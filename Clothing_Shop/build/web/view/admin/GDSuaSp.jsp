<%-- 
    Document   : GDSuaSp
    Created on : Nov 18, 2023, 1:41:02 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/gdupdate.css" />" type="text/css" rel="stylesheet"><!-- comment -->
<!DOCTYPE html>
<html>
<!--    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Trang Cập nhật Sản Phẩm</h1>

        <form action="qlsp?action=update&&product_id=${product.product_id}" method="post"  enctype="multipart/form-data" >

            <br>
            <label>Product Name</label> <br>
            <input type="text" name="product_name" value="${product.product_name}" required charset="UTF-8" /><br>
            <label>Description</label><br>
            <input type="text" name="description" value="${product.description}"  charset="UTF-8"/><br>
            <label>Price</label><br>
            <input type="number" name="price" min="1" value="${product.price}" charset="UTF-8"/><br>
            <label>Quantity</label> comment <br>
            <input type="number" name="stock_quantity" min="1" value="${product.stock_quantity}" charset="UTF-8"/><br>
                        <label>Brand</label> comment <br>
                        <input type="text" name="brand_id" value="${product.brand.brand_name}" charset="UTF-8"/><br>

             Dropdown để chọn brand 
            <label for="brand">Choose Brand:</label>
            <select id="brand" name="brand_id">
                <c:forEach var="brand" items="${requestScope.listBrands}" >
                    <c:choose>
                        <c:when test="${brand.brand_id eq product.brand.brand_id}">
                            <option value="${brand.brand_id}" selected>${brand.brand_name}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${brand.brand_id}">${brand.brand_name}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>

            <br>


            <label for="category">Choose Category:</label>
            <select id="category" name="category_id">
                <c:forEach items="${requestScope.listCategories}" var="category"  >
                    <c:choose>
                        <c:when test="${category.category_id eq product.category.category_id}">
                            <option value="${category.category_id}" selected>${category.category_name}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${category.category_id}">${category.category_name}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
            <br>


            <label>Size</label><br>
            <input type="text" name="size" value="${product.size}" charset="UTF-8"/><br>
            <label>Image</label><br>
            <input type="file" name="image_url" value="${product.image_url}"  /><br>
            <br>


            <input type="submit" value="Update" />
            <a href="qlsp">Back</a>
        </form>
    </body>-->

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

        <title>Update Product</title>
    </head>
    <body>


        <jsp:include page="../components/NavbarAdmin.jsp" ></jsp:include>
            <div class="container d-flex justify-content-center ">

                <form class="boxForm w-50 " action="qlsp?action=update&&product_id=${product.product_id}" method="post"  enctype="multipart/form-data">
                <h1 class="text-center p-3">Update Product</h1>

                <c:set var="imagePath" value="${product.image_url}" />
                <div class="text-center my-4">
                    <c:choose>

                        <c:when test="${not empty imagePath}">
                            <img style="width:200px" src="<c:url value='${request.contextPath}${imagePath}'/>" alt="Anh o day"/>
                        </c:when>
                        <c:otherwise>

                            <p>No image available</p>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="Product Name" name="product_name" value="${product.product_name}" charset="UTF-8" required >
                    <label for="floatingInput">Product Name</label>
                </div>
                <div class="form-floating mb-3">                       
                    <textarea type="text" class="form-control" id="floatingInput" placeholder="Product Name" name="description" value="${product.description}" charset="UTF-8" required rows="3" ></textarea>
                    <label for="floatingInput">Description </label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="floatingInput" name="price" value="${product.price}" min="1" charset="UTF-8" required >
                    <label for="floatingInput">Price : ($)</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="floatingInput" type="number" name="stock_quantity" value="${product.stock_quantity}" min="1" charset="UTF-8" required >
                    <label for="floatingInput">Quantity </label>
                </div>


                <label class="p-2" for="brand">Choose Brand:</label>
                <select class="form-select" aria-label="Default select example" id="brand" name="brand_id">
                    <c:forEach var="brand" items="${requestScope.listBrands}" >
                        <c:choose>
                            <c:when test="${brand.brand_id eq product.brand.brand_id}">
                                <option value="${brand.brand_id}" selected>${brand.brand_name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${brand.brand_id}">${brand.brand_name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>

                <label class="p-2" for="category">Choose Category:</label>
                <select class="form-select" id="category" name="category_id">

                    <c:forEach items="${requestScope.listCategories}" var="category"  >
                    <c:choose>
                        <c:when test="${category.category_id eq product.category.category_id}">
                            <option value="${category.category_id}" selected>${category.category_name}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${category.category_id}">${category.category_name}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                </select>

                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="floatingInput" name="size" value="${product.size}"  charset="UTF-8" required >
                    <label for="floatingInput">Size </label>
                </div>
                <label class="p-2">Image</label><br>
                <div class="input-group mb-3">
                    <label class="input-group-text" for="inputGroupFile01">Upload</label>
                    <input type="file" class="form-control" id="inputGroupFile01" name="image_url" value="${imagePath}">
                </div>
                <span style="color: red">${requestScope.error}</span>
                <div class="mt-3 text-center">
                    <button class="normal ">Update</button>
                </div>



            </form>



        </div>
    </body>
</html>
