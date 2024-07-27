<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Thêm tin tức| Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="admin/css/main.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
        <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
        <!-- Navbar-->
    <header class="app-header">
        <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                        aria-label="Hide Sidebar"></a>
        <!-- Navbar Right Menu-->
        <ul class="app-nav">


            <!-- User Menu-->
            <li><a class="app-nav__item" href="logout"><i class='bx bx-log-out bx-rotate-180'></i> </a>

            </li>
        </ul>
    </header>
    <!-- Sidebar menu-->
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
        <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="admin/images/user.png" width="50px"
                                            alt="User Image">
            <div>
                <p class="app-sidebar__user-name"><b>${sessionScope.admin.accName}</b></p>
                <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
            </div>
        </div>
        <hr>

    </aside>
    <main class="app-content">
        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item">Danh sách tin</li>
                <li class="breadcrumb-item"><a href="#">Thêm tin</a></li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <h3 class="tile-title">Cập nhật tin</h3>
                    <div class="tile-body">
                        <form class="row" id="myForm" action="insertnews" method="POST" enctype="multipart/form-data">

                            <div class="col-md-5">
                                <h2 class="my-2 fw-bold">Hình ảnh tin tức</h2>
                                <div class="border-dotted p-5 d-flex flex-column box-input-image w-90 position-relative justify-content-center">
                                    <img id="imagePreview" src="#" class="img-fluid" style="max-height: 200px; display: none;">
                                    <input name="news_img" type="file" class="form-control-file" id="exampleFormControlFile1" onchange="previewImage(this)">

                                </div>
                                <c:if test="${not empty requestScope.imageError}">
                                    <div class="text-danger">${requestScope.imageError}</div>
                                </c:if>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="control-label">Mô tả tin</label>
                                <div id="editor" style="height: 300px;">
                                </div>
                                <input type="hidden" id="editorContent" name="content">
                            </div>
                            <button class="btn btn-save" type="submit">Lưu lại</button>
                            &nbsp;
                            <a class="btn btn-cancel" href="newsmanager">Hủy bỏ</a>
                        </form>
                    </div>
                </div>
            </div>
    </main>
    <script src="admin/js/jquery-3.2.1.min.js"></script>
    <script src="admin/js/popper.min.js"></script>
    <script src="admin/js/bootstrap.min.js"></script>
    <script src="admin/js/main.js"></script>
    <script src="admin/js/plugins/pace.min.js"></script>
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
