<%-- 
    Document   : GDChiTietSp
    Created on : Nov 16, 2023, 6:39:33 PM
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
        <h1>Trang Chi Tiet San pham</h1>

        <h3>Chi Tiet San Pham</h3>
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
                <th>ToTal Sold</th>
            </tr>


            <c:set var="c" value="${requestScope.Product}" />
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
            </tr>


        </table>
        <h4><a href="" >Them vao gio hang</a></h4>
        <hr>


        <h3>Feedback</h3>
        <form action="chitietsp?action=addFeedback&&product_id=${requestScope.Product.product_id} " method="post">
            <label for="comment">Comment:</label>
            <textarea id="comment" name="comment" rows="4" cols="50" required></textarea><br>

            <label for="rating">Rating:</label>
            <select id="rating" name="rating" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select><br>

            <!-- Thêm một trường ẩn để lưu trữ thời gian tạo -->
            <input type="hidden" id="created_at" name="created_at" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %>">


            <input type="submit" value="Thêm Feedback">
        </form>

        <table border="1px">
            <tr>
                <th>ID</th><!-- comment -->
                <th>Username</th><!-- comment -->
                <th>Rating</th>
                <th>Comment</th> 
                <th>Created_at</th>  
            </tr>


            <c:forEach items="${requestScope.listFeedback}" var="c">
                <tr>
                    <td>${c.feedback_id}</td><!-- comment -->
                    <td>${c.user_id}</td><!-- comment -->
                    <td>${c.rating}</td>
                    <td>${c.comment}</td> 
                    <td>${c.created_at}</td>  
                </tr>
            </c:forEach>
        </table>
        <hr>
        <h3>Products Liên quan</h3>
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
                <th>ToTal Sold</th>
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
                    <td>${c.brand.brand_id} </td>  
                    <td>${c.category.category_id}</td>  
                    <td>${c.size}</td>
                    <td>${c.total_sold}</td>
                    <td><img src="${c.image_url}" alt="${c.product_name}"></td>
                    <td><a href="" >Add to cart</a> &nbsp; &nbsp; &nbsp; 
                        <a href="chitietsp?product_id=${c.product_id}" > Chi tiết sản phẩm</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
