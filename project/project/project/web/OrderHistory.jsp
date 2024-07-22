<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link
            rel="stylesheet"
            href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"
            />
        <!-- icon -->

        <!-- Google fonts End -->

        <!-- custon style Sheet & JavaScript -->
        <link rel="stylesheet" href="css/shoppage/index.css" />
        <link rel="stylesheet" href="css/shoppage/shop.css" />
        <link rel="stylesheet" href="css/shoppage/blog.css" />
        <link rel="stylesheet" href="css/shoppage/contactus.css" />
        <link rel="stylesheet" href="css/shoppage/orderhis.css" />
        <!-- custon style Sheet & JavaScript -->
        <link rel="stylesheet" href="css/shoppage/index.css" />
        <script src="js/shoppage/index.js" defer></script>
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

        <!-- ===================Shop Feature Section============================ -->

        <section class="shop-feature bg-gray grid">
            <div>
                <p class="fs-montserrat text-black">
                    Home <span aria-hidden="true" class="margin">></span> Contact Us
                </p>
            </div>
            <h2 class="fs-poppins fs-300 bold-700">Contact Us</h2>
        </section>

        <!-- ===================Contact Us======================== -->

        <!-- ===========Support Section==================== -->

        <section class="suport-container ">
            <table id="userTable" class="table ">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Customer Name </th>
                        <th>Status</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Payment Method</th>
                        <th>Total Amount</th>
                        <th>Order Date</th>
                        <th>Ship Status</th>
                        <th>View Detail</th>
                    </tr>
                    </tr>
                </thead>
                <tbody id="contents">
                    <c:forEach items="${ord}" var="p">
                        <c:set var="checkshipper" value="true"/>
                        <tr>
                            <td>
                                ${p.id}
                            </td>
                            <td>${p.cus_name}</td>
                            <td > 
                                <c:forEach items="${sta}" var="b">
                                    <c:if test="${p.status_id eq b.getStatusID()}">
                                        ${b.getDescription()}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td > ${p.adress}</td>
                            <td > ${p.phone}</td>
                            <td > 
                                <c:forEach items="${pay}" var="b">
                                    <c:if test="${p.payment_id eq b.getPaymentMethodID()}">
                                        ${b.getName()}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td > <fmt:formatNumber value="${p.totalAmount}" type="number" pattern="#,##0" /> </td>
                            <td > ${p.orderDate} </td>
                            <td > ${p. shipstatus} </td>
                            <td > 
                                <form class="inputField flex bg-very-light-gray" action="cusorderdetail" method="post" >
                                    <input type="hidden" value="${p.id}" name="id" />
                                    <button class="bg-black text-white fs-poppins" type="submit" class="button">
                                        Detail
                                    </button>
                                </form>
                            </td>
                            <c:choose>
                                <c:when test="${fn:contains(p.shipstatus, 'Delivered') || fn:contains(p.shipstatus, 'Successful delivery')}">
                                    <td > 
                                        <form class="inputField bg-very-light-gray" action="orderrecieved" method="post" onsubmit="return confirmDelete()">
                                            <input type="hidden" value="${p.id}" name="id" />
                                            <input type="hidden" value="${sessionScope.acc.id}" name="accid" />
                                            <button class="bg-green text-white fs-poppins fs-50" type="submit" class="button">
                                                Received
                                            </button>
                                        </form>
                                    </td>
                                </c:when>
                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </section>

        <!-- ===================Contact Us======================== -->

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
            function confirmDelete() {
                return confirm("Are you sure you recieve sucessfulll. Nơw you can comment and review of the product you had buy");
            }
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
             document.getElementById('showNotification').addEventListener('click', function () {
                document.getElementById('notification').classList.remove('hidden');
                setTimeout(function () {
                    document.getElementById('notification').classList.add('hidden');
                }, 1000); // Đợi 1 giây trước khi ẩn đi
            });
        </script>
        <style>
            #notification {
                background-color: #4CAF50; /* Màu nền */
                color: white; /* Màu chữ */
                text-align: center; /* Căn giữa nội dung */
                padding: 10px; /* Khoảng cách giữa nội dung và khung */
                position: fixed; /* Vị trí cố định */
                top: 20px; /* Cách lề trên 20px */
                right: 20px; /* Cách lề phải 20px */
                z-index: 1000; /* Lớp chồng lên cao */
                width: 300px; /* Độ rộng */
                border-radius: 5px; /* Đường viền cong */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Hiệu ứng bóng đổ */
                opacity: 0; /* Mặc định ẩn đi */
                animation: fadeInOut 1s ease-in-out forwards; /* Áp dụng animation */
            }

            /* Định nghĩa animation */
            @keyframes fadeInOut {
                0% {
                    opacity: 0; /* Ẩn đi ban đầu */
                }
                50% {
                    opacity: 1; /* Hiển thị lên 50% thời gian */
                }
                100% {
                    opacity: 0; /* Mờ dần đi */
                }
            }

            /* Hiển thị phần thông báo khi được kích hoạt */
            #notification:not(.hidden) {
                display: block;
            }

        </style>
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
    </body>
</html>
