<%-- 
    Document   : GDSignup
    Created on : Nov 17, 2023, 10:28:19 AM
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
        
        <h1>Trang Sign Up</h1>
        <form action="user?action=signup" method="post">
            <label>Username: </label> <br>
            <input type="text" name="username"><br>
            <label>Password:</label><br>
            <input type="password" name="password"> <br>
            <label>Repeat Password:</label><br>
            <input type="password" name="password_repeat"> <br>
            <input type="submit" value="Sign Up">
        </form>
        <h3 style="color: red">${requestScope.error}</h3>
        <a href="user?action=login">Đã có tài khoản</a>
    </body>
</html>
