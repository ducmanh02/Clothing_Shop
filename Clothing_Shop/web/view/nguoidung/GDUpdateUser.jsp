<%-- 
    Document   : GDUpdateUser
    Created on : Nov 17, 2023, 11:46:34 AM
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
    </head>
    <style>
        .container{
            padding-top: 15vh;
        }
    </style>

    <body>
        <jsp:include page="../components/Header.jsp" ></jsp:include>

        <c:set var="user" value="${requestScope.user}" />

 



        <div class="container d-flex justify-content-center ">

            <form class="boxForm w-50 " action="user?action=update" method="post">

                <h2 class="text-center p-3">Update Account Information</h2>

                <input type="hidden" name="userId" value="${user.getUser_id()}">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Username:</label>
                    <p>${user.getUsername()}</p>
                    <input type="text" class="form-control" id="exampleFormControlInput1" name="newUsername" value="${user.getUsername()}" hidden>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">New Password:</label>
                    <input type="password" class="form-control" id="exampleFormControlInput1" name="newpassword" value="${user.getPassword()}">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">New Full Name: </label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com" name="newfullname" value="${user.getFull_name()}">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">New Email:</label>
                    <input type="email" class="form-control" id="exampleFormControlInput1" name="newEmail" value="${user.getEmail()}">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">New Address:</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" name="newadress" value="${user.getAddress()}">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">New Phone:</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" name="newphone" value="${user.getPhone()}">
                </div>
                <span style="color: red">${requestScope.error}</span>
                <div class="mt-3 text-center">
                    <button class="normal ">Update</button>
                    <button class=" btn btn-secondary normal "><a class="text-decoration-none" style="color: #FFF" href="chinhsp">Back</a></button>
                    
                </div>



            </form>



        </div>
        <jsp:include page="../components/Footer.jsp"/>     
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>


</html>
