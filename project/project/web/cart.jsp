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
        <link rel="stylesheet" href="css/shoppage/shop.css" />
        <link rel="stylesheet" href="css/shoppage/blog.css" />
        <link rel="stylesheet" href="css/shoppage/cart.css" />
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
            }
            
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
                95% {
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
            <!-- custon style Sheet & JavaScript -->
            <title>Beta Shop</title>
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
                            Home <span aria-hidden="true" class="margin">></span> Cart
                        </p>
                    </div>
                    <h2 class="fs-poppins fs-300 bold-700">Cart</h2>
                </section>

                <!-- ===============================Cart Section=================== -->

                <section class="table">
                    <table>
                        <thead class="thead fs-poppins text-black bold-700 bg-very-light-gray">
                            <tr>
                                <td></td>
                                <td> Image</td>
                                <td>Product</td>
                                <td>Quantity</td>
                                <td>Price</td>
                                <td>Subtotal</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="o" value="${cart}"/>
                            <c:set var="showTotal" value="false" />
                            <c:forEach items="${o.items}" var="i">
                                <c:if test="${i.accid eq sessionScope.acc.id}">
                                    <tr>
                                        <c:set var="showTotal" value="true" />
                                        <td>
                                            <form class="inputField flex bg-white" action="quantity" method="post" onsubmit="return confirmDelete()">
                                                <input type="hidden" value="${i.product.id}" name="id" />
                                                <button class="bg-red text-white fs-poppins fs-50" type="submit" class="button">
                                                    Delete
                                                </button>
                                            </form>


                                        </td>
                                        <td><img style="width: 100px" src="${i.product.img}" alt="alt"/></td>
                                        <td>
                                            <a style="text-decoration: none;
                                            color: black" href="productDetail?proid=${i.product.id}">
                                                ${i.product.proName}
                                            </a>
                                        </td>
                                        <td style="text-align: center">
                                            <c:if test="${i.quantity > 1}">
                                                <button><a style="text-decoration: black;
                                                    color: black;
                                                    font-size: 15px" href="quantity?num=-1&id=${i.product.id}&acc_num=${sessionScope.acc.id}">-</a></button>
                                                </c:if>
                                                ${i.quantity}
                                                <c:if test="${i.quantity < i.product.stockQuantity}">
                                                <button><a style="text-decoration: black;
                                                    color: black;
                                                    font-size: 15px" href="quantity?num=1&id=${i.product.id}&acc_num=${sessionScope.acc.id}">+</a></button>
                                                </c:if>
                                        </td>
                                        <td><fmt:formatNumber value="${i.product.price}" type="number" pattern="#,##0" /></td>
                                        <td><fmt:formatNumber value="${(i.product.price * i.quantity)}" type="number" pattern="#,##0" /></td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>

                    <div class="copen-box flex">
                        <form action="applyvoucher" method="post">
                        <div>
                            <input name="vou" value="${vou}" class="copen-input fs-poppins text-black" type="text">
                            <button type="submit" class="cupen-btn fs-poppins bold-700 text-black">Apply coupen</button>
                        </div>
                        </form>
                    </div>

                </section>

                <section class="check-out grid">

                    <div>

                    </div>
                    <div>
                        <h3 class="fs-poppins fs-300 text-black bold-700">Cart totals</h3>

                        <table>
                            <thead class="thead fs-poppins text-black bold-700">
                                <c:set var="rate" value="${rate}" />
                                <c:if test="${showTotal}">
                                    <tr>
                                        <td class="bg-very-light-gray">Subtotal</td>
                                        <td><fmt:formatNumber value="${o.getTotalMoney(sessionScope.acc.id)}" type="number" pattern="#,##0" /> </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-very-light-gray">Total</td>
                                        <td class="bold-700"><fmt:formatNumber value="${o.getTotalMoney(sessionScope.acc.id) *(1- rate)}" type="number" pattern="#,##0" /></td>
                                    </tr>
                                </c:if>
                            </thead>
                            <tbody>
                        </table>
                        <div class="grid">
                            <form style="text-align: center" action="showBills" method="post">
                                <input type="hidden" value="${vou}" name="vou">
                                <button style="width: 100%" class="fs-poppins text-white bold-800 fs-300 bg-red">Proceed to checkout </button>
                                </form>
                            <button class="fs-poppins text-black bold-800 fs-300 bg-gray"><a href="home" style="text-decoration: black;
                                color: black">Continue to Shopping</a></button>
                        </div>
                    </div>

                </section>

                <!-- ===============================Cart Section=================== -->

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
                        return confirm("Are you sure you want to delete this product? It will be removed from your cart.");
                    }
                    ;
                    document.getElementById('showNotification').addEventListener('click', function () {
                        document.getElementById('notification').classList.remove('hidden');
                        setTimeout(function () {
                            document.getElementById('notification').classList.add('hidden');
                        }, 10000); // Đợi 1 giây trước khi ẩn đi
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
                    })
                </script>
                
            </body>
        </html>
        