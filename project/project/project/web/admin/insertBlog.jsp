<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
        <link href="${pageContext.request.contextPath}/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fonts/fontawesome/css/fontawesome-all.css">
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
                    <div class="card">
                        <h5 class="card-header">Insert Blog</h5>
                        <div class="card-body">
                            <form id="myForm" action="createblog"  method="post" enctype="multipart/form-data">
                                <input type="hidden" value="${sessionScope.acc.id}" name="acid"/>
                                 <div class="form-group row">
                                    <label class="col-12 col-sm-3 col-form-label text-sm-right">Blog Title</label>
                                    <div class="col-12 col-sm-8 col-lg-6">
                                        <input type="text" name="title" required="" placeholder="Input Title" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-12 col-sm-3 col-form-label text-sm-right">Description</label>
                                    <div class="col-12 col-sm-8 col-lg-6">
                                        <input type="text" name="des"  required=""   class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-12 col-sm-8 col-lg-6">
                                        <img id="imagePreview" src="#"  style="max-height: 200px; display: none;float: right;">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-12 col-sm-3 col-form-label text-sm-right">Blog Banner</label>
                                    <div class="col-12 col-sm-8 col-lg-6">
                                        <input required="" type="file" id="fileInput" name="img" multiple accept="image/*" class="form-control" id="fileInput" onchange="previewImage(this)">
                                    </div>
                                    <div id="errorMessage" class="error"></div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-12 col-sm-3 col-form-label text-sm-right">Publication Date</label>
                                    <div class="col-12 col-sm-8 col-lg-6">
                                        <input required="" type="date" name="date" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-12 col-sm-3 col-form-label text-sm-right">Blog Content</label>
                                    <div class="col-12 col-sm-8 col-lg-6">
                                       <div id="editor" style="height: 300px;">
                                </div>
                                <input type="hidden" id="editorContent" name="content">
                                    </div>
                               
                                </div>
                                <div class="form-group row text-right">
                                    <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                        <button type="submit" class="btn btn-space btn-primary">Submit</button>
                                        <a href="#" class="btn btn-outline-danger"  data-toggle="modal" data-target="#exampleModal${p.id}">Cancel</a>
                                    </div>
                                </div>
                            </form>
                            <div class="modal fade" id="exampleModal${p.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Cancel Update</h5>
                                            <a href="#" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </a>
                                        </div>
                                        <div class="modal-body">
                                            <p>Are you sure to Cancle update this product. Your data you input will not SAVE</p>
                                        </div>
                                        <div class="modal-footer">
                                            <a href="productmanage" class="btn btn-secondary" >Confirm Cancel Insert</a>
                                            <a href="#" class="btn btn-primary" data-dismiss="modal">Dismiss</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
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

    
</script>

<script>
    function previewImage(input) {
        var imagePreview = document.getElementById('imagePreview');
        var file = input.files[0];

        if (file) {
            var reader = new FileReader();
            reader.onload = function (e) {
                imagePreview.src = e.target.result;
                imagePreview.style.display = 'block';
            };
            reader.readAsDataURL(file);
        } else {
            imagePreview.src = "#";
            imagePreview.style.display = 'none';
        }
    }
</script>
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    <script>
                                        // Initialize Quill
                                        var quill = new Quill('#editor', {
                                            theme: 'snow', // 'snow' is one of the themes available
                                            modules: {
                                                toolbar: {
                                                    container: [
                                                        [{'header': [1, 2, false]}],
                                                        ['bold', 'italic', 'underline', 'strike'],
                                                        [{'color': []}, {'background': []}],
                                                        [{'align': []}],
                                                        ['link', 'image'], // Add 'image' button
                                                        ['clean']
                                                    ],
                                                },
                                            },
                                        });
                                        document.getElementById('myForm').addEventListener('submit', function (event) {
                                            // Get Quill's HTML content
                                            var htmlContent = document.querySelector('.ql-editor').innerHTML;
                                            // Set the content to the input field with name "content"
                                            document.querySelector('input[name="content"]').value = htmlContent;
                                        });
    </script>
</body>

</html>