 <!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ventas</title>
    <link rel="stylesheet" href="ventas_detalles.css">
</head>
<body>
 
<div class="container">
    <h1>Gestión de Ventas</h1>

    <!-- FORMULARIO -->
    <form action="ventas.php" method="POST" class="formulario">
        <input type="hidden" name="id" value="<?= $_GET['editar'] ?? '' ?>">

        <input type="text" name="cliente" placeholder="Cliente" required>
        <input type="text" name="producto" placeholder="Producto" required>
        <input type="number" name="cantidad" placeholder="Cantidad" required>
        <input type="number" step="0.01" name="precio" placeholder="Precio" required>

        <button type="submit" name="agregar">Agregar Venta</button>
    </form>

    <!-- TABLA -->
    <div class="tabla-container">
        <?php include("ventas.php"); ?>
    </div>
</div>

</body>
</html>