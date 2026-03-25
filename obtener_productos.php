<?php
$conexion = new mysqli("localhost", "root", "", "tienda_chuy");

if ($conexion->connect_error) {
    die("Error de conexión");
}

$sql = "SELECT * FROM productos";
$resultado = $conexion->query($sql);

$productos = [];

while ($fila = $resultado->fetch_assoc()) {
    $productos[] = $fila;
}

echo json_encode($productos);

$conexion->close();
?>