<%-- 
    Document   : GDSuaUser
    Created on : Dec 24, 2023, 5:43:30 PM
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
        <c:set var="user" value="${requestScope.user}" />
        <h1>Trang Cập nhật User</h1>
 
        <!-- Biểu mẫu cập nhật thông tin người dùng -->
        <form action="qluser?action=update" method="post">
            <input type="hidden" name="userId" value="${user.getUser_id()}">
            <label>New Username: </label> <br>
            <input type="text" name="newUsername" value="${user.getUsername()}" readonly><br>
            <input type="hidden" name="newpassword" value="${user.getPassword()}" ><br>

            <label>New Email:</label><br>
            <input type="text" name="newEmail" value="${user.getEmail()}"> <br>
            <label>New Full Name: </label> <br>
            <input type="text" name="newfullname" value="${user.getFull_name()}"><br>
            <label>New Address: </label> <br>
            <input type="text" name="newadress" value="${user.getAddress()}"><br>
            <label>New Phone: </label> <br>
            <input type="text" name="newphone" value="${user.getPhone()}"><br>
            <label>New Admin: </label> <br>
            <input type="text" name="newadmin" value="${user.getIs_admin()}"><br>
            <input type="submit" value="Update">
            <a href="qluser">Back</a>
        </form>
    </body>
</html>
