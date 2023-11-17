<%-- 
    Document   : GDHome
    Created on : Nov 17, 2023, 11:05:35 AM
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
        <h1>Trang Home</h1>
        <c:if test="${sessionScope.account ne null}">
            <h3>Hello, ${sessionScope.account.username}</h3>
            <h4><a href="logout">Logout</a></h4>
        </c:if>
        <c:if test="${sessionScope.account eq null}">
            
            <h4><a href="login">Login</a></h4>
            <h4><a href="signup">Sign Up</a></h4>
        </c:if>
        <a href="chinhsp">Xem San Pham</a>

    </body>
</html>
