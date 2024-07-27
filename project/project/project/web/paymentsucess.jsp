<%-- 
    Document   : paymentsucess
    Created on : Jun 24, 2024, 11:13:35 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Thanh toán thành công</title>
  <link rel="stylesheet" href="styles.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
  <style>
      body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background: url('img/sucess.jpg') no-repeat center center fixed;
    background-size: cover;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }
  
  .payment-success-container {
    text-align: center;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }
  
  .payment-success-card {
    background: rgba(255, 255, 255, 0.9);
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    max-width: 450px;
    width: 100%;
    animation: fadeIn 1s ease-in-out;
  }
  
  @keyframes fadeIn {
    from {
      opacity: 0;
      transform: translateY(-10px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }
  
  .success-image {
    width: 80px;
    margin-bottom: 20px;
  }
  
  .payment-success-card h1 {
    color: #4CAF50;
    margin-bottom: 15px;
    font-size: 24px;
    font-weight: 600;
  }
  
  .payment-success-card p {
    margin: 15px 0;
    font-size: 16px;
    color: #555;
  }
  
  .payment-success-card button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 12px 24px;
    margin-top: 25px;
    border-radius: 25px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 500;
    transition: background-color 0.3s ease;
  }
  
  .payment-success-card button:hover {
    background-color: #45a049;
  }
  </style>
  <script type="text/javascript">
        var countdown = 10; // Số giây đếm ngược
        function updateCountdown() {
            if (countdown > 0) {
                document.getElementById("countdown").innerText = countdown;
                countdown--;
                setTimeout(updateCountdown, 1000); // Cập nhật mỗi giây
            } else {
                window.location.href = 'home'; 
            }
        }
        window.onload = function() {
            updateCountdown(); // Bắt đầu đếm ngược khi trang được tải
        }
    </script>
</head>
<body>
  <div class="payment-success-container">
    <div class="payment-success-card">
        <img src="img/sc.jfif" alt="Success" class="success-image">
      <h1>Payment successful!</h1>
      <p>Thank you for your purchase.</p>
      <p>Your order with order code ${orderId} has been successfully paid. BETASHOP will contact you soon to deliver the product or service.</p>
      <p>Redirecting to home in <span id="countdown">10</span> seconds...</p>
      <button onclick="window.location.href = 'home'">Return to Home</button>
      <button onclick="window.location.href = 'cusorderdetail?id=${orderId}'">View Order Detail</button>
    </div>
  </div>
</body>
</html>
