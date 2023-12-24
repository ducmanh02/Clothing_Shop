<%-- 
    Document   : GDThemCategory
    Created on : Dec 24, 2023, 9:57:36 PM
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
        <h1>Trang Them Category</h1>
        <form action="qlcategory?action=add" method="post">
            <label>Ten Category :</label> <br/>
            <input type="text" name="category_name" required/>
            <br>
            <input type="submit" value="Add">
            <p style="color:red">${requestScope.error}</p>
        </form>
    </body>
</html>
