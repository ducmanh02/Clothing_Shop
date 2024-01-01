<%-- 
    Document   : GDSuaBrand
    Created on : Dec 24, 2023, 10:00:28 PM
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
    <h1>Trang Cập nhật Brand</h1>
    <form action="qlbrand?action=update&brand_id=${b.brand_id}" method="post">
        <label>Tên Brand :</label> <br/>
        <input type="text" name="brand_name" value="${b.brand_name}" required/>
        <br>
        <input type="submit" value="Update">
        <a href="qlbrand">Back</a>
        <p style="color:red">${requestScope.error}</p>
    </form>
</html>
