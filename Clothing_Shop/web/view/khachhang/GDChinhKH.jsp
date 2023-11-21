<%-- 
    Document   : GDChinhKH
    Created on : Nov 15, 2023, 4:23:46 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../asset/css/style.css" type="text/css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <style>
        .container {
            padding-top: 15vh;

        }
    </style>
    <body>
        <jsp:include page="../components/Header.jsp" ></jsp:include>
            <div class="container">
                <h1>GD Chinh Khách Hàng</h1>
                <h3>Brand</h3>
                <table border="1px">
                    <tr>
                        <th>ID</th>
                        <th>Brand Name</th>
                    </tr>
                <c:forEach var="b" items="${requestScope.listBrand}" >
                    <tr>
                        <td>${b.brand_id}</td>
                        <td><a href="chinhsp?action=filter&&brand_id=${b.brand_id}">${b.brand_name}</a></td>
                    </tr>
                </c:forEach>
            </table>
            <h3>Category</h3>
            <table border="1px">
                <tr>
                    <th>ID</th>
                    <th>Category Name</th>
                </tr>
                <c:forEach var="b" items="${requestScope.listCategory}" >
                    <tr>
                        <td>${b.category_id}</td>
                        <td><a href="chinhsp?action=filter&&category_id=${b.category_id}">${b.category_name}</a></td>
                    </tr>
                </c:forEach>
            </table>
            <h3>Tim Kiem san pham</h3>
            <form action="chinhsp?action=search" method="post">
                <input type="text" name="tuKhoa" placeholder="Nhap tu khoa">
                <input type="submit" value="Search">
            </form>

            <h3>Products</h3>
            <table border="1px">
                <tr>
                    <th>ID</th><!-- comment -->
                    <th>Name</th><!-- comment -->
                    <th>Description</th>
                    <th>Price</th> 
                    <th>Stock quantity</th>  
                    <th>Brand </th>  
                    <th>category</th>  
                    <th>size</th>
                    <th>Image</th>
                    <th>Action</th>
                </tr>


                <c:forEach items="${requestScope.listProduct}" var="c">
                    <tr>
                        <td>${c.product_id}</td><!-- comment -->
                        <td>${c.product_name}</td><!-- comment -->
                        <td>${c.description}</td>
                        <td>${c.price}</td> 
                        <td>${c.stock_quantity}</td>  
                        <td>${c.brand.brand_name} </td>  
                        <td>${c.category.category_name}</td>  
                        <td>${c.size}</td>
                        <td><img src="${c.image_url}" alt="${c.product_name}"></td>
                        <td><form action="giohang?action=add&&product_id=${c.product_id}" method="post" >
                                <input type="number" name="quantity" required="Nhap so luong" />
                                <input type="submit" value="Them vao gio hang" />
                            </form> &nbsp; &nbsp; &nbsp; 
                            <a href="chitietsp?product_id=${c.product_id}" > Chi tiết sản phẩm</a>
                        </td>
                    </tr>
                </c:forEach>

            </table>


            <hr><!-- comment -->
            <h3>Products Sort By bán chạy</h3>
            <table border="1px" >
                <tr>
                    <th>ID</th><!-- comment -->
                    <th>Name</th><!-- comment -->
                    <th>Description</th>
                    <th>Price</th> 
                    <th>Stock quantity</th>  
                    <th>Brand </th>  
                    <th>category</th>  
                    <th>size</th>
                    <th>Image</th>
                    <th>ToTal Sold</th>
                    <th>Action</th>
                </tr>


                <c:forEach items="${requestScope.listProductTK}" var="c">
                    <tr>
                        <td>${c.product_id}</td><!-- comment -->
                        <td>${c.product_name}</td><!-- comment -->
                        <td>${c.description}</td>
                        <td>${c.price}</td> 
                        <td>${c.stock_quantity}</td>  
                        <td>${c.brand.brand_name} </td>  
                        <td>${c.category.category_name}</td>  
                        <td>${c.size}</td>
                        <td><img src="${c.image_url}" alt="${c.product_name}"></td>
                        <td>${c.total_sold}
                        </td>
                        <td><form action="giohang?action=add&&product_id=${c.product_id}" method="post" >
                                <input type="number" name="quantity" required="Nhap so luong" />
                                <input type="submit" value="Them vao gio hang" />
                            </form> &nbsp; &nbsp; &nbsp; 
                            <a href="chitietsp?product_id=${c.product_id}" > Chi tiết sản phẩm</a>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </body>
</html>
