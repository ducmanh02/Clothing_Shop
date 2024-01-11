<%-- 
    Document   : GDQuanLyCategory
    Created on : Nov 18, 2023, 1:42:02 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/gdquanlyadmin.css" />" type="text/css" rel="stylesheet">
<!DOCTYPE html>
<html>
<!--    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Quản Lý Category</h1>
        <h2>Danh sách Category</h2>
        <div class="container">
        <a href="admin">Trang chủ</a>
        <a href="qlcategory?action=add">Thêm Category</a>
        <table border="1px">
            <tr>
                <th>ID</th>
                <th>Category Name</th>
                <th>Action</th>
            </tr>
            <c:forEach var="b" items="${requestScope.listCategory}" >
                <tr>
                    <td>${b.category_id}</td>
                    <td>${b.category_name}</td>
                    <td><a href="qlcategory?action=update&&category_id=${b.category_id}" >Update</a> &nbsp; &nbsp; &nbsp; 
                        <a href="qlcategory?action=delete&&category_id=${b.category_id}" > Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        </div>
    </body>-->
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <jsp:include page="../components/NavbarAdmin.jsp" ></jsp:include>

            <div class="container text-center">
                <h2>Danh sách Category</h2>
                <div class="d-flex justify-content-between">
                    <button class="normal"><a style="text-decoration: none;color:#fff" href="admin">Trang chủ</a></button>
                    <button class="normal"><a style="text-decoration: none;color:#fff" href="qlcategory?action=add">Thêm Category</a></button>
                </div>
                <table class="table mt-5 align-middle">
                    <thead class="table-dark ">
                    <th>ID</th>
                    <th>Category Name</th>
                    <th>Action</th>
                    <th>Warning</th>
                    </thead>
                <c:forEach var="b" items="${requestScope.listCategory}" >
                    <tr>
                        <td>${b.category_id}</td>
                        <td>${b.category_name}</td>
                        <td><button class="normal"><a style="color:#fff;text-decoration: none;" href="qlcategory?action=update&&category_id=${b.category_id}" >Update</a></button> 

                        </td>
                        <td><button class="btn-warning btn"><a style="color:#fff;text-decoration: none;" href="qlcategory?action=delete&&category_id=${b.category_id}" > Delete</a></button></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
