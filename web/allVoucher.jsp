<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                            <a class="fs-100 fs-montserrat bold-500" href="blog.jsp"
                               >Blog</a
                            >
                        </li>
                        <li>
                            <a class="fs-100 fs-montserrat bold-500" href="contactus.jsp"
                               >Contact Us</a
                            >
                        </li>
                        <li>
                            <a class="fs-100 fs-montserrat bold-500" href="cart.jsp"
                               >Cart page</a
                            >
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="header-login flex">
                <c:if test="${sessionScope.acc.full_name == null}">
                    <a style="text-decoration: none; color: black"class="fs-100 fs-montserrat bold-500" href="login.jsp">Login</a></p>
                </c:if>
                <c:if test="${sessionScope.acc.full_name != null}">
                    <p style="text-decoration: none; color: black"class="fs-100 fs-montserrat bold-500" id="acc-box" aria-controls="acc-icon">${sessionScope.acc.getFull_name()}</p>

                </c:if>
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
                <div id="acc-icon" data-visible="false" class="cart-icon">
                    <div class="shopping flex">
                        <p>Shopping Basket</p>
                        <i id="cross-btn" class="uil uil-times"></i>
                    </div>
                    <div style="padding-top: 2rem;" class="cart bold-800 flex">
                        <a style="text-decoration: none; color: black"class="fs-100 fs-montserrat bold-500" href="logout">Log out</a>
                    </div>
                    <div style="padding-top: 2rem;" class="cart bold-800 flex">
                        <a style="text-decoration: none; color: black"class="fs-100 fs-montserrat bold-500" href="accsettings">Account Settings</a>
                    </div>
                    <div style="padding-top: 2rem;" class="cart bold-800 flex">
                        <a style="text-decoration: none; color: black"class="fs-100 fs-montserrat bold-500" href="changePassword">Change Passwords</a>
                    </div>
                </div>
            </div>
            <div class="mobile-open-btn"><i class="uil uil-align-right"></i></div>
        </header>

        <!-- ===========Hero Section===================== -->



        <!-- =================Product Section======================= -->

        <section class="product-section">
            <c:forEach items="${vou}" var="o">

                <div class="product grid">

                    <div class="voucher">
                        <h2 class="discount-id">${o.getDiscountID()}</h2>
                        <h5 class="discount-rate"><fmt:formatNumber value="${o.getDiscountRate() * 100}" type="number" pattern="###0" />% OFF</h5>
                        <h5 class="discount-info">From: ${o.getStartDate()}</h5>
                        <h5 class="discount-info">To: ${o.getEndDate()}</h5>
                        <h5 class="discount-info">Amount: ${o.getAmount()}</h5>
                        <button class="voucher-btn" onclick="copyToClipboard('${o.getDiscountID()}')">
                            <span class="voucher-link">Get Voucher</span>
                        </button>
                    </div>

                </div>
            </c:forEach>

        </section>

        <!-- ========================================= -->
        <!-- =============Service section============== -->


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
            });
            function copyToClipboard(discountID) {
                // Tạo một thẻ input tạm thời
                var tempInput = document.createElement("input");
                tempInput.value = discountID;
                document.body.appendChild(tempInput);

                // Chọn và sao chép giá trị của thẻ input
                tempInput.select();
                tempInput.setSelectionRange(0, 99999); // Cho mobile
                document.execCommand("copy");

                // Loại bỏ thẻ input tạm thời
                document.body.removeChild(tempInput);

                // Thông báo cho người dùng
                alert("Get Voucher Successfull. You can use it right now");
            }
        </script>
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
        <style>
            .voucher {
                border: 2px dashed #66CDAA; /* Màu xanh matcha */
                border-radius: 10px;
                padding: 20px;
                background: linear-gradient(135deg, #B2D8B2, #A7C7E7); /* Xanh matcha đến xanh pastel */
                text-align: center;
                width: 350px;
                margin: 20px auto;
                font-family: 'Poppins', sans-serif;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .discount-id {
                color: #FFFFFF;
                font-size: 26px;
                margin: 10px 0;
            }

            .discount-rate {
                color: #FFFFFF;
                font-size: 22px;
                margin: 5px 0;
                background: rgba(102, 205, 170, 0.8); /* Màu xanh matcha bán trong suốt */
                display: inline-block;
                padding: 5px 10px;
                border-radius: 5px;
            }

            .discount-info {
                color: #333;
                margin: 10px 0;
                font-size: 16px;
            }

            .voucher-btn {
                background-color: #FFFFFF;
                border: 2px solid #66CDAA; /* Màu xanh matcha */
                border-radius: 5px;
                padding: 10px 20px;
                margin-top: 20px;
                cursor: pointer;
                transition: background-color 0.3s, color 0.3s;
            }

            .voucher-link {
                color: #66CDAA; /* Màu xanh matcha */
                text-decoration: none;
                font-size: 18px;
                font-weight: bold;
            }

            .voucher-btn:hover .voucher-link {
                color: #ff6666;
                text-decoration: none;
                display: block;
            }

        </style>
    </body>
</html>
