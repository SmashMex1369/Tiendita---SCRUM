<?php
$conn = new mysqli("localhost", "root", "", "tienda_chuy");

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// ------------------ AGREGAR ------------------
if (isset($_POST['agregar'])) {
    $cliente = $_POST['cliente'];
    $producto = $_POST['producto'];
    $cantidad = $_POST['cantidad'];
    $precio = $_POST['precio'];
    $total = $cantidad * $precio;

    $conn->query("INSERT INTO ventas (cliente, producto, cantidad, precio, total)
                  VALUES ('$cliente','$producto','$cantidad','$precio','$total')");
}

// ------------------ ELIMINAR ------------------
if (isset($_GET['eliminar'])) {
    $id = $_GET['eliminar'];
    $conn->query("DELETE FROM ventas WHERE id=$id");
}

// ------------------ ACTUALIZAR ------------------
if (isset($_POST['actualizar'])) {
    $id = $_POST['id'];
    $cliente = $_POST['cliente'];
    $producto = $_POST['producto'];
    $cantidad = $_POST['cantidad'];
    $precio = $_POST['precio'];
    $total = $cantidad * $precio;

    $conn->query("UPDATE ventas 
                  SET cliente='$cliente', producto='$producto', cantidad='$cantidad', precio='$precio', total='$total'
                  WHERE id=$id");
}

// ------------------ OBTENER DATOS PARA EDITAR ------------------
$editar = null;
if (isset($_GET['editar'])) {
    $id = $_GET['editar'];
    $res = $conn->query("SELECT * FROM ventas WHERE id=$id");
    $editar = $res->fetch_assoc();
}

// ------------------ MOSTRAR TABLA ------------------
$resultado = $conn->query("SELECT * FROM ventas");

echo "<table>
<tr>
<th>ID</th>
<th>Cliente</th>
<th>Producto</th>
<th>Cantidad</th>
<th>Precio</th>
<th>Total</th>
<th>Acciones</th>
</tr>";

while ($fila = $resultado->fetch_assoc()) {
    echo "<tr>
        <td>{$fila['id']}</td>
        <td>{$fila['cliente']}</td>
        <td>{$fila['producto']}</td>
        <td>{$fila['cantidad']}</td>
        <td>{$fila['precio']}</td>
        <td>{$fila['total']}</td>
        <td>
            <a href='ventas_detalles.html?editar={$fila['id']}'>Editar</a>
            <a href='ventas_detalles.html?eliminar={$fila['id']}'>Eliminar</a>
        </td>
    </tr>";
}

echo "</table>";
?>