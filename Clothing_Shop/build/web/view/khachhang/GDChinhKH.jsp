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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="<c:url value="/asset/css/style.css" />" type="text/css" rel="stylesheet">
        <!--        <link href="../../asset/css/style.css" type="text/css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <link rel="icon" type="image/x-icon" href="./asset/favicon/icons8-shop-color-96.png">
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
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
            <table border="1px ">
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
                        <td><form id="addToCartForm_${c.product_id}" action="giohang?action=add&&product_id=${c.product_id}" method="post" >

                                <!-- Báo lỗi nếu số lượng vượt quá kho -->
                                <c:if test="${c.stock_quantity lt 1}">
                                    <p style="color: red">Hết hàng</p>
                                </c:if>
                                <c:if test="${c.stock_quantity gt 1}">
                                    <input type="number" name="quantity" required min="1" max="${c.stock_quantity}" onclick="addToCart(${c.product_id})" / >
                                    <input type="submit" value="Them vao gio hang"  />
                                </c:if>

                            </form> &nbsp; &nbsp; &nbsp; 
                            <p style="color: red" id="error_${c.product_id}"></p>
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

<!--        <script>
            function addToCart(productId)

            {
            var quantityInput = document.getElementById('quantity_' + productI                                                     d);
            var errorElement = document.getElementById('error_' + productI                                                     d);
            var selectedQuantity = parseInt(quantityInput.valu                                                     e);
            var maxQuantity = parseInt(quantityInput.getAttribute('max'));
            if (selectedQuantity > maxQuantity) {
            errorElement.textContent = 'Số lượng vượt quá số lượng trong kh                                                     o';
            quantityInput.value = 1;
            event.preventDefault(); // Ngăn chặn form được submit nếu có l                                             ỗi

            } els                                             e {
            errorElement.textContent = ''; // Xóa thông báo lỗi nếu số lượng hợp                                             lệ
            }
            }

        </script>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
                integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
    </body>

</html>
