<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"
              />
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
        <link rel="stylesheet" href="css/shoppage/orderdetail.css" />
        <script src="js/shoppage/index.js" defer></script>
        <script src="js/shoppage/product.js" defer></script>
        <style>
            /* Thêm CSS ở đây */
            .shipper-info-container {
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .order-status-red {
                color: red;
                font-family: 'Montserrat', sans-serif;
                font-size: 1.5em;
            }

            .order-status-black {
                color: black;
                font-family: 'Montserrat', sans-serif;
                font-size: 1.5em;
            }

            .info-block h4 {
                font-family: inherit; /* Kế thừa font-family từ phần tử cha */
                font-size: 1.2em;
                margin: 10px 0;
                font-weight: bold;
                color: #333;
            }

            .info-block p {
                font-family: 'Montserrat', sans-serif;
                line-height: 1.5;
                font-size: 1em;
                margin: 5px 0;
                color: #555;
            }
        </style>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const prevBtn = document.querySelector('.prev-btn');
                const nextBtn = document.querySelector('.next-btn');
                const sliderContent = document.querySelector('.slider-content');

                prevBtn.addEventListener('click', function () {
                    sliderContent.scrollBy({
                        left: -620,
                        behavior: 'smooth'
                    });
                });

                nextBtn.addEventListener('click', function () {
                    sliderContent.scrollBy({
                        left: 620,
                        behavior: 'smooth'
                    });
                });
            });

        </script>
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
             <c:if test="${mess != null}">
            <div id="notification" class="hidden">
            ${mess}
        </div>
            </c:if>
        </header>

        <!-- ==================Single Product-============================= -->
        <section class="order-detail-slider">
            <div class="slider-container">
                <button class="slider-btn prev-btn">&#10094;</button>
                <div class="slider-content">
                    <c:forEach items="${detail}" var="d">
                        <div class="order-detail-product">
                            <img class="product-image" src="${d.proimg}" alt="Product Image 1">
                            <div class="product-info">
                                <h4  class="product-name"><a style="text-decoration: #666666; color: #666666;font-family: var" href="productDetail?proid=${d.product_id}">${d.proName}</a></h4>
                                <div class="">
                                    <p>Quantity: ${d.quantity}</p>
                                </div>
                                <div class="product-price">
                                    <p><fmt:formatNumber value="${(d.total_price)}" type="number" pattern="#,##0" /> VND</p>
                                </div>
                                <div style="margin: 5px 0;">
                                    <c:forEach items="${brand}" var="b">
                                        <c:if test="${d.brand_id eq b.id}">
                                            <p>Brand : ${b.brand_name}</p>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <div class="">
                                    <c:forEach items="${cate}" var="c">
                                        <c:if test="${d.caid eq c.id}">
                                            <p>${c.ca_name}</p>
                                        </c:if>
                                    </c:forEach>
                                </div>

                            </div>
                            <c:choose>
                                <c:when test="${fn:contains(order.shipstatus, 'Received  Successfully')}">
                                    <div class="inputField flex">
                                        <button class="bg-yellow text-white fs-poppins fs-50" type="button" data-toggle="modal" data-target="#exampleModal${d.product_id}">
                                            Review
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <!-- Nếu không cần xử lý gì ở đây thì có thể để trống -->
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal${d.product_id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 class="modal-title" id="exampleModalLabel">Đánh giá sản phẩm ${d.proName}</h3>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="procomment" method="post" id="modalForm${d.product_id}">
                                        <input type="hidden" value="${d.product_id}" name="proid"/>
                                        <input type="hidden" value="${sessionScope.acc.id}" name="cusid"/>
                                        <input type="hidden" value="${d.order_id}" name="oid"/>

                                        <div class="modal-body">
                                            <label for="productReview${d.product_id}">Đánh giá sản phẩm:</label>
                                            <textarea id="productReview${d.product_id}" name="context"></textarea>
                                            <label for="productRating${d.product_id}">Đánh giá:</label>
                                            <div class="rating">
                                                <input type="radio" id="star5-${d.product_id}" name="rating" value="5" /><label for="star5-${d.product_id}">★</label>
                                                <input type="radio" id="star4-${d.product_id}" name="rating" value="4" /><label for="star4-${d.product_id}">★</label>
                                                <input type="radio" id="star3-${d.product_id}" name="rating" value="3" /><label for="star3-${d.product_id}">★</label>
                                                <input type="radio" id="star2-${d.product_id}" name="rating" value="2" /><label for="star2-${d.product_id}">★</label>
                                                <input type="radio" id="star1-${d.product_id}" name="rating" value="1" /><label for="star1-${d.product_id}">★</label>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn bg-red" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn bg-green">Save changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>


                    </c:forEach>
                    <button class="slider-btn next-btn">&#10095;</button>
                </div>
            </div>
        </section>

        <!-- ==================Single Product-============================= -->

        <!-- ==============Product Description====================== -->

        <section style="padding-top: 5vh" class="product-description grid">

            <div class="shipper-info-container" data-tab="false">
                <c:if test="${shiper.id == 0}">
                    <h3 class="order-status-red">Your Order In Process</h3>
                </c:if>
                <c:if test="${shiper.id != 0}">
                    <h3 class="order-status-black">Your Shipper</h3>
                    <div class="info-block">
                        <h4>Shipper Name:</h4> 
                        <p class="shipper-name">${shiper.full_name}</p>
                    </div>
                    <div class="info-block">
                        <h4>Phone Number:</h4> 
                        <p class="shipper-phone">${shiper.phone}</p>
                    </div>
                    <div class="info-block">
                        <h4>Ship Status</h4> 
                        <p class="shipper-phone">${order. shipstatus}</p>
                    </div>
                </c:if>
            </div>
        </section>
        <section style="padding-top: 5vh" class="product-description grid">

            <div class="shipper-info-container" data-tab="false">

                <h3 class="order-status-black">Your Order</h3>
                <div class="info-block">
                    <label>Order Code:  </label>
                    &nbsp;
                    <strong style="font-family: sans-serif;font-weight: normal" class="shipper-name">${order.id}</strong>
                </div>
                <div class="info-block">
                    <label>Customer name :  </label>
                    &nbsp;
                    <strong style="font-family: sans-serif;font-weight: normal" class="shipper-name">${order.cus_name}</strong>
                </div>
                <div class="info-block">
                    <label>Order Date :  </label>
                    &nbsp;
                    <strong style="font-family: sans-serif;font-weight: normal" class="shipper-name">${order.orderDate}</strong>
                </div>
                <div class="info-block">
                    <label>Address :  </label>
                    &nbsp;
                    <strong style="font-family: sans-serif;font-weight: normal" class="shipper-name">${order.adress}</strong>
                </div>

                <div class="info-block">
                    <label>Total Amount:  </label>
                    &nbsp;
                    <strong style="font-family: sans-serif;font-weight: normal;color: red" class="shipper-name"><fmt:formatNumber value="${order.totalAmount}" type="number" pattern="#,##0" /> VND</strong>
                </div>
                <div class="info-block">
                    <label>Payment Method :  </label>
                    &nbsp;
                    <c:forEach items="${pay}" var="pay">
                        <c:if test="${order.payment_id eq pay.getPaymentMethodID()}">
                            <strong style="font-family: sans-serif;font-weight: normal" class="shipper-name">${pay.getName()}</strong>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="info-block">
                    <label>Payment Status :  </label>
                    &nbsp;
                    <c:forEach items="${orsta}" var="sta">
                        <c:if test="${order.status_id eq sta.getStatusID()}">
                            <strong style="font-family: sans-serif;font-weight: normal" class="shipper-name">${sta.getDescription()}</strong>
                        </c:if>
                    </c:forEach>
                </div>

            </div>
        </section>


        <!-- ==============Product Description====================== -->

        <!-- ============Related Product Section===================== -->

        <!-- =================Related Product Section ================================ -->

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
        <script>
            $(document).ready(function () {
                $('[data-toggle="modal"]').on('click', function () {
                    var targetModal = $(this).data('target');
                    $(targetModal).modal('show');
                });

                // Đóng modal khi submit form


                // Đóng modal khi nhấn vào nút đóng
                $('.close').on('click', function () {
                    var modalId = $(this).closest('.modal').attr('id');
                    $('#' + modalId).modal('hide');
                });

                // Đóng modal khi nhấn ra ngoài modal
                $(window).on('click', function (event) {
                    if ($(event.target).hasClass('modal')) {
                        $('.modal').modal('hide');
                    }
                });
            });
            document.getElementById('showNotification').addEventListener('click', function () {
                document.getElementById('notification').classList.remove('hidden');
                setTimeout(function () {
                    document.getElementById('notification').classList.add('hidden');
                }, 10000); // Đợi 1 giây trước khi ẩn đi
            });
        </script>
        <style>
            /* Center the modal and create a black overlay */
            .modal.fade .modal-dialog {
                transition: transform 0.3s ease-out;
                transform: translateY(-100%);
            }

            .modal.show .modal-dialog {
                transform: translateY(0);
            }

            .modal-content {
                background-color: #ffffff; /* Background trắng */
                border: 1px solid #ddd; /* Border màu nhạt */
                border-radius: 10px;
                padding: 20px;
                width: 100vh; /* Tăng kích thước chiều rộng modal */
                max-width: 1200px; /* Đặt kích thước tối đa */
                margin: auto;
            }

            .modal {
                display: none; /* Ẩn modal mặc định */
                position: fixed;
                top: 50%; /* Đẩy modal lên trên dưới 50% của viewport */
                left: 50%; /* Đẩy modal sang phải trái 50% của viewport */
                transform: translate(-50%, -50%); /* Dịch chuyển modal điều chỉnh sao cho nó căn giữa */
                z-index: 1050; /* Đảm bảo modal hiển thị trên các thành phần khác */
            }

            .modal.show {
                display: block; /* Hiển thị modal khi có lớp .show */
            }

            .modal-backdrop {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5); /* Adjust the opacity as needed */
                z-index: 1040; /* Đảm bảo overlay hiển thị sau modal */
            }

            .modal-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px;
                border-bottom: 1px solid #dee2e6;
                background-color: #f8f9fa; /* Màu nền header */
            }

            .modal-title {
                font-size: 1.5rem;
                margin: 0;
                color: #333; /* Màu chữ tiêu đề */
            }

            .close {
                font-size: 1.5rem;
                background: none;
                border: none;
                cursor: pointer;
                color: #aaa; /* Màu nút đóng */
            }

            .close:hover {
                color: #000; /* Màu khi hover */
            }

            /* Form styles */
            .modal-body {
                padding: 20px;
                display: flex;
                flex-direction: column;
            }

            .modal label {
                display: block;
                margin-top: 10px;
                color: #333; /* Màu chữ nhãn */
            }

            .modal textarea,
            .modal input[type="file"] {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ced4da;
                border-radius: 5px;
            }

            .modal-footer {
                display: flex;
                justify-content: flex-end;
                padding: 10px;
                border-top: 1px solid #dee2e6;
                background-color: #f8f9fa; /* Màu nền footer */
            }

            .modal-footer button {
                padding: 10px 20px;
                margin-left: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                color: #fff; /* Màu chữ nút */
            }

            .modal-footer .btn-secondary {
                background-color: #6c757d; /* Màu nút Close */
            }

            .modal-footer .btn-secondary:hover {
                background-color: #5a6268; /* Màu khi hover */
            }

            .modal-footer .btn-primary {
                background-color: #007bff; /* Màu nút Save changes */
            }

            .modal-footer .btn-primary:hover {
                background-color: #0056b3; /* Màu khi hover */
            }

            /* Rating styles */
            .rating {
                display: flex;
                justify-content: center;
                gap: 10px;
            }

            .rating input {
                display: none;
            }

            .rating label {
                font-size: 2rem;
                color: #ddd;
                cursor: pointer;
            }

            .rating input:checked ~ label,
            .rating input:checked ~ label ~ label {
                color: #FFD700;
            }

            .rating label:hover,
            .rating label:hover ~ label {
                color: #FFD700;
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
    </body>
</html>
