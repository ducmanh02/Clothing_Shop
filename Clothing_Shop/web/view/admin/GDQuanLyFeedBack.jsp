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
    </head>
    <body>
        <jsp:include page="../components/NavbarAdmin.jsp" ></jsp:include>

        <div class="container pt-5">
            <h2 class="text-center p-4">Danh Sách FeedBack</h2>
            <button class="normal"><a style="text-decoration: none;color: #fff"  href="admin">Trang chủ</a></button>
            <table class="table mt-5 mb-5 align-middle">
                <thead class="table-dark align-middle">
                    <th>ID</th>
                    <th>UserName</th>
                    <th>Product Id</th>
                    <th>Product Name</th>
                    <th>Product Image</th>
                    <th>Rating</th>
                    <th>Comment</th>
                    <th>Create at</th>

                </thead>
                <c:forEach var="b" items="${requestScope.listfb}" >
                    <tr>
                        <td>${b.feedback_id}</td>
                        <td>${b.getUser().getUsername()}</td>
                        <td>${b.getProduct().getProduct_id()}</td>
                        <td>
                            ${b.getProduct().getProduct_name()}
                        </td>
                        <td><img style="width: 150px" src="${b.getProduct().getImage_url()}" alt="alt"/></td>
                        <td>${b.rating}</td>
                        <td>${b.comment}</td>
                        <td>${b.created_at}</td>

                    </tr>

                </c:forEach>
            </table>
        </div>
    </body>
</html>
