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
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet"
            />

        <!-- Icon -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
        <!-- icon -->

        <!-- Google fonts End -->

        <!-- custon style Sheet & JavaScript -->
        <link rel="stylesheet" href="css/shoppage/index.css" />
        <script src="js/shoppage/index.js" defer></script>
        <style>
            #scrollToTopBtn {
                display: none; /* Ẩn nút khi trang mới tải */
                position: fixed; /* Định vị cố định nút */
                bottom: 20px; /* Cách đáy trang 20px */
                right: 30px; /* Cách bên phải 30px */
                z-index: 100; /* Đảm bảo nút luôn nằm trên cùng */
                border: none; /* Không viền */
                outline: none; /* Không viền khi focus */
                background-color: #0998b0; /* Màu nền */
                color: white; /* Màu chữ */
                cursor: pointer; /* Con trỏ chuột khi hover */
                padding: 15px; /* Khoảng cách bên trong */
                border-radius: 10px; /* Bo góc */
                font-size: 18px; /* Kích thước chữ */
            }

            #scrollToTopBtn:hover {
                background-color: #333; /* Màu nền khi hover */
            </style>
            <!-- custon style Sheet & JavaScript -->
            <title>Beta Shop</title>
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
                                <a class="active fs-100 fs-montserrat bold-500" href="home"
                                   >Home</a
                                >
                            </li>
                            <li>
                                <a class="fs-100 fs-montserrat bold-500" href="shop"
                                   >Shop</a
                                >
                            </li>
                            <li>
                                <a class="fs-100 fs-montserrat bold-500" href="about.jsp"
                                   >About Us</a
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
                    <c:if test="${sessionScope.acc.full_name == null}">
                        <a style="text-decoration: none;
                           color: black"class="fs-100 fs-montserrat bold-500" href="login.jsp">Login</a></p>
                        </c:if>
                        <c:if test="${sessionScope.acc.full_name != null}">
                            <p style="text-decoration: none;
                            color: black"class="fs-100 fs-montserrat bold-500" id="acc-box" aria-controls="acc-icon">${sessionScope.acc.getFull_name()}</p>

                        </c:if>
                        <a  href="showCart">
                            <i class="uil uil-shopping-bag"
                               ></i>${n}
                        </a>
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
                        <div id="acc-icon" data-visible="false" class="cart-icon">
                            <div class="shopping flex">
                                <p>Shopping Basket</p>
                                <i id="cross-btn" class="uil uil-times"></i>
                            </div>
                            <div style="padding-top: 2rem;" class="cart bold-800 flex">
                            <a style="text-decoration: none;
                               color: black"class="fs-100 fs-montserrat bold-500" href="logout">Log out</a>
                            </div>
                            <div style="padding-top: 2rem;" class="cart bold-800 flex">
                            <a style="text-decoration: none;
                               color: black"class="fs-100 fs-montserrat bold-500" href="accsettings">Account Settings</a>
                            </div>
                            <div style="padding-top: 2rem;" class="cart bold-800 flex">
                            <a style="text-decoration: none;
                               color: black"class="fs-100 fs-montserrat bold-500" href="changePassword">Change Passwords</a>
                            </div>
                            <div style="padding-top: 2rem;" class="cart bold-800 flex">
                            <form action="orderhistory" method="post">
                                <input type="hidden" value="${sessionScope.acc.id}" name="accid"/>
                                <input style="border: none;" class="fs-100 fs-montserrat bold-500" type="submit" value="View Order History"/>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="mobile-open-btn"><i class="uil uil-align-right"></i></div>
            </header>

            <!-- ===========Hero Section===================== -->

            <main class="hero-section">
                <div>
                    <h1 class="fs-200 fs-poppins">
                        Beats Solo
                        <span class="block lineheight fs-300 bold-900 big-wireless fs-poppins"
                              >Watches</span
                        ><span
                            class="text-white fs-900 uppercase lineheight-2 bold-bolder fs-poppins"
                            >Smart Watch</span
                        >
                    </h1>
                    <img src="img/p12.png" alt="" />
                </div>
                <div class="hero-inner flex">
                    <div>
                        <button class="large-btn bg-red text-white fs-poppins fs-50">
                            <a style="text-decoration: white;
                               color: white" href="shop">Shop By Category</a> 
                            </button>
                        </div>
                        <div class="hero-info">
                            <h4 class="fs-montserrat">Description</h4>
                            <p class="fs-montserrat">
                                There are many variations passages of Lorem Ipsum available, but the
                                majority have suffered alteration
                            </p>
                        </div>
                    </div>
                </main>

                <!-- =================Product Section======================= -->

                <section style="z-index: 1;" class="product-section">
                <c:forEach items="${brand}" var="o">

                    <div class="category  grid"  
                         style="background-image: url(${o.brand_img});
                         background-size: cover;
                         background-position: center;
                         background-repeat: no-repeat;">
                        <div>
                            <h3 class="text-white fs-50 fs-montserrat bold">
                                Wacthes <span class="block fs-300 fs-poppins bold">${o.brand_name}</span
                                ><span
                                    class="earphone uppercase fs-400 fs-poppins bold-900 lineheight"
                                    >${o.brand_name}</span
                                >
                            </h3>
                            <button  class="prdduct-btn large-btn text-red bg-white fs-poppins">
                                <a style="text-decoration: none; " class="text-red" href="brand?brid=${o.id}" >View</a>
                            </button>
                        </div>

                    </div>
                </c:forEach>
                <button class="large-btn bg-red text-white fs-poppins fs-50">
                    <a style="text-decoration: white;
                       color: white" href="allbrand">View All Brand</a>   
                    </button>
                </section>

                <!-- ========================================= -->
                <!-- =============Service section============== -->

                <section class="service-section">
                    <div class="service">
                        <img src="img/free.svg" alt="" />
                        <div class="service-info">
                            <h3 class="fs-poppins fs-200">Free Shippng</h3>
                            <p class="fs-montserrat fs-50">Free Shipping On All Order</p>
                        </div>
                    </div>
                    <div class="service">
                        <img src="img/sett.svg" alt="" />
                        <div class="service-info">
                            <h3 class="fs-poppins fs-200">Money Guarantee</h3>
                            <p class="fs-montserrat fs-50">30 Day Money Back</p>
                        </div>
                    </div>
                    <div class="service">
                        <img src="img/supt.svg" alt="" />
                        <div class="service-info">
                            <h3 class="fs-poppins fs-200">Online Support 24/7</h3>
                            <p class="fs-montserrat fs-50">Technical Support 24/7</p>
                        </div>
                    </div>
                    <div class="service">
                        <img src="img/pay.svg" alt="" />
                        <div class="service-info">
                            <h3 class="fs-poppins fs-200">Secure Payment</h3>
                            <p class="fs-montserrat fs-50">All Cards Accepted</p>
                        </div>
                    </div>
                </section>

                <!-- ===================Feature Section============= -->

                <section class="feature-section bg-red">
                    <div class="feature-one grid">
                        <img src="img/p-1.png" alt="" />
                        <p class="text-white uppercase">Up 25% OFF</p>
                        <p
                            class="font-size lineheight fs-500 text-white fs-poppins bold-900 uppercase"
                            >
                            Voucher
                        </p>
                    </div>
                    <div class="feature-info">
                        <h2 class="fs-200 text-white fs-poppins bold-500">⏳ Limited Time Offer! ⏳</h2>
                        <p class="fs-poppins fs-300 bold-800 text-white">Ultra Sale</p>
                        <p class="fs-montserrat text-white fs-50">
                            
                            Enjoy up to 25% off with our special discount vouchers. 🎁
                            Hurry, get your voucher before it's gone
                        </p>
                        <button class="prdduct-btn large-btn text-red bg-white fs-poppins">
                            <a class="text-red" href="allvoucher" >
                                View
                            </a>
                        </button>
                    </div>
                </section>
                <!-- =============================Best Sellar================== -->

                <section class="best-product container">
                    <h2 class="letter-spacing bold-800 fs-poppins">Best Seller Products</h2>
                    <p class="fs-montserrat fs-100">
                        speakerThere are many variations passages
                    </p>
                </section>

                <!-- ===========================Heading======================== -->
                <section style="z-index: 1;" class="best-Seller">
                <c:forEach items="${pro}" var="n">
                    <div class="product grid">
                        <a class="fs-poppins bold-500" style="text-decoration: #000;
                           color: black"  href="productDetail?proid=${n.id}">
                               <img style=" width: 350px" src="${n.img}" alt="" />
                               <p   class="fs-poppins bold-500">${n.proName}</a></p>
                           <p class="fs-poppins bold-500"><fmt:formatNumber value="${n.price}" type="number" pattern="#,##0" /> VND</p>
                           <!-- ---------------------------- -->
                           <div class="product-details grid bg-red">
                               <a href="addToCart?num=1&id=${n.id}&acc_num=${sessionScope.acc.id}"> <i class="text-white uil uil-shopping-cart-alt"></i></a>
                               <i class="text-white uil uil-heart-alt"></i>
                           </div>
                           <!-- ===================================== -->
                        </div>
                    </c:forEach>
                    <df-messenger
                        intent="WELCOME"
                        chat-title="Watch Shop"
                        agent-id="9e78c254-81b7-4fca-9822-1dde277cb01c"
                        language-code="vi"
                        ></df-messenger>
                </section>

                <!-- =========================================== -->

                <footer>
                    <!-- =============Brands================= -->
                    <section class="brands grid">
                        <div>
                            <img src="img/br-1.png" alt="" />
                        </div>
                        <div>
                            <img src="img/br-2.png" alt="" />
                        </div>
                        <div>
                            <img src="img/br-3.png" alt="" />
                        </div>
                        <div>
                            <img src="img/br-4.png" alt="" />
                        </div>
                        <div>
                            <img src="img/br-5.png" alt="" />
                        </div>
                    </section>

                    <!-- =============Footer Menu=================== -->
                    <section class="footer grid">
                        <div class="footer-logo grid">
                            <img src="img/logo.png" alt="" />
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
                    const accountBtn = document.getElementById('acc-box');
                    const accItme = document.getElementById('acc-icon');
                    accountBtn.addEventListener('click', () => {
                        const showCart = accItme.getAttribute('data-visible');

                        if (showCart === 'false') {
                            accItme.setAttribute('data-visible', true)
                        } else {
                            accItme.setAttribute('data-visible', false)
                        }
                    })
                </script>
                <script>
                    window.onscroll = function () {
                        scrollFunction()
                    };

                    function scrollFunction() {
                        if (document.body.scrollTop > 15 || document.documentElement.scrollTop > 15) {
                            document.getElementById("scrollToTopBtn").style.display = "block";
                        } else {
                            document.getElementById("scrollToTopBtn").style.display = "none";
                        }
                    }

                    // Khi người dùng bấm vào nút, cuộn lên đầu trang
                    document.getElementById('scrollToTopBtn').addEventListener('click', function () {
                        document.body.scrollTop = 0; // Đối với Safari
                        document.documentElement.scrollTop = 0; // Đối với Chrome, Firefox, IE và Opera
                    });
                </script>
                <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
            </body>
        </html>
