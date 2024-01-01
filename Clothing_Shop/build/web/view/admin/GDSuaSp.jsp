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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Trang Cập nhật Sản Phẩm</h1>

        <form action="qlsp?action=update&&product_id=${product.product_id}" method="post"  enctype="multipart/form-data" >

            <c:set var="imagePath" value="${product.image_url}" />
            <c:choose>

                <c:when test="${not empty imagePath}">
                    <img style="width:200px" src="<c:url value='${request.contextPath}${imagePath}'/>" alt="Anh o day"/>
                </c:when>
                <c:otherwise>

                    <p>No image available</p>
                </c:otherwise>
            </c:choose>
            <br>
            <label>Product Name</label> <br>
            <input type="text" name="product_name" value="${product.product_name}" required charset="UTF-8" /><br>
            <label>Description</label><br>
            <input type="text" name="description" value="${product.description}"  charset="UTF-8"/><br>
            <label>Price</label><br>
            <input type="number" name="price" min="1" value="${product.price}" charset="UTF-8"/><br>
            <label>Quantity</label><!-- comment --><br>
            <input type="number" name="stock_quantity" min="1" value="${product.stock_quantity}" charset="UTF-8"/><br>
            <!--            <label>Brand</label> comment <br>
                        <input type="text" name="brand_id" value="${product.brand.brand_name}" charset="UTF-8"/><br>-->

            <!-- Dropdown để chọn brand -->
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
    </body>
</html>
