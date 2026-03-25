-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-03-2026 a las 22:41:02
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_chuy`
CREATE DATABASE IF NOT EXISTS `tienda_chuy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tienda_chuy`;
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `IdProducto` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Existencias` int(11) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IdProducto`, `Nombre`, `Existencias`, `Precio`, `Categoria`) VALUES
(1, 'Coca Cola 600ml', 50, 18.00, 'Bebidas'),
(2, 'Pepsi 600ml', 45, 17.00, 'Bebidas'),
(3, 'Sabritas Original', 40, 17.50, 'Botanas'),
(4, 'Doritos Nacho', 35, 19.00, 'Botanas'),
(5, 'Galletas Oreo', 30, 20.00, 'Galletas'),
(6, 'Galletas Emperador', 25, 18.50, 'Galletas'),
(7, 'Leche Lala 1L', 35, 25.00, 'Lácteos'),
(8, 'Pan Bimbo Blanco', 20, 40.00, 'Pan'),
(9, 'Chocolate Abuelita', 15, 45.00, 'Chocolate'),
(10, 'Jugo Del Valle', 25, 22.00, 'Bebidas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `IdProducto` int(11) DEFAULT NULL,
  `IdVenta` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`IdProducto`, `IdVenta`, `Cantidad`, `Total`) VALUES
(1, 1, 2, 36.00),
(5, 2, 1, 20.00),
(7, 3, 2, 50.00),
(4, 4, 2, 38.00),
(9, 5, 1, 45.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `IdVenta` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`IdVenta`, `Fecha`, `Monto`) VALUES
(1, '2026-03-01', 36.00),
(2, '2026-03-02', 20.00),
(3, '2026-03-03', 50.00),
(4, '2026-03-04', 38.00),
(5, '2026-03-05', 45.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`IdProducto`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD KEY `IdProducto` (`IdProducto`),
  ADD KEY `IdVenta` (`IdVenta`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`IdVenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `IdProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `IdVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`),
  ADD CONSTRAINT `transacciones_ibfk_2` FOREIGN KEY (`IdVenta`) REFERENCES `ventas` (`IdVenta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
