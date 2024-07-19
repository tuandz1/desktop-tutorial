<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
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
    <img class="wave" src="img/login.jpg">
    <div class="container">
        <div class="img">
          
        </div>
        <div class="login-container">
            <form action="register" method="post" id="form">
                <h2>Register</h2>
                <p>Log in with:</p>
                <div class="social">
                   
                    <div class="social-icons google">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/WatchProject/login-google&response_type=code&client_id=495179221908-hrqrs564g8ts8i4oqjagiq8k4uvl1a52.apps.googleusercontent.com&approval_prompt=force">
                                <img src="img/google.png">Log in with Google</a>
                    </div>
                </div>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-user"></i> 
                    </div>
                    <div>
                        <input class="input" type="text" id="name" name="name" required onfocus="showNameRequirement()" onblur="showNameRequirement()" required="" placeholder="Name"><br>
                        
                        <input class="input" type="hidden" name="role" />
                    </div>
                    
                </div>
                <div class="input-div two">
                    <div class="i">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div>
                        <input class="input" type="email" name="email" placeholder="Email" required="">
                    </div>
                </div>
                    <p style="font-size: 12px; color: red">${namemess}</p>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-key"></i>
                    </div>
                    <div>
                        <input class="input" type="password" id="password" name="pass" placeholder="Password" required onfocus="showPasswordRequirement()" onblur="showPasswordRequirement()" required="">
                    </div>
                </div>
                    <p style="font-size: 12px; color: red">${passmess}</p>
                    <p style="font-size: 12px; color: red">${charmess}</p>
                <div class="input-div two">
                    <div class="i">
                        <i class="fas fa-key"></i>
                    </div>
                    <div>
                        <input class="input" type="password" id="confirmPassword" name="cfpass" placeholder="Confirm Password" required="">
                    </div>
                </div>
                <div  class="g-recaptcha" data-sitekey="6Lcpg-spAAAAAAMY0GU_Ex1OyjKOQZAlo9ov_MRM" ></div>
                    <p style="font-size: 12px; color: red">${cfpassmess}</p>
              <div id="error"></div>
              <span id="nameRequirement" style="display:none; color:red;">Name must be 8 characters at least</span><br><br>
              <span id="passwordRequirement"style="display:none; color:red;">Password must be 8 characters at least</span>
                <div class="btn-container">
                    <input type="submit" class="btn-action" value="Register">
                </div>
                <div class="account">
                    
                    <p>Have an account ?</p>
                    <a href="login.jsp">Login</a>
                </div>
                <!-- The Modal -->
                <div >
                    <!-- Modal content -->
                    
                </div>
            </form>
        </div>
    </div>

    <script type="text/javascript" src="js/main.js"></script>
      <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</body>
<script>
    function showNameRequirement() {
        var nameInput = document.getElementById("name");
        var nameRequirement = document.getElementById("nameRequirement");

        if (nameInput.value.length < 8) {
            nameRequirement.style.display = "inline";
        } else {
            nameRequirement.style.display = "none";
        }
    }
    
   function showPasswordRequirement() {
    var passwordInput = document.getElementById("password");
    var passwordRequirement = document.getElementById("passwordRequirement");

    if (passwordInput.value.length < 8) {
        passwordRequirement.style.display = "inline";
    } else {
        passwordRequirement.style.display = "none";
    }
}

window.onload = function (){
				let isValid = false;
				const form = document.getElementById("form");
				const error = document.getElementById("error");
				
				form.addEventListener("submit", function (event){
					event.preventDefault();
					const response = grecaptcha.getResponse();
					if (response){
						form.submit();
					} else {
						error.innerHTML = "Please check";
					}
				});
			};
    
 

    
</script>
</html>