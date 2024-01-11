<%-- 
    Document   : GDQuanLySp
    Created on : Nov 18, 2023, 1:15:32 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/gdsp.css" />" type="text/css" rel="stylesheet">
<!DOCTYPE html>
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
        <title>Products</title>
    </head>
    <style>
        .container {
            padding-top: 15vh;

        }
        table{
            max-height: 600px;
        }
    </style>
    <body>
        <jsp:include page="../components/NavbarAdmin.jsp" ></jsp:include>
            <div class="container mt-5">
                <h1 class="text-center m-4">Danh Sách Sản Phẩm</h1>

                <div class="d-flex justify-content-between my-4">
                    <button class="normal"><a style="text-decoration: none;color: #fff"  href="admin">Trang chủ</a></button>
                    <button class="normal"><a style="text-decoration: none;color: #fff"  href="qlsp?action=add">Thêm Sản Phẩm</a></button>

                </div>

                <div class=" my-4">
                    <h3>Tìm kiếm sản phẩm</h3>
                    <form action="qlsp?action=search" method="post">

                        <div class="input-group flex-nowrap">
                            <span class="input-group-text" id="addon-wrapping">Name Product</span>
                            <input type="text" class="form-control" placeholder="Product You Want To Search" aria-label="Product You Want To Search" aria-describedby="addon-wrapping" name="tuKhoa"">
                            <button class="normal">Search </button>
                        </div>
                    </form>
                </div>
                <br>
                <table class="table align-middle my-4 ">
                    <thead class="table-dark align-middle">
                    <th>ID</th><!-- comment -->
                    <th>Name</th><!-- comment -->
                    <th style="width: 300px">Description</th>
                    <th>Price</th> 
                    <th>Stock quantity</th>  
                    <th>Brand </th>  
                    <th>category</th>  
                    <th>size</th>
                    <th>Image</th>
                    <th>Action</th>
                    </thead>


                <c:forEach items="${requestScope.listProduct}" var="p">
                    <c:set var="imagePath" value="${p.image_url}" />
                    <tbody class="table-group-divider">
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
                                <img style="width:200px" src="<c:url value='${imagePath}'/>" alt="Anh o day"/>
                            </c:when>
                            <c:otherwise>

                                <p>No image available</p>
                            </c:otherwise>
                        </c:choose>

                    </td>
                    <td>
                        <div class="d-flex">
                            <button class="btn btn-primary">
                                <a style="text-decoration: none;color: #fff" href="qlsp?action=update&&product_id=${p.product_id}" >Update</a> 
                            </button>
                            <button class="btn btn-warning">
                                <a style="text-decoration: none;color: #fff" href="qlsp?action=delete&&product_id=${p.product_id}" > Delete</a>
                            </button>
                            
                        </div>
                    </td>
                    </tbody>
                </c:forEach>

            </table>
        </div>
    </body>
</html>
