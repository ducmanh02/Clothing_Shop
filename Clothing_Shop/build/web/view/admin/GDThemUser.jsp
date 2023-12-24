<%-- 
    Document   : GDThemUser
    Created on : Dec 24, 2023, 5:43:38 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h2>Đăng ký người dùng</h2>
        <form action="qluser?action=add" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required ><br>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password"  required><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>

            <label for="full_name">Full Name:</label>
            <input type="text" id="full_name" name="full_name" required><br>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required><br>

            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" required><br>

            <label for="is_admin">Is Admin:</label>
            <input type="number" id="is_admin" name="is_admin" value="0" required><br>

            <input type="submit" value="Add User">
        </form>
    </body>
</html>
