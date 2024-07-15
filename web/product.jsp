<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"
              />

        <!-- Icon -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
        <!-- icon -->

        <!-- Google fonts End -->

        <!-- custon style Sheet & JavaScript -->
        <link rel="stylesheet" href="css/shoppage/index.css" />
        <link rel="stylesheet" href="css/shoppage/shop.css" />
        <link rel="stylesheet" href="css/shoppage/blog.css" />
        <link rel="stylesheet" href="css/shoppage/product.css" />
        <link rel="stylesheet" href="css/shoppage/contactus.css" />
        <script src="js/shoppage/index.js" defer></script>
        <script src="js/shoppage/product.js" defer></script>
        <style>
            .slider-container {
                position: relative;
                max-width: 600px;
                margin: auto;
                overflow: hidden;
            }

            .slider {
                display: flex;
                transition: transform 0.5s ease-in-out;
            }

            .slide {
                min-width: 100%;
                box-sizing: border-box;
            }

            .slide img {
                width: 100%;
                display: block;
            }

            .prev, .next {
                cursor: pointer;
                position: absolute;
                top: 50%;
                width: auto;
                padding: 16px;
                margin-top: -22px;
                color: white;
                font-weight: bold;
                font-size: 18px;
                transition: 0.6s ease;
                user-select: none;
                border: none;
            }

            .next {
                right: 0;
            }

            .prev:hover, .next:hover {
                background-color: rgba(0, 0, 0, 0.8);
            }
        </style>
        <!-- custon style Sheet & JavaScript -->
        <title>Ecommerce Website</title>
    </head>
    <body class="home">
        <header class="primary-header container flex">
            <div class="header-inner-one flex">
                <div class="logo">
                    <img src="img/logo.png" alt="" />
                </div>
                <button
                    class="mobile-close-btn"
                    data-visible="false"
                    aria-controls="primary-navigation"
                    >
                    <i class="uil uil-times-circle"></i>
                </button>
                <nav>
                    <ul
                        id="primary-navigation"
                        data-visible="false"
                        class="primary-navigation flex"
                        >
                        <li>
                            <a class="fs-100 fs-montserrat bold-500" href="home"
                               >Home</a
                            >
                        </li>
                        <li>
                            <a class="fs-100 fs-montserrat bold-500" href="shop"
                               >Shop</a
                            >
                        </li>
                        <li>
                            <a class="fs-100 fs-montserrat bold-500" href="aboutus.jsp"
                               >About Us</a
                            >
                        </li>
                        <li>
                            <a class="fs-100 fs-montserrat bold-500" href="blog.jsp"
                               >Blog</a
                            >
                        </li>
                        <li>
                            <a class="fs-100 fs-montserrat bold-500" href="contactus.jsp"
                               >Contact Us</a
                            >
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="header-login flex">
                <p class="fs-100 fs-montserrat bold-500">login</p>
                <i class="uil uil-search"></i>
                <i
                    id="cart-box"
                    aria-controls="cart-icon"
                    class="uil uil-shopping-bag"
                    ></i>

                <!-- =================1111111111================== -->
                <div id="cart-icon" data-visible="false" class="cart-icon">
                    <div class="shopping flex">
                        <p>Shopping Basket</p>
                        <i id="cross-btn" class="uil uil-times"></i>
                    </div>
                    <div class="cart bold-800 flex">
                        <i class="uil uil-shopping-cart-alt"></i>
                        <p>Cart Is Empty</p>

                        <!-- ================================================== -->

                        <!-- ================================================== -->
                    </div>
                </div>
            </div>
            <div class="mobile-open-btn"><i class="uil uil-align-right"></i></div>
        </header>

        <!-- ==================Single Product-============================= -->
        <section class="single-product grid">
            <div class="slider-container">
                <div class="slider">
                    <div class="slide">
                        <img style="width: 400px; height: 400px" src="${pro.img}" alt="Product Image 1">
                    </div>
                    <c:forEach items="${pic}" var="p">
                        <div class="slide">
                            <img style="width: 400px; height: 400px" src="${p.img_link}" alt="Product Image 2">
                        </div>
                    </c:forEach>
                    <!-- Add more slides as needed -->
                </div>
                <button class="prev" onclick="plusSlides(-1)"><i class="uil text-red uil-angle-double-left"></i></button>
                <button class="next" onclick="plusSlides(1)"><i class="uil text-red uil-angle-double-right"></i></button>
            </div>
            <div class="product-info grid">
                <h1 class="fs-poppins fs-400 blod-900">${pro.proName}</h1>
                <div class="star-icon flex">
                    <div>
                        <i class="uil text-red uil-star"></i>
                        <i class="uil text-red uil-star"></i>
                        <i class="uil text-red uil-star"></i>
                        <i class="uil text-red uil-star"></i>
                        <i class="uil uil-star"></i>
                    </div>
                    <div>
                        <p class="fs-montserrat fs-100">(1 customer review)</p>
                    </div>
                </div>

                <div class="price">
                    <p class="bold-700 fs-poppins fs-300"><fmt:formatNumber value="${pro.price}" type="number" pattern="#,##0" /> VND</p>
                </div>

                <div>
                    <p class="fs-montserrat lineheight">
                        ${pro.description}
                    </p>
                </div>
                <form action="addToCart" method="get">
                    <div class="product-add-cart flex">

                        <input type="number" name="num" min="0" value="1" max="${pro.stockQuantity}" class="bg-gray fs-poppins " />
                        <input type="hidden" name="id" value="${pro.id}" />
                        <input type="hidden" name="acc_num" value="${sessionScope.acc.id}" />
                        <button 
                            class="product-btn large-btn bg-red text-white fs-poppins fs-50"
                            >
                            Add to cart
                        </button>
                    </div>
                </form>

                <div>
                    <p class="fs-montserrat text-red">
                        <span class="text-black">Stock Quantity </span>${pro.stockQuantity}
                    </p>
                </div>
            </div>
        </section>

        <!-- ==================Single Product-============================= -->

        <!-- ==============Product Description====================== -->

        <section class="product-description grid">
            <div class="product-taps flex">
                <a id="dis-tab" class="fs-poppins fs-200 text-black bold-700 active-tab"
                   >Description</a
                >
                <a
                    id="rev-tab"
                    class="fs-poppins fs-200 text-black bold-700 tabs-light-text"
                    >Reviews(1)</a
                >
            </div>

            <div class="description grid" data-tab="false">
                <h3 class="text-black fs-poppins fs-300">Description</h3>
                <p class="fs-montserrat lineheight">
                   ${pro.description}
                </p>
            </div>

            <article class="reviews-container" data-tab="false">
                <div class="reviews">
                    <p class="text-black fs-poppins fs-200 bold-700">
                        1 review for ${pro.proName}
                    </p>
                </div>
                <c:forEach items="${rv}" var="r">
                    <div id="post-reviews">
                        <div
                            id="display-reviews"
                            class="display-reviews bg-very-light-gray flex"
                            >
                            <div style="margin: 0 10px">
                                <img src="${r.userava}" style="width: 150px; height: 150px; border-radius: 48%; object-fit: cover;">
                            </div>
                            <div>
                                <div class="connent-box">
                                    <c:forEach begin="1" end="${r.rating}">
                                    <i class="uil text-red uil-star"></i>
                                    </c:forEach>
                                    <p style="font-size: 20px" class="fs-poppins">
                                        <span class="bold-700">${r.fullname} </span>- ${r.createdOn}
                                    </p>
                                    <p style="font-size: 20px"class="fs-poppins">${r.commentText}</p>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:forEach>


            </article>
        </section>

        <!-- ==============Product Description====================== -->

        <!-- ============Related Product Section===================== -->

        <!-- =================Related Product Section ================================ -->
        <section class="best-product container">
            <h2 class="letter-spacing bold-800 fs-poppins">Related products</h2>
        </section>

        <!-- ============Related Product Section===================== -->

        <!-- ===========================Heading======================== -->
        <section class="best-Seller related-product">
            <c:forEach items="${samebr}" var="n">
                <div class="product grid">
                    <a class="fs-poppins bold-500" style="text-decoration: #000; color: black"  href="productDetail?proid=${n.id}">
                        <img style="height: 350px; width: 350px" src="${n.img}" alt="" />
                        <p   class="fs-poppins bold-500">${n.proName}</a></p>
                    <p class="fs-poppins bold-500">$ ${n.price}</p>
                    <!-- ---------------------------- -->
                    <div class="product-details grid bg-red">
                        <i class="text-white uil uil-shopping-cart-alt"></i>
                        <i class="text-white uil uil-heart-alt"></i>
                    </div>
                    <!-- ===================================== -->
                </div>
            </c:forEach>

        </section>
        <!-- =================Related Product Section ================================ -->
        <section class="best-product container">
            <h2 class="letter-spacing bold-800 fs-poppins">Same Categories products</h2>
        </section>

        <!-- ============Related Product Section===================== -->
        <section class="best-Seller related-product">
            <c:forEach items="${sameca}" var="n">
                <div class="product grid">
                    <a class="fs-poppins bold-500" style="text-decoration: #000; color: black"  href="productDetail?proid=${n.id}">
                        <img style="height: 350px; width: 350px" src="${n.img}" alt="" />
                        <p   class="fs-poppins bold-500">${n.proName}</a></p>
                    <p class="fs-poppins bold-500">$ ${n.price}</p>
                    <!-- ---------------------------- -->
                    <div class="product-details grid bg-red">
                        <i class="text-white uil uil-shopping-cart-alt"></i>
                        <i class="text-white uil uil-heart-alt"></i>
                    </div>
                    <!-- ===================================== -->
                </div>
            </c:forEach>

        </section>
        <!-- ==============Footer section================================= -->

        <footer>
            <!-- =============Brands================= -->
            <section class="brands grid">
                <div>
                    <img src="image/br-1.png" alt="" />
                </div>
                <div>
                    <img src="image/br-2.png" alt="" />
                </div>
                <div>
                    <img src="image/br-3.png" alt="" />
                </div>
                <div>
                    <img src="image/br-4.png" alt="" />
                </div>
                <div>
                    <img src="image/br-5.png" alt="" />
                </div>
            </section>

            <!-- =============Footer Menu=================== -->
            <section class="footer grid">
                <div class="footer-logo grid">
                    <img src="image/logo.png" alt="" />
                    <p class="fs-montserrat fs-200">
                        There are many variations passages of Lorem Ipsum available, but the
                        majority have
                    </p>
                    <div class="social-media flex">
                        <i class="uil uil-facebook-f"></i>
                        <i class="uil uil-instagram"></i>
                        <i class="uil uil-linkedin"></i>
                        <i class="uil uil-twitter"></i>
                    </div>
                </div>

                <div class="footer-menu grid">
                    <h3 class="fs-poppins fs-200 bold-800">Quick Links</h3>
                    <ul>
                        <li>
                            <a class="fs-montserrat text-black fs-200" href="#">Home</a>
                        </li>
                        <li>
                            <a class="fs-montserrat text-black fs-200" href="#">About</a>
                        </li>
                        <li>
                            <a class="fs-montserrat text-black fs-200" href="#">Shop</a>
                        </li>
                        <li>
                            <a class="fs-montserrat text-black fs-200" href="#">Contact</a>
                        </li>
                    </ul>
                </div>

                <div class="contact grid">
                    <h3 class="fs-poppins fs-200 bold-800">Contact</h3>
                    <p class="fs-montserrat">
                        +99 (0) 101 0000 888 Patricia C. Amedee 4401 Waldeck Street
                        Grapevine Nashville, Tx 76051
                    </p>
                </div>

                <div class="emails grid">
                    <h3 class="fs-poppins fs-200 bold-800">Subscribe To Our Email</h3>
                    <p class="updates fs-poppins fs-300 bold-800">
                        For Latest News & Updates
                    </p>
                    <div class="inputField flex bg-gray">
                        <input
                            type="email"
                            placeholder="Enter Your Email"
                            class="fs-montserrat bg-gray"
                            />
                        <button class="bg-red text-white fs-poppins fs-50">
                            Subscribe
                        </button>
                    </div>
                </div>
            </section>

            <section class="copyRight">
                <p class="c-font fs-montserrat fs-200">
                    Â© 2022 eStore. All rights reserved.
                </p>
                <p class="fs-montserrat fs-100 text-align p-top">
                    Privacy Policy . Term Condition
                </p>
            </section>
        </footer>
        <script>
            let slideIndex = 0;

            function showSlides(n) {
                const slides = document.getElementsByClassName('slide');
                if (n >= slides.length) {
                    slideIndex = 0;
                } else if (n < 0) {
                    slideIndex = slides.length - 1;
                } else {
                    slideIndex = n;
                }

                for (let i = 0; i < slides.length; i++) {
                    slides[i].style.display = 'none';
                }

                slides[slideIndex].style.display = 'block';
            }

            function plusSlides(n) {
                showSlides(slideIndex + n);
            }

            // Initialize the slider
            showSlides(slideIndex);
        </script>
    </body>
</html>
