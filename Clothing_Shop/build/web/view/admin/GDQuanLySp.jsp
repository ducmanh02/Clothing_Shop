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
        <link href="<c:url value="/asset/css/style.css" />" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="icon" type="image/x-icon" href="./asset/favicon/icons8-shop-color-96.png">
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        <title>JSP Page</title>
    </head>
    <style>
        .container {
            padding-top: 15vh;

        }
    </style>
    <body>
        <div class="container">
            <h1>Trang Quan Ly San Pham</h1>
            <h3><a href="qlsp?action=add">Thêm Sản Phẩm</a></h3>
            <h3><a href="admin">Back</a></h3>
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


                <c:forEach items="${requestScope.listProduct}" var="p">
                    <c:set var="imagePath" value="${p.image_url}" />
                    <tr>
                        <td>${p.product_id}</td><!-- comment -->
                        <td>${p.product_name}</td><!-- comment -->
                        <td>${p.description}</td>
                        <td>${p.price}</td> 
                        <td>${p.stock_quantity}</td>  
                        <td>${p.brand.brand_name} </td>  
                        <td>${p.category.category_name}</td>  
                        <td>${p.size}</td>

                        <td>
<!--                            <img src="${p.image_url}" alt="${p.product_name}">-->
                            <p>${request.contextPath}</p>
                            <c:choose>
                                
                                <c:when test="${not empty imagePath}">
                                    <img style="width:200px" src="<c:url value='${request.contextPath}${imagePath}'/>" alt="Anh o day"/>
                                </c:when>
                                <c:otherwise>

                                    <p>No image available</p>
                                </c:otherwise>
                            </c:choose>

                        </td>
                        <td><a href="qlsp?action=update&&product_id=${p.product_id}" >Update</a> &nbsp; &nbsp; &nbsp; 
                            <a href="qlsp?action=delete&&product_id=${p.product_id}" > Delete</a>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </body>
</html>
