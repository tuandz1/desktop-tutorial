<%-- 
    Document   : test
    Created on : May 24, 2024, 10:33:31 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Nhập dữ liệu sản phẩm</title>
</head>
<body>
    <h2>Nhập dữ liệu sản phẩm</h2>
    <form action="ChartServlet" method="post">
        <div id="brandInputs">
            Brand: <input type="text" name="brand" required>
            Value: <input type="number" name="value" required><br>
        </div>
        <button type="button" onclick="addInput()">Thêm thương hiệu</button><br>
        <input type="submit" value="Tạo biểu đồ">
    </form>
    <script>
        function addInput() {
            const div = document.createElement('div');
            div.innerHTML = 'Brand: <input type="text" name="brand" required> Value: <input type="number" name="value" required><br>';
            document.getElementById('brandInputs').appendChild(div);
        }
    </script>
</body>
</html>


