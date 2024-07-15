<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Plotly Pie Chart</title>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
</head>
<body>
    <div id="brandPlot" style="width: 600px; height: 400px"></div>
    <div id="catePlot" style="width: 600px; height: 400px"></div>

    <p>${cate}</p>
    <p>${catesl}</p>
    <script>
        // Nh?n d? li?u t? servlet d??i d?ng chu?i
        const xArrayString = '<%= request.getAttribute("brand") %>';
        const yArrayString = '<%= request.getAttribute("sll") %>';

        // Phân tách chu?i ?? t?o m?ng
        const xArray = xArrayString.split(",").map(item => item.replace(/"/g, ''));
        const yArray = yArrayString.split(",").map(Number);

        // Thi?t l?p layout cho bi?u ??
        const layout = {title: "Product By Brand"};

        // Thi?t l?p d? li?u cho bi?u ??
        const data = [{
            x: xArray,
            y: yArray,
            type: "line"
        }];

        // V? bi?u ?? b?ng Plotly
        Plotly.newPlot("brandPlot", data, layout);


        // Nh?n d? li?u t? servlet d??i d?ng chu?i
        const xCateString = '<%= request.getAttribute("cate") %>';
        const yCateString = '<%= request.getAttribute("catesl") %>';

        // Phân tách chu?i ?? t?o m?ng
        const xCateArray = xCateString.split(",");
        const yCateArray = yCateString .split(",").map(Number);

        // Thi?t l?p layout cho bi?u ??
        const layoutcate = {title:"ProductByCate"};

        // Thi?t l?p d? li?u cho bi?u ??
        const datacate = [{labels:xCateArray, values:yCateArray, type:"pie"}];

        // V? bi?u ?? b?ng Plotly
        Plotly.newPlot("catePlot", datacate, layoutcate);
    </script>
</body>
</html>




