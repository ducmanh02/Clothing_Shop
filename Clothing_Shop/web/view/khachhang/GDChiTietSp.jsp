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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" >
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
        <c:set var="c" value="${requestScope.Product}" />
        <div class="container">

            <section id="prodetails" >
                <div class="single-pro-img">
                    <img src="${c.image_url}" alt="${c.product_name}" width="100%" id="MainImg" >

                </div>
                <div class="single-pro-details">
                    <h6>Home / ${c.category.category_name}</h6>

                    <h4>${c.product_name}</h4>

                    <h2>$${c.price}</h2>
                    <form action="giohang?action=add&&product_id=${c.product_id}" method="post" >
                        <!-- Báo lỗi nếu số lượng vượt quá kho -->
                        <c:if test="${c.stock_quantity lt 1}">
                            <p style="color: red">Hết hàng</p>
                        </c:if>
                        <c:if test="${c.stock_quantity ge 1}">
                            <input type="number" name="quantity" required min="1" max="${c.stock_quantity}"  value="1" / >
                            <button class="normal">Add To Cart</button>
                        </c:if>
                        <p style="color: red">${requestScope.errorStock}</p>
                    </form>

                    <h6>Size: ${c.size}</h6>
                    <h6>Stock: ${c.stock_quantity} </h6>
                    <h6>Sold: ${c.total_sold} </h6>
                    <h6>Brand: ${c.brand.brand_name}</h6>
                    <h4>Product Details</h4>
                    <span>
                        ${c.description}.</span>
                </div>
            </section>




            <br>

            <hr>

            <div class="feedback mt-5">
                <h3>Feedback</h3>
                <form action="chitietsp?action=addFeedback&&product_id=${requestScope.Product.product_id} " method="post">
                    <select class="form-select mb-3" name="rating">

                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Leave Your Feedback Here</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" name="comment" rows="3"></textarea>
                        <!-- Thêm một trường ẩn để lưu trữ thời gian tạo -->
                        <input type="hidden" id="created_at" name="created_at" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %>">
                    </div>
                    <button class="form-button normal">Submit</button>
                </form>

                <hr><!-- comment -->
                <h3 >All Feedback</h3>
                <br> 

                <c:forEach items="${requestScope.listFeedback}" var="c">


                    <div class="card w-100 mb-3" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">${c.getUser().getUsername()}</h5>
                            <h6 class="card-subtitle mb-2 text-body-secondary">${c.created_at}</h6>
                            <p class="card-text">Rating: ${c.rating}/5</p>
                            <p class="card-text">${c.comment}</p>
                            
                        </div>
                    </div>
                </c:forEach>

            </div>


            <section id="product1">
                <h2>Featured Products</h2>
                <div class="product_container ">

                    <c:forEach items="${requestScope.listProduct}" var="c" begin="0" end="3">
                        <div class="product">
                            <img src="${c.image_url}" alt="${c.product_name}">
                            <div class="product_description">
                                <span>${c.getBrand().getBrand_name()}</span>
                                <h5><a href="chitietsp?product_id=${c.product_id}" >${c.product_name}</a></h5>
                                <div class="star">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <h4>$ ${c.price}</h4>
                                <form id="addToCartForm_${c.product_id}" action="giohang?action=add&&product_id=${c.product_id}" method="post" >

                                    <!-- Báo lỗi nếu số lượng vượt quá kho -->
                                    <c:if test="${c.stock_quantity lt 1}">
                                        <span style="color: red; margin-top: 10px;">Hết hàng</span>
                                    </c:if>
                                    <c:if test="${c.stock_quantity ge 1}">
                                        <div class="hang">
                                            <span>Sold: ${c.total_sold}</span>
                                        </div>
                                        <div class="hang">
                                            <span>Stock: ${c.stock_quantity}</span>
                                        </div>
                                        <input type="number" name="quantity" required min="1" max="${c.stock_quantity}"  value="1"/ >
                                        <button  >Add To Cart</button> 
                                    </c:if>
                                </form>
                            </div>
                        </div>
                    </c:forEach>   
                </div>
            </section>



        </div>
    </div>
    <jsp:include page="../components/Footer.jsp"/>

</body>
</html>
