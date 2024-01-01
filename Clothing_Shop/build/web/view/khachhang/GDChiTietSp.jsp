<%-- 
    Document   : GDChiTietSp
    Created on : Nov 16, 2023, 6:39:33 PM
    Author     : ducmanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/chitietsp.css" />" type="text/css" rel="stylesheet">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/asset/css/style.css" />" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="icon" type="image/x-icon" href="./asset/favicon/icons8-shop-color-96.png">
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>

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
                <div class="top">
                    <div class="card">
                    <div class="left">
                         <c:set var="c" value="${requestScope.Product}" />
                        <img style="width:400px" src="${c.image_url}" alt="${c.product_name}">
                    </div>
                    <div class="right">
                        <table>
                            <tr>
                                <th>Mã Sản Phẩm: </th>
                                <td>${c.product_id}</td>
                            </tr>
                            <tr>
                                <th>Tên Sản Phẩm: </th>
                                <td>${c.product_name}</td>
                            </tr>
                            <tr>
                                <th>Mô tả: </th>
                                <td>${c.description}</td>
                            </tr>
                            <tr>
                                <th>Giá: </th>
                                <td>${c.price}</td>
                            </tr>
                            <tr>
                                <th>Stock: </th>
                                <td>${c.stock_quantity}</td>
                            </tr>
                            <tr>
                                <th>Brand: </th>
                                <td>${c.brand.brand_name}</td>
                            </tr>
                            <tr>
                                <th>Category </th>
                                <td>${c.category.category_name}</td>
                            </tr>
                            <tr>
                                <th>Kích cỡ </th>
                                <td>${c.size}</td>
                            </tr>
                            <tr>
                                <th>Đã bán </th>
                                <td>${c.total_sold}</td>
                            </tr>
                        </table>
                        <form action="giohang?action=add&&product_id=${c.product_id}" method="post" >
                <!-- Báo lỗi nếu số lượng vượt quá kho -->
                                <c:if test="${c.stock_quantity lt 1}">
                                    <p style="color: red">Hết hàng</p>
                                </c:if>
                                <c:if test="${c.stock_quantity ge 1}">
                                    <input type="number" name="quantity" required min="1" max="${c.stock_quantity}" onclick="addToCart(${c.product_id})" / >
                                    <input type="submit" value="Them vao gio hang"  />
                                </c:if>
                            <p style="color: red">${requestScope.errorStock}</p>
                        </form>
                    </div>
                </div>
                </div>
                    
                
            <br>
            
            <hr>

            <div class="bottom">
                <div class="feedback">
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
                </div>
                        <hr><!-- comment -->
                        <h3 style="padding:20px;">Đánh giá khách hàng</h3>
                        <br> 
                        <div class="danhgia"">    
                            
                            <c:forEach items="${requestScope.listFeedback}" var="c">
                            <div class="single-comment">
                                    <div class="name">
                                        ${c.getUser().getUsername()}
                                    </div>
                                    <div class="rate">
                                        <p>Đánh giá: ${c.rating}</p>
                                    </div>
                                    <div class="time">
                                        ${c.created_at}
                                    </div>
                                    <div class="binhluan">
                                        ${c.comment}
                                    </div>                                
                            </div>
                            </c:forEach>
                        </div>
                        <br><!-- comment -->
                        <hr>
                        <h3 style="padding:20px">Products Liên quan</h3>
                        <div class="lienquan">
                        
                            <c:forEach items="${requestScope.listProduct}" var="c">
                            <div class="single-product">
                                    <div class="product-image">
                                        <img style="width:200px"  src="${c.image_url}" alt="${c.product_name}">
                                    </div>
                                    <div class="name">
                                        <h3><a href="chitietsp?product_id=${c.product_id}" >${c.product_name}</a></h3>
                                    </div>
                                    <div class="price">
                                        <span>${c.price}</span>
                                    </div>
                                    <div class="action">
                                        <form id="addToCartForm_${c.product_id}" action="giohang?action=add&&product_id=${c.product_id}" method="post" >

                                        <!-- Báo lỗi nếu số lượng vượt quá kho -->
                                        <c:if test="${c.stock_quantity lt 1}">
                                            <p style="color: red">Hết hàng</p>
                                        </c:if>
                                        <c:if test="${c.stock_quantity ge 1}">
                                            <input type="number" name="quantity" required min="1" max="${c.stock_quantity}" onclick="addToCart(${c.product_id})" / >
                                            <input type="submit" value="Add Cart"  />
                                        </c:if>

                                       </form>
                                    </div>
                            </div>
                            </c:forEach>
                    </div>
                    </div>
            </div>
            <jsp:include page="../components/Footer.jsp"/>

    </body>
</html>
