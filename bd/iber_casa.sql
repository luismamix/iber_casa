-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-07-2021 a las 19:38:57
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `iber_casa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `inmueble_id` int(11) DEFAULT NULL,
  `importe` decimal(10,2) NOT NULL,
  `fechainicio` datetime NOT NULL,
  `fechafin` datetime NOT NULL,
  `fianza` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartera`
--

CREATE TABLE `cartera` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cartera`
--

INSERT INTO `cartera` (`id`, `nombre`) VALUES
(1, 'Jupiter'),
(2, 'Titan'),
(3, 'Venus'),
(4, 'Sahara'),
(5, 'Everest'),
(6, 'Mistic');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comercializacion`
--

CREATE TABLE `comercializacion` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comercializacion`
--

INSERT INTO `comercializacion` (`id`, `descripcion`) VALUES
(1, 'alquiler'),
(2, 'venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210726180318', '2021-07-26 20:04:10', 50),
('DoctrineMigrations\\Version20210726183511', '2021-07-26 20:35:41', 232),
('DoctrineMigrations\\Version20210726185904', '2021-07-26 20:59:47', 2135),
('DoctrineMigrations\\Version20210727105931', '2021-07-27 13:00:38', 61),
('DoctrineMigrations\\Version20210727110307', '2021-07-27 13:03:12', 44),
('DoctrineMigrations\\Version20210727110959', '2021-07-27 13:11:27', 155),
('DoctrineMigrations\\Version20210727111407', '2021-07-27 13:14:13', 49),
('DoctrineMigrations\\Version20210727111835', '2021-07-27 13:18:41', 147),
('DoctrineMigrations\\Version20210727113529', '2021-07-27 13:35:38', 176),
('DoctrineMigrations\\Version20210727114019', '2021-07-27 13:40:24', 168),
('DoctrineMigrations\\Version20210730163425', '2021-07-30 18:34:43', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE `inmueble` (
  `id` int(11) NOT NULL,
  `tipologia_id` int(11) DEFAULT NULL,
  `cartera_id` int(11) DEFAULT NULL,
  `propietario_id` int(11) DEFAULT NULL,
  `status1_id` int(11) DEFAULT NULL,
  `status2_id` int(11) DEFAULT NULL,
  `uso_id` int(11) DEFAULT NULL,
  `comercializacion_id` int(11) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localidad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anoconstruccion` int(11) DEFAULT NULL,
  `calefaccion` tinyint(1) DEFAULT NULL,
  `aireacondicionado` tinyint(1) DEFAULT NULL,
  `piscina` tinyint(1) DEFAULT NULL,
  `garaje` tinyint(1) DEFAULT NULL,
  `banos` int(11) DEFAULT NULL,
  `cocina` tinyint(1) DEFAULT NULL,
  `dormitorios` int(11) DEFAULT NULL,
  `ascensor` tinyint(1) DEFAULT NULL,
  `trastero` tinyint(1) DEFAULT NULL,
  `buhardilla` tinyint(1) DEFAULT NULL,
  `plantas` int(11) DEFAULT NULL,
  `salas` int(11) DEFAULT NULL,
  `porcentajeconstruido` decimal(5,2) DEFAULT NULL,
  `m2construido` int(11) DEFAULT NULL,
  `m2parcela` int(11) DEFAULT NULL,
  `licactividad` tinyint(1) DEFAULT NULL,
  `suminostroagua` tinyint(1) DEFAULT NULL,
  `suministroelectricidad` tinyint(1) DEFAULT NULL,
  `pozo` tinyint(1) DEFAULT NULL,
  `aperos` tinyint(1) DEFAULT NULL,
  `m2superficie` int(11) DEFAULT NULL,
  `rutaimagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certenergetico` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`id`, `nombre`) VALUES
(1, 'Tomas Gutierrez'),
(2, 'Arturo Fernandez'),
(3, 'Marta Gomez'),
(4, 'Blanca Alvarez'),
(5, 'Alabama Holding'),
(6, 'Apple tree Holding'),
(7, 'Five Rivers Holding'),
(8, 'Jeff Brezos'),
(9, 'Andreu Buenavista'),
(10, 'Alicia Martinez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status1`
--

CREATE TABLE `status1` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `status1`
--

INSERT INTO `status1` (`id`, `descripcion`) VALUES
(1, 'disponible'),
(2, 'no_disponible'),
(3, 'alquilado'),
(4, 'vendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status2`
--

CREATE TABLE `status2` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `status2`
--

INSERT INTO `status2` (`id`, `descripcion`) VALUES
(1, 'buen estado'),
(2, 'mal estado'),
(3, 'en construccion'),
(4, 'ruina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipologia`
--

CREATE TABLE `tipologia` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipologia`
--

INSERT INTO `tipologia` (`id`, `descripcion`) VALUES
(1, 'Edificio'),
(2, 'Local'),
(3, 'Nave'),
(4, 'Oficina'),
(5, 'Piso'),
(6, 'Adosado'),
(7, 'Chalet'),
(8, 'Solar urbano'),
(9, 'Solar rustico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `perfil` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `perfil`) VALUES
(1, 'Admin'),
(2, 'Vendedor'),
(3, 'Comprador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uso`
--

CREATE TABLE `uso` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `uso`
--

INSERT INTO `uso` (`id`, `descripcion`) VALUES
(1, 'residencial'),
(2, 'comercial'),
(3, 'restauracion'),
(4, 'turistico'),
(5, 'industrial'),
(6, 'forestal'),
(7, 'agricola'),
(8, 'ganadero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` int(11) NOT NULL,
  `tipousuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `roles`, `password`, `nombre`, `apellido`, `direccion`, `telefono`, `tipousuario_id`) VALUES
(1, 'admin@admin.com', '[\"ROLE_ADMIN\"]', '$2y$13$ebvQK0NGUDngqsrKxAQR9.2yvXrEGBCTSwMyMoQ30.ObiZmTSkPQK', 'Bruno', 'Mars', 'C/ Jupiter 7', 626455733, 1),
(2, 'luis@luis.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$mY7F654FJYvjVAqjQrxqJe161Rq1TsK9Pg2g6Mwr5SnV.VRJAtKBu', 'LUIS MANUEL', 'ALBERQUILLA', 'C/ Robles 7', 633444555, 2),
(3, 'minion@minion.com', '[\"ROLE_COMPRADOR\"]', '$2y$13$rYPQozhom2q9tuIheYKF5e4cSNLxdjjtqD3Cojwfn10FhBRygKjMG', 'Bob', 'Minion', 'C/ gru 7', 666444333, 3),
(4, 'batman@gotham.com', '[\"ROLE_ADMIN\"]', '$2y$13$ZWJhE5r2.Ygc2/RgbN47luzkJbMBPqlUNfuH7SIBi.4Q82tCa.wyK', 'Bruce', 'Wayne', 'Batcueva', 628000028, 1),
(5, 'dealer@teletienda.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$TOhQjgZf1A296Bb3GTG1Zed6QckXf9V2E0UHJtAsmPzqgQ1nRM6NW', 'John', 'Doe', 'C/ pink 9', 644533123, 2),
(6, 'investor33@forrastreros.com', '[\"ROLE_COMPRADOR\"]', '$2y$13$l.B1VViGY0Q.SCHxmW3vDeSlztd7XryFKyu/f5R0wo3gp92M0sFZ2', 'Rachel', 'Cors', 'Av. Menorca 33', 633336633, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `inmueble_id` int(11) DEFAULT NULL,
  `fechaventa` datetime NOT NULL,
  `iva` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `reserva` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_655BED39DB38439E` (`usuario_id`),
  ADD KEY `IDX_655BED39932498D9` (`inmueble_id`);

--
-- Indices de la tabla `cartera`
--
ALTER TABLE `cartera`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comercializacion`
--
ALTER TABLE `comercializacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_476C8979636030D6` (`tipologia_id`),
  ADD KEY `IDX_476C8979A5A18135` (`cartera_id`),
  ADD KEY `IDX_476C897953C8D32C` (`propietario_id`),
  ADD KEY `IDX_476C897963D715A2` (`status1_id`),
  ADD KEY `IDX_476C89797162BA4C` (`status2_id`),
  ADD KEY `IDX_476C8979AE1A5CB9` (`uso_id`),
  ADD KEY `IDX_476C8979871C9A1E` (`comercializacion_id`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `status1`
--
ALTER TABLE `status1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `status2`
--
ALTER TABLE `status2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipologia`
--
ALTER TABLE `tipologia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uso`
--
ALTER TABLE `uso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2265B05DE7927C74` (`email`),
  ADD KEY `IDX_2265B05D74CA5DCD` (`tipousuario_id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8FE7EE55DB38439E` (`usuario_id`),
  ADD KEY `IDX_8FE7EE55932498D9` (`inmueble_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cartera`
--
ALTER TABLE `cartera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `comercializacion`
--
ALTER TABLE `comercializacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `status1`
--
ALTER TABLE `status1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `status2`
--
ALTER TABLE `status2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipologia`
--
ALTER TABLE `tipologia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `uso`
--
ALTER TABLE `uso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `FK_655BED39932498D9` FOREIGN KEY (`inmueble_id`) REFERENCES `inmueble` (`id`),
  ADD CONSTRAINT `FK_655BED39DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD CONSTRAINT `FK_476C897953C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `propietario` (`id`),
  ADD CONSTRAINT `FK_476C8979636030D6` FOREIGN KEY (`tipologia_id`) REFERENCES `tipologia` (`id`),
  ADD CONSTRAINT `FK_476C897963D715A2` FOREIGN KEY (`status1_id`) REFERENCES `status1` (`id`),
  ADD CONSTRAINT `FK_476C89797162BA4C` FOREIGN KEY (`status2_id`) REFERENCES `status2` (`id`),
  ADD CONSTRAINT `FK_476C8979871C9A1E` FOREIGN KEY (`comercializacion_id`) REFERENCES `comercializacion` (`id`),
  ADD CONSTRAINT `FK_476C8979A5A18135` FOREIGN KEY (`cartera_id`) REFERENCES `cartera` (`id`),
  ADD CONSTRAINT `FK_476C8979AE1A5CB9` FOREIGN KEY (`uso_id`) REFERENCES `uso` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_2265B05D74CA5DCD` FOREIGN KEY (`tipousuario_id`) REFERENCES `tipo_usuario` (`id`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `FK_8FE7EE55932498D9` FOREIGN KEY (`inmueble_id`) REFERENCES `inmueble` (`id`),
  ADD CONSTRAINT `FK_8FE7EE55DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
