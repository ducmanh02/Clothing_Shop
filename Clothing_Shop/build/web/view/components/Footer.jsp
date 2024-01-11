
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/asset/css/footer.css" />" type="text/css" rel="stylesheet"><!-- comment -->

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./../../asset/css/style.css"/>
        <title>JSP Page</title>
    </head>

    <body>

        <section id="newsletter" class="section-p1 section-m1" >
            <div class="newstext">
                <h4>Sign Up For Newsletter</h4>
                <p>Get E-mail updates about our latest shop and <span>special offers</span></p>
            </div>
            <div class="form">
                <input type="text" name="" id="" placeholder="Your email here">
                <button class="normal">Sign Up</button>
            </div>
        </section>

        <footer class="section-p1">
            <div class="col">
                <img class="logo" src="/img/logo.png" alt="">
                <h4>Contact</h4>
                <p><strong>Address: </strong>100 Nguyen Trai street, Thanh Xuan, Ha Noi</p>
                <p><strong>Phone: </strong>0123456789</p>
                <p><strong>Hours: </strong>10:00 - 22:00. Mon - Sat</p>
                <div class="follow">
                    <h4>Follow Us</h4>
                    <div class="icon">
                        <a href=""><i class="fab fa-facebook-f"></i></a></i>
                        <a href=""><i class="fab fa-twitter"> </i></a>
                        <a href=""><i class="fab fa-instagram"> </i></a> 
                        <a href=""><i class="fab fa-pinterest-p"> </i></a>
                        <a href=""><i class="fab fa-youtube"> </i></a>
                    </div>
                </div>
            </div>
            <div class="col">
                <h4>About</h4>
                <a href="#">About us</a>
                <a href="#">Delivery Information</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Terms & Conditions</a>
                <a href="#">Contact us</a>
            </div>

            <div class="col">
                <h4>My Account</h4>
                <a href="#">Sign In</a>
                <a href="#">View Cart</a>
                <a href="#">My Wishlist</a>
                <a href="#">Track My Order</a>
                <a href="#">Help</a>
            </div>

            <div class="col install">
                <h4>Install App</h4>
                <p>From App Store or Google Play</p>
                <div class="row">
                    <img src="asset/pay/app.jpg" alt="">
                    <img src="asset/pay/play.jpg" alt="">
                </div>
                <p>Secured Payment Gateways</p>
                <img src="asset/pay/pay.png" alt="">
            </div>


        </footer>
        <div class="copyright section-p1">
            <p> 2023, HANOI</p>
        </div>
    </body>
</html>
