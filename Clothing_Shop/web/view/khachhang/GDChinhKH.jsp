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

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <link rel="icon" type="image/x-icon" href="./asset/favicon/icons8-shop-color-96.png">
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>

        <style>
            .active{
                opacity: 0.5;
            }
        </style>
    </head>
    
    <body>
        <jsp:include page="../components/Header.jsp" ></jsp:include>
            <div class="container section-p1 ">
                <div class="searchbox">
                    <form action="chinhsp?action=search" method="post">
                        <div class="input-group flex-nowrap">
                            <span class="input-group-text" id="addon-wrapping">Name Product</span>
                            <input type="text" class="form-control" placeholder="Product You Want To Search" aria-label="Product You Want To Search" aria-describedby="addon-wrapping" name="tuKhoa"">
                            <button class="normal">Search </button>
                        </div>
                    </form>
                </div>
                <div class ="listFilter pt-5 d-flex justify-content-between ">
                    <div class="w-50">
                        <h4>List Brands: </h4>
                        <ul class="list-group w-100  ">
                        <c:forEach var="b" items="${requestScope.listBrand}" >
                            <li class="list-group-item"><a href="chinhsp?action=filter&&brand_id=${b.brand_id}">${b.brand_name}</a></li>
                            </c:forEach>
                    </ul>

                </div>

                <div class="w-50">
                    <h4>List Categories: </h4>
                    <ul class="list-group w-100  ">
                        <c:forEach var="b" items="${requestScope.listCategory}" >
                            <li class="list-group-item"><a href="chinhsp?action=filter&&category_id=${b.category_id}">${b.category_name}</a></li>
                            </c:forEach>
                    </ul>

                </div>
            </div>

            <section id="product1">
                <h2>New Arrivals</h2>
                <p>Summer Collection New Modern Design</p>
                <div class="product_container list">

                    <c:forEach items="${requestScope.listProduct}" var="c">
                        <div class="product item">
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
                                            <span>Stock: ${c.stock_quantity}</span>
                                        </div>
                                        <input type="number" name="quantity" required min="1" max="${c.stock_quantity}"  value="1" / >
                                        <button  >Add To Cart</button> 
                                    </c:if>
                                </form>
                            </div>
                        </div>
                    </c:forEach>   
                </div>
            </section>
            <div id="pagination" class="listPage section-p1">
                <a class="active" href="#">1</a>
                <a href="">2</a>

                <a href=""><i class="fal fa-long-arrow-alt-right"></i></a>
            </div>
            <hr><!-- comment -->
            <section id="product1">
                <h2>Top 8 Sản Phẩm Bán Chạy</h2>
                <div class="product_container">

                    <c:forEach items="${requestScope.listProductTK}" var="c" begin="0" end="7">
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


        <jsp:include page="../components/Footer.jsp"/>
        <script>
            let thisPage = 1;
            let limit = 12;
            let list = document.querySelectorAll('.list .item');
            
            function loadItem(){
                let beginGet = limit * (thisPage - 1);
                let endGet = limit * thisPage - 1;
                list.forEach((item, key)=>{
                    if(key>= beginGet && key <= endGet){
                        item.style.display = 'block';
                        
                    }else{
                        item.style.display = 'none';
                    }
                });
                listPage();
                console.log("1");
            }
            loadItem();
            function listPage(){
                let count = Math.ceil(list.length / limit);
                document.querySelector('.listPage').innerHTML = '';
                for(let i = 1 ; i<= count; i++){
                    let newPage = document.createElement('a');
                    newPage.innerText = i;
                    if(i == thisPage){
                        newPage.classList.add('active');
                    }
                    newPage.setAttribute('onclick', "changePage(" + i + ")" );
                    document.querySelector('.listPage').appendChild(newPage);
                    
                };
            };
            function changePage(i){
                thisPage = i;
                loadItem();
            };
            
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
                integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
    </body>

</html>
