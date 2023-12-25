<%-- 
    Document   : GDQuanLyBrand
    Created on : Nov 18, 2023, 1:41:50 PM
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
        <h1>Trang Quan Ly Brand</h1>
        <a href="admin">Back</a>
        <a href="qlbrand?action=add">Them Brand</a>
        <table border="1px">
                    <tr>
                        <th>ID</th>
                        <th>Brand Name</th>
                        <th>Action</th>
                    </tr>
                <c:forEach var="b" items="${requestScope.listBrand}" >
                    <tr>
                        <td>${b.brand_id}</td>
                        <td>${b.brand_name}</td>
                        <td><a href="qlbrand?action=update&&brand_id=${b.brand_id}" >Update</a> &nbsp; &nbsp; &nbsp; 
                            <a href="qlbrand?action=delete&&brand_id=${b.brand_id}" > Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
    </body>
</html>
