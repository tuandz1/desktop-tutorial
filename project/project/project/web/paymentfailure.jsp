<%-- 
    Document   : paymentfailure
    Created on : Jun 24, 2024, 1:12:01 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Thanh toán thất bại</title>
  <link rel="stylesheet" href="styles.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
  <style>
      body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background: url('img/tissot.jpg') no-repeat center center fixed;
    background-size: cover;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    color: #fff;
  }
  
  .payment-failure-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    width: 100%;
    padding: 20px;
  }
  
  .payment-failure-card {
    background: rgba(0, 0, 0, 0.75);
    padding: 40px 30px;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
    max-width: 400px;
    width: 100%;
    text-align: center;
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
  
  .failure-image {
    width: 100px;
    margin-bottom: 20px;
  }
  
  .payment-failure-card h1 {
    color: #e74c3c;
    margin-bottom: 15px;
    font-size: 28px;
    font-weight: 600;
  }
  
  .payment-failure-card p {
    margin: 15px 0;
    font-size: 16px;
    color: #ddd;
  }
  
  .button-group {
    margin-top: 25px;
    display: flex;
    justify-content: center;
    gap: 15px;
  }
  
  .payment-failure-card button {
    background-color: #e74c3c;
    color: white;
    border: none;
    padding: 12px 24px;
    border-radius: 25px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 500;
    transition: background-color 0.3s ease;
  }
  
  .payment-failure-card button:hover {
    background-color: #c0392b;
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
  <div class="payment-failure-container">
    <div class="payment-failure-card">
        <img src="img/failure.webp" alt="Failure" class="failure-image">
      <h1>Payment Failed!</h1>
      <p>We're sorry, but your payment could not be processed.</p>
      <p>Please try again or contact support if the problem persists.</p>
       <p>Redirecting to home in <span id="countdown">10</span> seconds...</p>
      <button onclick="window.location.href = 'home'">Return to Home</button>
      <button onclick="window.location.href = 'showBills'">Try Again</button>
    </div>
  </div>
</body>
</html>