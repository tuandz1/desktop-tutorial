<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet" />

        <!-- Icon -->
        <link
            rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
        <!-- icon -->

        <!-- Google fonts End -->

        <!-- custon style Sheet & JavaScript -->
        <link rel="stylesheet" href="css/shoppage/shop.css" />
        <link rel="stylesheet" href="css/shoppage/index.css" />
        <link rel="stylesheet" href="css/shoppage/about.css">
        <script src="js/shoppage/index.js" defer></script>
        <script src="js/shoppage/shop.js" defer></script>
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
                    Home <span aria-hidden="true" class="margin">></span> Check Out
                </p>
            </div>
            <h2 class="fs-poppins fs-300 bold-700">Check out</h2>
        </section>

        <!-- ========================About Section========================== -->

        <div class="checkout-container">
            <div class="product-summary">
                <table class="table">
                    <thead class="bg-light">
                        <tr class="border-0">
                            <td>Image</td>
                            <td>Product</td>
                            <td>Quantity</td>
                            <td>Price</td>
                            <td>Subtotal</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="showTotal" value="false" />
                        <c:set var="o" value="${cart}"/>
                        <c:forEach items="${o.items}" var="i">
                            <c:if test="${i.accid eq sessionScope.acc.id}">
                                <c:set var="showTotal" value="true" />
                                <tr>
                                    <td><img style="width: 100px" src="${i.product.img}" alt="alt"/></td>
                                    <td>
                                        <a style="text-decoration: none; color: black" href="productDetail?proid=${i.product.id}">
                                            ${i.product.proName}
                                        </a>
                                    </td>
                                    <td style="text-align: center">${i.quantity}</td>
                                    <td><fmt:formatNumber value="${i.product.price}" type="number" pattern="#,##0" /> VND</td>
                                    <td><fmt:formatNumber value="${(i.product.price * i.quantity)}" type="number" pattern="#,##0" /> VND</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="table">
                    <c:if test="${showTotal}">
                        <thead class="thead fs-poppins text-black bold-700">
                            <tr>
                                <td>
                                    <label class="">Subtotal: </label>
                                </td>
                                <td><fmt:formatNumber value="${o.getTotalMoney(sessionScope.acc.id)}" type="number" pattern="#,##0" />VND</td>
                            </tr>
                        </thead>
                        <c:set var="rate" value="${rate}" />
                        <thead class="thead fs-poppins text-black bold-700">
                            <tr>
                                <td>
                                    <label class="">Discount </label>
                                </td>
                                <td>- <fmt:formatNumber value="${o.getTotalMoney(sessionScope.acc.id) *(rate)}" type="number" pattern="#,##0" /> VND</td>
                            </tr>
                        </thead>
                        
                        <thead class="thead fs-poppins text-black bold-700">
                            <tr>
                                <td>
                                    <label style="color: red; font-size: 20px" class="col-12 col-sm-4 col-form-label text-sm-right">Total: </label>
                                </td>
                                <td class="bold-700">
                                    <label class="text-red">
                                        <label style="color: red; font-size: 20px">
                                            <fmt:formatNumber value="${o.getTotalMoney(sessionScope.acc.id) *(1- rate)}" type="number" pattern="#,##0" />VND
                                        </label>
                                    </label>
                                </td>
                            </tr>
                        </thead>
                    </c:if>
                    <tbody>
                </table>
            </div>

            <div class="checkout-form">
                <div class="about-info">
                    <form style="width: 500px" id="validationform" action="checkout" method="post">
                        <input type="hidden" value="${sessionScope.acc.id}" name="cusid">
                        <input type="hidden" value="${rate}" name="disrate">
                        <div class="form-group">
                            <label class="col-form-label">Customer Name</label>
                            <div class="input-group">
                                <input type="text" name="name" value="${sessionScope.acc.full_name}" required="" placeholder="Input Name" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Phone Number</label>
                            <div class="input-group">
                                <input type="tel" name="phone" value="${sessionScope.acc.phone}" placeholder="Phone Number" required="" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Payment Method</label>
                            <div class="input-group">
                                <select class="form-control" name="pay">
                                    <c:forEach items="${pay}" var="p">
                                        <option value="${p.getPaymentMethodID()}">${p.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Address</label>
                            <div class="input-group">
                                <textarea required="" name="add" class="form-control">${sessionScope.acc.address}</textarea>
                            </div>
                        </div>
                        <div class="form-group text-right">
                            <div class="input-group">
                                <button type="submit" class="btn btn-space btn-primary">Submit</button>
                                <a href="home" class="btn btn-outline-danger" data-toggle="modal" data-target="#exampleModal${p.id}">Cancel</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>





        <!-- ========================About Section========================== -->




        <!-- =====================Footer Section================ -->

        <footer>

            <!-- =============Brands================= -->
            <section class="brands grid">
                <div>
                    <img src="img/br-1.png" alt="">
                </div>
                <div>
                    <img src="img/br-2.png" alt="">
                </div>
                <div>
                    <img src="img/br-3.png" alt="">
                </div>
                <div>
                    <img src="img/br-4.png" alt="">
                </div>
                <div>
                    <img src="img/br-5.png" alt="">
                </div>
            </section>

            <!-- =============Footer Menu=================== -->
            <section class="footer grid">
                <div class="footer-logo grid">
                    <img src="img/logo.png" alt="">
                    <p class="fs-montserrat fs-200">There are many variations passages of Lorem Ipsum available, but the majority have</p>
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
                        <li><a class="fs-montserrat text-black fs-200" href="#">Home</a></li>
                        <li><a class="fs-montserrat text-black fs-200" href="#">About</a></li>
                        <li><a class="fs-montserrat text-black fs-200" href="#">Shop</a></li>
                        <li><a class="fs-montserrat text-black fs-200" href="#">Contact</a></li>
                    </ul>
                </div>

                <div class="contact grid">

                    <h3 class="fs-poppins fs-200 bold-800">Contact</h3>
                    <p class="fs-montserrat">+99 (0) 101 0000 888 Patricia C. Amedee 4401 Waldeck Street Grapevine Nashville, Tx 76051</p>
                </div>

                <div class="emails grid">
                    <h3 class="fs-poppins fs-200 bold-800">Subscribe To Our Email</h3>
                    <p class="updates fs-poppins fs-300 bold-800">For Latest News & Updates</p>
                    <div class="inputField flex bg-gray">
                        <input type="email" placeholder="Enter Your Email" class="fs-montserrat bg-gray" >
                        <button class="bg-red text-white fs-poppins fs-50">Subscribe</button>
                    </div>
                </div>
            </section>

            <section class="copyRight">
                <p class="c-font fs-montserrat fs-200">Â© 2022 eStore. All rights reserved.</p>
                <p class="fs-montserrat fs-100 text-align p-top">Privacy Policy . Term Condition</p>
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
        <style>
            /* General styles for the card layout */
            .checkout-container {
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                gap: 20px;
            }

            .product-summary, .checkout-form {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .product-summary {
                flex: 1;
            }

            .checkout-form {
                flex: 0 0 45%; /* Adjust this width as needed */
            }

            .table {
                width: 100%;
                margin-bottom: 1rem;
                color: #212529;
            }

            .table th,
            .table td {
                padding: 12px;
                vertical-align: middle;
                border-top: 1px solid #dee2e6;
            }

            .table thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
            }

            .table tbody + tbody {
                border-top: 2px solid #dee2e6;
            }

            .bg-light {
                background-color: #f1f1f1 !important;
            }

            .fs-poppins {
                font-family: 'Poppins', sans-serif;
            }

            .text-black {
                color: #000;
            }

            .bold-700 {
                font-weight: 700;
            }

            .text-red {
                color: red;
            }

            .form-group {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }

            .col-form-label {
                font-weight: 600;
                margin-right: 10px;
                width: 30%; /* Adjust the width of the labels */
            }

            .input-group {
                flex: 1;
            }

            input.form-control, select.form-control, textarea.form-control {
                width: 100%;
                border-radius: 5px;
                border: 1px solid #ccc;
                padding: 10px;
                background-color: #f9f9f9;
                transition: all 0.3s ease-in-out;
            }

            input.form-control:focus, select.form-control:focus, textarea.form-control:focus {
                border-color: #007bff;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
                background-color: #e9f5ff;
            }

            textarea.form-control {
                height: auto;
            }

            select.form-control {
                height: auto;
            }

            button.btn-space {
                margin-right: 10px;
            }

            button.btn-primary, a.btn-outline-danger {
                padding: 10px 20px;
                border-radius: 5px;
            }

            button.btn-primary {
                background-color: #007bff;
                border: none;
                color: white;
                transition: background-color 0.3s ease;
            }

            button.btn-primary:hover {
                background-color: #0056b3;
            }

            a.btn-outline-danger {
                border: 1px solid #dc3545;
                color: #dc3545;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            a.btn-outline-danger:hover {
                background-color: #dc3545;
                color: white;
            }

        </style>
    </body>
</html>