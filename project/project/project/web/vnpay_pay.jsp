<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet"
            />
        <link href="js/vnpay1/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="js/vnpay1/jumbotron-narrow.css" rel="stylesheet">      
        <script src="js/vnpay1/jquery-1.11.3.min.js"></script>
        <link rel="stylesheet" href="css/shoppage/index.css" />
        <script src="js/shoppage/index.js" defer></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
        <link href="${pageContext.request.contextPath}/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/fonts/fontawesome/css/fontawesome-all.css">
    </head>

    <body class="home">

        <div class="container">
            <div class="header clearfix">

                <header class="primary-header container flex">
                    <div class="header-inner-one flex">
                        <div class="logo">
                            <img src="img/logo.png" alt="" />
                        </div>

                    </div>
                </header>
            </div>
            <div class="card">
                 <c:set var="o" value="${cart}"/>
                 <c:set var="r" value="${rate}"/>
                 <c:set var="i" value="${o.getTotalMoney(sessionScope.acc.id)}"/>
                <h5 class="card-header">
                    <label style="font-size: 20px; text-align: center; font-family: sans-serif " for="amount">Số tiền: </label> &nbsp;
                    <strong style="font-size: 25px; text-align: center; color: #ff6666; font-family: sans-serif"><fmt:formatNumber value="${o.getTotalMoney(sessionScope.acc.id)*(1-r)}" type="number" pattern="#,##0" />đ</strong>
                </h5>

                <div class="card-body border-top">
                    <img style="display: flex; width: 15vh; " src="img/vnpay.webp" alt="alt"/>
                         <h4 style="font-size: 25px; text-align: center; color: #00ccff; font-family: sans-serif">Chọn phương thức thanh toán</h4>
                    
                     <form action="/WatchProject/vnpayajax" id="frmCreateOrder" method="post">  
                        <div class="form-group"> 
                            <input class="" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="hidden" value="<fmt:formatNumber value="${i}" type="number" pattern="###"/>" />
                            <input type="hidden" value="${sessionScope.acc.id}" name="accid"/>
                        </div>
                        <div class="form-group">
                            <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                            <label class="custom-control custom-radio">
                                <input type="radio"  id="bankCode" name="bankCode" value="" checked="true" class="custom-control-input"><span for="bankCode" class="custom-control-label">Cổng thanh toán VNPAYQR</span>
                            </label>
                            <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                            <label class="custom-control custom-radio">
                                <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR" class="custom-control-input"><span for="bankCode" class="custom-control-label">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</span>
                            </label>
                            <label class="custom-control custom-radio">
                                <input type="radio" id="bankCode" name="bankCode" value="VNBANK" class="custom-control-input"><span for="bankCode" class="custom-control-label">Thanh toán qua thẻ ATM/Tài khoản nội địa</span>
                            </label>
                            <label class="custom-control custom-radio">
                                <input type="radio" id="bankCode" name="bankCode" value="INTCARD" class="custom-control-input"><span for="bankCode" class="custom-control-label">Thanh toán qua thẻ quốc tế</span>
                            </label>
                        </div>
                        <div class="form-group">
                            <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                            <label class="custom-control custom-radio">
                                <input type="radio"  id="language" Checked="True" name="language" value="vn" class="custom-control-input"><span for="language" class="custom-control-label">Tiếng Việt</span>
                            </label>
                            <label class="custom-control custom-radio">
                                <input type="radio" id="language" name="language" value="en" class="custom-control-input"><span for="language" class="custom-control-label">Tiếng Anh</span>
                            </label>
                        </div>
                        <button type="submit" class="btn btn-space btn-primary" href>Thanh toán</button>
                    </form>
                </div>
            </div>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>

        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>       
    </body>
</html>