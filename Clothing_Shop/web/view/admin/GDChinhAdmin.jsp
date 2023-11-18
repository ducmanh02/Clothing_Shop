<%-- 
    Document   : GDChinhAdmin
    Created on : Nov 15, 2023, 4:24:59 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Trang Admin!</h1>
        <h3>Hello, ${sessionScope.account.username}</h3>
        <h3>Thong ke san pham ban chay se o day</h3>
        
        <br>
        <hr><!-- comment -->
        <h3><a href="">Quan Ly Category</a></h3>
        <h3><a href="">Quan ly Brand</a></h3>
        <h3><a href="qlsp" >Quan ly san pham</a></h3>
        <h3><a href="">Quan ly Don Hang</h3>
        
    </body>
</html>
