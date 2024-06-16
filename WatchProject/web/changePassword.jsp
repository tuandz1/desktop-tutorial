<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Custom styles-path -->
    <link rel="stylesheet" href="css/login/style.css">

    <!-- Font Awesome kit script -->
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>

    <!-- Google Fonts Open Sans-->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">

    <!-- Favicon -->
    <link rel="icon" href="img/html-5.png">
</head>

<body>
    <img class="wave" src="img/fogot.jpg">
    <div class="container">
        <div class="img">
           
        </div>
        <div class="login-container">
            <form action="changePassword" method="post">
                <h2>Change Password</h2>
                <input type="hidden" value="${sessionScope.acc.id}" name="id">
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-key"></i>
                    </div>
                    <div>
                        <input class="input" id="oldpass" name="oldpass" type="password" placeholder="Old Password" required=""onfocus="showPasswordRequirement()" onblur="showPasswordRequirement()">
                       
                    </div>
                </div>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-key"></i>
                    </div>
                    <div>
                        <input class="input" id="newpass" name="newpass" type="password" placeholder="New Password" required="" onfocus="showPasswordRequirement()" onblur="showPasswordRequirement()">
                    </div>
                </div>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-key"></i>
                    </div>
                    <div>
                        <input class="input" id="renewpass" name="renewpass" type="password" placeholder="Re Enter New Password" required="" onfocus="showPasswordRequirement()" onblur="showPasswordRequirement()">
                    </div>
                </div>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas "></i>
                    </div>
                    <div>
                        <select class="input" name="sq">
                            <c:forEach items="${sq}" var="s">
                                <option value="${s.id}">${s.ques_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                 <div class="input-div one">
                    <div class="i">
                        <i class="fas "></i>
                    </div>
                    <div>
                        <input class="input" name="ans" type="text" placeholder="Your Answer" required="">
                    </div>
                </div>
                 <span id="validation-message-old" style="display:none; color:red;">Password must be 8 characters at least and have special character </span>
                 <span id="validation-message-new" style="display:none; color:red;">Password must be 8 characters at least and have special character </span>
                 <span id="validation-message-renew" style="display:none; color:red;">Password must be 8 characters at least and have special character </span>
                      <p id="message" class="message"></p>
                      <h5>${mess}</h5>
                <p style="font-size: 12px; color: red">${mes}</p>
                <input type="submit" class="btn" value="Submit">
                <div class="account">
                    <p> </p>
                    <a href="mail">Forgot the password? ?</a>
                </div>
            </form>
        </div>
    </div>

    <script type="text/javascript" src="js/main.js"></script>
     <script>
            function showPasswordRequirement(inputId, messageId) {
    var passwordInput = document.getElementById(inputId);
    var passwordRequirement = document.getElementById(messageId); 
        const passwordRegex = /^(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$/;    
     if (passwordInput.value.length >= 8 && passwordRegex.test(passwordInput.value)) {
                passwordRequirement.style.display = "none";
            } else {
                passwordRequirement.style.display = "inline";
            }
}

  document.getElementById('oldpass').addEventListener('input', function() {
            showPasswordRequirement('oldpass', 'validation-message-old');
        });
  document.getElementById('newpass').addEventListener('input', function() {
            showPasswordRequirement('newpass', 'validation-message-new');
        });
  document.getElementById('renewpass').addEventListener('input', function() {
            showPasswordRequirement('renewpass', 'validation-message-renew');
        });
        
        const newpassInput = document.getElementById('newpass');
const renewInput = document.getElementById('renewpass');
const messageElement = document.getElementById('message');

newpassInput.addEventListener('input', checkPasswords);
renewInput.addEventListener('input', checkPasswords);

function checkPasswords() {
    const newpass = newpassInput.value;
    const renew = renewInput.value;

    if (newpass === renew) {
        messageElement.textContent = 'Mật khẩu khớp nhau';
        messageElement.style.color = 'green';
    } else {
        messageElement.textContent = 'Mật khẩu không khớp nhau';
        messageElement.style.color = 'red';
    }
}
    </script>
</body>

</html>