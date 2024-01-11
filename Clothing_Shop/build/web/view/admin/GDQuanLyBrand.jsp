<%-- 
    Document   : GDQuanLyBrand
    Created on : Nov 18, 2023, 1:41:50 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/gdquanlyadmin.css" />" type="text/css" rel="stylesheet">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <jsp:include page="../components/NavbarAdmin.jsp" ></jsp:include>

            <div class="container text-center">
                <h2>Danh sách Brand</h2>
                <div class="d-flex justify-content-between">
                    <button class="normal"><a style="text-decoration: none;color:#fff" href="admin">Trang chủ</a></button>
                    <button class="normal"><a style="text-decoration: none;color:#fff" href="qlbrand?action=add">Thêm Brand</a></button>
                </div>
                <table class="table mt-5 align-middle">
                    <thead class="table-dark ">
                    <th>ID</th>
                    <th>Brand Name</th>
                    <th>Action</th>
                    <th>Warning</th>
                    </thead>
                <c:forEach var="b" items="${requestScope.listBrand}" >
                    <tr>
                        <td>${b.brand_id}</td>
                        <td>${b.brand_name}</td>
                        <td><button class="normal"><a style="color:#fff;text-decoration: none;" href="qlbrand?action=update&&brand_id=${b.brand_id}" >Update</a></button> 

                        </td>
                        <td><button class="btn-warning btn"><a style="color:#fff;text-decoration: none;" href="qlbrand?action=delete&&brand_id=${b.brand_id}" > Delete</a></button></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
