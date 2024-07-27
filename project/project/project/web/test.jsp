<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 Not Found</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
     <div class="container">
        <div class="stars"></div>
        <div class="central-body">
            <img class="image-404" src="img/404img.png" alt="404 Image" width="300px">
            <c:if test="${sessionScope.acc.role_id > 1 && sessionScope.acc.role_id !=3 }">
            <a href="dashboard" class="btn-go-home">GO BACK HOME</a>
            </c:if>
            <c:if test="${sessionScope.acc.role_id == 1}">
            <a href="home" class="btn-go-home">GO BACK HOME</a>
            </c:if>
            <c:if test="${sessionScope.acc.role_id == 3}">
            <a href="shipperdashboard" class="btn-go-home">GO BACK HOME</a>
            </c:if>
        </div>
        <div class="objects">
            <img class="object_rocket" src="img/astro.png" alt="Rocket" width="100px">
            <div class="earth-moon">
                <img class="object_earth" src="img/earth5.png" alt="Earth" width="120px">
                <img class="object_moon" src="img/moon1.png" alt="Moon" width="100px">
            </div>
            <div class="box_astronaut">
                <img class="object_astronaut" src="img/astronaut1.png" alt="Astronaut" width="350px">
            </div>
        </div>
        <div class="glowing_stars">
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
        </div>
    </div>
</body>
<style>
body {
    margin: 0;
    padding: 0;
    overflow: hidden;
    font-family: 'Lato', sans-serif;
    background-color: #050A30;
    color: #fff;
}

.container {
    position: relative;
    height: 100vh;
    width: 100%;
    overflow: hidden;
}

.stars {
    width: 100%;
    height: 100%;
    background: url('img/stars-background.png') repeat;
    position: absolute;
    z-index: 0;
}

.central-body {
    position: absolute;
    width: 100%;
    padding: 20px;
    z-index: 2;
    text-align: center;
    top: 50%;
    transform: translateY(-50%);
}

.image-404 {
    margin-bottom: 20px;
    display: block;
    margin-left: auto;
    margin-right: auto;
}

.btn-go-home {
    padding: 10px 25px;
    border: 1px solid #fff;
    color: #fff;
    text-transform: uppercase;
    text-decoration: none;
    border-radius: 20px;
    display: inline-block;
    transition: all 0.3s ease;
}

.btn-go-home:hover {
    background-color: #fff;
    color: #050A30;
}

.objects img {
    z-index: 1;
    pointer-events: none;
}

.object_rocket {
    position: absolute;
    top: 75%;
    left: 10%;
    animation: rocketMovement 200s linear infinite both running;
}

@keyframes rocketMovement {
    100% {
        transform: translate(400px, -800px);
    }
}

.earth-moon {
    position: absolute;
    top: 20%;
    left: 20%;
}

.object_earth {
    animation: earthMovement 200s linear infinite both running;
}

@keyframes earthMovement {
    100% {
        transform: rotate(360deg);
    }
}

.object_moon {
    position: absolute;
    top: 10%;
    left: 100px;
    animation: moonMovement 200s linear infinite both running;
}

@keyframes moonMovement {
    100% {
        transform: rotate(-360deg);
    }
}

.box_astronaut {
    position: absolute;
    top: 60%;
    right: 20%;
}

.object_astronaut {
    animation: astronautFly 50s infinite linear both alternate;
}

@keyframes astronautFly {
    100% {
        transform: translateY(-20px);
    }
}

.glowing_stars .star {
    position: absolute;
    width: 3px;
    height: 3px;
    background: #fff;
    border-radius: 50%;
    animation: glowing 2s infinite ease-in-out alternate;
}

.glowing_stars .star:nth-child(1) {
    top: 80%;
    left: 25%;
    animation-duration: 1s;
    animation-delay: 1s;
}

.glowing_stars .star:nth-child(2) {
    top: 20%;
    left: 40%;
    animation-duration: 2s;
    animation-delay: 2s;
}

.glowing_stars .star:nth-child(3) {
    top: 25%;
    left: 75%;
    animation-duration: 2.5s;
    animation-delay: 2.5s;
}

.glowing_stars .star:nth-child(4) {
    top: 75%;
    left: 80%;
    animation-duration: 3s;
    animation-delay: 3s;
}

.glowing_stars .star:nth-child(5) {
    top: 90%;
    left: 50%;
    animation-duration: 3.5s;
    animation-delay: 3.5s;
}

@keyframes glowing {
    0% {
        opacity: 0.3;
        transform: scale(0.8);
    }
    100% {
        opacity: 1;
        transform: scale(1.2);
    }
}

</style>
</html>

