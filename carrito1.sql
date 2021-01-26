-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-01-2021 a las 01:29:07
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carrito1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `imagen` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `imagen`) VALUES
(1, 'Mujeres', 'Ropar para dama', 'women.jpg'),
(2, 'Hombres', 'Ropa para hombre', 'men.jpg'),
(3, 'Niños', 'Ropa para niños', 'children.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id_envios` int(11) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id_envios`, `pais`, `company`, `direccion`, `estado`, `cp`, `id_venta`) VALUES
(1, '4', 'nqwert', 'ashdshshdhsd', 'Mexico', '57900', 3),
(2, '', '', '', '', '', 4),
(3, '4', 'nqwert', 'ashdshshdhsd', 'Mexico', '57900', 5),
(4, '', '', '', '', '', 6),
(5, '6', 'asdsd', 'qwrtt', 'Mexico', '55555', 7),
(6, '4', 'new collection', 'qwrtt', 'Mexico', '57900', 8),
(7, '6', 'nqwert', 'ashdshshdhsd', 'Mexico', '57900', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `inventario` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `talla` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `imagen`, `inventario`, `id_categoria`, `talla`, `color`) VALUES
(1, 'Tank Top', 'Finding perfect t-shirt', 60, 'cloth_1.jpg', 30, 3, 'XL', 'white'),
(2, 'Corater', 'Finding perfect products', 20, 'shoe_1.jpg', 3, 2, '25.5', 'blue'),
(3, 'Producto 0', 'Esta es la descripcion', 592, 'cloth_1.jpg', 38, 1, 'XL', 'Blue'),
(4, 'Producto 1', 'Esta es la descripcion', 290, 'cloth_1.jpg', 22, 1, 'XL', 'Blue'),
(5, 'Producto 2', 'Esta es la descripcion', 119, 'cloth_1.jpg', 53, 1, 'XL', 'Blue'),
(6, 'Producto 3', 'Esta es la descripcion', 311, 'cloth_1.jpg', 58, 1, 'XL', 'Blue'),
(7, 'Producto 4', 'Esta es la descripcion', 562, 'cloth_1.jpg', 95, 1, 'XL', 'Blue'),
(8, 'Producto 5', 'Esta es la descripcion', 271, 'cloth_1.jpg', 89, 1, 'XL', 'Blue'),
(9, 'Producto 6', 'Esta es la descripcion', 944, 'cloth_1.jpg', 78, 1, 'XL', 'Blue'),
(10, 'Producto 7', 'Esta es la descripcion', 205, 'cloth_1.jpg', 64, 1, 'XL', 'Blue'),
(11, 'Producto 8', 'Esta es la descripcion', 810, 'cloth_1.jpg', 86, 1, 'XL', 'Blue'),
(12, 'Producto 9', 'Esta es la descripcion', 871, 'cloth_1.jpg', 54, 1, 'XL', 'Blue'),
(13, 'Producto 10', 'Esta es la descripcion', 617, 'cloth_1.jpg', 27, 1, 'XL', 'Blue'),
(14, 'Producto 11', 'Esta es la descripcion', 21, 'cloth_1.jpg', 13, 1, 'XL', 'Blue'),
(15, 'Producto 12', 'Esta es la descripcion', 201, 'cloth_1.jpg', 43, 1, 'XL', 'Blue'),
(16, 'Producto 13', 'Esta es la descripcion', 439, 'cloth_1.jpg', 65, 1, 'XL', 'Blue'),
(17, 'Producto 14', 'Esta es la descripcion', 752, 'cloth_1.jpg', 35, 1, 'XL', 'Blue'),
(18, 'Producto 15', 'Esta es la descripcion', 636, 'cloth_1.jpg', 51, 1, 'XL', 'Blue'),
(19, 'Producto 16', 'Esta es la descripcion', 253, 'cloth_1.jpg', 4, 1, 'XL', 'Blue'),
(20, 'Producto 17', 'Esta es la descripcion', 316, 'cloth_1.jpg', 68, 1, 'XL', 'Blue'),
(21, 'Producto 18', 'Esta es la descripcion', 453, 'cloth_1.jpg', 98, 1, 'XL', 'Blue'),
(22, 'Producto 19', 'Esta es la descripcion', 974, 'cloth_1.jpg', 42, 1, 'XL', 'Blue'),
(23, 'Producto 20', 'Esta es la descripcion', 527, 'cloth_1.jpg', 27, 1, 'XL', 'Blue'),
(24, 'Producto 21', 'Esta es la descripcion', 412, 'cloth_1.jpg', 90, 1, 'XL', 'Blue'),
(25, 'Producto 22', 'Esta es la descripcion', 779, 'cloth_1.jpg', 78, 1, 'XL', 'Blue'),
(26, 'Producto 23', 'Esta es la descripcion', 823, 'cloth_1.jpg', 31, 1, 'XL', 'Blue'),
(27, 'Producto 24', 'Esta es la descripcion', 846, 'cloth_1.jpg', 71, 1, 'XL', 'Blue'),
(28, 'Producto 25', 'Esta es la descripcion', 703, 'cloth_1.jpg', 93, 1, 'XL', 'Blue'),
(29, 'Producto 26', 'Esta es la descripcion', 554, 'cloth_1.jpg', 23, 1, 'XL', 'Blue'),
(30, 'Producto 27', 'Esta es la descripcion', 936, 'cloth_1.jpg', 65, 1, 'XL', 'Blue'),
(31, 'Producto 28', 'Esta es la descripcion', 895, 'cloth_1.jpg', 26, 1, 'XL', 'Blue'),
(32, 'Producto 29', 'Esta es la descripcion', 416, 'cloth_1.jpg', 60, 1, 'XL', 'Blue'),
(33, 'Producto 30', 'Esta es la descripcion', 695, 'cloth_1.jpg', 71, 1, 'XL', 'Blue'),
(34, 'Producto 31', 'Esta es la descripcion', 12, 'cloth_1.jpg', 76, 1, 'XL', 'Blue'),
(35, 'Producto 32', 'Esta es la descripcion', 320, 'cloth_1.jpg', 54, 1, 'XL', 'Blue'),
(36, 'Producto 33', 'Esta es la descripcion', 843, 'cloth_1.jpg', 58, 1, 'XL', 'Blue'),
(37, 'Producto 34', 'Esta es la descripcion', 84, 'cloth_1.jpg', 86, 1, 'XL', 'Blue'),
(38, 'Producto 35', 'Esta es la descripcion', 473, 'cloth_1.jpg', 74, 1, 'XL', 'Blue'),
(39, 'Producto 36', 'Esta es la descripcion', 57, 'cloth_1.jpg', 37, 1, 'XL', 'Blue'),
(40, 'Producto 37', 'Esta es la descripcion', 230, 'cloth_1.jpg', 40, 1, 'XL', 'Blue'),
(41, 'Producto 38', 'Esta es la descripcion', 486, 'cloth_1.jpg', 52, 1, 'XL', 'Blue'),
(42, 'Producto 39', 'Esta es la descripcion', 966, 'cloth_1.jpg', 3, 1, 'XL', 'Blue'),
(43, 'Producto 40', 'Esta es la descripcion', 294, 'cloth_1.jpg', 80, 1, 'XL', 'Blue'),
(44, 'Producto 41', 'Esta es la descripcion', 995, 'cloth_1.jpg', 26, 1, 'XL', 'Blue'),
(45, 'Producto 42', 'Esta es la descripcion', 843, 'cloth_1.jpg', 1, 1, 'XL', 'Blue'),
(46, 'Producto 43', 'Esta es la descripcion', 632, 'cloth_1.jpg', 80, 1, 'XL', 'Blue'),
(47, 'Producto 44', 'Esta es la descripcion', 72, 'cloth_1.jpg', 90, 1, 'XL', 'Blue'),
(48, 'Producto 45', 'Esta es la descripcion', 287, 'cloth_1.jpg', 37, 1, 'XL', 'Blue'),
(49, 'Producto 46', 'Esta es la descripcion', 883, 'cloth_1.jpg', 75, 1, 'XL', 'Blue'),
(50, 'Producto 47', 'Esta es la descripcion', 774, 'cloth_1.jpg', 49, 1, 'XL', 'Blue'),
(51, 'Producto 48', 'Esta es la descripcion', 21, 'cloth_1.jpg', 26, 1, 'XL', 'Blue'),
(52, 'Producto 49', 'Esta es la descripcion', 922, 'cloth_1.jpg', 34, 1, 'XL', 'Blue');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_venta`
--

CREATE TABLE `productos_venta` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos_venta`
--

INSERT INTO `productos_venta` (`id`, `id_venta`, `id_producto`, `cantidad`, `precio`, `subtotal`) VALUES
(1, 2, 32, 1, 416, 416),
(2, 3, 32, 1, 416, 416),
(3, 5, 51, 1, 21, 21),
(4, 7, 50, 1, 774, 774),
(5, 8, 48, 1, 287, 287),
(6, 9, 52, 3, 922, 2766);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `img_perfil` varchar(300) NOT NULL,
  `nivel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `telefono`, `email`, `password`, `img_perfil`, `nivel`) VALUES
(1, 'karlavasquez', '5511223344', 'ksvh@hotmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '', ''),
(2, 'karla svasquez', '5511223344', 'ksvh@hotmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '', ''),
(3, 'karlavasquez', '5511223344', 'ksvh@hotmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '', 'cliente'),
(4, '', '', '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', ''),
(5, 'karlavasquez', '5511223344', 'ksvh@hotmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '', ''),
(6, '', '', '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', ''),
(7, 'karla shamavasquez', '5511223355', 'ksvh@gmail.com', '20eabe5d64b0e216796e834f52d61fd0b70332fc', '', 'admin'),
(8, 'karla svasquez', '5511223344', 'prueba@email.com', '20eabe5d64b0e216796e834f52d61fd0b70332fc', '', 'cliente'),
(9, 'karla shamadyHernandez', '5511223355', 'prueba_1@email.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `total` double NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_usuario`, `total`, `fecha`) VALUES
(1, 1, 0, '2021-01-17 12:01:56'),
(2, 2, 416, '2021-01-17 12:01:25'),
(3, 3, 416, '2021-01-17 13:01:24'),
(4, 4, 0, '2021-01-17 13:01:06'),
(5, 5, 21, '2021-01-17 13:01:43'),
(6, 6, 0, '2021-01-17 13:01:16'),
(7, 7, 774, '2021-01-17 13:01:05'),
(8, 8, 287, '2021-01-17 13:01:31'),
(9, 9, 2766, '2021-01-19 18:01:44');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id_envios`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos_venta`
--
ALTER TABLE `productos_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id_envios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `productos_venta`
--
ALTER TABLE `productos_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
