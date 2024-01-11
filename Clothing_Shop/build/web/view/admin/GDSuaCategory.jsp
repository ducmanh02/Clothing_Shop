<%-- 
    Document   : GDSuaCategory
    Created on : Dec 24, 2023, 10:00:36 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/gdupdate.css" />" type="text/css" rel="stylesheet"><!-- comment -->
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
        <title>Add Brand</title>
    </head>
    <body>
        <jsp:include page="../components/NavbarAdmin.jsp" ></jsp:include>
            <div class="container ">

                <div class="container d-flex  justify-content-center">

                    <form class="boxForm w-50 " action="qlcategory?action=update&category_id=${c.category_id}" method="post">
                    <h1 class="text-center p-3">Update Category: </h1>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInput" placeholder="brand name" name="category_name" value="${c.category_name}" required>
                        <label for="floatingInput">Category Name: </label>
                    </div>
                    <span style="color: red">${requestScope.error}</span>
                    <div class="mt-3 text-center">
                        <button class="normal ">Update</button>

                        
                    </div>
                </form>

                    
            </div>

        </div>
    </body>
</html>
