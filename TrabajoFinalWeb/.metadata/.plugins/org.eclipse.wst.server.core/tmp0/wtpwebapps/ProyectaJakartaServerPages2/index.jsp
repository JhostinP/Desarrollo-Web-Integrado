<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <%= new java.util.Date() %>

    <title>Tienda de Electrodomésticos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .product {
            border: 1px solid #ccc;
            padding: 16px;
            margin: 16px;
            text-align: center;
        }
        .product h2 {
            font-size: 24px;
            color: #333;
        }
        .product p {
            font-size: 16px;
            color: #666;
        }
        .product span {
            font-size: 20px;
            color: #e67e22;
        }
    </style>
</head>
<body>
    <h1>Bienvenidos a la Tienda de Electrodomésticos</h1>
    <div id="products">
        <div class="product">
            <h2>Refrigerador</h2>
            <p>Capacidad: 300L, Color: Plata, Marca: XYZ</p>
            <span>$499.99</span>
        </div>
        <div class="product">
            <h2>Lavadora</h2>
            <p>Capacidad: 7kg, Tipo: Automática, Marca: ABC</p>
            <span>$299.99</span>
        </div>
        <div class="product">
            <h2>Microondas</h2>
            <p>Potencia: 800W, Funciones: Descongelar, Calentar, Marca: DEF</p>
            <span>$99.99</span>
        </div>
        <!-- Añade más productos según sea necesario -->
    </div>
</body>
</html>