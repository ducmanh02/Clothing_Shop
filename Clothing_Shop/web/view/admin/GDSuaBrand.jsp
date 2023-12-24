<%-- 
    Document   : GDSuaBrand
    Created on : Dec 24, 2023, 10:00:28 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <h1>Trang Sua Brand</h1>
    <form action="qlbrand?action=update&brand_id=${b.brand_id}" method="post">
        <label>Ten Brand :</label> <br/>
        <input type="text" name="brand_name" value="${b.brand_name}" required/>
        <br>
        <input type="submit" value="Update">
        <p style="color:red">${requestScope.error}</p>
    </form>
</html>
