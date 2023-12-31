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
        <link href="<c:url value="/asset/css/gdchinh.css" />" type="text/css" rel="stylesheet">
        <!--        <link href="../../asset/css/style.css" type="text/css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <link rel="icon" type="image/x-icon" href="./asset/favicon/icons8-shop-color-96.png">
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        
          <style>
body {
   background: linear-gradient(to bottom, pink, #f2f2f2);

}
  </style>
    </head>
    <style>
        .container {
            padding-top: 15vh;
        }
    </style>
    <body>
        <jsp:include page="../components/Header.jsp" ></jsp:include>
    <div class="container">
        <div class="timkiem">
            <form action="chinhsp?action=search" method="post">
                <input type="text" name="tuKhoa" placeholder="Nhap tu khoa">
                <input type="submit" value="Search">
            </form>
        </div>
        <div class ="under">
            <div class="left">
                <div class="brand">
                    <table>
                    <tr>
                        <th>Brand Name</th>
                    </tr>
                    <c:forEach var="b" items="${requestScope.listBrand}" >
                        <tr>
                            <td><a href="chinhsp?action=filter&&brand_id=${b.brand_id}">${b.brand_name}</a></td>
                        </tr>
                    </c:forEach>
                    </table>
                </div>
                <div class="brand">
                    <table>
                    <tr>
                        <th>Category</th>
                    </tr>
                    <c:forEach var="b" items="${requestScope.listCategory}" >
                        <tr>
                            <td><a href="chinhsp?action=filter&&category_id=${b.category_id}">${b.category_name}</a></td>
                        </tr>
                    </c:forEach>
                    </table>
                </div>
            </div>
                
                        
            <div class="right">
                    <div class="top">
                            <c:forEach items="${requestScope.listProduct}" var="c">
                            <div class="single-product">
                                    <div class="product-image">
                                        <img style="width:200px"  src="${c.image_url}" alt="${c.product_name}">
                                    </div>
                                    <div class="name">
                                        <h3><a href="chitietsp?product_id=${c.product_id}" >${c.product_name}</a></h3>
                                    </div>
                                   
                                    <div class="price">
                                        <span>${c.price}$</span>
                                    </div>
                                    
                                    <div class="action">
                                        <form id="addToCartForm_${c.product_id}" action="giohang?action=add&&product_id=${c.product_id}" method="post" >

                                        <!-- Báo lỗi nếu số lượng vượt quá kho -->
                                        <c:if test="${c.stock_quantity lt 1}">
                                            <p style="color: red; margin-top: 10px;">Hết hàng</p>
                                        </c:if>
                                        <c:if test="${c.stock_quantity ge 1}">
                                            <div class="hang">
                                                <span>Số hàng: ${c.stock_quantity}</span>
                                            </div>
                                            <input type="number" name="quantity" required min="1" max="${c.stock_quantity}" onclick="addToCart(${c.product_id})" / >
                                            <input type="submit" value="Add Cart"  />
                                        </c:if>

                                       </form>
                                    </div>
                            </div>
                            </c:forEach>
                    </div>

                    <hr><!-- comment -->
                    <h3>Products Sort By bán chạy</h3>
                    <div class="last">
                        <c:forEach items="${requestScope.listProductTK}" var="c" begin="0" end="3">
                    <div class="single-product">

                            <div class="product-image">
                                <img style="width:200px"  src="${c.image_url}" alt="${c.product_name}">
                            </div>
                            <div class="name">
                                <h3><a href="chitietsp?product_id=${c.product_id}" >${c.product_name}</a></h3>
                            </div>
                            <div class="price">
                                <span>${c.price}$</span>
                            </div>
                            <div class="sold">
                                <h4>Đã bán: ${c.total_sold}</h4>
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
    </div>
        <jsp:include page="../components/Footer.jsp"/>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
                integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
    </body>

</html>
