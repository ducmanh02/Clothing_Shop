<%-- 
    Document   : GDThemCategory
    Created on : Dec 24, 2023, 9:57:36 PM
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
        <h1>Trang Thêm Category</h1>
        <form action="qlcategory?action=add" method="post">
            <label>Tên Category :</label> <br/>
            <input type="text" name="category_name" required/>
            <br>
            <input type="submit" value="Add">
            <a href="qlcategory">Back</a>
            <p style="color:red">${requestScope.error}</p>
        </form>
    </body>
</html>
