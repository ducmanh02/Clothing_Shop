<%-- 
    Document   : GDThemUser
    Created on : Dec 24, 2023, 5:43:38 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../components/NavbarAdmin.jsp" ></jsp:include>
            <div class="container ">

            <div class="container d-flex justify-content-center ">

                <form class="boxForm w-50 " action="qluser?action=add" method="post">
                    <h1 class="text-center p-3">Create User</h1>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInput" placeholder="username" name="username" required>
                        <label for="floatingInput">Username:</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password" required>
                        <label for="floatingPassword">Password</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" id="floatingInput" placeholder="username" name="email">
                        <label for="floatingInput">Email:</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInput" placeholder="username" name="full_name" >
                        <label for="floatingInput">Full Name:</label>
                    </div> 
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInput" placeholder="username" name="address" >
                        <label for="floatingInput">Address:</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInput" placeholder="username" name="phone" >
                        <label for="floatingInput">Phone:</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="floatingInput" name="is_admin" value="0" required min="0" max="1">
                        <label for="floatingInput">Is Admin:</label>
                    </div>
                    <span style="color: red">${requestScope.error}</span>
                    <div class="mt-3 text-center">
                        <button class="normal ">Create</button>
                    </div>



                </form>



            </div>

        </div>
    </body>
</html>
