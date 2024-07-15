<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"/>

    <!-- Icon -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />
    <!-- icon -->

    <!-- Google fonts End -->

    <!-- custon style Sheet & JavaScript -->
    <link rel="stylesheet" href="css/shoppage/shop.css" />
    <link rel="stylesheet" href="css/shoppage/index.css" />
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
              <a class="fs-100 fs-montserrat bold-500" href="home"
                >Home</a
              >
            </li>
            <li>
              <a class="active fs-100 fs-montserrat bold-500" href="shop">Shop</a>
            </li>
            <li>
              <a class="fs-100 fs-montserrat bold-500" href="about.jsp"
                >About Us</a
              >
            </li>
            <li>
              <a class="fs-100 fs-montserrat bold-500" href="blog.jsp">Blog</a>
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
                    <a style="text-decoration: none; color: black"class="fs-100 fs-montserrat bold-500" href="login.jsp">Login</a></p>
                </c:if>
                <c:if test="${sessionScope.acc.full_name != null}">
                    <a style="text-decoration: none; color: black"class="fs-100 fs-montserrat bold-500" href="accsettings">${sessionScope.acc.getFull_name()}</a></p>
                    <a style="text-decoration: none; color: black"class="fs-100 fs-montserrat bold-500" href="login.jsp">Logout</a></p>
                </c:if>
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



    <!-- ===================Shop Feature Section============================ -->

    <section class="shop-feature bg-gray grid">
      <div>
        <p class="fs-montserrat text-black">
          Home <span aria-hidden="true" class="margin">></span> Product
        </p>
      </div>
      <h2 class="fs-poppins fs-300 bold-700">Product</h2>
    </section>

    <!-- ===================Section 2---------------------- -->

   

    <main class="shop-main-container grid">
      <!-- -------------------Inner Section=============== -->

      <div>
        <div class="shop-title flex">
          <div>
            <h2 class="fs-poppins fs-300">Shop</h2>
          
          </div>
          <div>
              <a class="fs-montserrat fs-100 bold-400" style="text-decoration: none; color: black;" href="shop?action=2"> Low To High</a> <br>
              <a class="fs-montserrat fs-100 bold-400" style="text-decoration: none; color: black;" href="shop?action=1">High To Low</a>
            </select>
          </div>
        </div>
        <!-- ---------------End----Inner Section=============== -->

        <!-- ==============Shop-product====================== -->

        <section class="shop-product grid">
            <c:forEach items="${pro}" var="p">
          <div class="product-list grid">
               <a class="fs-poppins bold-500" style="text-decoration: none; color: black"  href="productDetail?proid=${p.id}">
              <img style="height: 300px; max-width: 320px" src="${p.img}" alt="" />
            <p class="fs-montserrat bold-600">${p.proName}</p>
            <div class="shop-btn flex">
                <form class="shop-btn flex" action="addToCart" method="post">
                    <input type="hidden" value="${p.id}" name="id">
                    <input type="hidden" value="1" name="num">
                    <input type="hidden" name="acc_num" value="${sessionScope.acc.id}" />
                    <button  class="bg-red text-white fs-montserrat">  Add To Cart
              </button>
                </form>
              <p class="fs-montserrat bold-700"><fmt:formatNumber value="${p.price}" type="number" pattern="#,##0" /> VND</p>
            </div>
               </a>
            <!-- ===============Pop-Up========================== -->
          </div>
            <!-- ===============Pop-Up========================== -->
          </c:forEach>
         
        </section>
        <c:set var="xpage" value="${requestScope.page}"/>
        <div class="next-page fs-poppins flex ">
            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                <a style="text-decoration: white" href="shop?xpage=${i}&action=${ac}" class="bg-red text-white active bold-800">${i}</a>
            </c:forEach>
                <c:set var="spage" value="${requestScope.page1}"/>
                <c:forEach begin="${1}" end="${requestScope.num1}" var="i">
                <a style="text-decoration: white" href="search?spage=${i}&txt=${txt}" class="bg-red text-white active bold-800">${i}</a>
            </c:forEach>
        </div>
        
      </div>
      <!-- ==============Shop-product====================== -->
      <section>
            <form action="search" method="post">
        <div class="sidebar-search text-black bg-gray flex">
          <input
            type="text"
            placeholder="Search Here"
            class="fs-montserrat bg-gray"
            name="txt"
            value="${txt}"
          />
          <div>
            <i class="uil bg-red text-white uil-search"></i>
          </div>
        </div>
            </form>

        <aside class="sidebar-category">
          <div class="category-list flex">
            <h3 class=" fs-poppins bold-700 fs-200">Product Categories</h3>
            <i id="arrow" class="uil uil-angle-right" data-category="false"></i>
          </div>

          <div class="shop-category-list">
            <ul id="side-nav" class="sidebar-nav grid" data-category="false">
                <c:forEach items="${cate}" var="c">
              <li>
                <a class="fs-montserrat text-black bold-500" href="search?cate=${c.id}"
                  >${c.ca_name}</a>
              </li>
                </c:forEach>
            </ul>
          </div>
        </aside>
      </section>
    </main>








    <!-- =====================Footer Section================ -->

    <footer>

        <!-- =============Brands================= -->
        <section class="brands grid">
          <div>
         <img src="image/br-1.png" alt="">
        </div>
          <div>
         <img src="image/br-2.png" alt="">
        </div>
          <div>
         <img src="image/br-3.png" alt="">
        </div>
          <div>
         <img src="image/br-4.png" alt="">
        </div>
          <div>
         <img src="image/br-5.png" alt="">
        </div>
        </section>
    
    <!-- =============Footer Menu=================== -->
     <section class="footer grid">
         <div class="footer-logo grid">
           <img src="image/logo.png" alt="">
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
       <df-messenger
                intent="WELCOME"
                chat-title="Beta"
                agent-id="9e78c254-81b7-4fca-9822-1dde277cb01c"
                language-code="vi"
                ></df-messenger>
   <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
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
        document.getElementById('showNotification').addEventListener('click', function () {
                document.getElementById('notification').classList.remove('hidden');
                setTimeout(function () {
                    document.getElementById('notification').classList.add('hidden');
                }, 10000); // Đợi 1 giây trước khi ẩn đi
            });
   </script>
  </body>
</html>
