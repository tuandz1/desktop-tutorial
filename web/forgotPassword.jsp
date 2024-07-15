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
            <form action="mail" method="post">
                <h2>Forgot Password</h2>
                <p>Please enter your mail</p>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div>
                        <input class="input" name="email" type="email" placeholder="Email" required="">
                    </div>
                </div>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-phone"></i>
                    </div>
                    <div>
                        <input class="input" name="phone" type="tel" placeholder="Phone Number" required="">
                    </div>
                </div>
                <p style="font-size: 12px; color: red">${mes}</p>
                <input type="submit" class="btn" value="Send Email">
                <div class="account">
                    <p> remember the password? ?</p>
                    <a href="index.jsp">Login</a>
                </div>
            </form>
        </div>
    </div>

    <script type="text/javascript" src="js/main.js"></script>
</body>

</html>