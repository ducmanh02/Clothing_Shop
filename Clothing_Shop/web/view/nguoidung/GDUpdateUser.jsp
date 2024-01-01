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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Giao Diện thông tin người dùng</h1>

        <c:set var="user" value="${requestScope.user}" />
       
        <!-- Biểu mẫu cập nhật thông tin người dùng -->
        <form action="user?action=update" method="post">
            <input type="hidden" name="userId" value="${user.getUser_id()}">
            <label>Username: </label> 
            <input style="border: none" type="text" name="newUsername" value="${user.getUsername()}"><br>
            <label>New Password: </label> <br>
            <input type="password" name="newpassword" value="${user.getPassword()}"><br>

            <label>New Email:</label><br>
            <input type="text" name="newEmail" value="${user.getEmail()}"> <br>
            <label>New Full Name: </label> <br>
            <input type="text" name="newfullname" value="${user.getFull_name()}"><br>
            <label>New Address: </label> <br>
            <input type="text" name="newadress" value="${user.getAddress()}"><br>
            <label>New Phone: </label> <br>
            <input type="text" name="newphone" value="${user.getPhone()}"><br>
            <input type="submit" value="Update">
            <a href="chinhsp">Back</a>
        </form>
    </body>
</html>
