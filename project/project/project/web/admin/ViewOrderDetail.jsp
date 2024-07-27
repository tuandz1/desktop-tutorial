<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">


    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Form Validation</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
        <link href="${pageContext.request.contextPath}/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fonts/fontawesome/css/fontawesome-all.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shoppage/orderdetail.css" />
    </head>

    <body>
        <!-- ============================================================== -->
        <!-- main wrapper -->
        <!-- ============================================================== -->
        <div class="dashboard-main-wrapper">
            <!-- ============================================================== -->
            <!-- navbar -->
            <!-- ============================================================== -->
            <div class="dashboard-header">
                <nav class="navbar navbar-expand-lg bg-white fixed-top">
                    <a class="navbar-brand" href="home">Beta Shop</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse " id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto navbar-right-top">
                            <li class="nav-item">

                            </li>
                            <li class="nav-item dropdown notification">
                                <a class="nav-link nav-icons" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-fw fa-bell"></i> <span class="indicator"></span></a>
                                <ul class="dropdown-menu dropdown-menu-right notification-dropdown">
                                    <li>
                                        <div class="notification-title"> Notification</div>
                                        <div class="notification-list">
                                            <div class="list-group">
                                                <a href="#" class="list-group-item list-group-item-action active">
                                                    <div class="notification-info">
                                                        <div class="notification-list-user-img"><img src="${pageContext.request.contextPath}/assets/images/avatar-2.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                        <div class="notification-list-user-block"><span class="notification-list-user-name">Jeremy Rakestraw</span>accepted your invitation to join the team.
                                                            <div class="notification-date">2 min ago</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a href="#" class="list-group-item list-group-item-action">
                                                    <div class="notification-info">
                                                        <div class="notification-list-user-img"><img src="${pageContext.request.contextPath}/assets/images/avatar-3.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                        <div class="notification-list-user-block"><span class="notification-list-user-name">
                                                                John Abraham</span>is now following you
                                                            <div class="notification-date">2 days ago</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a href="#" class="list-group-item list-group-item-action">
                                                    <div class="notification-info">
                                                        <div class="notification-list-user-img"><img src="${pageContext.request.contextPath}/assets/images/avatar-4.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                        <div class="notification-list-user-block"><span class="notification-list-user-name">Monaan Pechi</span> is watching your main repository
                                                            <div class="notification-date">2 min ago</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a href="#" class="list-group-item list-group-item-action">
                                                    <div class="notification-info">
                                                        <div class="notification-list-user-img"><img src="${pageContext.request.contextPath}/assets/images/avatar-5.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                        <div class="notification-list-user-block"><span class="notification-list-user-name">Jessica Caruso</span>accepted your invitation to join the team.
                                                            <div class="notification-date">2 min ago</div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="list-footer"> <a href="#">View all notifications</a></div>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown connection">
                                <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-fw fa-th"></i> </a>
                                <ul class="dropdown-menu dropdown-menu-right connection-dropdown">
                                    <li class="connection-list">
                                        <div class="row">
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                                <a href="#" class="connection-item"><img src="${pageContext.request.contextPath}/assets/images/github.png" alt="" > <span>Github</span></a>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                                <a href="#" class="connection-item"><img src="${pageContext.request.contextPath}/assets/images/dribbble.png" alt="" > <span>Dribbble</span></a>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                                <a href="#" class="connection-item"><img src="${pageContext.request.contextPath}/assets/images/dropbox.png" alt="" > <span>Dropbox</span></a>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                                <a href="#" class="connection-item"><img src="${pageContext.request.contextPath}/assets/images/bitbucket.png" alt=""> <span>Bitbucket</span></a>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                                <a href="#" class="connection-item"><img src="${pageContext.request.contextPath}/assets/images/mail_chimp.png" alt="" ><span>Mail chimp</span></a>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                                <a href="#" class="connection-item"><img src="${pageContext.request.contextPath}/assets/images/slack.png" alt="" > <span>Slack</span></a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="conntection-footer"><a href="#">More</a></div>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown nav-user">
                                <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="${sessionScope.acc.avatar}" alt="" class="user-avatar-md rounded-circle"></a>
                                <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                    <div class="nav-user-info">
                                        <h5 class="mb-0 text-white nav-user-name">
                                            ${sessionScope.acc.full_name}</h5>
                                        <span class="status"></span><span class="ml-2">Available</span>
                                    </div>
                                    <a class="dropdown-item" href="accountmanage?action=2&aid=${sessionScope.acc.id}"><i class="fas fa-user mr-2"></i>Account</a>
                                    <a class="dropdown-item" href="logout"><i class="fas fa-power-off mr-2"></i>Logout</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
            <!-- ============================================================== -->
            <!-- end navbar -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- left sidebar -->
            <!-- ============================================================== -->
            <div class="nav-left-sidebar sidebar-dark">
                <div class="menu-list">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="d-xl-none d-lg-none" href="productmanage">Dashboard</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                           <ul class="navbar-nav flex-column">
                                <li class="nav-divider">
                                    Menu
                                </li>
                                  <li class="nav-item ">
                                    <a class="nav-link active" href="productmanage" ><i class="fa fa-fw fa-user-circle"></i>Dashboard </a>

                                </li>
                                <c:if test="${sessionScope.acc.role_id == 4 || sessionScope.acc.role_id == 2}">
                                  <li class="nav-item ">
                                    <a class="nav-link " href="productmanage" ><i class="fa fa-fw fa-user-circle"></i>Product Manager </a>

                                </li>
                                </c:if>
                                <c:if test="${sessionScope.acc.role_id == 5 }">
                                <li class="nav-item ">
                                    
                                    <a class="nav-link  " href="accountmanage" ><i class="fa fa-fw fa-user-circle"></i>Account Manage </a>

                                </li>
                                </c:if>
                                <c:if test="${sessionScope.acc.role_id == 2}">
                                <li class="nav-item ">
                                    <a class="nav-link " href="brandmanage" ><i class="fa fa-fw fa-user-circle"></i>Brand Manage</a>

                                </li>
                                </c:if>
                                      <c:if test="${sessionScope.acc.role_id == 4}">
                                <li class="nav-item ">
                                    <a class="nav-link " href="commentManage" ><i class="fa fa-fw fa-user-circle"></i>Comment Manage</a>

                                </li>
                                </c:if>
                                <c:if test="${sessionScope.acc.role_id == 2}">
                                  <li class="nav-item ">
                                    <a class="nav-link  " href="catemanage" ><i class="fa fa-fw fa-user-circle"></i>Cate Manage</a>
                                    
                                </li>
                                </c:if>
                                <c:if test="${sessionScope.acc.role_id == 2}">
                                  <li class="nav-item ">
                                    <a class="nav-link  " href="blogmanage" ><i class="fa fa-fw fa-user-circle"></i>Blog Manage</a>
                                    
                                </li>
                                </c:if>
                                <c:if test="${sessionScope.acc.role_id == 4}">
                                  <li class="nav-item ">
                                    <a class="nav-link  " href="ordermanage" ><i class="fa fa-fw fa-user-circle"></i>Order Manage</a>

                                </li>
                                 </c:if>
                                <c:if test="${sessionScope.acc.role_id == 4}">
                                  <li class="nav-item ">
                                    <a class="nav-link  " href="vouchermanage" ><i class="fa fa-fw fa-user-circle"></i>Voucher Manage</a>

                                </li>
                                </c:if>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end left sidebar -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- wrapper  -->
            <!-- ============================================================== -->
            <div class="dashboard-wrapper">

                <!-- ============================================================== -->
                <!-- valifation types -->
                <!-- ============================================================== -->
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="">
                        <h5 class="card-header">View Order Detail</h5>
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
                                                <div style="font-size: 1.5em; color: red;font-family: inherit">
                                                    <p><fmt:formatNumber value="${d.total_price}" type="number" pattern="#,##0" /> VND</p>
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
                                        </div>
                                    </c:forEach>
                                    <button class="slider-btn next-btn">&#10095;</button>
                                </div>
                            </div>
                        </section>

                        <!-- ==================Single Product-============================= -->

                        <!-- ==============Product Description====================== -->
                        <div class="row " >
                            <section style="padding-top: 5vh" class=" col-lg-6 card product-description grid">

                                <div class="card-body shipper-info-container" data-tab="false">
                                    <c:if test="${shiper.id == 0}">
                                        <h3 class="order-status-red">This Order wait for confirming</h3>
                                        
                                        <a href="addShipper?orid=${order.id}" target="_blank" class="btn btn-secondary">Add Shipper</a>
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
                            <section style="padding-top: 5vh" class="col-lg-6 card product-description grid">

                                <div class="card-body shipper-info-container" data-tab="false">

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
                        </div>
                                  <a href="ordermanage"  class="btn btn-block btn-google-plus">Close</a>

                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end valifation types -->
            <!-- ============================================================== -->
        </div>

    </div>
    <!-- ============================================================== -->
    <!-- footer -->
    <!-- ============================================================== -->
    <div class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                    Copyright Â© 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                </div>
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                    <div class="text-md-right footer-links d-none d-sm-block">
                        <a href="javascript: void(0);">About</a>
                        <a href="javascript: void(0);">Support</a>
                        <a href="javascript: void(0);">Contact Us</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- end footer -->
    <!-- ============================================================== -->
</div>
</div>
<!-- ============================================================== -->
<!-- end main wrapper -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${pageContext.request.contextPath}/vendor/slimscroll/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/vendor/parsley/parsley.js"></script>
<script src="${pageContext.request.contextPath}/js/admin/main-js.js"></script>
<script>
    $('#form').parsley();
</script>
<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
    document.getElementById('fileInput').addEventListener('change', function (event) {
        const file = event.target.files[0];
        if (file) {
            const img = new Image();
            img.onload = function () {
                if (img.width === img.height) {
                    document.getElementById('errorMessage').textContent = '';
                    // Image is valid, proceed with upload or other actions
                } else {
                    document.getElementById('errorMessage').textContent = 'Image must have a 1:1 aspect ratio.';
                    event.target.value = ''; // Clear the file input
                }
            };
            img.onerror = function () {
                document.getElementById('errorMessage').textContent = 'Selected file is not a valid image.';
                event.target.value = ''; // Clear the file input
            };
            img.src = URL.createObjectURL(file);
        }
    });
    document.getElementById('fileInput2').addEventListener('change', function (event) {
        const files = event.target.files;
        const errorMessages = document.getElementById('errorMessages22');
        errorMessages.innerHTML = '';

        let allValid = true;

        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            const img = new Image();

            img.onload = function () {
                if (img.width !== img.height) {
                    allValid = false;
                    const message = `The image ${file.name} does not have a 1:1 aspect ratio.\n`;
                    errorMessages.innerHTML += message;
                }
            };

            img.src = URL.createObjectURL(file);
        }
    });




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
</body>

</html>