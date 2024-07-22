<%-- 
    Document   : test
    Created on : May 24, 2024, 10:33:31 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Open Link in New Tab</title>
</head>
<body>
     <h1>Upload Multiple Images</h1>
    <form action="uploadMultipleImages" method="post" enctype="multipart/form-data">
        <input type="file" name="file" multiple />
        <input type="submit" value="Upload" />
        <h3>${mes}</h3>
    </form>
</body>
</html>
