<%-- 
    Document   : GDLogin
    Created on : Nov 17, 2023, 10:28:03 AM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/login.css" />" type="text/css" rel="stylesheet"><!-- comment -->

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Trang Login</h1>

        <form action="user?action=login" method="post">
            <label>Username: </label> <br>
            <input type="text" name="username"><br>
            <label>Password:</label><br>
            <input type="password" name="password"> <br>
            <input type="submit" value="Login">
        </form>
        <h3 style="color: red">${requestScope.error}</h3>
        <a href="user?action=signup">Tạo Tài khoản</a>
    </body>
</html>
