<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Entrar</title>
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
                <form action="login" method="post">
                    <h2>Login</h2>
                    <p>Welcome back!!</p>
                    <p style="color: red; font-family: initial"> ${mes}</p>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="form-group">
                            <input class="input" placeholder=" Name" type="text" name="name" required value="${cookie.cuser.value}">
                        </div>
                    </div>
                    <div class="input-div two">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div class="form-group">
                            <input class="input" type="password" placeholder="Password" name="pass" required value="${cookie.cpass.value}">
                        </div>
                    </div>
                    <div class="terms">
                        <input ${cookie.crem.value eq 'on'?'checked':''} name="rem" value="on" type="checkbox">
                        <label>Remind me</label>
                    </div>
                    <input type="submit" class="btn" value="Log in">
                    <a class="forgot" href="forgotPassword.jsp">Forgot Password ?</a>
                    <div class="others">
                        <hr>
                        <p>Or</p>
                        <hr>
                    </div>
                    <div class="social">

                        <div class="social-icons google">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/WatchProject/login-google&response_type=code&client_id=495179221908-hrqrs564g8ts8i4oqjagiq8k4uvl1a52.apps.googleusercontent.com&approval_prompt=force">
                                <img src="img/google.png">Log in with Google</a>
                        </div>
                    </div>
                    <div class="account">
                        <p>Don't have account ?</p>
                        <a href="register.jsp">Register</a>
                    </div>
                    <div class="account">
                        <a href="home">Back to Home</a>
                    </div>
                </form>
            </div>
        </div>

        <script type="text/javascript" src="js/main.js"></script>
    </body>

</html>