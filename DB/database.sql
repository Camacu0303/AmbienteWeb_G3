-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-12-2024 a las 17:56:12
-- Versión del servidor: 8.0.36
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = '+00:00'



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blogdb`
--
CREATE DATABASE IF NOT EXISTS `blogdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `blogdb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `CommentID` int NOT NULL,
  `PostID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `Contenido` varchar(45) DEFAULT NULL,
  `FechaComentario` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `PostID` int NOT NULL,
  `Titulo` varchar(45) DEFAULT NULL,
  `Contenido` varchar(45) DEFAULT NULL,
  `FechaPublicacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `UserID` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `FechaRegistro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`UserID`, `Nombre`, `Email`, `FechaRegistro`) VALUES
(1, 'Juan', 'juan.ejemplo@hotmail.com', '2024-06-01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `userid_idx` (`UserID`),
  ADD KEY `postid_idx` (`PostID`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`PostID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `CommentID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `PostID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `UserID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `postid` FOREIGN KEY (`PostID`) REFERENCES `publicaciones` (`PostID`),
  ADD CONSTRAINT `userid` FOREIGN KEY (`UserID`) REFERENCES `usuarios` (`UserID`);
--
-- Base de datos: `book`
--
CREATE DATABASE IF NOT EXISTS `book` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `book`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `available` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `available`) VALUES
(1, 'Cien Años de Soledad', 'Gabriel García Márquez', 1),
(2, '1984', 'George Orwell', 0),
(3, 'El Gran Gatsby', 'F. Scott Fitzgerald', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservations`
--

CREATE TABLE `reservations` (
  `id` int NOT NULL,
  `book_id` int NOT NULL,
  `user_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reservations`
--

INSERT INTO `reservations` (`id`, `book_id`, `user_name`) VALUES
(1, 2, '1984');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);
--
-- Base de datos: `dblibros`
--
CREATE DATABASE IF NOT EXISTS `dblibros` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dblibros`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
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
  `id_estado` int NOT NULL,
  `nombre_estado` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
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
  `id_estado` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
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
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `id_idioma` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`id_idioma`, `nombre`) VALUES
(1, 'Español'),
(2, 'Inglés'),
(3, 'Francés'),
(4, 'Alemán'),
(5, 'Italiano'),
(6, 'Portugués'),
(7, 'Chino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intercambio`
--

CREATE TABLE `intercambio` (
  `id_intercambio` int NOT NULL,
  `id_usuario_ofreciente` int NOT NULL,
  `id_usuario_receptor` int NOT NULL,
  `id_libro_solicitado` int DEFAULT NULL,
  `fecha_intercambio` date NOT NULL,
  `id_estado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id_libro` int NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `autor` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `descripcion` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `archivo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id_libro`, `titulo`, `autor`, `id_categoria`, `id_estado`, `descripcion`, `id_usuario`, `archivo`, `imagen`) VALUES
(1, 'Dracula', 'Bram Stokker', 8, 2, 'Drácula es una novela clásica de terror gótico escrita por Bram Stoker. Publicada en 1897, narra la historia del conde Drácula, un vampiro que busca expandir su reinado desde Transilvania hasta Inglaterra. La trama combina misterio, horror y romance, desarrollándose a través de diarios, cartas y recortes de prensa. Es una obra fundamental que definió la figura moderna del vampiro.', 4, 'Dracula.pdf', 'Dracula.jpeg'),
(3, 'Alicia en el Pais de las Maravillas', 'Lewis Carroll', 7, 3, '\"Alicia en el País de las Maravillas\" de Lewis Carroll es una fantasía clásica donde Alicia, una niña curiosa, cae en un mundo mágico lleno de personajes excéntricos y aventuras surrealistas.', 4, 'Alicia en el Pais de las Maravillas.pdf', 'Alicia en el pais de las maravillas.jpeg'),
(4, 'Cien años de soledad ', 'Gabriel García Márquez', 5, 3, 'Un clásico de la literatura latinoamericana que explora la vida de la familia Buendía en el pueblo ficticio de Macondo.', 4, 'Cien años de soledad.pdf', 'cien años de soledad.jpeg'),
(5, 'Orgullo y Prejuicio', 'Jane Austen', 9, 5, 'Una novela romántica que trata sobre el amor y las diferencias sociales en la Inglaterra del siglo XIX.', 4, 'Orgullo y prejuicio.pdf', 'orgullo y prejuicio.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token_seguridad`
--

CREATE TABLE `token_seguridad` (
  `id` int NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(512) COLLATE utf8mb4_general_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
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
  `id_usuario` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `usuario` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `privilegio` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `foto_perfil` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `direccion` text COLLATE utf8mb4_general_ci,
  `idioma_preferido` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `intereses` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `usuario`, `pass`, `privilegio`, `fecha_registro`, `foto_perfil`, `telefono`, `direccion`, `idioma_preferido`, `intereses`) VALUES
(2, 'Josue Campos Acuña', 'coder.josue@gmail.com', 'camacu0303', '$2y$10$uBMhE6wAFD8XQX/G8sLd9.MpxTUhOE0/zLhKftDQiiW.RbtObni6q', 'usuario', '2024-12-05 00:32:49', NULL, NULL, NULL, NULL, NULL),
(3, 'Admin User', 'coder.pruebas.josue@gmail.com', 'admin', '$2y$10$/CShpOgjA7w5zMX8CkJgWuY1GvcxMX1Lwm1C53m0La4/VIpqB2XDC', 'admin', '2024-12-05 00:32:49', NULL, NULL, NULL, NULL, NULL),
(4, 'Fiorella Portuguez Rojas', 'portuguezfiore@gmail.com', 'fioportu', '$2y$10$sRvuzFtKAJOGZUqdpefFbOOPx23F/4vWSPeWVoHfbAIR8lprHyVtW', 'usuario', '2024-12-04 18:34:58', 'perfil1.png', '11112222', 'La Angelina, Cartago', 'Español,Inglés', 'Fantasía,Cocina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoracion`
--

CREATE TABLE `valoracion` (
  `id_valoracion` int NOT NULL,
  `id_usuario_receptor` int NOT NULL,
  `id_usuario_ofreciente` int NOT NULL,
  `calificacion` int NOT NULL,
  `comentario` text COLLATE utf8mb4_general_ci,
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
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`id_idioma`);

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
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `estado_intercambio`
--
ALTER TABLE `estado_intercambio`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_libro`
--
ALTER TABLE `estado_libro`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `id_idioma` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `intercambio`
--
ALTER TABLE `intercambio`
  MODIFY `id_intercambio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id_libro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `token_seguridad`
--
ALTER TABLE `token_seguridad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `valoracion`
--
ALTER TABLE `valoracion`
  MODIFY `id_valoracion` int NOT NULL AUTO_INCREMENT;

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
--
-- Base de datos: `db_libros`
--
CREATE DATABASE IF NOT EXISTS `db_libros` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_libros`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
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
  `id_estado` int NOT NULL,
  `nombre_estado` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
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
  `id_estado` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
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
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `id_idioma` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`id_idioma`, `nombre`) VALUES
(1, 'Español'),
(2, 'Inglés'),
(3, 'Francés'),
(4, 'Alemán'),
(5, 'Italiano'),
(6, 'Portugués'),
(7, 'Chino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intercambio`
--

CREATE TABLE `intercambio` (
  `id_intercambio` int NOT NULL,
  `id_usuario_ofreciente` int NOT NULL,
  `id_usuario_receptor` int NOT NULL,
  `id_libro_solicitado` int DEFAULT NULL,
  `fecha_intercambio` date NOT NULL,
  `id_estado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id_libro` int NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `autor` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `descripcion` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `archivo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id_libro`, `titulo`, `autor`, `id_categoria`, `id_estado`, `descripcion`, `id_usuario`, `archivo`, `imagen`) VALUES
(14, 'Prueba 2', 'Prueba 2', 1, 1, 'Prueba imagen', 4, 'Prueba2.pdf', 'libro1.jpg'),
(15, 'Prueba 3', 'Prueba 3', 1, 1, 'Prueba 3 ', 4, 'Bram Sttoker Dracula.pdf', 'Alicia en el pais de las maravillas.jpeg'),
(16, 'Dracula', 'Bram Stokker', 7, 3, 'Para centrar las imágenes dentro de las tarjetas y asegurarte de que están alineadas visualmente, puedes usar el siguiente CSS. Esto centrará las imágenes tanto vertical como horizontalmente dentro de sus contenedores.', 4, 'Bram Sttoker Dracula.pdf', 'Dracula1.jpeg'),
(17, 'Orgullo y Prejuicio', 'Jane Austen', 9, 2, 'Orgullo y Prejuicio', 4, 'Orgullo y prejuicio.pdf', 'orgullo y prejuicio.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token_seguridad`
--

CREATE TABLE `token_seguridad` (
  `id` int NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(512) COLLATE utf8mb4_general_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
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
  `id_usuario` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `usuario` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `privilegio` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `foto_perfil` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `direccion` text COLLATE utf8mb4_general_ci,
  `idioma_preferido` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `intereses` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `usuario`, `pass`, `privilegio`, `fecha_registro`, `foto_perfil`, `telefono`, `direccion`, `idioma_preferido`, `intereses`) VALUES
(2, 'Josue Campos Acuña', 'coder.josue@gmail.com', 'camacu0303', '$2y$10$uBMhE6wAFD8XQX/G8sLd9.MpxTUhOE0/zLhKftDQiiW.RbtObni6q', 'usuario', '2024-12-05 01:13:28', NULL, NULL, NULL, NULL, NULL),
(3, 'Admin User', 'coder.pruebas.josue@gmail.com', 'admin', '$2y$10$/CShpOgjA7w5zMX8CkJgWuY1GvcxMX1Lwm1C53m0La4/VIpqB2XDC', 'admin', '2024-12-05 01:13:28', NULL, NULL, NULL, NULL, NULL),
(4, 'Fiorella Portuguez Rojas', 'portuguezfiore@gmail.com', 'fioportu', '$2y$10$lCqB/vHFQnP9/sNyG55JCu49mETF5zsnjKO2G1jLQbZnCqnfg6jrW', 'usuario', '2024-12-04 19:46:54', 'perfil1.png', '11112222', 'Costa Rica, San Jose', 'Español,Italiano,Portugués', 'Historia,Autoayuda,Desarrollo Personal,Tecnología'),
(5, 'Usuario1', 'correousuario1@gmail.com', 'user1', '$2y$10$Fue5EDooWlXXUQeCL7J4GuUUrNW2BdvBBl/JqH9HhK5YEia1KZXC6', 'usuario', '2024-12-10 14:25:36', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoracion`
--

CREATE TABLE `valoracion` (
  `id_valoracion` int NOT NULL,
  `id_usuario_receptor` int NOT NULL,
  `id_usuario_ofreciente` int NOT NULL,
  `calificacion` int NOT NULL,
  `comentario` text COLLATE utf8mb4_general_ci,
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
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`id_idioma`);

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
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `estado_intercambio`
--
ALTER TABLE `estado_intercambio`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_libro`
--
ALTER TABLE `estado_libro`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `id_idioma` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `intercambio`
--
ALTER TABLE `intercambio`
  MODIFY `id_intercambio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id_libro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `token_seguridad`
--
ALTER TABLE `token_seguridad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `valoracion`
--
ALTER TABLE `valoracion`
  MODIFY `id_valoracion` int NOT NULL AUTO_INCREMENT;

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
--
-- Base de datos: `gestion_tareas`
--
CREATE DATABASE IF NOT EXISTS `gestion_tareas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `gestion_tareas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` text,
  `Estado` enum('Pendiente','Completada') DEFAULT 'Pendiente',
  `Fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `Nombre`, `Descripcion`, `Estado`, `Fecha`) VALUES
(5, 'Tarea 1', 'Tarea 1 ', 'Pendiente', '2024-12-09 20:25:39'),
(6, 'Tarea 2', 'Tarea 2', 'Pendiente', '2024-12-09 20:25:45'),
(7, 'Tarea 3', 'Tarea 3 Bases de Datos', 'Completada', '2024-12-09 20:32:14'),
(8, 'Tarea 4', 'Tarea 4', 'Pendiente', '2024-12-09 20:32:28');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Base de datos: `lightningtechnologies`
--
CREATE DATABASE IF NOT EXISTS `lightningtechnologies` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `lightningtechnologies`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` bigint NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_carrito`, `imagen`, `nombre`, `marca`, `precio`, `cantidad`) VALUES
(10, 'https://ssl-product-images.www8-hp.com/digmedialib/prodimg/lowres/c08221934.png?impolicy=Png_Res', 'Pavilion 15-EH3047NR', 'HP', 439900.00, 1),
(11, 'https://redragon.es/content/uploads/2021/06/CCW3000.png', 'Cooler CCW3000', 'RedDragon', 29995.00, 1),
(12, 'https://images-ext-1.discordapp.net/external/bkJfuyUDe8KvMgVKdwLCxUSQ6wOzjCboX55dJdnm8DU/https/extremetechcr.com/tienda/17082/razer-huntsman-v2-analog-espanol.jpg?format=webp', 'HUNTSMAN V2 ANALOG', 'Razer', 129990.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes`
--

CREATE TABLE `componentes` (
  `id_componentes` int NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `tipoCI` varchar(30) NOT NULL,
  `precio` int NOT NULL,
  `ruta_imagen` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `componentes`
--

INSERT INTO `componentes` (`id_componentes`, `modelo`, `marca`, `tipoCI`, `precio`, `ruta_imagen`) VALUES
(1, 'B450M DS3H V2', 'Gigabyte', 'Tarjeta Madre', 67900, 'https://static.gigabyte.com/StaticFile/Image/Global/dbe63d1042a65e0805a35e69bf24016e/Product/25763/png/500'),
(2, 'RTX 4070 12GB', 'Zotac', 'Grafica', 384995, 'https://www.zotac.com/us/system/files/styles/w1024/private/product_gallery/graphics_cards/zt-d40720j-10p-image01.jpg?itok=rOW__I2k'),
(3, 'Cooler CCW3000', 'RedDragon', 'Enfriamiento', 29995, 'https://redragon.es/content/uploads/2021/06/CCW3000.png'),
(4, 'CORE i7 14700', 'Intel', 'Procesador', 269995, 'https://extremetechcr.com/tienda/33208-large_default/intel-core-i7-14700.jpg'),
(5, 'RYZEN 5 7600X', 'AMD', 'Procesador', 115995, 'https://extremetechcr.com/tienda/21831-large_default/amd-ryzen-5-7600x.jpg'),
(6, 'PURE BASE 500DX ARGB', 'Be Quiet', 'Case', 72995, 'https://extremetechcr.com/tienda/13734-thickbox_default/be-quiet-pure-base-500dx-argb-negro.jpg'),
(7, 'DELTA 16GB DDR5', 'TeamGroup', 'Memoria RAM', 28995, 'https://extremetechcr.com/tienda/30120-large_default/teamgroup-t-force-delta-rgb-16gb-ddr5-6000-negro.jpg'),
(8, 'PRIME 850W GOLD', 'Asus', 'Fuente de Poder', 79990, 'https://extremetechcr.com/tienda/34599-large_default/asus-prime-850w-gold-modular.jpg'),
(9, 'A400 960 GB', 'KINGSTON', 'Almacenamiento', 44995, 'https://extremetechcr.com/tienda/10302-large_default/kingston-a400-960-gb.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componenteslaptop`
--

CREATE TABLE `componenteslaptop` (
  `id_componentesLaptop` int NOT NULL,
  `nombre_componentesLaptop` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `componenteslaptop`
--

INSERT INTO `componenteslaptop` (`id_componentesLaptop`, `nombre_componentesLaptop`) VALUES
(1, 'AMD'),
(2, 'Intel'),
(3, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipos` int NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `tipoCI` varchar(30) NOT NULL,
  `procesador` varchar(30) NOT NULL,
  `precio` int NOT NULL,
  `ruta_imagen` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipos`, `modelo`, `marca`, `tipoCI`, `procesador`, `precio`, `ruta_imagen`) VALUES
(1, 'Pavilion 15-EH3047NR', 'HP', 'Laptop', 'AMD', 439900, 'https://ssl-product-images.www8-hp.com/digmedialib/prodimg/lowres/c08221934.png?impolicy=Png_Res'),
(2, 'Inspiron 3520', 'Dell', 'Laptop', 'Intel', 540900, 'https://walmartcr.vtexassets.com/arquivos/ids/550279/Laptop-DELL-Inspiron-3520-SPA-i3-8GB-256GB-W11H-9C9JY-15-6-pulgadas-3-98429.jpg?v=638445369776100000'),
(3, 'Thinkbook 16 Gen4', 'Lenovo', 'Laptop', 'AMD', 570900, 'https://p1-ofp.static.pub/fes/cms/2021/12/17/ephit8bi4waypyhk5ayf20s55uhtf3918030.png'),
(4, 'IdeaPad 3', 'Lenovo', 'Laptop', 'Intel', 434990, 'https://p3-ofp.static.pub/fes/cms/2022/12/28/lnfmv13jwu5nb0xzzmczeytk58lh6e366455.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int NOT NULL,
  `nombre_marca` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre_marca`) VALUES
(16, 'AMD'),
(7, 'Asus'),
(12, 'Be Quiet'),
(11, 'Corsair'),
(3, 'Dell'),
(8, 'Gigabyte'),
(2, 'HP'),
(17, 'HUION'),
(15, 'Intel'),
(14, 'KINGSTON'),
(4, 'Lenovo'),
(6, 'Logitech'),
(1, 'Pendiente'),
(5, 'Razer'),
(10, 'RedDragon'),
(18, 'SAMSUNG'),
(13, 'TeamGroup'),
(19, 'XIAOMI'),
(9, 'Zotac');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perifericos`
--

CREATE TABLE `perifericos` (
  `id_perifericos` int NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `tipoCI` varchar(30) NOT NULL,
  `precio` int NOT NULL,
  `ruta_imagen` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `perifericos`
--

INSERT INTO `perifericos` (`id_perifericos`, `modelo`, `marca`, `tipoCI`, `precio`, `ruta_imagen`) VALUES
(1, 'G435 LightSpeed', 'Logitech', 'Headset', 30000, 'https://resource.logitechg.com/w_692,c_lpad,ar_4:3,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/gaming/en/products/g435/swatches/g435-gaming-headset-gallery-3-black.png?v=1'),
(2, 'TUF VG27AQ3A', 'Asus', 'Monitor', 62990, 'https://dlcdnwebimgs.asus.com/gain/4f23e193-a298-461d-ada5-76c1526d6681/w185'),
(3, 'BASILISK V3', 'Razer', 'Mouse', 35990, 'https://i.insider.com/651eeda69f7ca8b2bbda86dd'),
(4, 'HUNTSMAN V2 ANALOG', 'Razer', 'Teclado', 129990, 'https://images-ext-1.discordapp.net/external/bkJfuyUDe8KvMgVKdwLCxUSQ6wOzjCboX55dJdnm8DU/https/extremetechcr.com/tienda/17082/razer-huntsman-v2-analog-espanol.jpg?format=webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_CLIENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicios` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `valor` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `mensaje` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicios`, `nombre`, `valor`, `descripcion`, `mensaje`) VALUES
(1, 'Mantenimiento Preventivo', 'Anticipa, Protege, Optimiza', 'Anticipa el futuro y mantén tu equipo en su mejor estado. Con nuestro mantenimiento preventivo, extendemos la vida de tu tecnología y previenes interrupciones antes de que ocurran.', 'Invierte en el cuidado proactivo de tu equipo.'),
(2, 'Mantenimiento Correctivo', 'Respuestas Rápidas, Soluciones Duraderas', 'Cuando surgen problemas técnicos, nuestro mantenimiento correctivo está listo para actuar. Brindamos soluciones efectivas para que tu equipo vuelva a operar con normalidad lo antes posible.', 'Restaura el rendimiento óptimo con expertos de confianza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoci`
--

CREATE TABLE `tipoci` (
  `id_tipoCI` int NOT NULL,
  `nombre_tipoCI` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipoci`
--

INSERT INTO `tipoci` (`id_tipoCI`, `nombre_tipoCI`) VALUES
(13, 'Almacenamiento'),
(14, 'Case'),
(15, 'Deck'),
(11, 'Enfriamiento'),
(8, 'Fuente de Poder'),
(7, 'Grafica'),
(5, 'Headset'),
(2, 'Laptop'),
(18, 'Lector DVD'),
(9, 'Memoria RAM'),
(6, 'Monitor'),
(4, 'Mouse'),
(16, 'Mousepad'),
(19, 'Parlantes'),
(1, 'Pendiente'),
(10, 'Procesador'),
(17, 'Tableta de dibujo'),
(12, 'Tarjeta Madre'),
(3, 'Teclado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `id_rol` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellidos`, `correo`, `telefono`, `username`, `password`, `activo`, `id_rol`) VALUES
(1, 'Harlyn', 'Luna', 'hluna@gmail.com', '4556-8978', 'hluna', '123', 1, 1),
(2, 'Sury', 'Luna', 'sluna@gmail.com', '4564-4438', 'sluna', '123', 1, 2),
(3, 'Maria', 'Mora', 'mariamora1@gmail.com', '8888-9999', 'mariasp', '123', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE `usuario_rol` (
  `id_usuario` int NOT NULL,
  `id_rol` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`);

--
-- Indices de la tabla `componentes`
--
ALTER TABLE `componentes`
  ADD PRIMARY KEY (`id_componentes`),
  ADD KEY `fk_componentes_marca` (`marca`),
  ADD KEY `fk_componentes_tipoCI` (`tipoCI`);

--
-- Indices de la tabla `componenteslaptop`
--
ALTER TABLE `componenteslaptop`
  ADD PRIMARY KEY (`id_componentesLaptop`),
  ADD KEY `nombre_componentesLaptop` (`nombre_componentesLaptop`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipos`),
  ADD KEY `fk_equipos_marca` (`marca`),
  ADD KEY `fk_equipos_tipoCI` (`tipoCI`),
  ADD KEY `fk_equipos_procesador` (`procesador`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `nombre_marca` (`nombre_marca`);

--
-- Indices de la tabla `perifericos`
--
ALTER TABLE `perifericos`
  ADD PRIMARY KEY (`id_perifericos`),
  ADD KEY `fk_perifericos_marca` (`marca`),
  ADD KEY `fk_perifericos_tipoCI` (`tipoCI`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicios`);

--
-- Indices de la tabla `tipoci`
--
ALTER TABLE `tipoci`
  ADD PRIMARY KEY (`id_tipoCI`),
  ADD KEY `nombre_tipoCI` (`nombre_tipoCI`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_id_rol` (`id_rol`);

--
-- Indices de la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD PRIMARY KEY (`id_usuario`,`id_rol`),
  ADD KEY `fk_id_rol_id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `componentes`
--
ALTER TABLE `componentes`
  MODIFY `id_componentes` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `componenteslaptop`
--
ALTER TABLE `componenteslaptop`
  MODIFY `id_componentesLaptop` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `perifericos`
--
ALTER TABLE `perifericos`
  MODIFY `id_perifericos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicios` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipoci`
--
ALTER TABLE `tipoci`
  MODIFY `id_tipoCI` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `componentes`
--
ALTER TABLE `componentes`
  ADD CONSTRAINT `fk_componentes_marca` FOREIGN KEY (`marca`) REFERENCES `marca` (`nombre_marca`),
  ADD CONSTRAINT `fk_componentes_tipoCI` FOREIGN KEY (`tipoCI`) REFERENCES `tipoci` (`nombre_tipoCI`);

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `fk_equipos_marca` FOREIGN KEY (`marca`) REFERENCES `marca` (`nombre_marca`),
  ADD CONSTRAINT `fk_equipos_procesador` FOREIGN KEY (`procesador`) REFERENCES `componenteslaptop` (`nombre_componentesLaptop`),
  ADD CONSTRAINT `fk_equipos_tipoCI` FOREIGN KEY (`tipoCI`) REFERENCES `tipoci` (`nombre_tipoCI`);

--
-- Filtros para la tabla `perifericos`
--
ALTER TABLE `perifericos`
  ADD CONSTRAINT `fk_perifericos_marca` FOREIGN KEY (`marca`) REFERENCES `marca` (`nombre_marca`),
  ADD CONSTRAINT `fk_perifericos_tipoCI` FOREIGN KEY (`tipoCI`) REFERENCES `tipoci` (`nombre_tipoCI`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_id_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `fk_id_rol_id_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  ADD CONSTRAINT `fk_id_rol_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
--
-- Base de datos: `matricula`
--
CREATE DATABASE IF NOT EXISTS `matricula` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `matricula`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `rol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `netflixdb`
--
CREATE DATABASE IF NOT EXISTS `netflixdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `netflixdb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actores`
--

CREATE TABLE `actores` (
  `actor_id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `actores`
--

INSERT INTO `actores` (`actor_id`, `nombre`, `fecha_nacimiento`) VALUES
(1, 'Bryan Cranston', '1956-03-07'),
(2, 'Millie Bobby Brown', '2004-02-19'),
(3, 'Claire Foy', '1984-04-16'),
(4, 'Mads Mikkelsen', '1965-11-22'),
(5, 'Henry Cavill', '1983-05-05'),
(6, 'Pedro Pascal', '1975-04-02'),
(7, 'Will Arnett', '1970-05-04'),
(8, 'Hailee Steinfeld', '1996-12-11'),
(9, 'Cillian Murphy', '1976-05-25'),
(10, 'Benedict Cumberbatch', '1976-07-19'),
(11, 'Wagner Moura', '1976-06-27'),
(12, 'Emilia Clarke', '1986-10-23'),
(13, 'Steve Carell', '1962-08-16'),
(14, 'Aaron Paul', '1979-08-27'),
(15, 'Winona Ryder', '1971-10-29'),
(16, 'Olivia Colman', '1974-01-30'),
(17, 'Anya Chalotra', '1996-07-21'),
(18, 'Gina Carano', '1982-04-16'),
(19, 'Amy Sedaris', '1961-03-29'),
(20, 'Sophie Turner', '1996-02-21'),
(21, 'Matt Smith', '1982-10-28'),
(22, 'Ella Purnell', '1996-09-17'),
(23, 'Paul Anderson', '1978-02-12'),
(24, 'Martin Freeman', '1971-09-08'),
(25, 'Boyd Holbrook', '1981-09-01'),
(26, 'Lena Headey', '1973-10-03'),
(27, 'Kit Harington', '1986-12-26'),
(28, 'Gwendoline Christie', '1978-10-28'),
(29, 'Rami Malek', '1981-05-12'),
(30, 'Carla Gugino', '1971-08-29'),
(31, 'Jonathan Groff', '1985-03-26'),
(32, 'Charlie Cox', '1982-12-15'),
(33, 'Nicola Coughlan', '1987-01-09'),
(34, 'Asa Butterfield', '1997-04-01'),
(35, 'Mackenzie Davis', '1987-04-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actuaciones`
--

CREATE TABLE `actuaciones` (
  `actor_id` int NOT NULL,
  `serie_id` int NOT NULL,
  `personaje` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `actuaciones`
--

INSERT INTO `actuaciones` (`actor_id`, `serie_id`, `personaje`) VALUES
(1, 1, 'Walter White'),
(2, 2, 'Eleven'),
(3, 3, 'Reina Isabel II'),
(5, 5, 'Geralt de Rivia'),
(6, 6, 'Din Djarin'),
(7, 7, 'BoJack Horseman'),
(8, 8, 'Vi'),
(9, 9, 'Tommy Shelby'),
(10, 10, 'Sherlock Holmes'),
(11, 11, 'Pablo Escobar'),
(12, 12, 'Daenerys Targaryen'),
(13, 13, 'Michael Scott'),
(14, 1, 'Jesse Pinkman'),
(15, 2, 'Joyce Byers'),
(16, 2, 'Daenerys Targaryen'),
(17, 5, 'Yennefer de Vengerberg'),
(18, 6, 'Cara Dune'),
(18, 8, 'Kamille \"Cami\" OConnell'),
(19, 7, 'Princess Carolyn'),
(20, 13, 'Sansa Stark'),
(21, 3, 'Príncipe Felipe'),
(22, 8, 'Jinx'),
(23, 9, 'Arthur Shelby'),
(24, 10, 'Dr. John Watson'),
(25, 11, 'Steve Murphy'),
(26, 12, 'Cersei Lannister'),
(27, 12, 'Jon Snow'),
(28, 12, 'Brienne of Tarth'),
(29, 4, 'Elliot Alderson'),
(30, 2, 'Olivia Crain'),
(31, 6, 'Holden Ford'),
(32, 9, 'Matt Murdock/Daredevil'),
(33, 3, 'Penelope Featherington'),
(34, 7, 'Otis Milburn'),
(35, 4, 'Cameron Howe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `episodios`
--

CREATE TABLE `episodios` (
  `episodio_id` int NOT NULL,
  `serie_id` int DEFAULT NULL,
  `titulo` varchar(255) NOT NULL,
  `duracion` int DEFAULT NULL,
  `rating_imdb` int DEFAULT NULL,
  `temporada` int DEFAULT NULL,
  `descripcion` text,
  `fecha_estreno` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `episodios`
--

INSERT INTO `episodios` (`episodio_id`, `serie_id`, `titulo`, `duracion`, `rating_imdb`, `temporada`, `descripcion`, `fecha_estreno`) VALUES
(1, 1, 'Piloto', 58, 9, 1, 'Un profesor de química recibe un diagnóstico terminal y decide convertirse en fabricante de metanfetaminas.', '2008-01-20'),
(2, 1, 'Gato en un saco', 47, 9, 2, 'Walt y Jesse tratan de deshacerse de dos cuerpos mientras que al mismo tiempo tienen que lidiar con un testigo problemático.', '2009-05-10'),
(3, 1, 'Mandala', 48, 9, 2, 'Walt y Jesse deciden buscar un nuevo socio para poder expandir su negocio.', '2009-05-17'),
(4, 1, 'Phoenix', 47, 9, 2, 'Walt experimenta uno de sus mayores conflictos éticos cuando Jesse hace una nueva amiga.', '2009-05-24'),
(5, 1, 'ABQ', 47, 9, 2, 'Desastres colaterales llevan a Walt a manipular eventos que afectan a los que lo rodean.', '2009-05-31'),
(6, 1, 'No más', 47, 9, 3, 'Walt lidia con las consecuencias de sus acciones. Jesse está cada vez más distante.', '2010-03-21'),
(7, 1, 'Caballo sin nombre', 47, 9, 3, 'Walt encuentra problemas cuando regresa a su casa. Jesse lucha por su sobrevivencia.', '2010-03-28'),
(8, 1, 'I.F.T.', 47, 8, 3, 'Skyler toma una decisión que sorprende a Walt y Jesse. Las tensiones escalan.', '2010-04-04'),
(9, 1, 'Verde luz', 45, 9, 3, 'Walt pierde el control, poniendo en peligro todo lo que ha construido.', '2010-04-11'),
(10, 1, 'Más', 47, 9, 3, 'Jesse toma una decisión importante sobre su futuro mientras que Walt se consolida.', '2010-04-18'),
(11, 1, 'Atardecer', 45, 10, 3, 'Walt y Jesse se encuentran en una situación extrema y deben encontrar una salida rápida.', '2010-04-25'),
(12, 2, 'El desaparecido', 50, 9, 1, 'Cuando un niño desaparece, sus amigos encuentran una chica con poderes misteriosos.', '2016-07-15'),
(13, 2, 'La desaparición de Will Byers', 47, 9, 1, 'Después de que Will Byers desaparece misteriosamente, sus amigos comienzan una búsqueda que les lleva a encontrar a una chica con poderes extraños.', '2016-07-15'),
(14, 2, 'La loca de la calle Maple', 55, 9, 1, 'Lucas, Mike y Dustin intentan hablar con la chica que encontraron en el bosque. Mientras tanto, Hopper investiga la desaparición de Will.', '2016-07-15'),
(15, 2, 'Todo está patas arriba', 51, 9, 1, 'Joyce está convencida de que Will se está comunicando con ella. Los chicos le dan un nombre a la chica: Once.', '2016-07-15'),
(16, 2, 'El cadáver', 50, 9, 1, 'Los chicos encuentran una forma de entrar en el Mundo del Revés para buscar a Will. Nancy y Jonathan confrontan la fuerza que se llevó a Barb.', '2016-07-15'),
(17, 2, 'La pulga y el acróbata', 53, 9, 1, 'Hopper entra en el laboratorio para encontrar la verdad sobre el Mundo del Revés. Los chicos ponen a prueba la teoría del acróbata y la pulga.', '2016-07-15'),
(18, 2, 'MADMAX', 64, 9, 2, 'Stranger Things Season 2 Episode 1', '2017-11-03'),
(19, 2, 'Trick or Treat, Freak', 44, 10, 2, 'Stranger Things Season 2 Episode 2', '2017-11-10'),
(20, 2, 'The Pollywog', 64, 8, 2, 'Stranger Things Season 2 Episode 3', '2017-11-17'),
(21, 2, 'Will the Wise', 61, 8, 2, 'Stranger Things Season 2 Episode 4', '2017-11-24'),
(22, 2, 'Dig Dug', 56, 9, 2, 'Stranger Things Season 2 Episode 5', '2017-12-01'),
(23, 2, 'The Spy', 44, 10, 2, 'Stranger Things Season 2 Episode 6', '2017-12-08'),
(24, 2, 'The Lost Sister', 52, 9, 2, 'Stranger Things Season 2 Episode 7', '2017-12-15'),
(25, 2, 'The Mind Flayer', 62, 10, 2, 'Stranger Things Season 2 Episode 8', '2017-12-22'),
(26, 2, 'The Gate', 46, 8, 2, 'Stranger Things Season 2 Episode 9', '2017-12-29'),
(27, 2, 'Suzie, Do You Copy?', 49, 10, 3, 'Stranger Things Season 3 Episode 1', '2019-07-11'),
(28, 2, 'The Mall Rats', 50, 9, 3, 'Stranger Things Season 3 Episode 2', '2019-07-18'),
(29, 2, 'The Case of the Missing Lifeguard', 55, 9, 3, 'Stranger Things Season 3 Episode 3', '2019-07-25'),
(30, 2, 'The Sauna Test', 59, 9, 3, 'Stranger Things Season 3 Episode 4', '2019-08-01'),
(31, 2, 'The Source', 61, 8, 3, 'Stranger Things Season 3 Episode 5', '2019-08-08'),
(32, 2, 'The Birthday', 56, 9, 3, 'Stranger Things Season 3 Episode 6', '2019-08-15'),
(33, 2, 'The Bite', 46, 9, 3, 'Stranger Things Season 3 Episode 7', '2019-08-22'),
(34, 2, 'The Battle of Starcourt', 52, 8, 3, 'Stranger Things Season 3 Episode 8', '2019-08-29'),
(35, 3, 'La corona pesada', 52, 9, 1, 'Isabel II es coronada reina en una época de cambio político y conflictos personales.', '2016-11-04'),
(36, 3, 'Winds of Change', 58, 9, 1, 'El Primer Ministro Macmillan enfrenta crisis políticas y personales que afectan su liderazgo.', '2016-11-20'),
(37, 3, 'Hyde Park Corner', 56, 9, 1, 'Isabel enfrenta sus nuevas responsabilidades como reina mientras lidia con noticias trágicas desde el extranjero.', '2016-11-27'),
(38, 3, 'Gelignite', 57, 9, 1, 'Los planes matrimoniales de la princesa Margarita enfrentan obstáculos institucionales y públicos.', '2016-12-04'),
(39, 3, 'Act of God', 54, 9, 1, 'Una gran neblina cubre Londres, causando problemas de salud y políticos para Winston Churchill.', '2016-12-11'),
(40, 3, 'Smoke and Mirrors', 56, 9, 1, 'La coronación de Isabel II toma lugar bajo la sombra de las luchas familiares y políticas.', '2016-12-18'),
(41, 3, 'Scientia Potentia Est', 55, 9, 1, 'La joven reina debe navegar las complejidades de una crisis de Suez emergente.', '2017-01-08'),
(42, 3, 'Pride & Joy', 54, 9, 1, 'La Reina Madre explora su nuevo papel, mientras Isabel ajusta su enfoque como monarca y madre.', '2017-01-15'),
(43, 3, 'Education', 53, 9, 2, 'Isabel se enfrenta al sistema educativo cuando examina las opciones para sus hijos.', '2017-01-22'),
(44, 3, 'Mystery Man', 56, 9, 2, 'Un escándalo en el palacio lleva a una serie de revelaciones impactantes.', '2017-01-29'),
(45, 3, 'Marionettes', 55, 9, 2, 'Una figura pública cuestiona la relevancia y el costo de la monarquía, provocando un debate nacional.', '2017-02-05'),
(46, 4, 'Caída en picada', 60, 8, 3, 'En un mundo donde la estatus social se mide por calificaciones, una mujer intenta mejorar su puntuación.', '2016-10-21'),
(47, 4, 'USS Callister', 76, 8, 4, 'Un programador talentoso crea una versión digital de sí mismo para ejercer control en un universo virtual.', '2017-12-29'),
(48, 4, 'Arkangel', 52, 7, 4, 'Una madre instala un sistema de vigilancia que le permite ver todo lo que ve su hija y controlar sus experiencias.', '2017-12-29'),
(49, 4, 'Crocodile', 59, 8, 4, 'Un accidente desencadena una serie de eventos que obligan a una mujer a ir a extremos para ocultar sus actos.', '2017-12-29'),
(50, 4, 'Hang the DJ', 51, 9, 4, 'Dos personas se enfrentan a un sistema de citas que predefine la duración de todas sus relaciones.', '2017-12-29'),
(51, 4, 'Metalhead', 41, 7, 4, 'En un almacén post-apocalíptico, una mujer intenta escapar de un perro robot que está programado para matar.', '2017-12-29'),
(52, 4, 'Black Museum', 69, 9, 4, 'Una mujer visita un museo que muestra artefactos tecnológicos con historias oscuras asociadas a ellos.', '2017-12-29'),
(53, 4, 'Striking Vipers', 62, 8, 5, 'Dos viejos amigos se reencuentran y exploran nuevas identidades en un juego de realidad virtual.', '2019-06-05'),
(54, 4, 'Smithereens', 70, 7, 5, 'Un hombre secuestra a un empleado de una empresa tecnológica para exponer su impacto destructivo en la sociedad.', '2019-06-05'),
(55, 4, 'Rachel, Jack and Ashley Too', 67, 6, 5, 'Una adolescente solitaria encuentra consuelo en una muñeca de inteligencia artificial que imita a su cantante favorita.', '2019-06-05'),
(56, 4, 'The National Anthem', 44, 7, 1, 'El primer ministro del Reino Unido enfrenta una crisis peculiar y humillante involucrando un secuestro.', '2011-12-04'),
(57, 5, 'El fin del principio', 60, 9, 1, 'Geralt de Rivia, un cazador de monstruos solitario, lucha por encontrar su lugar en un mundo turbulento.', '2019-12-20'),
(58, 5, 'A Grain of Truth', 63, 8, 2, 'Geralt encuentra a un viejo amigo en una mansión maldita y descubre los oscuros secretos que guarda.', '2021-12-17'),
(59, 5, 'Kaer Morhen', 47, 9, 2, 'Geralt lleva a Ciri a su hogar ancestral para protegerla y entrenarla, mientras fuerzas oscuras continúan su búsqueda.', '2021-12-17'),
(60, 5, 'What is Lost', 55, 8, 2, 'Recuerdos del pasado de Geralt surgen mientras enfrenta un nuevo enemigo que pone a prueba sus convicciones.', '2021-12-17'),
(61, 5, 'Redanian Intelligence', 59, 9, 2, 'Mientras Geralt defiende a Ciri, espías y conspiraciones políticas tejen una red de engaños alrededor de ellos.', '2021-12-17'),
(62, 5, 'Turn Your Back', 61, 9, 2, 'Ciri lucha con su identidad y poderes crecientes; Geralt debe tomar decisiones difíciles para su protección.', '2021-12-17'),
(63, 5, 'Dear Friend', 50, 8, 2, 'Geralt y Ciri buscan la ayuda de una poderosa aliada, enfrentando viejos amigos y nuevos rivales en su camino.', '2021-12-17'),
(64, 5, 'Voleth Meir', 58, 9, 2, 'Una entidad misteriosa ofrece respuestas y poder, pero a un costo que podría ser demasiado alto para pagar.', '2021-12-17'),
(65, 5, 'Family', 65, 9, 2, 'La definición de familia se pone a prueba cuando aliados inesperados se unen para enfrentar una amenaza común.', '2021-12-17'),
(66, 5, 'Withering Flame', 53, 9, 2, 'En busca de una cura para una maldición, Geralt se enfrenta a una verdad incómoda sobre los monstruos y los hombres.', '2021-12-17'),
(67, 5, 'The Pensive Dragon', 60, 9, 2, 'Geralt y Ciri enfrentan su destino mientras descubren el lazo que los une más allá de la magia y las espadas.', '2021-12-17'),
(68, 6, 'The Siege', 42, 9, 2, 'El Mandaloriano regresa a Nevarro para reparaciones y se ve envuelto en una misión para destruir una base imperial.', '2020-11-20'),
(69, 6, 'The Jedi', 47, 10, 2, 'El Mandaloriano y Grogu viajan a un antiguo templo Jedi, donde encuentran a una figura legendaria del pasado.', '2020-11-27'),
(70, 6, 'The Tragedy', 33, 9, 2, 'Tragedia golpea cuando las fuerzas imperiales localizan a Grogu mientras el Mandaloriano busca aliados.', '2020-12-04'),
(71, 6, 'The Believer', 38, 9, 2, 'Para rescatar a Grogu, el Mandaloriano debe infiltrarse en una instalación imperial con la ayuda de un viejo enemigo.', '2020-12-11'),
(72, 6, 'The Rescue', 45, 10, 2, 'El Mandaloriano y sus aliados lanzan un audaz rescate para salvar a Grogu de las garras del Imperio.', '2020-12-18'),
(73, 6, 'The Marshal', 52, 9, 2, 'En su misión para devolver a Grogu a los Jedi, el Mandaloriano se encuentra con un alguacil usando una armadura Mandaloriana.', '2020-10-30'),
(74, 6, 'The Passenger', 41, 8, 2, 'El Mandaloriano acepta transportar a un pasajero con un precioso cargamento a cambio de información crucial.', '2020-11-06'),
(75, 6, 'The Heiress', 35, 9, 2, 'El Mandaloriano se encuentra con guerreros Mandalorianos que lo desafían a cuestionar sus creencias y su camino.', '2020-11-13'),
(76, 6, 'The Search', 44, 9, 3, 'El Mandaloriano busca la verdad sobre el origen de Grogu y su conexión con los Mandalorianos.', '2021-12-15'),
(77, 6, 'The Reckoning', 48, 9, 3, 'Una amenaza del pasado resurge, forzando al Mandaloriano a enfrentar su pasado y tomar decisiones cruciales para su futuro.', '2021-12-22'),
(78, 6, 'El mandaloriano', 40, 9, 1, 'Un cazarrecompensas mandaloriano protege a un niño de gran poder.', '2019-11-12'),
(79, 7, 'BoJack el destructor', 25, 8, 1, 'BoJack Horseman, una estrella de TV en decadencia, intenta retomar su carrera y vida.', '2014-08-22'),
(80, 7, 'The Telescope', 25, 9, 1, 'BoJack se reencuentra con un amigo del pasado que le trae noticias perturbadoras.', '2014-08-22'),
(81, 7, 'Downer Ending', 25, 9, 1, 'BoJack tiene visiones surrealistas sobre su vida mientras intenta escribir su propia autobiografía.', '2014-08-22'),
(82, 7, 'Later', 25, 9, 1, 'El libro de BoJack es un éxito, pero la felicidad le sigue siendo esquiva.', '2014-08-22'),
(83, 7, 'Brand New Couch', 26, 9, 2, 'BoJack trata de cambiar su vida con la esperanza de ser una mejor persona y encontrar la redención.', '2015-07-17'),
(84, 7, 'Yesterdayland', 26, 8, 2, 'BoJack encuentra romance en una feria de ciencia ficción, mientras Todd construye un parque temático.', '2015-07-17'),
(85, 7, 'Higher Love', 26, 8, 2, 'BoJack persigue un nuevo romance que lo lleva por un camino de auto-descubrimiento y complicaciones inesperadas.', '2015-07-17'),
(86, 7, 'Hank After Dark', 25, 9, 2, 'Diane enfrenta consecuencias inesperadas cuando intenta exponer los secretos de una celebridad.', '2015-07-17'),
(87, 7, 'Let’s Find Out', 26, 10, 2, 'BoJack aparece en un juego de preguntas televisivo y enfrenta preguntas difíciles sobre su pasado.', '2015-07-17'),
(88, 7, 'The Shot', 26, 9, 2, 'BoJack tiene la oportunidad de realizar una escena cinematográfica soñada, pero las cosas no salen como esperaba.', '2015-07-17'),
(89, 7, 'Escape from L.A.', 26, 10, 2, 'BoJack huye a Nuevo México para escapar de sus problemas en Los Ángeles, solo para encontrar nuevos dilemas.', '2015-07-17'),
(90, 8, 'Bienvenidos a Zaun', 45, 9, 1, 'Dos hermanas se encuentran en lados opuestos de una guerra entre ciudades futuristas.', '2021-11-06'),
(91, 8, 'Some Mysteries Are Better Left Unsolved', 44, 9, 1, 'Vi y Powder descubren un secreto que podría cambiar todo lo que saben sobre su familia.', '2021-11-13'),
(92, 8, 'When These Walls Come Tumbling Down', 42, 9, 1, 'Las tensiones entre Piltover y Zaun alcanzan un punto crítico tras un devastador ataque.', '2021-11-13'),
(93, 8, 'The Base Violence Necessary for Change', 45, 10, 1, 'Un nuevo líder emerge en Zaun, prometiendo revolución y desafiando el equilibrio de poder.', '2021-11-20'),
(94, 8, 'Happy Progress Day!', 48, 9, 1, 'Piltover celebra el Día del Progreso, pero los eventos toman un giro oscuro cuando los secretos son revelados.', '2021-11-20'),
(95, 8, 'Everybody Wants to Be My Enemy', 43, 9, 1, 'Mientras Vi lucha por proteger a su hermana, antiguos aliados se convierten en nuevos enemigos.', '2021-11-20'),
(96, 8, 'The Boy Savior', 42, 9, 1, 'Ekko intenta salvar a Zaun de sus propios demonios internos y del avance de enemigos externos.', '2021-11-27'),
(97, 8, 'Oil and Water', 45, 9, 1, 'Los hermanos se encuentran en lados opuestos de la guerra, cada uno luchando por sus ideales y seres queridos.', '2021-11-27'),
(98, 8, 'The Monster You Created', 47, 10, 1, 'Confrontaciones del pasado regresan para desafiar las alianzas actuales y el futuro de Zaun y Piltover.', '2021-11-27'),
(99, 8, 'Bridges Burn', 44, 9, 1, 'La batalla por el puente entre Piltover y Zaun deja cicatrices profundas y decisiones difíciles para Vi y Powder.', '2021-12-04'),
(100, 8, 'The Will of the Blades', 46, 10, 1, 'En el clímax de la temporada, los personajes enfrentan sus destinos y hacen elecciones que cambiarán sus mundos para siempre.', '2021-12-04'),
(101, 9, 'Birmingham en llamas', 60, 9, 1, 'Tommy Shelby lidera a los Peaky Blinders, una banda de gánsteres, hacia la dominación de Birmingham.', '2013-09-12'),
(102, 9, 'Black Tuesday', 57, 9, 5, 'Los Shelby enfrentan las repercusiones del crac del 29 y nuevas oportunidades de expansión en América.', '2019-08-25'),
(103, 9, 'Black Cats', 58, 9, 5, 'Tommy descubre una traición mientras nuevos enemigos emergen en las sombras.', '2019-09-01'),
(104, 9, 'Strategy', 56, 9, 5, 'Tommy traza un nuevo plan político mientras maneja tensiones internas dentro de los Peaky Blinders.', '2019-09-08'),
(105, 9, 'The Loop', 59, 9, 5, 'Los Shelby participan en una arriesgada carrera de caballos que promete grandes recompensas.', '2019-09-15'),
(106, 9, 'The Shock', 60, 9, 5, 'Una revelación sorprendente pone a prueba la lealtad de Tommy y plantea nuevas alianzas.', '2019-09-22'),
(107, 9, 'Mr. Jones', 59, 9, 5, 'Tommy se enfrenta cara a cara con un enemigo formidable, culminando en un tenso encuentro.', '2019-09-29'),
(108, 9, 'Blackbird', 58, 9, 6, 'Arthur recibe una misión que podría cambiar el destino de los Shelby, mientras Tommy explora caminos espirituales.', '2021-02-28'),
(109, 9, 'Gold', 57, 9, 6, 'La familia Shelby descubre una mina de oro potencial que los pone en el radar de una nueva amenaza.', '2021-03-07'),
(110, 9, 'The Noose', 56, 9, 6, 'El cerco se cierra en torno a los Shelby mientras luchan por mantener el control de sus territorios.', '2021-03-14'),
(111, 9, 'Lock and Key', 60, 10, 6, 'Tommy enfrenta la posible destrucción de todo lo que ha construido, mientras busca redimirse y asegurar su legado.', '2021-03-21'),
(112, 10, 'Un estudio en rosa', 90, 9, 1, 'Sherlock Holmes se enfrenta a un caso que lo lleva a cruzar caminos con el doctor John Watson.', '2010-07-25'),
(113, 10, 'The Blind Banker', 88, 8, 1, 'Sherlock y Watson investigan una serie de símbolos misteriosos que están relacionados con robos en un banco.', '2010-08-01'),
(114, 10, 'The Great Game', 89, 9, 1, 'Sherlock se encuentra en una carrera contra el tiempo cuando un loco amenaza con matar inocentes como parte de un \"juego\" retorcido.', '2010-08-08'),
(115, 10, 'A Scandal in Belgravia', 90, 10, 2, 'Sherlock se enfrenta a una dominatrix que sabe demasiados secretos de gente poderosa.', '2012-01-01'),
(116, 10, 'The Hounds of Baskerville', 88, 9, 2, 'Sherlock y Watson exploran una leyenda aterradora cuando visitan el páramo de Dartmoor.', '2012-01-08'),
(117, 10, 'The Reichenbach Fall', 90, 10, 2, 'Sherlock se enfrenta a su mayor desafío cuando Moriarty trama un plan para desacreditarlo y destruirlo.', '2012-01-15'),
(118, 10, 'The Empty Hearse', 90, 9, 3, 'Sherlock regresa después de su \"muerte\" para detener un ataque terrorista en Londres.', '2014-01-01'),
(119, 10, 'The Sign of Three', 93, 9, 3, 'Sherlock enfrenta un desafío diferente mientras trata de dar el mejor discurso en la boda de Watson.', '2014-01-05'),
(120, 10, 'His Last Vow', 89, 9, 3, 'Sherlock se encuentra en un juego mortal de mente contra Charles Augustus Magnussen, un maestro chantajista.', '2014-01-12'),
(121, 10, 'The Six Thatchers', 90, 8, 4, 'Sherlock se ve envuelto en un misterio cuando se destrozan bustos de Margaret Thatcher.', '2017-01-01'),
(122, 10, 'The Lying Detective', 90, 9, 4, 'Después de una tragedia personal, Watson se distancia de Sherlock, quien a su vez se involucra con un poderoso enemigo.', '2017-01-08'),
(123, 11, 'La catedral del mar', 55, 8, 1, 'En la Barcelona del siglo XIV, un hombre se eleva de la esclavitud para convertirse en un comerciante respetado.', '2018-05-23'),
(124, 11, 'Descenso', 57, 9, 1, 'El agente Steve Murphy llega a Colombia para ayudar en la lucha contra el narcotráfico y pronto se entera del poder de Pablo Escobar.', '2015-08-28'),
(125, 11, 'The Sword of Simón Bolívar', 47, 9, 1, 'Mientras Pablo Escobar se expande en el negocio, las autoridades comienzan a ver la magnitud de su imperio.', '2015-08-28'),
(126, 11, 'The Men of Always', 47, 9, 1, 'Escobar busca legitimidad política, pero sus ambiciones se encuentran con resistencia.', '2015-08-28'),
(127, 11, 'The Palace in Flames', 45, 9, 1, 'Un ataque audaz contra el Palacio de Justicia es vinculado a Escobar, causando un conflicto masivo.', '2015-08-28'),
(128, 11, 'There Will Be a Future', 51, 9, 1, 'Escobar maneja negociaciones con el gobierno para su rendición, pero los acuerdos no satisfacen a todos.', '2015-08-28'),
(129, 11, 'Explosivos', 49, 9, 1, 'Pablo implementa tácticas cada vez más extremas para gestionar amenazas políticas y de la ley.', '2015-08-28'),
(130, 11, 'You Will Cry Tears of Blood', 52, 9, 1, 'La guerra entre el cartel y el gobierno se intensifica, causando daños colaterales significativos.', '2015-08-28'),
(131, 11, 'La Gran Mentira', 50, 9, 1, 'Los esfuerzos para capturar a Escobar se complican por sus tácticas para evadir a la ley.', '2015-08-28'),
(132, 11, 'La Catedral', 54, 9, 1, 'Escobar se rinde bajo condiciones favorables, pero su tiempo en prisión es cualquier cosa menos convencional.', '2015-08-28'),
(133, 11, 'Despegue', 56, 9, 1, 'La situación se agrava cuando Escobar escapa de la prisión, llevando la batalla a nuevos extremos.', '2015-08-28'),
(134, 12, 'El invierno se acerca', 60, 9, 1, 'Los Stark se enfrentan a la traición mientras se cierne la amenaza de los Caminantes Blancos.', '2011-04-17'),
(135, 12, 'La batalla de los bastardos', 60, 10, 6, 'Jon Snow enfrenta a Ramsay Bolton en una de las batallas más épicas por el Norte.', '2016-06-19'),
(136, 12, 'The Kingsroad', 56, 9, 1, 'Mientras los Stark viajan al sur, Jon Snow se dirige al norte para unirse a la Guardia de la Noche.', '2011-04-24'),
(137, 12, 'Lord Snow', 58, 9, 1, 'Jon se enfrenta a la dura realidad de la Guardia de la Noche. Ned Stark llega a King’s Landing y descubre la corrupción de la corte.', '2011-05-01'),
(138, 12, 'Cripples, Bastards, and Broken Things', 56, 9, 1, 'Tyrion hace un nuevo amigo en el camino. Ned investiga la muerte de su predecesor.', '2011-05-08'),
(139, 12, 'The Wolf and the Lion', 55, 9, 1, 'La tensión entre las casas Stark y Lannister escala hacia un conflicto abierto.', '2011-05-15'),
(140, 12, 'A Golden Crown', 53, 9, 1, 'Viserys Targaryen hace una última demanda por su corona, lo que lleva a consecuencias mortales.', '2011-05-22'),
(141, 12, 'You Win or You Die', 58, 9, 1, 'Ned Stark hace una jugada crítica en el juego de tronos, mientras Jon descubre una verdad oscura en el Muro.', '2011-05-29'),
(142, 12, 'The Pointy End', 59, 9, 1, 'Los Stark enfrentan graves peligros tras la captura de Ned, y Arya y Sansa se ven en situaciones difíciles.', '2011-06-05'),
(143, 12, 'Baelor', 57, 10, 1, 'Ned enfrenta su destino mientras Sansa ruega por su vida. Robb lucha por salvar a su padre.', '2011-06-12'),
(144, 12, 'Fire and Blood', 53, 10, 1, 'Arya comienza su viaje para escapar de King’s Landing. Daenerys toma decisiones cruciales tras una gran pérdida.', '2011-06-19'),
(145, 12, 'The North Remembers', 53, 9, 2, 'Tyrion llega a King’s Landing para tomar su lugar como Mano del Rey. Stannis Baratheon planea reclamar su derecho al trono.', '2012-04-01'),
(146, 13, 'Diversidad', 22, 8, 1, 'Michael intenta enseñar diversidad a sus empleados de una manera muy Michael Scott.', '2005-03-29'),
(147, 13, 'La alianza', 22, 8, 1, 'Michael intenta formar una alianza para sobrevivir a los recortes de personal, mientras Dwight inicia su propia alianza secreta.', '2005-04-12'),
(148, 13, 'Health Care', 22, 8, 1, 'Michael delega la tarea de elegir un nuevo plan de salud, lo que lleva a Dwight a hacer recortes impopulares.', '2005-04-05'),
(149, 13, 'The Alliance', 22, 8, 1, 'Michael intenta mejorar la moral de la oficina con un cumpleaños, mientras Dwight busca aliados para su supervivencia en la oficina.', '2005-04-12'),
(150, 13, 'Basketball', 23, 8, 1, 'Michael organiza un partido de baloncesto entre los trabajadores de la oficina y el almacén, lo que lleva a una competencia feroz.', '2005-04-19'),
(151, 13, 'Hot Girl', 23, 8, 1, 'Una vendedora atractiva visita la oficina, y los hombres intentan impresionarla, lo que causa tensiones y celos.', '2005-04-26'),
(152, 13, 'The Dundies', 21, 9, 2, 'Michael presenta los premios Dundie en Chili’s, y la noche está llena de sorpresas y revelaciones inesperadas.', '2005-09-20'),
(153, 13, 'Office Olympics', 22, 9, 2, 'Mientras Michael y Dwight no están, Jim organiza los Juegos Olímpicos de la Oficina para levantar el ánimo.', '2005-10-04'),
(154, 13, 'The Fire', 22, 8, 2, 'Un pequeño incendio en la cocina lleva a los empleados a participar en juegos de confesiones y revelaciones personales.', '2005-10-11'),
(155, 13, 'Halloween', 22, 8, 2, 'Es Halloween y Michael tiene que despedir a alguien, lo que crea una atmósfera tensa en la oficina.', '2005-10-18'),
(156, 13, 'The Client', 22, 9, 2, 'Michael y Jan logran un importante trato con un cliente, mientras que en la oficina los empleados encuentran un guion escrito por Michael.', '2005-11-08'),
(157, 13, 'Performance Review', 22, 8, 2, 'Es la época de evaluaciones de desempeño, y Michael se centra en sus propios asuntos personales en lugar de en las evaluaciones.', '2005-11-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `series`
--

CREATE TABLE `series` (
  `serie_id` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text,
  `año_lanzamiento` int DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `series`
--

INSERT INTO `series` (`serie_id`, `titulo`, `descripcion`, `año_lanzamiento`, `genero`) VALUES
(1, 'Breaking Bad', 'Un profesor de química se convierte en un rey del narcotráfico.', 2008, 'Drama'),
(2, 'Stranger Things', 'Niños en los 80s enfrentan fuerzas sobrenaturales y secretos gubernamentales.', 2016, 'Ciencia ficción'),
(3, 'The Crown', 'Drama histórico sobre el reinado de la Reina Isabel II del Reino Unido.', 2016, 'Drama histórico'),
(4, 'Black Mirror', 'Serie de antología que explora un futuro inquietante y distópico.', 2011, 'Ciencia ficción'),
(5, 'The Witcher', 'Un cazador de monstruos lucha por encontrar su lugar en un mundo donde las personas a menudo son más perversas.', 2019, 'Fantasía'),
(6, 'The Mandalorian', 'Un pistolero solitario explora los confines de la galaxia, lejos de la autoridad de la Nueva República.', 2019, 'Ciencia ficción'),
(7, 'BoJack Horseman', 'Un caballo antropomórfico lucha con la depresión y la adicción en esta comedia de animación para adultos.', 2014, 'Comedia'),
(8, 'Arcane', 'Basada en el universo de League of Legends, esta serie explora los orígenes de algunos campeones icónicos.', 2021, 'Animación'),
(9, 'Peaky Blinders', 'Una banda de gánsteres de Birmingham de la década de 1920 se eleva a la prominencia.', 2013, 'Drama histórico'),
(10, 'Sherlock', 'El detective más famoso del mundo resuelve misterios en el Londres del siglo XXI.', 2010, 'Drama'),
(11, 'Narcos', 'La historia del narcotráfico en Colombia', 2015, 'Biografía'),
(12, 'Game of Thrones', 'Nobles familias luchan por el control del Trono de Hierro', 2011, 'Fantasía'),
(13, 'The Office', 'La vida cotidiana de los empleados de Dunder Mifflin', 2005, 'Comedia');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actores`
--
ALTER TABLE `actores`
  ADD PRIMARY KEY (`actor_id`);

--
-- Indices de la tabla `actuaciones`
--
ALTER TABLE `actuaciones`
  ADD PRIMARY KEY (`actor_id`,`serie_id`),
  ADD KEY `serie_id` (`serie_id`);

--
-- Indices de la tabla `episodios`
--
ALTER TABLE `episodios`
  ADD PRIMARY KEY (`episodio_id`),
  ADD KEY `serie_id` (`serie_id`);

--
-- Indices de la tabla `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`serie_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actores`
--
ALTER TABLE `actores`
  MODIFY `actor_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `episodios`
--
ALTER TABLE `episodios`
  MODIFY `episodio_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT de la tabla `series`
--
ALTER TABLE `series`
  MODIFY `serie_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actuaciones`
--
ALTER TABLE `actuaciones`
  ADD CONSTRAINT `actuaciones_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actores` (`actor_id`),
  ADD CONSTRAINT `actuaciones_ibfk_2` FOREIGN KEY (`serie_id`) REFERENCES `series` (`serie_id`);

--
-- Filtros para la tabla `episodios`
--
ALTER TABLE `episodios`
  ADD CONSTRAINT `episodios_ibfk_1` FOREIGN KEY (`serie_id`) REFERENCES `series` (`serie_id`);
--
-- Base de datos: `practica`
--
CREATE DATABASE IF NOT EXISTS `practica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `practica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbol`
--

CREATE TABLE `arbol` (
  `id_arbol` int NOT NULL,
  `dureza_madera` int NOT NULL,
  `ruta_imagen` varchar(1024) DEFAULT NULL,
  `tipo_flor` varchar(40) DEFAULT NULL,
  `nombre_comun` varchar(60) DEFAULT NULL,
  `tipo_arbol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `arbol`
--

INSERT INTO `arbol` (`id_arbol`, `dureza_madera`, `ruta_imagen`, `tipo_flor`, `nombre_comun`, `tipo_arbol`) VALUES
(1, 0, NULL, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arbol`
--
ALTER TABLE `arbol`
  ADD PRIMARY KEY (`id_arbol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `arbol`
--
ALTER TABLE `arbol`
  MODIFY `id_arbol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Base de datos: `prueba1`
--
CREATE DATABASE IF NOT EXISTS `prueba1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `prueba1`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `contraseña`) VALUES
(1, 'usuario1', 'contraseña1'),
(2, 'usuario2', 'contraseña2'),
(3, 'usuario3', 'contraseña3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Base de datos: `prueba_a`
--
CREATE DATABASE IF NOT EXISTS `prueba_a` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `prueba_a`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id_pregunta` int NOT NULL,
  `enunciado` varchar(40) DEFAULT NULL,
  `tema` int DEFAULT NULL,
  `puntos_pregunta` int DEFAULT NULL,
  `imagen` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id_pregunta`, `enunciado`, `tema`, `puntos_pregunta`, `imagen`) VALUES
(1, 'Enunciado1', 1, 5, 'roma.jpg'),
(2, 'Enunciado2', 2, 7, 'fleming.jpg'),
(3, 'Enunciado3', 3, 3, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id_pregunta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id_pregunta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Base de datos: `reservas_eventos`
--
CREATE DATABASE IF NOT EXISTS `reservas_eventos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `reservas_eventos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--

CREATE TABLE `reservaciones` (
  `id` int NOT NULL,
  `id_salon` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad_personas` int NOT NULL,
  `fecha` date NOT NULL,
  `estado` enum('pendiente','aprobado','rechazado') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reservaciones`
--

INSERT INTO `reservaciones` (`id`, `id_salon`, `nombre`, `cantidad_personas`, `fecha`, `estado`) VALUES
(1, 1, 'Maria', 5, '2024-12-18', 'aprobado'),
(2, 2, 'Jose', 10, '2024-12-18', 'pendiente'),
(3, 2, 'Katherine', 15, '2024-12-20', 'pendiente'),
(4, 1, 'Bryan', 10, '2024-12-29', 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salones`
--

CREATE TABLE `salones` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `capacidad` int NOT NULL,
  `estado` enum('disponible','no disponible') DEFAULT 'disponible',
  `fecha_no_disponible` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `salones`
--

INSERT INTO `salones` (`id`, `nombre`, `capacidad`, `estado`, `fecha_no_disponible`) VALUES
(1, 'Salón A', 10, 'no disponible', '2024-12-29'),
(2, 'Salón B', 20, 'no disponible', '2024-12-20'),
(3, 'Salón C', 30, 'disponible', NULL),
(4, 'Salón D', 40, 'disponible', NULL),
(5, 'Salón E', 50, 'disponible', NULL),
(6, 'Salón F', 10, 'disponible', NULL),
(7, 'Salón G', 20, 'disponible', NULL),
(8, 'Salón H', 30, 'disponible', NULL),
(9, 'Salón I', 40, 'disponible', NULL),
(10, 'Salón J', 50, 'disponible', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `rol`) VALUES
(2, 'test', '$2y$10$my1dVQaQzFgCwyL.MVbtEOl0HoKM8r9Z1plXecIQ30xEZUOKhq0iq', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_salon` (`id_salon`);

--
-- Indices de la tabla `salones`
--
ALTER TABLE `salones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `salones`
--
ALTER TABLE `salones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD CONSTRAINT `reservaciones_ibfk_1` FOREIGN KEY (`id_salon`) REFERENCES `salones` (`id`) ON DELETE CASCADE;
--
-- Base de datos: `techshop`
--
CREATE DATABASE IF NOT EXISTS `techshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `techshop`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `ruta_imagen` varchar(1024) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `descripcion`, `ruta_imagen`, `activo`) VALUES
(1, 'Monitores', 'https://d2ulnfq8we0v3.cloudfront.net/cdn/695858/media/catalog/category/MONITORES.jpg', 1),
(2, 'Teclados', 'https://cnnespanol.cnn.com/wp-content/uploads/2022/04/teclado-mecanico.jpg', 1),
(3, 'Tarjeta Madre', 'https://static-geektopia.com/storage/thumbs/784x311/788/7884251b/98c0f4a5.webp', 1),
(4, 'Celulares', 'https://www.monumental.co.cr/wp-content/uploads/2022/03/X4J2Z6XQUZDO7O6QTDF4DIJ3VE.jpeg', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_usuario`, `fecha`, `total`, `estado`) VALUES
(1, 1, '2022-01-05', 211560, 2),
(2, 2, '2022-01-07', 554340, 2),
(3, 3, '2022-01-07', 871000, 2),
(4, 1, '2022-01-15', 244140, 1),
(5, 2, '2022-01-17', 414800, 1),
(6, 3, '2022-01-21', 420000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `id_categoria` int NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `detalle` varchar(1600) NOT NULL,
  `precio` double DEFAULT NULL,
  `existencias` int DEFAULT NULL,
  `ruta_imagen` varchar(1024) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `id_categoria`, `descripcion`, `detalle`, `precio`, `existencias`, `ruta_imagen`, `activo`) VALUES
(1, 1, 'Monitor AOC 19', 'Lorem ipsum dolor sit amet consectetur adipiscing elit iaculis, ullamcorper in fringilla eu cras tempor mi. Luctus blandit sapien mauris vestibulum consequat mattis taciti aliquam ullamcorper, sagittis suscipit etiam urna convallis interdum tempor bibendum, ultricies habitant viverra natoque dictum posuere senectus volutpat. Cum ad vehicula condimentum nunc lacus nec tellus eleifend, a platea curae nullam sollicitudin nibh class cursus taciti, posuere purus inceptos facilisis cubilia suspendisse ut.', 23000, 5, 'https://c.pxhere.com/images/ec/fd/d67b367ed6467eb826842ac81d3b-1453591.jpg!d', 1),
(2, 1, 'Monitor MAC', 'Quisque in ridiculus scelerisque platea accumsan libero sem vel, mi cras metus cubilia tempor conubia fermentum volutpat gravida, maecenas semper sodales potenti turpis enim dapibus. Volutpat accumsan vivamus dignissim blandit vel eget posuere donec id, tempus sagittis aliquam erat luctus ornare aptent cubilia aliquet proin, ultrices ante pretium gravida sed vitae vestibulum aenean. Eleifend nascetur conubia ornare purus a eget at metus est risus natoque, elementum dis vulputate sociosqu integer ut ad nisl dui molestie.', 27000, 2, 'https://c.pxhere.com/photos/17/77/Art_Calendar_Cc0_Creative_Design_High_Resolution_Mac_Stock-1622403.jpg!d', 1),
(3, 1, 'Monitor Flex 21', 'Natoque lacinia accumsan hendrerit pretium sociis imperdiet a, nullam ornare erat suspendisse praesent porta, euismod in augue tempus aliquet habitasse. Non accumsan nostra cras vestibulum augue facilisi auctor scelerisque suscipit, iaculis maecenas varius sollicitudin lacus netus et ultricies tincidunt, tortor curabitur tempor diam aliquet dis platea integer. Potenti aliquet erat neque vitae et sociis pretium, viverra euismod vivamus scelerisque metus est feugiat curae, parturient auctor aliquam pharetra nam congue.', 24000, 5, 'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/09/LG-OLED-Flex-7-scaled.jpg', 1),
(4, 1, 'Monitor Flex 36', 'Elementum sagittis dictumst leo curabitur porta, pellentesque interdum mauris class augue, penatibus vulputate dignissim lobortis, risus euismod ullamcorper ultrices. Hac suspendisse id odio tempus eleifend a malesuada, conubia gravida turpis auctor eget quam eu, fusce taciti lobortis sem netus cum. Etiam lacinia non nibh taciti vulputate ut nullam, curae mollis penatibus facilisi maecenas urna aptent, metus fusce felis magna ullamcorper aenean.', 27600, 2, 'https://www.lg.com/us/images/tvs/md08003300/gallery/D-01.jpg', 1),
(5, 2, 'Teclado español everex', 'Aenean senectus diam vitae curae habitant risus a et netus ante, sociis metus quisque euismod aptent etiam platea fringilla class vestibulum, dis habitasse facilisis fusce varius nam arcu blandit congue. Rutrum placerat congue etiam senectus tincidunt fringilla consequat dignissim sollicitudin, vulputate curae accumsan tempor nunc vel eros mus. Mauris donec urna ante proin duis nullam purus maecenas gravida curae iaculis, tempor quam massa cursus mollis per sodales eros diam leo.', 45000, 5, 'https://http2.mlstatic.com/D_NQ_NP_984317-MLA43206062255_082020-O.webp', 1),
(6, 2, 'Teclado fisico gamer', 'Auctor id morbi tempor litora fusce potenti, ornare integer imperdiet turpis accumsan enim, sagittis suscipit purus lacus nunc. Posuere tellus elementum imperdiet sollicitudin consequat torquent urna risus, pulvinar ac per quis egestas tristique ultricies, bibendum dignissim congue eu litora malesuada montes. Nisl arcu mi purus auctor nulla sodales torquent facilisis imperdiet, dignissim bibendum justo dictum in congue integer scelerisque sagittis, accumsan laoreet nam augue felis massa varius nostra.', 57000, 2, 'https://psycatgames.com/magazine/party-games/gaming-trivia/feature-image_hu1c2b511a5a2ca80ffc557d83cb5157c1_380853_1200x1200_fill_q100_box_smart1.jpg', 1),
(7, 2, 'Teclado usb compacto', 'Cum placerat etiam lobortis curabitur fames class facilisi hac duis, congue vulputate mus feugiat nostra imperdiet neque vehicula. Mi mollis ridiculus montes aenean sagittis vitae metus, netus massa ligula sociis magnis porttitor, torquent nisl eleifend lobortis dignissim at. Eget nostra tellus sagittis condimentum nec felis curabitur dis ad purus, montes dapibus ullamcorper cras vivamus facilisis nascetur lectus porttitor, dictum vulputate luctus pretium ligula eu posuere rhoncus molestie. Nibh platea odio at mollis est, turpis enim felis pharetra tellus placerat, facilisis praesent massa nulla. Accumsan curabitur cras mus turpis malesuada arcu aptent, volutpat praesent habitant senectus quis mollis sed, viverra nec proin nostra cubilia hendrerit.', 25000, 5, 'https://live.staticflickr.com/7010/26783973491_3e2043edda_b.jpg', 1),
(8, 2, 'Teclado Monitor Flex', 'Purus dictumst scelerisque mollis platea malesuada per vehicula lectus blandit sed, vulputate morbi imperdiet duis dapibus congue class accumsan nullam, ligula eleifend tincidunt urna mi condimentum dis posuere tellus. Sem rutrum erat mauris justo nunc odio condimentum in dictumst, cum porttitor lectus dignissim velit nulla gravida lobortis tempus vehicula, pharetra urna ullamcorper metus semper volutpat proin senectus. Aliquam donec cras ante hendrerit enim vitae nostra consequat scelerisque a habitant dictum congue ornare potenti, sodales velit litora suspendisse nullam neque pellentesque dui etiam platea imperdiet pretium luctus.', 27600, 2, 'https://hardzone.es/app/uploads-hardzone.es/2020/10/Mejores-KVM.jpg', 1),
(9, 3, 'CPU Intel 7i', 'Morbi egestas sociis magnis curabitur suscipit nostra blandit magna torquent convallis, enim parturient feugiat fringilla litora aliquam turpis nisl at velit, fames aenean dui viverra arcu habitasse nascetur platea ac. Lectus nibh imperdiet nascetur proin potenti nisl mattis fringilla urna consequat diam, pellentesque vulputate magnis ridiculus dignissim nec venenatis primis ut bibendum, penatibus himenaeos mus sapien magna etiam velit justo vivamus metus. Tellus volutpat hendrerit vehicula lacinia aliquam euismod lectus erat posuere, arcu nec morbi dui placerat quisque semper tempor vulputate est, turpis ac dis nostra congue odio per mattis.', 15780, 5, 'https://live.staticflickr.com/7391/9662276651_f4aa27d5ca_b.jpg', 1),
(10, 3, 'CPU Intel Core 5i', 'Rhoncus ante magna cursus consequat proin senectus ridiculus, varius maecenas tellus justo facilisi ligula eros dapibus, taciti sollicitudin vulputate vivamus lacus fusce. Lacus aptent facilisi urna volutpat vestibulum nunc sociis viverra habitasse egestas, vivamus blandit ultricies neque netus pulvinar elementum ac per iaculis, donec euismod porttitor velit diam ullamcorper congue phasellus nam. Feugiat senectus parturient tristique enim ac integer torquent rutrum imperdiet, nec dapibus nam vestibulum sodales phasellus dis egestas urna, donec interdum id dictumst mollis nostra felis euismod. Ornare proin diam lobortis enim maecenas tempus scelerisque nascetur, id quam magna fames vitae posuere luctus tempor, interdum mattis et ac sapien imperdiet ante.', 15000, 2, 'https://live.staticflickr.com/1473/24714440462_31a0fcdfba_b.jpg', 1),
(11, 3, 'AMD 7500', 'Primis quis sollicitudin ac himenaeos dui metus ridiculus, viverra vitae erat litora mauris eget, ut nisl platea feugiat inceptos cum. Diam vitae sem nulla commodo hendrerit duis dictum, tristique senectus maecenas eu augue dignissim lectus, eros cursus felis ornare nisl primis. Tempor facilisi ad scelerisque himenaeos nec ultrices interdum praesent, tincidunt mauris morbi nostra et parturient vivamus odio viverra, eget eu fermentum conubia vestibulum sagittis feugiat. Nulla mus dis rutrum feugiat imperdiet sociosqu non augue tempor sem, arcu natoque ridiculus odio dapibus quis ligula sagittis dui.', 25400, 5, 'https://upload.wikimedia.org/wikipedia/commons/0/0c/AMD_Ryzen_9_3900X_-_ISO.jpg', 1),
(12, 3, 'AMD 670', 'Risus tristique donec faucibus cursus dictumst vestibulum maecenas, ac scelerisque luctus purus senectus quisque pellentesque, dictum commodo accumsan himenaeos placerat suscipit. Pharetra erat cubilia sapien feugiat aenean molestie vulputate ac, lectus phasellus rutrum pretium interdum a natoque varius parturient, pulvinar condimentum praesent mollis ante nulla inceptos. Curabitur vestibulum malesuada justo non nostra nam donec dictum platea, commodo dictumst natoque bibendum leo nibh cras habitant primis, quisque augue eget ultrices pulvinar sodales odio rhoncus. Diam condimentum id pellentesque imperdiet porttitor vestibulum himenaeos iaculis, natoque ornare scelerisque nam nostra taciti tortor malesuada, sapien lacus cubilia suspendisse eros rutrum conubia.', 45000, 3, 'https://upload.wikimedia.org/wikipedia/commons/a/a0/AMD_Duron_850_MHz_D850AUT1B.jpg', 1),
(13, 4, 'Samsung S22', 'Nam ad hac curae mollis dui scelerisque convallis eros, dignissim faucibus velit nostra dapibus cursus vehicula habitasse facilisi, mi conubia pellentesque quisque cras justo inceptos. Integer varius consequat volutpat at dui scelerisque dapibus magnis platea quis, purus mi nibh tempor inceptos litora hac himenaeos ultrices. Convallis orci dictumst tincidunt phasellus facilisis ullamcorper montes vestibulum, leo cubilia tempus fringilla sodales per lacus viverra pretium, potenti id sociis fames curae nam etiam.', 285000, 0, 'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/08/S22-app-drawer-scaled.jpg', 1),
(14, 4, 'Motorola X23', 'Luctus lacus montes vulputate libero purus est litora, risus magnis quisque ac urna magna sollicitudin, suspendisse mauris massa euismod quam placerat. Facilisis congue id posuere tortor et porttitor curabitur pulvinar sapien, cubilia tempus pharetra facilisi fringilla dapibus lectus non hendrerit, pellentesque dictumst vulputate natoque molestie aptent nascetur ante. Laoreet etiam taciti integer at metus facilisis, pellentesque tortor leo enim felis turpis bibendum, neque curabitur himenaeos hac torquent.', 154000, 0, 'https://www.trustedreviews.com/wp-content/uploads/sites/54/2021/10/motorola-2.jpg', 1),
(15, 4, 'Nokia 5430', 'Nullam porttitor vivamus phasellus tempus in morbi aliquet platea duis, nulla tristique inceptos pellentesque pulvinar congue sagittis euismod vitae lacinia, scelerisque mus orci sociosqu libero proin sed felis. Pretium tincidunt ultrices eu vel nam massa morbi diam sem, neque aliquet vehicula penatibus odio phasellus curabitur. Conubia natoque quis tellus scelerisque sociis facilisi nisi suspendisse, id interdum ornare vivamus proin himenaeos class sed in, suscipit torquent est aliquam orci nunc etiam. Congue et nisl magna cum id sociis enim suscipit integer, nisi egestas est porttitor sollicitudin commodo natoque pharetra torquent, aliquam euismod nam porta rhoncus non ante habitasse.', 330000, 0, 'https://www.trustedreviews.com/wp-content/uploads/sites/54/2021/08/nokia-xr20-1.jpg', 1),
(16, 4, 'Xiami x45', 'Litora metus senectus mattis egestas mus fames tempus suscipit, inceptos luctus hendrerit congue quis sem. Potenti quis conubia fermentum non dictum nibh, viverra neque sed pretium eros aptent, metus hac at imperdiet est. Accumsan donec sociosqu etiam venenatis felis aenean suspendisse facilisi dignissim conubia non, molestie est ultrices neque id diam pellentesque quis quisque in odio, per nulla aptent arcu vehicula lobortis aliquet tempor cum platea.', 273000, 0, 'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/03/20220315_104812-1-scaled.jpg', 1),
(17, 4, 'Nokia', 'Nokia', 2000, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre`, `id_usuario`) VALUES
(1, 'ROLE_ADMIN', 1),
(2, 'ROLE_VENDEDOR', 1),
(3, 'ROLE_USER', 1),
(4, 'ROLE_VENDEDOR', 2),
(5, 'ROLE_USER', 2),
(6, 'ROLE_USER', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(512) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `correo` varchar(25) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `ruta_imagen` varchar(1024) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `username`, `password`, `nombre`, `apellidos`, `correo`, `telefono`, `ruta_imagen`, `activo`) VALUES
(1, 'juan', '$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.', 'Juan', 'Castro Mora', 'jcastro@gmail.com', '4556-8978', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg', 1),
(2, 'rebeca', '$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi', 'Rebeca', 'Contreras Mora', 'acontreras@gmail.com', '5456-8789', 'https://upload.wikimedia.org/wikipedia/commons/0/06/Photo_of_Rebeca_Arthur.jpg', 1),
(3, 'pedro', '$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO', 'Pedro', 'Mena Loria', 'lmena@gmail.com', '7898-8936', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Eduardo_de_Pedro_2019.jpg/480px-Eduardo_de_Pedro_2019.jpg?20200109230854', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int NOT NULL,
  `id_factura` int NOT NULL,
  `id_producto` int NOT NULL,
  `precio` double DEFAULT NULL,
  `cantidad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `id_factura`, `id_producto`, `precio`, `cantidad`) VALUES
(1, 1, 5, 45000, 3),
(2, 1, 9, 15780, 2),
(3, 1, 10, 15000, 3),
(4, 2, 5, 45000, 1),
(5, 2, 14, 154000, 3),
(6, 2, 9, 15780, 3),
(7, 3, 14, 154000, 1),
(8, 3, 6, 57000, 1),
(9, 3, 15, 330000, 2),
(10, 1, 6, 57000, 2),
(11, 1, 8, 27600, 3),
(12, 1, 9, 15780, 3),
(13, 2, 8, 27600, 3),
(14, 2, 14, 154000, 2),
(15, 2, 3, 24000, 1),
(16, 3, 15, 330000, 1),
(17, 3, 12, 45000, 1),
(18, 3, 10, 15000, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `fk_factura_usuario` (`id_usuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_producto_caregoria` (`id_categoria`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`),
  ADD KEY `fk_rol_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `fk_ventas_factura` (`id_factura`),
  ADD KEY `fk_ventas_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `rol`
--
ALTER TABLE `rol`
  ADD CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);
--
-- Base de datos: `wonder_shop`
--
CREATE DATABASE IF NOT EXISTS `wonder_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `wonder_shop`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_usuario`, `fecha`, `total`, `estado`) VALUES
(1, 1, '2024-02-05', 211560, 2),
(2, 2, '2024-02-07', 554340, 2),
(3, 3, '2024-02-07', 871000, 2),
(4, 1, '2024-02-15', 244140, 1),
(5, 2, '2024-02-17', 414800, 1),
(6, 3, '2024-02-21', 420000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia`
--

CREATE TABLE `historia` (
  `descripcion` varchar(30) NOT NULL,
  `ruta_imagen` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion`
--

CREATE TABLE `informacion` (
  `id_informacion` int NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `ruta_imagen` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id_pregunta` int NOT NULL,
  `detalle_pregunta` varchar(1600) NOT NULL,
  `nombre_usuario` varchar(30) NOT NULL,
  `respuesta` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id_pregunta`, `detalle_pregunta`, `nombre_usuario`, `respuesta`) VALUES
(1, '¿Puedo devolver un producto?', 'Anonimo', 'Sí, un producto se puede devolver siempre y cuando cuente con el tiquete de compra y si el producto esta dañado de fabrica se hara un rembolso  del dinero.'),
(2, '¿Cuáles son los métodos de pago aceptados?', 'Maria Mora', 'Aceptamos tarjetas de crédito (Visa, Mastercard, American Express) y PayPal.'),
(3, '¿Cuál es el plazo de entrega de los productos?', 'Anonimo', 'El plazo de entrega estándar es de 3 a 5 días hábiles. Sin embargo, ofrecemos opciones de envío express para entregas más rápidas.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `detalle` varchar(1600) NOT NULL,
  `precio` double DEFAULT NULL,
  `existencias` int DEFAULT NULL,
  `ruta_imagen` varchar(1024) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `descripcion`, `detalle`, `precio`, `existencias`, `ruta_imagen`, `activo`) VALUES
(1, 'Peluche Hueso', 'Juguete de peluche en forma de alita', 7000, 2, 'https://i.pinimg.com/564x/36/22/61/3622612c59e7155a9d228a1e9f66e494.jpg', 1),
(2, 'Juguete Dispensador de Comida', 'Juguete pelota que conforme tu mascota va mordiendo, sale comida de ella', 20000, 3, 'https://i.pinimg.com/564x/f0/21/3f/f0213f65292a28823ab75a3429fb1470.jpg', 1),
(3, 'Pelotas de Tenis', 'Pelotas de tenis de color rosa', 4000, 6, 'https://i.pinimg.com/564x/9a/2d/33/9a2d33ad3a3f325ec40c20f752f1015d.jpg', 1),
(4, 'Juguete con arañador para gato', 'Juguete rascador para gato con resorte', 15000, 10, 'https://i.pinimg.com/564x/cc/b0/d7/ccb0d7780f618a8a3b9b73313eb5f241.jpg', 1),
(5, 'Cepillo para bañar', 'Cepillo para baño. Al mismo, se le echa jabon para mascotas para su funcion', 6800, 3, 'https://i.pinimg.com/564x/07/6f/66/076f6647a5f68dee6c910916e7c7ec74.jpg', 1),
(6, 'Bolitas de Catnip', 'Bolitas rotatorias de catnip en forma de aguacate', 2500, 8, 'https://i.pinimg.com/564x/c1/21/c7/c121c723e454c2fea5370e85183d4f5b.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre`, `id_usuario`) VALUES
(1, 'ROLE_ADMIN', 1),
(2, 'ROLE_VENDEDOR', 1),
(3, 'ROLE_USER', 1),
(4, 'ROLE_VENDEDOR', 2),
(5, 'ROLE_USER', 2),
(6, 'ROLE_USER', 3),
(7, 'ROLE_USER', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(512) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `correo` varchar(25) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `ruta_imagen` varchar(1024) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `username`, `password`, `nombre`, `apellidos`, `correo`, `telefono`, `ruta_imagen`, `activo`) VALUES
(1, 'luis', 'Luis2.300', 'Luis', 'Perez Brenes', 'lperez@gmail.com', '2233-4455', 'https://cdn.pixabay.com/photo/2012/04/13/21/07/user-33638_1280.png', 1),
(2, 'maria', 'Maria5.400', 'Maria', 'Alfaro Salazar', 'malfaro@gmail.com', '6677-8889', 'https://cdn.pixabay.com/photo/2017/01/30/23/52/female-2022387_1280.png', 1),
(3, 'jose', 'Jose7.500', 'Jose', 'Arias Flores', 'jarias@gmail.com', '9900-1122', 'https://img.freepik.com/vector-premium/icono-perfil-usuario-masculino-predeterminado-ilustracion-vectorial_276184-168.jpg?w=740', 1),
(4, 'Maria1', 'Q22w1ix0omy76Blb8N16sxZ7v8pivodhN77Q+JPD', 'Maria', 'Perez', 'maria1@gmail.com', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int NOT NULL,
  `id_factura` int NOT NULL,
  `id_producto` int NOT NULL,
  `precio` double DEFAULT NULL,
  `cantidad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `id_factura`, `id_producto`, `precio`, `cantidad`) VALUES
(1, 1, 1, 7000, 3),
(2, 1, 2, 20000, 2),
(3, 1, 3, 4000, 3),
(4, 2, 4, 15000, 1),
(5, 2, 5, 6800, 3),
(6, 2, 6, 2500, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `fk_factura_usuario` (`id_usuario`);

--
-- Indices de la tabla `historia`
--
ALTER TABLE `historia`
  ADD PRIMARY KEY (`descripcion`);

--
-- Indices de la tabla `informacion`
--
ALTER TABLE `informacion`
  ADD PRIMARY KEY (`id_informacion`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id_pregunta`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`),
  ADD KEY `fk_rol_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `fk_ventas_factura` (`id_factura`),
  ADD KEY `fk_ventas_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `informacion`
--
ALTER TABLE `informacion`
  MODIFY `id_informacion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id_pregunta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `rol`
--
ALTER TABLE `rol`
  ADD CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
