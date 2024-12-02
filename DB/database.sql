-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2024 a las 23:21:38
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dblibros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`) VALUES
(1, 'Ficción'),
(2, 'No Ficción'),
(3, 'Ciencia'),
(4, 'Biografía'),
(5, 'Literatura Clásica'),
(6, 'Ciencia Ficción'),
(7, 'Fantasía'),
(8, 'Misterio'),
(9, 'Romance'),
(10, 'Historia'),
(11, 'Autoayuda'),
(12, 'Desarrollo Personal'),
(13, 'Cocina'),
(14, 'Salud'),
(15, 'Tecnología'),
(16, 'Viajes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_intercambio`
--

CREATE TABLE `estado_intercambio` (
  `id_estado` int(11) NOT NULL,
  `nombre_estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_intercambio`
--

INSERT INTO `estado_intercambio` (`id_estado`, `nombre_estado`) VALUES
(1, 'Pendiente'),
(2, 'Completado'),
(3, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_libro`
--

CREATE TABLE `estado_libro` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_libro`
--

INSERT INTO `estado_libro` (`id_estado`, `nombre`) VALUES
(1, 'Nuevo'),
(2, 'Usado - Como Nuevo'),
(3, 'Usado - Buen Estado'),
(4, 'Usado - Aceptable'),
(5, 'Usado - Desgastado'),
(6, 'Usado - Dañado'),
(7, 'Colección'),
(8, 'Edición Especial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intercambio`
--

CREATE TABLE `intercambio` (
  `id_intercambio` int(11) NOT NULL,
  `id_usuario_ofreciente` int(11) NOT NULL,
  `id_usuario_receptor` int(11) NOT NULL,
  `id_libro_solicitado` int(11) DEFAULT NULL,
  `fecha_intercambio` date NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id_libro` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `descripcion` varchar(1024) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token_seguridad`
--

CREATE TABLE `token_seguridad` (
  `id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `token` varchar(512) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `token_seguridad`
--

INSERT INTO `token_seguridad` (`id`, `user_email`, `token`, `expires_at`, `created_at`) VALUES
(1, 'coder.josue@gmail.com', '061d9476876c6f841f46772573ff3bea9c29d8fb1d2e752f1712a9daa71197d53e99f7aeda36df54371c530187471d7fddaabf23af901126db765b16bbeb5d89', '2024-11-30 03:38:23', '2024-11-29 20:33:23'),
(2, 'coder.josue@gmail.com', 'f2075b8adade9c94c984142283fccff86f50ca23a7816481f1faf73609badec69c5b170ab23383dbca92797a2e4f075130eb2526339f648612f622fde36023fa', '2024-11-30 03:38:57', '2024-11-29 20:33:57'),
(3, 'coder.josue@gmail.com', '7f97d63f91486fb4636c8270decabc39d7274199125149051732a9f6f27e45eb64794c4473d6960e78f86196f549ca16e358df7b38c009a80f275cf74029a4cb', '2024-11-30 03:39:41', '2024-11-29 20:34:41'),
(4, 'coder.josue@gmail.com', '976683b398e82e18c410ecace22fe67ba312bbf8ce0c15f86768e7bc6e15a0ac217a9071a46e63a7cdc7395e6c8d134dbeec93a2ef13b276ecbdc78a778f15d6', '2024-11-30 03:39:45', '2024-11-29 20:34:45'),
(5, 'coder.josue@gmail.com', 'b0aac11b94f754c47ca24afa9a4ce47c48c6261fe8f181c4f7cf854379dd5bf6db4ce756540bff827b7af23104fa9bba180bd6a089fb137142f54b2e7bdb22d8', '2024-11-30 03:40:43', '2024-11-29 20:35:43'),
(7, 'coder.josue@gmail.com', '', '2024-11-30 06:08:42', '2024-11-29 23:03:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `privilegio` varchar(50) NOT NULL,
  `fecha_registro` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `usuario`, `pass`, `privilegio`, `fecha_registro`) VALUES
(2, 'Josue Campos Acuña', 'coder.josue@gmail.com', 'camacu0303', '$2y$10$uBMhE6wAFD8XQX/G8sLd9.MpxTUhOE0/zLhKftDQiiW.RbtObni6q', 'usuario', '2024-11-28'),
(3, 'Admin User', 'coder.pruebas.josue@gmail.com', 'admin', '$2y$10$/CShpOgjA7w5zMX8CkJgWuY1GvcxMX1Lwm1C53m0La4/VIpqB2XDC', 'admin', '2024-11-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoracion`
--

CREATE TABLE `valoracion` (
  `id_valoracion` int(11) NOT NULL,
  `id_usuario_receptor` int(11) NOT NULL,
  `id_usuario_ofreciente` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `comentario` text DEFAULT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `estado_intercambio`
--
ALTER TABLE `estado_intercambio`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `estado_libro`
--
ALTER TABLE `estado_libro`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `intercambio`
--
ALTER TABLE `intercambio`
  ADD PRIMARY KEY (`id_intercambio`),
  ADD KEY `id_usuario_ofreciente` (`id_usuario_ofreciente`),
  ADD KEY `id_usuario_receptor` (`id_usuario_receptor`),
  ADD KEY `id_libro_solicitado` (`id_libro_solicitado`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `token_seguridad`
--
ALTER TABLE `token_seguridad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `valoracion`
--
ALTER TABLE `valoracion`
  ADD PRIMARY KEY (`id_valoracion`),
  ADD KEY `id_usuario_receptor` (`id_usuario_receptor`),
  ADD KEY `id_usuario_ofreciente` (`id_usuario_ofreciente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `estado_intercambio`
--
ALTER TABLE `estado_intercambio`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_libro`
--
ALTER TABLE `estado_libro`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `intercambio`
--
ALTER TABLE `intercambio`
  MODIFY `id_intercambio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `token_seguridad`
--
ALTER TABLE `token_seguridad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `valoracion`
--
ALTER TABLE `valoracion`
  MODIFY `id_valoracion` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `intercambio`
--
ALTER TABLE `intercambio`
  ADD CONSTRAINT `intercambio_ibfk_1` FOREIGN KEY (`id_usuario_ofreciente`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `intercambio_ibfk_2` FOREIGN KEY (`id_usuario_receptor`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `intercambio_ibfk_3` FOREIGN KEY (`id_libro_solicitado`) REFERENCES `libro` (`id_libro`),
  ADD CONSTRAINT `intercambio_ibfk_4` FOREIGN KEY (`id_estado`) REFERENCES `estado_intercambio` (`id_estado`);

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado_libro` (`id_estado`),
  ADD CONSTRAINT `libro_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `valoracion`
--
ALTER TABLE `valoracion`
  ADD CONSTRAINT `valoracion_ibfk_1` FOREIGN KEY (`id_usuario_receptor`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `valoracion_ibfk_2` FOREIGN KEY (`id_usuario_ofreciente`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
