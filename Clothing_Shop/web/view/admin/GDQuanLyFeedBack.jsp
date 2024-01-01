<%-- 
    Document   : GDQuanLyFeedBack
    Created on : Dec 25, 2023, 8:08:30 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/gdquanlyadmin.css" />" type="text/css" rel="stylesheet"><!-- comment -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Trang Quản Lý FeedBack</h1>
        <h2>Danh Sách FeedBack</h2>
        <div class="container">
        <a href="admin">Trang Chủ</a>
        <table border="1px">
            <tr>
                <th>ID</th>
                <th>UserName</th>
                <th>Product Id</th>
                <th>Product Name</th>
                <th>Product Image</th>
                <th>Rating</th>
                <th>Comment</th>
                <th>Create at</th>

            </tr>
            <c:forEach var="b" items="${requestScope.listfb}" >
                <tr>
                    <td>${b.feedback_id}</td>
                    <td>${b.getUser().getUsername()}</td>
                    <td>${b.getProduct().getProduct_id()}</td>
                    <td>
                        ${b.getProduct().getProduct_name()}
                    </td>
                    <td><img style="width: 200px" src="${b.getProduct().getImage_url()}" alt="alt"/></td>
                    <td>${b.rating}</td>
                    <td>${b.comment}</td>
                    <td>${b.created_at}</td>

                </tr>
                
            </c:forEach>
        </table>
        </div>
    </body>
</html>
