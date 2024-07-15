<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
        <!-- Bootstrap CSS -->
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="jquery-3.7.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/table2excel.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
        <link href="${pageContext.request.contextPath}/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/datatables/css/dataTables.bootstrap4.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/datatables/css/buttons.bootstrap4.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/datatables/css/select.bootstrap4.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/datatables/css/fixedHeader.bootstrap4.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/vector-map/jqvmap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/jvectormap/jquery-jvectormap-2.0.2.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fonts/flag-icon-css/flag-icon.min.css">
        <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
        <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
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
                                                        <div class="notification-list-user-img"><img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/avatar-2.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                        <div class="notification-list-user-block"><span class="notification-list-user-name">Jeremy Rakestraw</span>accepted your invitation to join the team.
                                                            <div class="notification-date">2 min ago</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a href="#" class="list-group-item list-group-item-action">
                                                    <div class="notification-info">
                                                        <div class="notification-list-user-img"><img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/avatar-3.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                        <div class="notification-list-user-block"><span class="notification-list-user-name">
                                                                John Abraham</span>is now following you
                                                            <div class="notification-date">2 days ago</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a href="#" class="list-group-item list-group-item-action">
                                                    <div class="notification-info">
                                                        <div class="notification-list-user-img"><img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/avatar-4.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                        <div class="notification-list-user-block"><span class="notification-list-user-name">Monaan Pechi</span> is watching your main repository
                                                            <div class="notification-date">2 min ago</div>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a href="#" class="list-group-item list-group-item-action">
                                                    <div class="notification-info">
                                                        <div class="notification-list-user-img"><img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/avatar-5.jpg" alt="" class="user-avatar-md rounded-circle"></div>
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
                                                <a href="#" class="connection-item"><img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/github.png" alt="" > <span>Github</span></a>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                                <a href="#" class="connection-item"><img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/dribbble.png" alt="" > <span>Dribbble</span></a>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                                <a href="#" class="connection-item"><img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/dropbox.png" alt="" > <span>Dropbox</span></a>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                                <a href="#" class="connection-item"><img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/bitbucket.png" alt=""> <span>Bitbucket</span></a>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                                <a href="#" class="connection-item"><img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/mail_chimp.png" alt="" ><span>Mail chimp</span></a>
                                            </div>
                                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                                <a href="#" class="connection-item"><img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/slack.png" alt="" > <span>Slack</span></a>
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

            <!-- ============================================================== -->
            <!-- end left sidebar -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- wrapper  -->
            <!-- ============================================================== -->
            <div class="dashboard-content">

                <!-- ============================================================== -->
                <!-- revenue  -->
                <!-- ============================================================== -->

                <!-- ============================================================== -->
                <!-- end total sale  -->
                <!-- ============================================================== -->
            
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="page-header">
                    <h2 class="pageheader-title">Check out</h2>
                    <p class="pageheader-text">Proin placerat ante duiullam scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi lobortis pulvinar quam.</p>
                    <div class="page-breadcrumb">
                        <nav aria-label="breadcrumb">

                    </div >
</div>
                    <div class="row">
                        <!-- ============================================================== -->
                        <!-- top selling products  -->
                        <!-- ============================================================== -->
                        <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Top  Products</h5>
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="bg-light">
                                                <tr class="border-0">
                                                    <td>Image</td>
                                                    <td>Product</td>
                                                    <td>Price</td>
                                                    <td>Quantity</td>
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
                                                                <a style="text-decoration: none;
                                                                   color: black" href="productDetail?proid=${i.product.id}">
                                                                    ${i.product.proName}
                                                                </a>
                                                            </td>
                                                            <td style="text-align: center">  ${i.quantity}
                                                            </td>
                                                            <td><fmt:formatNumber value="${i.product.price}" type="number" pattern="#,##0" /> VND</td>
                                                            <td><fmt:formatNumber value="${(i.product.price * i.quantity)}" type="number" pattern="#,##0" /> VND</td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <h5 class="card-header">PayMent Detail</h5>
                                <div class="card-body p-0">
                                    <div class="table-responsive">
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
                                                <thead class="thead fs-poppins text-black bold-700">
                                                    <tr>
                                                        <td>
                                                            <label class="">Discount </label>
                                                        </td>
                                                        <td>${voucher.getDiscountID()}</td>
                                                    </tr>
                                                </thead>
                                                <c:set var="rate" value="${rate}" />
                                                <thead class="thead fs-poppins text-black bold-700">
                                                    <tr>
                                                        <td>
                                                            <label style="color: red; font-size: 20px" class="col-12 col-sm-4 col-form-label text-sm-right">Total: </label>
                                                        </td>
                                                        <td class="bold-700"><label class="text-red"><label style="color: red; font-size: 20px" ><fmt:formatNumber value="${o.getTotalMoney(sessionScope.acc.id) *(1- rate)}" type="number" pattern="#,##0" />VND</label></td>
                                                    </tr>
                                                </thead>
                                            </c:if>
                                            <tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- ============================================================== -->
                        <!-- end top selling products  -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- revenue locations  -->
                        <!-- ============================================================== -->
                        <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Customer detail</h5>
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <form id="validationform" action="checkout"  method="post" >
                                            <input type="hidden" value="${sessionScope.acc.id}" name="cusid">
                                            <input type="hidden" value="${rate}" name="disrate">
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Customer Name</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input type="text" name="name" value="${sessionScope.acc.full_name}" required="" placeholder="Input Name" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Phone Number</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input type="tel" name="phone" value="${sessionScope.acc.phone}" placeholder="Phone Number"  required=""   class="form-control">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Payment Method</label>
                                                <div class="col-12 col-sm-10 col-lg-6">
                                                    <select style="height: 100%; width: 100%" name="pay">
                                                        <c:forEach items="${pay}" var="p">
                                                            <option  value="${p.getPaymentMethodID()}">${p.getName()}</option>
                                                        </c:forEach>

                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Address</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <textarea required="" name="add"  class="form-control">${sessionScope.acc. address}</textarea>
                                                </div>
                                            </div>
                                            <div class="form-group row text-right">
                                                <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                    <button type="submit" class="btn btn-space btn-primary">Submit</button>
                                                    <a href="#" class="btn btn-outline-danger"  data-toggle="modal" data-target="#exampleModal${p.id}">Cancel</a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- ============================================================== -->
                        <!-- end revenue locations  -->
                        <!-- ============================================================== -->
                    </div>

                    <!-- ============================================================== -->
                    <!-- footer -->
                    <!-- ============================================================== -->

                    <!-- ============================================================== -->
                    <!-- end footer -->
                    <!-- ============================================================== -->
                </div>
                <!-- ============================================================== -->
                <!-- end wrapper  -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- end main wrapper  -->
            <!-- ============================================================== -->
            <!-- Optional JavaScript -->
            <!-- jquery 3.3.1 js-->
            <script src="${pageContext.request.contextPath}/vendor/jquery/jquery-3.3.1.min.js"></script>
            <!-- bootstrap bundle js-->
            <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.js"></script>
            <!-- slimscroll js-->
            <script src="${pageContext.request.contextPath}/vendor/slimscroll/jquery.slimscroll.js"></script>
            <!-- chartjs js-->
            <script src="${pageContext.request.contextPath}/vendor/charts/charts-bundle/Chart.bundle.js"></script>
            <script src="${pageContext.request.contextPath}/vendor/charts/charts-bundle/chartjs.js"></script>

            <!-- main js-->
            <script src="${pageContext.request.contextPath}/js/admin/main-js.js"></script>
            <!-- jvactormap js-->
            <script src="${pageContext.request.contextPath}/vendor/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
            <script src="${pageContext.request.contextPath}/vendor/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
            <!-- sparkline js-->
            <script src="${pageContext.request.contextPath}/vendor/charts/sparkline/jquery.sparkline.js"></script>
            <script src="${pageContext.request.contextPath}/vendor/charts/sparkline/spark-js.js"></script>
            <!-- dashboard sales js-->
            <script src="${pageContext.request.contextPath}/js/admin/dashboard-sales.js"></script>
            <script>

                const xArrayString = '<%= request.getAttribute("brand") %>';
                const yArrayString = '<%= request.getAttribute("sll") %>';


                const xArray = xArrayString.split(",").map(item => item.replace(/"/g, ''));
                const yArray = yArrayString.split(",").map(Number);


                const layout = {title: ""};


                const data = [{
                        x: xArray,
                        y: yArray,
                        type: "line"
                    }];

                // V? bi?u ?? b?ng Plotly
                Plotly.newPlot("myPlot", data, layout);

                const xCateString = '<%= request.getAttribute("cate") %>';
                const yCateString = '<%= request.getAttribute("catesl") %>';

                // Phân tách chuỗi để tạo mảng
                const xCateArray = xCateString.split(",");
                const yCateArray = yCateString.split(",").map(Number);

                // Thiết lập layout cho biểu đồ
                const layoutcate = {title: ""};

                // Thiết lập dữ liệu cho biểu đồ
                const datacate = [{labels: xCateArray, values: yCateArray, type: "pie"}];

                // Vẽ biểu đồ bằng Plotly
                Plotly.newPlot("catePlot", datacate, layoutcate);
            </script>
    </body>

</html>