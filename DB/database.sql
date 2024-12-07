-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2024 a las 09:07:16
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
-- Estructura de tabla para la tabla `blog`
--

CREATE TABLE `blog` (
  `id_blog` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` text NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_publicacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `blog`
--

INSERT INTO `blog` (`id_blog`, `titulo`, `contenido`, `id_usuario`, `fecha_publicacion`) VALUES
(1, 'Primera Publicación', 'Este es un ejemplo de publicación en el blog.', 2, '2024-12-07 00:26:26'),
(2, 'Publicación 1', 'Este es el contenido de la publicación 1.', 2, '2024-12-07 00:53:41'),
(3, 'Publicación 2', 'Este es el contenido de la publicación 2.', 2, '2024-12-07 00:53:41'),
(4, 'Publicación 3', 'Este es el contenido de la publicación 3.', 2, '2024-12-07 00:53:41'),
(5, 'Publicación 4', 'Este es el contenido de la publicación 4.', 2, '2024-12-07 00:53:41'),
(6, 'Publicación 5', 'Este es el contenido de la publicación 5.', 2, '2024-12-07 00:53:41'),
(7, 'Publicación 6', 'Este es el contenido de la publicación 6.', 2, '2024-12-07 00:53:41'),
(8, 'Publicación 7', 'Este es el contenido de la publicación 7.', 2, '2024-12-07 00:53:41'),
(9, 'Publicación 8', 'Este es el contenido de la publicación 8.', 2, '2024-12-07 00:53:41'),
(10, 'Publicación 9', 'Este es el contenido de la publicación 9.', 2, '2024-12-07 00:53:41'),
(11, 'Publicación 10', 'Este es el contenido de la publicación 10.', 2, '2024-12-07 00:53:41'),
(12, 'Publicación 11', 'Este es el contenido de la publicación 11.', 2, '2024-12-07 00:53:41'),
(13, 'Publicación 12', 'Este es el contenido de la publicación 12.', 2, '2024-12-07 00:53:41'),
(14, 'Publicación 13', 'Este es el contenido de la publicación 13.', 2, '2024-12-07 00:53:41'),
(15, 'Publicación 14', 'Este es el contenido de la publicación 14.', 2, '2024-12-07 00:53:41'),
(16, 'Publicación 15', 'Este es el contenido de la publicación 15.', 2, '2024-12-07 00:53:41'),
(17, 'Publicación 16', 'Este es el contenido de la publicación 16.', 2, '2024-12-07 00:53:41'),
(18, 'Publicación 17', 'Este es el contenido de la publicación 17.', 2, '2024-12-07 00:53:41'),
(19, 'Publicación 18', 'Este es el contenido de la publicación 18.', 2, '2024-12-07 00:53:41'),
(20, 'Publicación 19', 'Este es el contenido de la publicación 19.', 2, '2024-12-07 00:53:41'),
(21, 'Publicación 20', 'Este es el contenido de la publicación 20.', 2, '2024-12-07 00:53:41');

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
-- Estructura de tabla para la tabla `comentarios_blog`
--

CREATE TABLE `comentarios_blog` (
  `id_comentario` int(11) NOT NULL,
  `id_blog` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `contenido` text NOT NULL,
  `fecha_comentario` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios_blog`
--

INSERT INTO `comentarios_blog` (`id_comentario`, `id_blog`, `id_usuario`, `contenido`, `fecha_comentario`) VALUES
(1, 1, 3, 'Este es un comentario de prueba en la publicación principal.', '2024-12-07 00:26:31'),
(2, 2, 3, 's', '2024-12-07 01:16:16'),
(3, 2, 3, 'asd', '2024-12-07 01:16:35'),
(4, 2, 3, 's', '2024-12-07 01:20:16'),
(5, 21, 3, 'asdasd', '2024-12-07 01:22:26'),
(6, 2, 3, 's', '2024-12-07 01:26:15');

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
  `id_usuario` int(11) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id_libro`, `titulo`, `autor`, `id_categoria`, `id_estado`, `descripcion`, `id_usuario`, `archivo`) VALUES
(1, 'Don Quijote de la Mancha', 'Don Quijote', 5, 1, 'Don Quijote', 2, 'quijote_edincr.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguidores`
--

CREATE TABLE `seguidores` (
  `id_seguimiento` int(11) NOT NULL,
  `id_usuario_seguidor` int(11) NOT NULL,
  `id_usuario_seguido` int(11) NOT NULL,
  `fecha_seguimiento` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seguidores`
--

INSERT INTO `seguidores` (`id_seguimiento`, `id_usuario_seguidor`, `id_usuario_seguido`, `fecha_seguimiento`) VALUES
(1, 2, 3, '2024-12-07 00:34:59'),
(3, 3, 2, '2024-12-07 00:35:25');

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
(5, 'coder.josue@gmail.com', 'b0aac11b94f754c47ca24afa9a4ce47c48c6261fe8f181c4f7cf854379dd5bf6db4ce756540bff827b7af23104fa9bba180bd6a089fb137142f54b2e7bdb22d8', '2024-11-30 03:40:43', '2024-11-29 20:35:43');

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
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `usuario`, `pass`, `privilegio`, `fecha_registro`) VALUES
(2, 'Josue Campos Acuña', 'coder.josue@gmail.com', 'camacu0303', '$2y$10$.aT/HGoxhKJsPPGmO2dsuu9PyrNz9SlNv.owxCOWofGfiytuU85qS', 'usuario', '2024-12-05 06:54:03'),
(3, 'Admin User', 'coder.pruebas.josue@gmail.com', 'admin', '$2y$10$/CShpOgjA7w5zMX8CkJgWuY1GvcxMX1Lwm1C53m0La4/VIpqB2XDC', 'admin', '2024-12-05 06:54:03');

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
-- Indices de la tabla `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id_blog`),
  ADD KEY `id_usuario_emisor` (`id_usuario`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `comentarios_blog`
--
ALTER TABLE `comentarios_blog`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_blog` (`id_blog`),
  ADD KEY `id_usuario_receptor` (`id_usuario`);

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
-- Indices de la tabla `seguidores`
--
ALTER TABLE `seguidores`
  ADD PRIMARY KEY (`id_seguimiento`),
  ADD UNIQUE KEY `unique_seguimiento` (`id_usuario_seguidor`,`id_usuario_seguido`),
  ADD KEY `fk_usuario_seguido` (`id_usuario_seguido`);

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
-- AUTO_INCREMENT de la tabla `blog`
--
ALTER TABLE `blog`
  MODIFY `id_blog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `comentarios_blog`
--
ALTER TABLE `comentarios_blog`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `seguidores`
--
ALTER TABLE `seguidores`
  MODIFY `id_seguimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `token_seguridad`
--
ALTER TABLE `token_seguridad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- Filtros para la tabla `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `comentarios_blog`
--
ALTER TABLE `comentarios_blog`
  ADD CONSTRAINT `comentarios_blog_ibfk_1` FOREIGN KEY (`id_blog`) REFERENCES `blog` (`id_blog`),
  ADD CONSTRAINT `comentarios_blog_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

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
-- Filtros para la tabla `seguidores`
--
ALTER TABLE `seguidores`
  ADD CONSTRAINT `fk_usuario_seguido` FOREIGN KEY (`id_usuario_seguido`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `fk_usuario_seguidor` FOREIGN KEY (`id_usuario_seguidor`) REFERENCES `usuario` (`id_usuario`);

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
