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
                            <a class="fs-100 fs-montserrat bold-500" href="customerblog"
                               >Blog</a
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

        <div class="container">
            <article class="article-detail">
                <img class="article-image" src="${blg.img}" alt="Article Image">
                <div class="article-meta">
                    <p class="article-date">${blg.createOn}</p>
                    <p class="article-author">${blg.acc_name}</p>
                </div>
                <h1 class="article-title">${blg.title}</h1>
                <p class="article-description">${blg.description}</p>
                <div class="article-content">
                    <p>${blg.content}</p>
                    <!-- Thêm nhiều nội dung hơn ở đây -->
                </div>
            </article>

        </div>
        <!-- =================Related Product Section ================================ -->
        <section class="best-product container">
            <h2 class="text-yellow letter-spacing bold-200 fs-poppins">Recomend Blogs</h2>
        </section>

        <!-- ============Related Product Section===================== -->

        <!-- ===========================Heading======================== -->
        <section class="recent-news grid">
            <c:forEach items="${rcmblg}" var="b">
                <div class="news grid">
                    <a href="blogdetail?blgid=${b.id}"> <img style="width: 100%; height: 35vh;object-fit: cover;" src="${b.img}" alt=""></a>
                    <div class="fs-montserrat fs-100 flex padding-inline"><p>${b.createOn}</p>
                        <p>by ${b.acc_name}</p>
                    </div>
                    <h2 class="fs-poppins padding-inline fs-200 blod-600">${b.title}</h2>
                    <p class="fs-montserrat padding-inline fs-100">${b.description}</p>
                </div> 
            </c:forEach>
        </section>
        <!-- =================Related Product Section ================================ -->


        <!-- ============Related Product Section===================== -->

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
            <button id="scrollToTopBtn">Top</button>
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
        <style>
            .article-detail {
                padding: 20px;
            }

            .article-image {
                width: 100%;
                height: 200px;
                object-fit: cover;
                margin-bottom: 20px;
                border-radius: 10px;
            }

            .article-meta {
                display: flex;
                justify-content: space-between;
                font-size: 16px; /* Tăng kích thước font của thông tin meta */
                color: #777;
                margin-bottom: 10px;
                font-style: italic;
            }

            .article-title {
                font-family: 'Poppins', sans-serif;
                font-size: 36px; /* Tăng kích thước font của tiêu đề */
                font-weight: 600;
                margin-bottom: 15px;
                color: #333;
                line-height: 1.2;
                text-transform: capitalize;
            }

            .article-description {
                font-family: 'Montserrat', sans-serif;
                font-size: 20px; /* Tăng kích thước font của mô tả */
                margin-bottom: 25px;
                color: #555;
                line-height: 1.5;
            }

            .article-content {
                font-family: 'Montserrat', sans-serif;
                font-size: 18px; /* Tăng kích thước font của nội dung */
                line-height: 1.8;
                color: #444;
            }

            .article-content p {
                margin-bottom: 20px;
            }

            .article-content h2 {
                font-family: 'Poppins', sans-serif;
                font-size: 28px; /* Tăng kích thước font của tiêu đề h2 */
                font-weight: 600;
                margin-top: 30px;
                margin-bottom: 10px;
                color: #333;
            }

            .article-content h3 {
                font-family: 'Poppins', sans-serif;
                font-size: 24px; /* Tăng kích thước font của tiêu đề h3 */
                font-weight: 600;
                margin-top: 25px;
                margin-bottom: 10px;
                color: #444;
            }

            .article-content ul, .article-content ol {
                margin: 20px 0;
                padding-left: 40px;
            }

            .article-content ul li, .article-content ol li {
                margin-bottom: 10px;
                line-height: 1.6;
            }

            .article-content blockquote {
                margin: 20px 0;
                padding: 10px 20px;
                background-color: #f9f9f9;
                border-left: 4px solid #ccc;
                font-style: italic;
                color: #666;
            }

            .article-content a {
                color: #007bff;
                text-decoration: none;
            }

            .article-content a:hover {
                text-decoration: underline;
            }

            @media (max-width: 600px) {
                .container {
                    padding: 10px;
                }

                .article-detail {
                    padding: 10px;
                }

                .article-title {
                    font-size: 28px; /* Tăng kích thước font của tiêu đề cho thiết bị di động */
                }

                .article-description {
                    font-size: 18px; /* Tăng kích thước font của mô tả cho thiết bị di động */
                }

                .article-content {
                    font-size: 16px; /* Tăng kích thước font của nội dung cho thiết bị di động */
                }
            }

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
                background-color: #333;
            }/* Màu nền khi hover */
        </style>
    </body>
</html>
