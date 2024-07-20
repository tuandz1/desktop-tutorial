<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

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
        <title>Manager </title>
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
                        <a class="d-xl-none d-lg-none" href="vouchermanage">Dashboard</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                             <ul class="navbar-nav flex-column">
                                <li class="nav-divider">
                                    Menu
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link active" href="dashboard" ><i class="fa fa-fw fa-user-circle"></i>Dashboard </a>

                                </li>
                                <c:if test="${sessionScope.acc.role_id == 4 || sessionScope.acc.role_id == 2}">
                                    <li class="nav-item ">
                                        <a class="nav-link " href="productmanage" ><i class="fa fa-fw fa-user-circle"></i>Product Manager </a>

                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.acc.role_id == 4}">
                                    <li class="nav-item ">
                                        <a class="nav-link " href="commentManage" ><i class="fa fa-fw fa-user-circle"></i>Comment Manage</a>

                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.acc.role_id == 2}">
                                    <li class="nav-item ">
                                        <a class="nav-link  " href="blogmanage" ><i class="fa fa-fw fa-user-circle"></i>Blog Manage</a>

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
                <div class="container-fluid  dashboard-content">
                    <c:if test="${mess != null}">
                        <div id="notification" class="">
                            ${mess}
                        </div>
                    </c:if>
                    <!-- ============================================================== -->
                    <!-- pageheader -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title">Voucher Manager</h2>
                                <p class="pageheader-text">Proin placerat ante duiullam scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi lobortis pulvinar quam.</p>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Product Manager</a></li>
                                        
                                        </ol>
                                    </nav>
                                </div >
                                <div class="row">
                                    <a href="vouchermanage?action=1" class="col-2 btn btn-primary text-white"><i class="  fas fa-plus-circle"></i> Add Voucher</a>
                                    &nbsp;
                                    <button id="exportBtn" class="col-2 btn btn-primary"><i class="  fas fa-plus-circle"></i> export to file</button>
                                    <form class="col-12 form-control" action="vouchermanage"method="post">
                                         <div class="input-group ">
                                             <input type="text" placeholder="Search...." name="txt" value="${search}" class="form-control">
                                                <div class="input-group-append">
                                                    <button type="submit" class="btn btn-primary">Search</button>
                                                </div>
                                            </div>
                                    </form>
                                </div>
                                <div class="row">   

                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end pageheader -->
                            <!-- ============================================================== -->

                            <div >
                                <!-- ============================================================== -->
                                <!-- basic table -->
                                <!-- ============================================================== -->

                                <!-- ============================================================== -->
                                <!-- end basic table -->
                                <!-- ============================================================== -->
                                <!-- ============================================================== -->
                                <!-- striped table -->
                                <!-- ============================================================== -->
                                <div >
                                    <div class="card">
                                        <h5 class="card-header">Striped Table</h5>
                                        <div class="card-body">
                                            <table id="userTable" class="table ">
                                                <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Discount Rate</th>
                                                        <th>Amount</th>
                                                        <th>Start Date</th>
                                                        <th>End Date</th>
                                                        <th>Funtion</th>
                                                    </tr>
                                                    </tr>
                                                </thead>
                                                <tbody id="contents">
                                                    <fmt:parseDate value="${currentTime}" pattern="yyyy-MM-dd HH:mm:ss" var="currentTime" />
                                                    <c:forEach items="${vou}" var="p">
                                                        <fmt:parseDate value="${p.getStartDate()}" pattern="yyyy-MM-dd HH:mm:ss" var="startDate" />
                                                        <fmt:parseDate value="${p.getEndDate()}" pattern="yyyy-MM-dd HH:mm:ss" var="endDate" />
                                                        <tr>
                                                            <td>${p.getDiscountID()}</td>
                                                            
                                                            <td > ${p.getDiscountRate()*100} % </td>
                                                            <td > ${p.getAmount()} </td>
                                                            <td > ${p.getStartDate()} </td>
                                                            <td > ${p.getEndDate()} </td>
                                                            <td>
                                                                <c:if test="${currentTime.before(startDate)|| currentTime.after(endDate)}">
                                                                <a href="#" class="btn btn-outline-danger"  data-toggle="modal" data-target="#exampleModal${p.getDiscountID()}"><i class=" fas fa-trash-alt"></i></a>
                                                                <div class="modal fade" id="exampleModal${p.getDiscountID()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog" role="document">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                                                <a href="#" class="close" data-dismiss="modal" aria-label="Close">
                                                                                    <span aria-hidden="true">&times;</span>
                                                                                </a>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <p>Are you sure to delete this Product</p>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <a href="vouchermanage?action=2&vid=${p.getDiscountID()}" class="btn btn-secondary" >Delete</a>
                                                                                <a href="#" class="btn btn-primary" data-dismiss="modal">Cancel</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                </c:if>
                                                                &nbsp; 
                                                                <a href="vouchermanage?action=3&vid=${p.getDiscountID()}" class="btn btn-outline-success"><i class=" fas fa-edit"></i></a>
                                                                 &nbsp; 
                                                                 <c:if test="${p.getStatus() == 1}">
                                                                      <a href="vouchermanage?action=4&vid=${p.getDiscountID()}" class="btn btn-outline-warning"><i class="fas fa-ban"></i></a>
                                                                 </c:if>
                                                                 <c:if test="${p.getStatus() != 1}">
                                                                      <a href="vouchermanage?action=5&vid=${p.getDiscountID()}" class="btn btn-outline-info"><i class="fas fa-check"></i></a>
                                                                 </c:if>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    
                                                </tbody>
                                            </table>
                                            <c:set var="xpage" value="${requestScope.page}"/>
                                            <div style="padding: 20px 0px;" class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12"> 
                                                <ul class="pagination">
                                                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                                        <li class="page-item"> <a style="text-decoration: white" href="vouchermanage?xpage=${i}&txt=${search}" class="page-link">${i}</a></li>
                                                    </c:forEach>
                                                    
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- ============================================================== -->
                                <!-- end striped table -->
                                <!-- ============================================================== -->
                            </div>

                            <!-- ============================================================== -->
                            <!-- end contextual table -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- responsive table -->
                            <!-- ============================================================== -->


                        </div>
                        <!-- ============================================================== -->
                        <!-- footer -->
                        <!-- ============================================================== -->
                        <div >
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
                <script src="${pageContext.request.contextPath}/vendor/custom-js/jquery.multi-select.html"></script>
                <script src="${pageContext.request.contextPath}/js/admin/main-js.js"></script>
                <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
                <script src="${pageContext.request.contextPath}/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
                <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
                <script src="${pageContext.request.contextPath}/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
                <script src="${pageContext.request.contextPath}/vendor/datatables/js/data-table.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
                <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
                <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
                <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
                <script src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
                <script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
                <script src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
                <script>

                </script>
                  <script>
            document.getElementById("exportBtn").addEventListener('click', function () {
                var table2excel = new Table2Excel();
                table2excel.export(document.querySelectorAll("#userTable"));
            });

        </script>
         <script type="text/javascript">
                function submitForm(formId) {
                    document.getElementById(formId).submit();
                }
                ;
                document.addEventListener("DOMContentLoaded", function () {
                    var mess = "${mess}"; // Đảm bảo rằng bạn nhận được giá trị của 'mess' từ server-side rendering

                    if (mess !== null && mess.trim() !== "") {
                        var notification = document.getElementById('notification');
                        if (notification) {
                            notification.innerHTML = mess;
                            notification.style.display = 'block'; // Hiển thị thông báo

                            setTimeout(function () {
                                notification.style.display = 'none'; // Ẩn thông báo sau 2 giây
                            }, 1000); // Thời gian 2 giây (2000 miligiây)
                        }
                    }
                });
            </script>
            <style>
                .radio-container {
                    display: flex;
                    gap: 20px; /* khoảng cách giữa các lựa chọn radio */
                }

                #notification {
                    display: none; /* Ẩn thông báo ban đầu */
                    padding: 10px;
                    color: white;
                    background-color: #33cc00f2;
                    border: 1px solid #ccc;
                    position: fixed;
                    top: 20px;
                    right: 20px;
                    z-index: 9999;
                }

            </style>
                </body>

                </html>     