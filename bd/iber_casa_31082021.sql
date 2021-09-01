-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-09-2021 a las 16:15:53
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

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`id`, `usuario_id`, `inmueble_id`, `importe`, `fechainicio`, `fechafin`, `fianza`) VALUES
(1, 3, 4, '6000.00', '2021-08-21 09:58:35', '2021-09-04 09:58:35', '1500.00'),
(2, 9, 44, '1800.00', '2021-08-24 13:23:51', '2021-09-10 13:23:51', '180.00'),
(3, 6, 53, '4450.00', '2021-08-24 13:39:31', '2022-08-24 13:39:31', '450.00'),
(4, 6, 19, '500.00', '2021-08-31 13:51:34', '2021-09-05 13:51:34', '100.00');

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
('DoctrineMigrations\\Version20210730163425', '2021-07-30 18:34:43', 50),
('DoctrineMigrations\\Version20210807090451', '2021-08-07 11:05:45', 113),
('DoctrineMigrations\\Version20210808173114', '2021-08-08 19:31:46', 453),
('DoctrineMigrations\\Version20210808175301', '2021-08-08 19:54:30', 473),
('DoctrineMigrations\\Version20210824103107', '2021-08-24 12:32:03', 72),
('DoctrineMigrations\\Version20210830094831', '2021-08-30 11:51:57', 278);

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
  `suministroagua` tinyint(1) DEFAULT NULL,
  `suministroelectricidad` tinyint(1) DEFAULT NULL,
  `pozo` tinyint(1) DEFAULT NULL,
  `aperos` tinyint(1) DEFAULT NULL,
  `m2superficie` int(11) DEFAULT NULL,
  `rutaimagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certenergetico` tinyint(1) DEFAULT NULL,
  `terrazas` int(11) DEFAULT NULL,
  `descripcion` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inmueble`
--

INSERT INTO `inmueble` (`id`, `tipologia_id`, `cartera_id`, `propietario_id`, `status1_id`, `status2_id`, `uso_id`, `comercializacion_id`, `precio`, `direccion`, `localidad`, `provincia`, `anoconstruccion`, `calefaccion`, `aireacondicionado`, `piscina`, `garaje`, `banos`, `cocina`, `dormitorios`, `ascensor`, `trastero`, `buhardilla`, `plantas`, `salas`, `porcentajeconstruido`, `m2construido`, `m2parcela`, `licactividad`, `suministroagua`, `suministroelectricidad`, `pozo`, `aperos`, `m2superficie`, `rutaimagen`, `certenergetico`, `terrazas`, `descripcion`, `usuario_id`) VALUES
(1, 4, 1, 7, 1, 1, 2, 1, '3800.00', 'C/ Pinares 27 2ª Planta', 'MADRID', 'MADRID', 2003, 1, 1, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, 7, NULL, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_610f9cae161c1.jpg;images/img_610f9cae167e2.jpg;images/img_610f9cae16cd1.jpg', NULL, NULL, 'Oficina en entreplanta de 225 m2 con ventanas a la fachada principal. Consta de 7 salas espaciosas. Con cocina, calefacción y aire acondicionado. Está muy bien conectada porque pasan varias líneas de autobuses.', 17),
(2, 1, 6, 10, 1, 1, 1, 2, '529000.00', 'C/ Finisterre 34', 'Sant Carles De La Rapita', 'Tarragona', 1987, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_610ed49a34fda.jpg;images/img_610ed49a355fd.jpg;images/img_610ed49a359c6.jpg', NULL, NULL, 'El edificio tiene 6 plantas y un total de 16 viviendas que ocupan los pisos superiores. La planta baja está destinada a un amplio local comercial. Cada planta tiene 3 pisos que tienen amplias terrazas y bonitas vistas. Algunos de ellos tienen vistas al mar mientras que otros disfrutan de un agradable paisaje de montaña.', 20),
(3, 2, 1, 1, 1, 1, 2, 1, '361.00', 'C/ Fontana 23 Local B', 'SAN BLAS', 'ALICANTE', 2003, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'images/img_610ed7f9123df.jpg;images/img_610ed7f912926.jpg;images/img_610ed7f912cf6.jpg', 0, NULL, 'El local tiene 93 m² posee lic. Actividad como tienda de Alimentación. Tiene 1 baño, posee cert. energético. Es una zona que disfruta de todo tipo de servicios, con elevado tránsito de peatones, en una de las zonas comerciales de la población. Está bien comunicada mediante transporte público con el centro de la población.', 11),
(4, 3, 5, 1, 3, 1, 2, 1, '6000.00', 'C/ Arrabales 33', 'COSLADA', 'MADRID', 2010, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 2335, 4000, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_611012c557f92.jpg;images/img_611012c5585ac.jpg;images/img_611012c5589b6.jpg', NULL, NULL, 'Nave exenta, cerrada y vallada, de 2.335m2 construidos sobre parcela de 4.000m2 en zona Ctra. Coslada, frente a Mercaliebre. Se distribuye en almacén diáfano de 2.070m2 y oficinas dotadas y equipadas en 1ª planta, con entrada independiente, 5 muelles más puertas laterales y trasera de carga y descarga. Excelentes comunicaciones.', 11),
(5, 5, 4, 3, 1, 1, 1, 2, '209000.00', 'C/ Machupichu 13 2B', 'MADRID', 'MADRID', 1992, 1, NULL, NULL, NULL, 2, 1, 2, 1, 1, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6110f0c01fd77.jpg;images/img_6110f0c0215bd.jpg;images/img_6110f0c02240c.jpg', NULL, 1, 'Se trata de un apartamento de 59 m2, localizado en Madrid. La vivienda está distribuida en distintas estancias. Está ubicada en una zona residencial muy consolidad, muy cerca del centro de la población, en la que podemos encontrar todo tipo de servicios y comercios.', 13),
(6, 6, 5, 5, 1, 1, 4, 1, '1550.00', 'AV. Fuerzas Armadas 33', 'MADRID', 'MADRID', 2018, 1, 1, 1, 1, 2, 1, 3, NULL, NULL, 1, 2, NULL, NULL, 240, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6110ff636ba48.jpg;images/img_6110ff636bfeb.jpg;images/img_6110ff636c3a5.jpg;images/img_6110ff636c793.jpg;images/img_6110ff636cb5c.jpg;images/img_6110ff636cf19.jpg', NULL, 1, 'Amplio adosado en zona residencial, con piscina comunitaria, zonas verdes, 3 dormitorios, dormitorio principal con baño y vestidor, 2 baños, 1 aseo, salón-comedor con chimenea y salida a terraza de 20 m2 y jardín de 100 m2, cocina amueblada y equipada con office, salón en semi-sótano de 30 m2, GARAJE para 2 vehículos, VIGILANCIA 24 h.', 15),
(7, 7, 2, 7, 1, 1, 1, 2, '580000.00', 'C/ Mortimer 33', 'VALDEMORILLLO', 'MADRID', 1992, 1, 1, 1, 1, 4, 1, 7, NULL, NULL, NULL, 2, NULL, NULL, 451, 1870, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_611103ab30356.jpg;images/img_611103ab30978.jpg;images/img_611103ab30f02.jpg;images/img_611103ab31328.jpg;images/img_611103ab31712.jpg;images/img_611103ab31ae9.jpg;images/img_611103ab31ec6.jpg', NULL, 1, 'Magnífico chalet independiente en la reconocida urbanización Cotos de Monterrey. El chalet tiene una superficie construida de 451,58 m2 sobre una parcela de 1.870 m2, totalmente vallada en piedra y valla metálica. Dispone de 1 puerta de acceso peatonal con portero automático y 2 entradas para vehículos (automática). La parcela se encuentra totalmente ajardinada con árboles y riego automático y dispone de garaje exterior techado para 2 coches.\r\n\r\nPLANTA BAJA. - Hall de entrada. - Salón / comedor con chimenea en 2 ambientes. - Cocina comunicada con el comedor y con zona de servicio (habitación y zona de lavandería). - 2 dormitorios secundarios con vestidor. - Baño completo con bañera hidromasaje. - Dormitorio principal con baño en suite con bañera de hidromasaje y plato de ducha, vestidor y con salida a parcela. - Despacho. - Habitación de servicio con baño con ducha. - Piscina cubierta y climatizada con ducha y sauna\r\n\r\nPLANTA PRIMERA. - 3 dormitorios secundarios (2 de ellos dobles y el', 17),
(8, 8, 4, 1, 1, 1, 1, 2, '40000.00', 'C/ cipreses 4', 'MENTRIDA', 'TOLEDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 472, 'images/img_6111053dd497e.jpg;images/img_6111053dd5369.jpg', NULL, NULL, 'Parcela de 472 m² en la urbanización Los Altos de Méntrida (Toledo) cuyas parcelas se encuentran ya prácticamente todas construidas recientemente.\r\nSituada en un fondo de saco, muy tranquila, llana, con construcciones ya realizadas en los laterales y fondo.', 11),
(9, 9, 4, 9, 1, 2, 7, 2, '75000.00', 'C/ Lagartera s/n', 'La Campana de Oropesa', 'TOLEDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 40000, 'images/img_611106a39d86d.jpg;images/img_611106a39dde7.jpg;images/img_611106a39e244.jpg;images/img_611106a39e690.jpg', NULL, NULL, 'Finca de 4 hectáreas (finca viña del Médico).Tiene casa de 100m de 1975 para rehabilitar sin agua ni luz y 1 pozo.\r\n\r\n27198m de labor o labradío de secano\r\n3223m de olivos de secano\r\n6349m de labor o labradío de regadío\r\n3805m de olivos de secano', 19),
(10, 2, 3, 4, 1, 3, 2, 2, '59000.00', 'C/ Albatros 33', 'BEJAR', 'SALAMANCA', 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '70.00', 140, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'images/img_61110a00c73ac.jpg;images/img_61110a00c78ef.jpg;images/img_61110a00c7ced.jpg', NULL, NULL, 'Local comercial en venta en Sahagún (León) con una superficie de 140 m². El inmueble tiene acceso a la calle por una puerta metálica y tiene una única planta diáfana. Está cerca del la zona centro de Sahagún ', 14),
(11, 2, 6, 3, 1, 1, 2, 1, '38400.00', 'AV. Contreras 27', 'TORRE-PACHECO', 'MURCIA', 2007, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 344, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'images/img_610fa31b0f0aa.jpg;images/img_610fa31b0f5e3.jpg;images/img_610fa39ab9928.jpg', 1, NULL, 'Local en venta en Torre- Pacheco, Murcia. Dispone de Lic. Actividad comercial y Cert. Energético. A pocos metros de la Avenida de la Estación y de la Torre Campanario. Es una zona con gran densidad comercial y está rodeado de varios comercios como oficinas bancarias, restaurantes, comercios locales y farmacias.', 13),
(12, 7, 2, 8, 1, 1, 1, 2, '498000.00', 'C/ Fontana 44', 'NAVACERRADA', 'MADRID', 2008, 1, 1, NULL, 1, 3, 1, 4, NULL, NULL, NULL, 3, NULL, NULL, 313, 1300, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6112530c6bd2e.jpg;images/img_6112530c6c28a.jpg;images/img_6112530c6c691.jpg;images/img_6112530c6ca60.jpg;images/img_6112530c6ce22.jpg;images/img_6112530c6d228.jpg', NULL, 1, 'La vivienda fue construida en 2008 sobre una parcela de mas de 1.300 m2. Actualmente la vivienda tiene 313 m2 construidos distribuidos en 3 plantas.\r\n', 18),
(13, 7, 6, 10, 1, 1, 1, 2, '225000.00', 'C/ Castañar 33', 'VALDEMORILLLO', 'MADRID', 1995, 1, NULL, NULL, NULL, 2, 1, 4, NULL, NULL, NULL, 2, NULL, NULL, 220, 744, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_611234f0de5ca.jpg;images/img_611234f0df35e.jpg;images/img_611234f0df848.jpg', NULL, 1, 'Chalet independiente con parcela de 744m2 y vivienda de 220m2, 4 habitaciones, 2 baños, salón comedor, cocina, bodega. La vivienda se distribuye en dos plantas, en la planta principal contamos con hall de entrada, salón-comedor con chimenea, cocina independiente con salida al jardín trasero de la vivienda, en esta planta también contamos con 4 dormitorios dos de ellos con armarios empotrados y un baño que da servicio a toda la planta y amplia terraza totalmente acristalada.', 20),
(14, 7, 6, 5, 1, 1, 1, 2, '350000.00', 'C/ Olimpo 33', 'VALDEMAQUEDA', 'MADRID', 2005, 1, 1, 1, NULL, 2, 1, 3, NULL, NULL, NULL, 2, NULL, NULL, 218, 2500, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_611236cb2a018.jpg;images/img_611236cb2a565.jpg;images/img_611236cb2a953.jpg;images/img_611236cb2ad4c.jpg', NULL, NULL, ' La vivienda tiene bomba de frio y calor. Tiene estufa de leña, carbón con conducto interno para calentar toda la vivienda,\r\nEn 2.500 metros de parcela con piscina de 45 metros aproximadamente, se ha construido este chalet de 180 metros útiles en dos plantas encontramos una vivienda con ambiente rustico que lo hace acogedor y con encanto propio.\r\n', 15),
(15, 7, 1, 6, 1, 1, 1, 1, '890.00', 'C/ Ultramar 22', 'SANTA MARIA DE LA ALAMEDA', 'MADRID', 2002, 1, 1, 1, NULL, 1, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, 130, 700, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6112381c44425.jpg;images/img_6112381c44d15.jpg;images/img_6112381c450f6.jpg;images/img_6112381c454f0.jpg', NULL, NULL, 'Precioso chalet tipo loft de diseño minimalista. Zona muy tranquila. Magníficas vistas. Muy luminoso y espacioso. Suelo porcelánico. Calefacción por suelo radiante. Jardín independiente 700 metros. La piscina es de la comunidad de propietarios. Se alquila sólo la planta baja (que aparece en las fotografías, que tiene 130 metros cuadrados). Para una persona o pareja sin niños. No se admiten mascotas.', 16),
(16, 7, 5, 4, 1, 1, 1, 2, '409000.00', 'C/ Sotomonte 21', 'NAVALCARNERO', 'MADRID', 2002, 1, 1, 1, 1, 3, 1, 5, NULL, NULL, NULL, 3, NULL, NULL, 444, 2541, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61123982a6e3c.jpg;images/img_61123982a739e.jpg;images/img_61123982a77ca.jpg;images/img_61123982a7c7f.jpg;images/img_61123982a8101.jpg;images/img_61123982a8533.jpg', NULL, NULL, 'Chalet de 444 m² construidos según catastro y parcela de 2541 m². Consta de tres plantas, 5 habitaciones, 3 baños, salón a doble altura con biblioteca, comedor, cocina, garaje, leñera, trastero y piscina.', 14),
(17, 7, 2, 6, 1, 1, 1, 1, '1600.00', 'C/ Baratija 12', 'CHAPINERIA', 'MADRID', 2007, 1, 1, 1, 1, 1, 1, 4, NULL, NULL, NULL, 2, NULL, NULL, 200, 1500, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61123b6678956.jpg;images/img_61123b6678ee2.jpg;images/img_61123b66792cc.jpg;images/img_61123b66796b4.jpg;images/img_61123b6679adb.jpg', NULL, NULL, 'Precioso chalet en parcela de 1500 m2 en urbanización cerrada con vigilancia 24 horas y a tan solo 30 minutos de la capital , en un entorno privilegiado ideal para descansar del ajetreo de la ciudad.\r\nLa vivienda consta de:\r\n\r\n-2 plantas con 4 dormitorios uno principal en suite con baño completo, gran salón con chimenea y salida al jardín, cocina equipada con todos los electrodomésticos y salida a precioso porche, otro baño completo, garaje propio, gran parcela con piscina construida en 2018, preciosas vistas a la sierra, calefacción por suelo radiante con caldera de gasóleo, ventanas climalit y mágnificas calidades.', 16),
(18, 7, 5, 5, 1, 1, 1, 2, '725000.00', 'C/ Resistance 2', 'GALAPAGAR', 'MADRID', 2009, 1, 1, 1, 1, 5, 1, 5, NULL, NULL, NULL, 3, NULL, NULL, 450, 1500, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61123ea13d2e5.jpg;images/img_61123ea13d870.jpg;images/img_61123ea13e13a.jpg;images/img_61123ea13e568.jpg;images/img_61123ea13e94c.jpg;images/img_61123ea13ed30.jpg;images/img_61123ea13f125.jpg;images/img_61123ea13f500.jpg;images/img_61123ea13f8d', NULL, 1, 'Espectacular Kasoplón de lujo, con acabados de alta calidad, jardin de escándalo con piscina. El chalet se encuentra ubicado en una posición centrada dentro de la parcela, permitiendo disponer de unas amplias zonas ajardinadas tanto en la parte frontal, como en la parte posterior. Consta de un gran salón comedor, con chimenea, y 3 grandes ventanales que acceden a un porche.  Dispone de una amplia cocina, un aseo de cortesía, y 2 habitaciones dobles, que comparten un amplio baño completo.       Espectacular terraza, con vistas al sotomonte. dispone de 2 habitaciones, con un baño completo a compartir, y una gran suite, con baño completo con hidromasaje. Garaje con capacidad para un vehículo. Si buscas algo excepcional, este es el chalet.', 15),
(19, 7, 5, 1, 3, 1, 4, 1, '500.00', 'C/ Lagar s/n', 'ONDES', 'ASTURIAS', 1987, 1, NULL, NULL, NULL, 2, 1, 3, NULL, NULL, NULL, 2, NULL, NULL, 120, 16000, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6112430938f43.jpg;images/img_61124309394ac.jpg;images/img_611243093986c.jpg;images/img_6112430939c36.jpg;images/img_611243093a000.jpg;images/img_611243093a48a.jpg;images/img_611243093a8cd.jpg', NULL, NULL, 'Acogedora casa rural de 2 plantas con amplio salón con chimenea, rodeados de inmejorable ambiente natural. Amplio jardín con barbacoa par disfrutar de los cachopos y las sidrinas.', 11),
(20, 7, 4, 7, 1, 2, 1, 2, '14000.00', 'C/ mercaderes 11', 'MIERES', 'ASTURIAS', 1951, NULL, NULL, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, 2, NULL, NULL, 44, 88, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_611248840d64b.jpg;images/img_611248840dbe3.jpg;images/img_611248840e3b0.jpg;images/img_611248840e7a7.jpg;images/img_611248840eb88.jpg;images/img_611248840ef49.jpg;images/img_611248840f31c.jpg', NULL, 1, 'Casa en venta en Mieres, Asturias. Tiene 88 m² distribuidos en salón comedor, cocina, 3 habitaciones, 1 baño y terraza. Tiene un agradable jardín privado y vistas a la montaña asturiana. Interior mugroso. Ideal para  una buena reforma.', 17),
(21, 7, 4, 6, 2, 4, 1, 2, '8900.00', 'C/ Protos 11', 'RAÑAS', 'PONTEVEDRA', 2008, NULL, NULL, 1, NULL, 1, NULL, 1, NULL, NULL, NULL, 2, NULL, NULL, 36, 80, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61124bbad14f5.jpg;images/img_61124bbad1bbd.jpg;images/img_61124bbad2099.jpg;images/img_61124bbad24c3.jpg;images/img_61124bbad299b.jpg;images/img_61124bbad2dcf.jpg;images/img_61124bbad31fb.jpg', NULL, NULL, 'Casa pequeña de piedra con posibilidades. Casa en ruinas en Valongo, Cotobade, Pontevedra. Casita del S. XIX con granito de excelente calidad, piedra de cantería \"morena país\" con 38 m2 aprox distribuidos en dos plantas. Estado en ruina pero muy bien consolidada sin problemas estructurales, muros de 80 cm de grosor.\r\nDispone de un pequeño jardín delantero con un cruceiro de piedra(protegido). Zona tranquila, en la misma aldea dos bares muy recomendables y autobús diario a Pontevedra. Dispone de charca en la parte trasera.  Es ideal para hacer reforma ya que es una construcción típica gallega protegida y si lo ves y no t gusta te tomas un vinito con vieiras.', 16),
(37, 2, 1, 2, 1, 1, 2, 1, '750.00', 'C/ Fake 13 Bajo', 'MOSTOLES', 'MADRID', 2013, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'images/img_610d0c138cd2a.jpg;images/img_610d0c138d36d.jpg;', 1, NULL, 'Local Comercial en Móstoles, Madrid. El local tiene 93 m² totalmente diáfano. Es una zona que disfruta de todo tipo de servicios, con elevado tránsito de peatones, en una de las zonas comerciales de la población. Está bien comunicada mediante transporte público con el centro de la población, así como con la capital, Madrid, por la A5.', 12),
(38, 2, 1, 7, 1, 1, 2, 2, '225000.00', 'C/ Olivas 1', 'MOSTOLES', 'MADRID', 2002, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'images/img_610d1da619321.jpg;images/img_610d1da6198a7.jpg;images/img_610d1da619c87.jpg', 1, NULL, 'Local en venta Mostoles, Madrid. Tiene una superficie de construcción de 86 m² en varios espacios diáfanos. A pocos metros de la Avenida de la Estación y de la Torre Campanario. Es una zona con gran densidad comercial y está rodeado de varios comercios como oficinas bancarias, restaurantes, comercios locales y farmacias. Posee Lic Actividad tienda de alimentacion y cert.energético.', 17),
(39, 3, 3, 8, 1, 1, 2, 2, '385000.00', 'C/ Fortuny 17', 'VILLAVERDE', 'MADRID', 1999, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 541, 44, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_611254f783777.jpg;images/img_611254f783cb5.jpg;images/img_611254f78408a.jpg;images/img_611254f78444d.jpg;images/img_611254f7848b3.jpg', NULL, NULL, 'NAVE distribuida en 3 plantas en calle principal. Incluye 4 plazas de aparcamiento en el precio.\r\nCuenta con 541 m2 divididos en:\r\nPlanta Baja: Almacén\r\nPlanta 1º Oficina\r\nPlanta 2º Almacén', 18),
(40, 3, 3, 8, 1, 1, 8, 2, '70000.00', 'C/ Albercas 17', 'NAVARRETE', 'LA RIOJA', 1961, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 280, 175, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61125604af657.jpg;images/img_61125604afb9c.jpg;images/img_61125604aff70.jpg', NULL, NULL, 'En Navarrete (La Rioja) 280 m2 de naves ganaderas con patio cubierto de 175 m2. Con agua y luz.', 18),
(41, 9, 4, 9, 1, 1, 6, 2, '46900.00', 'C/ Vegas s/n', 'NAVALCARNERO', 'MADRID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 22600, 'images/img_6112573562d43.jpg;images/img_611257356328a.jpg;images/img_611257356367f.jpg;images/img_6112573563a57.jpg', NULL, NULL, 'ESPECTACULAR PARCELA RÚSTICA.\r\nTe ofrecemos una magnífica Parcela rústica de 22.600 m2.', 19),
(42, 4, 2, 8, 1, 1, 2, 2, '340000.00', 'C/ Tejar 11', 'ALMERIA', 'ALMERIA', 2004, 1, 1, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, 7, NULL, 331, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_610f9fc43aa9e.jpg;images/img_610f9fc43af7c.jpg;images/img_610f9fc43b340.jpg', NULL, NULL, 'Oficina en el polígono de San Onofre. 176 metros cuadrados distribuidos en varias dependencias y 2 cuartos de baño. Buen estado, exterior y con aparatos de aire acondicionado. Bien comunicado y fácil acceso por carretera.', 18),
(43, 2, 6, 10, 1, 2, 3, 2, '41000.00', 'C/ Sant Jaume 5 Bajo', 'XIRIVELLA', 'VALENCIA', 2003, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'images/img_611250381ec99.jpg;images/img_611250381f173.jpg;images/img_611250381f509.jpg;images/img_611250381f88c.jpg', NULL, NULL, 'Local comercial en venta en Xirivella, provincia de Valencia con una superficie de 102 m². El local se distribuye en una planta con una estancia diáfana, con dos estancias diferentes y un baño completo. El local está preparado para establecer un bar - restaurante con salida de humos. Cuenta con persianas de seguridad en metal, suelos de plaqueta y cerámicos. El local se encuentra en la planta baja de un edificio de cuatro alturas. Ubicado en una zona tranquila de la localidad de Xirivella, muy próxima al Ayuntamiento local. ', 20),
(44, 5, 5, 2, 3, 1, 1, 1, '1800.00', 'C/ TORRENT 7 3C', 'PLAYA DE SAN JUAN', 'ALICANTE', 1999, NULL, 1, 1, 1, 3, 1, 5, 1, NULL, NULL, NULL, NULL, NULL, 270, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6113996c0e301.jpg;images/img_6113996c0ee08.jpg;images/img_6113996c0f625.jpg;images/img_6113996c0fdfb.jpg;images/img_6113996c1066c.jpg;images/img_6113996c10e7c.jpg;images/img_6113996c1164f.jpg', NULL, 1, 'For rent long term, or sale. PRIME LOCATION. The House has 270mt2 expandable up to 350mt2. 5 bethrooms plus living room. 2 larges terraces and solárium. 3 bathrooms.\r\nLarge garage (capacity for 5 cars and more than 6m high). Direct access to gardens and pools from the livin room. Very bright. Beautiful views of the bay of Alicante.', 12),
(45, 6, 2, 8, 1, 1, 4, 1, '1925.00', 'C/ Espetos 12 2A', 'ESTEPONA', 'MALAGA', 2002, NULL, 1, 1, NULL, 2, 1, 3, NULL, NULL, NULL, 2, NULL, NULL, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61139b71979c4.jpg;images/img_61139b71983ef.jpg;images/img_61139b7198bc4.jpg;images/img_61139b7199422.jpg;images/img_61139b7199dee.jpg', NULL, 1, 'Fantástico ático con fabulosas vistas sobre el mar en 1ª LINEA DE PLAYA, con un agradable jardín con dos piscinas una de ellas para niños. Completamente cerrado y muy seguro, orientado al sur, sobre maduros jardines. Ubicado entre Estepona y La Duquesa, donde encontrará toda clase de comercios y lugares de ocio.', 18),
(46, 5, 5, 8, 4, 1, 1, 2, '695000.00', 'C/ Romescu 23 6B', 'CALVIÁ', 'BALEARES', 2003, 1, 1, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61139d685349b.jpg;images/img_61139d68540d2.jpg;images/img_61139d6854a7e.jpg;images/img_61139d68553bf.jpg;images/img_61139d6855ec1.jpg;images/img_61139d685681b.jpg', NULL, 1, 'Cuenta con 61 m2 de superficie perfectamente distribuidos e iluminados. La vivienda se vende totalmente amueblada con todo lujo de detalles y cuenta con 2 habitaciones con armarios empotrados y 1 baño completo al que se accede desde ambos dormitorios. La entrada nos conduce directamente al espacio de cocina equipada, un gran módulo con mobiliario integrado abierto al salón-comedor que mira hacia fuera gracias a grandes ventanales y desde el que se sale a la terraza de 8 m2 que nos ofrece la vivienda para disfrutar de un espacio exterior íntimo y del mar.', 18),
(47, 2, 3, 6, 1, 1, 3, 1, '1500.00', 'C/ HUERTAS 13', 'MADRID', 'MADRID', 1999, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 160, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'images/img_61139f49cd272.jpg;images/img_61139f49ce6d1.jpg;images/img_61139f49cf557.jpg', 1, NULL, 'Amplio y luminoso local de 160 m2, situado en una zona muy transitada, junto al metro Antón Martín.\r\nPlanta de entrada: Fachada de 5 metros lineales. Espacio diáfano y luminoso, con espacio para varias mesas y barra de degustación. Zona de cocina. 3 aseos.\r\nPlanta semisótano: Zona de almacenaje.\r\nEl local dispone de suelo de terrazo y gres, puerta de seguridad, salida de humos, aire acondicionado y calefacción con bomba de frío/ calor, extintores y luces de emergencia.', 16),
(48, 1, 5, 8, 1, 1, 4, 2, '4500000.00', 'PASEO DE LA CASTELLANA 198', 'MADRID', 'MADRID', 1951, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, 2656, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6113a1cd1e301.jpg;images/img_6113a1cd1ed13.jpg;images/img_6113a1cd1f4d0.jpg;images/img_6113a1cd1fc8d.jpg;images/img_6113a1cd20419.jpg', NULL, NULL, 'Superficie construida: 2.656 m²; 924 m² bajo rasante y 1.732 m² sobre rasante.\r\n\r\nDispone de las correspondientes licencias administrativas para el ejercicio de la actividad. Tiene una clasificación de tres estrellas. En pleno rendimiento.\r\nConstruido sobre un solar de 465 metros cuadrados. Consta de planta baja, entreplanta, cinco plantas de pisos, planta ático y dos plantas de sótano.\r\n40 habitaciones (5 exteriores y 2 dando al patio de manzana, en la planta sexta hay 4 habitaciones), todas ellas con baño en suite.\r\n10 plazas de aparcamiento ubicadas en el mismo edificio.\r\nHall de acceso y recepción.\r\nEl hotel está en perfecto estado.', 18),
(49, 1, 1, 5, 4, 1, 4, 2, '3900000.00', 'C/ Bellice 33', 'SAN SEBASTIAN', 'PAIS VASCO', 1998, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6113a47dc1a9e.jpg;images/img_6113a47dc2494.jpg;images/img_6113a47dc2c63.jpg;images/img_6113a47dc3464.jpg;images/img_6113a47dc3c8c.jpg', NULL, NULL, 'Tiene una superficie de 2.000 m² distribuidos en 8 plantas + 2 sótanos. 48 habitaciones, 24 dobles y 24 sencillas.\r\nCategoría 3 estrellas | ***', 15),
(50, 1, 1, 7, 1, 3, 1, 2, '268000.00', 'C/ Palomeras bajas 17', 'VALLECAS', 'MADRID', 2018, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, '30.00', 162, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6113a96b7ef4b.jpg;images/img_6113a96b7f941.jpg;images/img_6113a96b800c5.jpg', NULL, NULL, 'EDIFICIO EN CONSTRUCCIÓN Venta de cuatro viviendas en edificio en construcción compuesto por un total de cinco viviendas y un local comercial. La obra actualmente se encuentra parada. Cada vivienda tiene una superficie construida de 45,30 m2. ', 17),
(51, 2, 1, 8, 1, 1, 1, 2, '130000.00', 'C/ Herreros 25 LOCAL B', 'MADRID', 'MADRID', 2012, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 155, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6113acede700a.jpg;images/img_6113acede79e8.jpg;images/img_6113acede83cf.jpg;images/img_6113acede8cf4.jpg;images/img_6113acede9544.jpg', 1, NULL, 'Loft de  un total de 155 m², con mucha luz y vistas despejadas. La calefacción es por gas natural y el uso puede ser de vivienda. \r\nLos servicios comunes incluyen jardines cuidados en un entorno moderno con conserje y vigilancia las 24 horas.\r\nSe trata de un inmueble muy luminoso con una distribución muy funcional pensada para garantizar el confort y el bienestar de sus futuros inquilinos.', 18),
(52, 3, 1, 9, 1, 1, 7, 2, '195000.00', 'C/ Huertazo s/n', 'CAMPOHERMOSO', 'ALMERIA', 2014, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 325, 3200, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61162efd06a51.jpg;images/img_61162efd07300.jpg;images/img_61162efd07713.jpg;images/img_61162efd07b54.jpg', NULL, NULL, ' naves, invernadero y terreno en Campohermoso.   la finca cuenta con dos naves, una de ellas de unos 165m2 construidos, otra con unos 175m2 construidos, ambas con oficina,  aseo y contadores independientes de luz.   zona de almacén junto al Invernadero, el cual cuenta con unos 80m2 construidos, destinado al cultivo de hortalizas.  amplio terreno con zona de huerta, invernadero,toma de agua ', 19),
(53, 4, 1, 6, 3, 1, 2, 1, '4450.00', 'Gran Vía de Hortaleza 105', 'MADRID', 'MADRID', 1997, 1, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, 269, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6113b10592d92.jpg;images/img_6113b1059379a.jpg;images/img_6113b10593f51.jpg;images/img_6113b1059471b.jpg', NULL, NULL, 'Edificio exclusivo de oficinas, excelentes comunicaciones.\r\nAire acondicionado central.\r\nCuatro fachadas a calle.\r\nEdificio reformado.\r\nExcelente dotación de servicios en la zona\r\n• Tipo de inmueble: Ed. Exclusivo\r\n• Superficie: 269m²\r\n• Parking publico cercano: Parking en el edificio: 95 € / plaza / mes\r\n• Distribucion: Diáfana\r\n• Estado de conservacion: A estrenar\r\n• Techo: Falso techo modular con luminarias empotradas\r\n• Suelo: Suelo técnico elevado para cableado\r\n• Fibra optica\r\n• Control de acceso\r\n• Seguridad: 24 horas y control de accesos\r\n• Sistema de climatización sectorizable VRV\r\n• Certificación energética: E\r\n• Luminarias tipo LED\r\n• Excelente luminosidad natural\r\n• Fachada acristalada\r\n• Ascensores: 4\r\n• Sistema de proteccion contra incendios\r\n• Adaptado a movilidad reducida', 16),
(54, 6, 1, 7, 4, 1, 1, 2, '1200000.00', 'C/ RICO GODOY 12', 'MADRID', 'MADRID', 2018, 1, 1, 1, 1, 3, 1, 4, NULL, NULL, 1, 3, NULL, NULL, 290, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6113b366537b0.jpg;images/img_6113b36654230.jpg;images/img_6113b36654a27.jpg;images/img_6113b3665523f.jpg;images/img_6113b36655a15.jpg;images/img_6113b36656205.jpg', NULL, 1, 'La vivienda cuenta con 320 m2, de los cuales 290 son útiles y están distribuidos en 4 plantas.  En la planta baja hay un gran salón-comedor, cocina americana completamente equipada, un aseo y una pequeña terraza que da acceso al jardín de la propiedad. En la primera planta, 1 dormitorio-suite, con cuarto de baño propio y dos vestidores, además de terraza privada. También consta de otro dormitorio y cuarto de baño. La segunda planta es un solárium de 100 m2, con un excelente jacuzzi. Finalmente, nos encontramos un sótano con garaje con capacidad para dos coches y una pequeña estancia de usos múltiples.', 17),
(55, 7, 2, 10, 1, 1, 1, 2, '228000.00', 'C/ Desembarco del rey 9', 'CHICLANA', 'CADIZ', 1990, NULL, 1, NULL, NULL, 2, 1, 2, NULL, NULL, NULL, 2, NULL, NULL, 81, 80, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_611797d649089.jpg;images/img_611797d64980b.jpg;images/img_611797d649d30.jpg;images/img_611797d64a119.jpg;images/img_611797d64a50d.jpg;images/img_611797d64a8bd.jpg;images/img_611797d64ac54.jpg', NULL, 1, 'En la Primera Pista de La Playa de la Barrosa se encuentra esta fantástica vivienda a escasos metros del mar, tiene vistas al jardín común y con una orientación sur, por lo que la luz es protagonista absoluta en la vivienda.\r\nSe distribuye en planta baja en terraza con barbacoa, salón-comedor, cocina, aseo y patio trasero. En la primera planta nos encontramos con 2 dormitorios, baño y terraza.\r\ncocina reformada, ventanas PVC climalit color blanco y oscilobatientes, puertas de madera color blancas.', 20),
(56, 5, 5, 3, 1, 1, 4, 1, '750.00', 'C/ Tarongeta 4', 'CADAQUÉS', 'GIRONA', 1997, NULL, 1, NULL, 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6117a10aec175.jpg;images/img_6117a10aeccce.jpg;images/img_6117a10aed1e3.jpg;images/img_6117a10aed5ce.jpg;images/img_6117a10aed972.jpg', NULL, 1, 'Moderno y luminoso apartamento con jardín y parking.\r\nSe alquila desde Junio a Septiembre.\r\nConexión a Internet por fibra\r\nContactar por email, watsapp. llamadas solo a partir del 1 de septiembre (estoy en extrangero actualmente).', 13),
(64, 2, 1, 10, 1, 1, 1, 1, '980.00', 'C/ Sant Gervasi 21 Bajo C', 'BARCELONA', 'BARCELONA', 2007, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6124c19f8794d.jpg;images/img_6124c19f87e8b.jpg;images/img_6124c19f882ec.jpg;images/img_6124c19f887bc.jpg;images/img_6124c19f88c74.jpg', 1, NULL, 'El Loft está recién reformado con calidades altas. El Loft se compone de un salón-comedor bastante amplio con una cocina abierta. El loft es diáfano, por lo que junto al espacio del salón-comedor, pero separado con un escalón, se ubica el dormitorio, que además dispone de un vestidor al lado. Seguidamente, junto a la cocina encontramos un baño completo.\r\n\r\nLoft reformado ideal para aquellos que deseen disfrutar de una vivienda acogedora y con vistas a la ciudad.', 20),
(65, 6, 3, 2, 1, 1, 1, 1, '1000.00', 'C/ George Lucas 14', 'RIVAS-VACIAMADRID', 'MADRID', 2007, 1, 1, 1, 1, 3, 1, 4, NULL, NULL, NULL, 2, NULL, NULL, 234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6124c78c9b79c.jpg;images/img_6124c78c9bdf8.jpg;images/img_6124c78c9c2e7.jpg;images/img_6124c78c9c726.jpg;images/img_6124c78c9cb78.jpg;images/img_6124c78c9cf63.jpg', NULL, 1, 'vivienda unifamiliar de 4 dormitorios, pareados y adosados con jardín. La extensión de la parcela que tendrá viales privados ha permitido diseñar una urbanización con diferentes zonas comunes contando con piscina, pádel parque infantil, club social y zonas ajardinadas.\r\n\r\nViviendas adosadas y pareadas 4 dormitorios en 2 plantas con aparcamiento en parcela privativa hasta de 250 m2.', 12),
(66, 6, 5, 5, 1, 1, 1, 1, '850.00', 'C/ Traspalacio 23', 'VILLALBILLA', 'MADRID', 2002, 1, 1, 1, 1, 3, 1, 3, NULL, NULL, 1, 3, NULL, NULL, 171, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6124cc0532a29.jpg;images/img_6124cc0533012.jpg;images/img_6124cc053341d.jpg;images/img_6124cc053394e.jpg;images/img_6124cc0533e66.jpg', NULL, NULL, ' Te presentamos este impecable y acogedor adosado, de esquina, de 171 m2, que cuenta con 3 dormitorios mas buhardilla, 2 baños y 1 aseo, además de una gran plaza de garaje y un amplísimo trastero. La urbanización a la que pertenece es tranquila y formada por pocos vecinos. Es perfecto para que familias con niños hagan de el su nuevo hogar. Destaca por su cercanía al centro de la población y su proximidad a los principales servicios, autobuses, colegios, centro de salud, biblioteca, etc. Su distribución es la siguiente: Planta calle: cocina muy luminosa, amueblada, con campana, vitrocerámica y horno, salón con acceso a planta superior y 1 aseo. Planta primera: 3 habitaciones con amplios armarios empotrados, una de ellas en suite y 2 baños completos. Además cuenta con una bonita buhardilla decorada con techos de madera y velúx,, cerrada a la escalera donde podrás montar un cuarto de juegos, sala de cine o despacho. La calefacción es de gas natural por suelo radiante, las ventanas son abatibles de PVC y cristales climalit, los suelos de parquet y las paredes lisas.', 15),
(67, 3, 3, 8, 1, 1, 2, 2, '543800.00', 'C/ SOLANA 12', 'TORREJON DE ARDOZ', 'MADRID', 1990, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1204, 50, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6124cd67d8e4c.jpg;images/img_6124cd67d937f.jpg;images/img_6124cd67d978f.jpg;images/img_6124cd67d9bf5.jpg', NULL, NULL, 'nave industrial adosada en c/solana, en torrejón de ardoz, madrid.\r\nLa nave dispone de 1204 m2 de superficie, distribuidos en dos plantas sobre rasante.\r\nDispone de zona de oficina, baño y patio.\r\nSituada en el polígono industrial de torrejón, bien comunicada con el centro urbano.', 18),
(68, 4, 1, 1, 1, 1, 2, 2, '244900.00', 'C/ JULIAN CAMARILLO 7', 'MADRID', 'MADRID', 1991, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6124cff64fca5.jpg;images/img_6124cff65022b.jpg;images/img_6124cff6506a4.jpg;images/img_6124cff650ab7.jpg;images/img_6124cff650fc6.jpg', NULL, NULL, 'OFICINA compuesta de sala diáfana con mucha luz gracias a los ventanales de techo a suelo, cuarto de comunicaciones, dos despachos separados y cuarto de baño. Además con plaza de garaje exterior incluida en el precio. Calefacción y aire acondicionado mediante conductos, suelos de tarima flotante y buena iluminación. Se sitúa en una primera planta con ascensor. Tiene una inmejorable ubicación, en pleno parque empresarial Julián Camarillo, próximo a los juzgados de lo penal y de la Subdirección General de Gestión de Multas. En sus cercanías un Mercadona, farmacia y multitud de bares y restaurantes. Bien comunicado tanto en transporte público como privado.', 11),
(69, 8, 5, 7, 1, 1, 1, 2, '2700000.00', 'Paseo de los Lagos 1', 'POZUELO DE ALARCON', 'MADRID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 3000, 'images/img_6124d20f30a9d.jpg', NULL, NULL, 'Presentamos esta fantástica parcela de terreno urbano en la urbanización La Finca. Una parcela de 3000 m², situada en una de las mejores zonas residenciales de Pozuelo de Alarcón, situada en una urb privada por lo que la tranquilidad está asegurada. El uso residencial permitido es la construcción de una vivienda unifamiliar con las siguientes características: ocupación 18%, altura máxima 8 metros, dos plantas + bajo cubierta, con una ocupación máxima en planta de 236,03 m², volumen máximo edificable 1.888,29 m³, coeficiente de edificabilidad (m2/m2) en parcela neta de 0,44 y los retranqueos son de 10 metros a frente de calles y 5 metros a laterales y fondo.', 17),
(70, 8, 3, 5, 4, 1, 1, 2, '70000.00', 'C/ del Piú 13', 'Camarma de Esteruelas', 'MADRID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1000, 'images/img_6124d3d9ea9ce.jpg;images/img_6124d3d9eaed4.jpg;images/img_6124d3d9eb2d4.jpg', NULL, NULL, 'venta de 24 parcelas urbanizables en El Practicante, urbanización perteneciente a Camarma de Esteruelas, Madrid.\r\n\r\nParcelas de 1.000 m2 a partir de 70 mil euros más impuestos.\r\n\r\nUbicadas a 10 minutos de Espartales en Alcalá de Henares y de la A2.\r\n\r\n\r\n', 15),
(71, 5, 2, 10, 1, 1, 1, 2, '430000.00', 'C/ Viladomat 7 3C', 'BARCELONA', 'BARCELONA', 1980, 1, NULL, NULL, NULL, 2, 1, 4, 1, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_612dec529ae28.jpg;images/img_612dec529b3e3.jpg;images/img_612dec529b7b7.jpg;images/img_612dec529bb95.jpg;images/img_612dec529bf36.jpg;images/img_612dec529c2dd.jpg', NULL, 1, 'Fantástico piso de 92m² en venta ubicado en la calle Viladomat.\r\nDistribuido en salón comedor con salida a un balcón de 5m², cocina, 4 habitaciones (3 dobles), 2 baños y zona de aguas.\r\nDispone de aire acondicionado, calefacción individual de gas y carpintería exterior de aluminio. Exterior y luminoso.\r\nUbicado en una finca con servicio de conserjería.\r\nUbicado en l\'Esquerra de l\'Eixample, una zona comercial con todo tipo de servicios y muy bien comunicada por transporte público.', 20);

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
(6, 'investor33@forrastreros.com', '[\"ROLE_COMPRADOR\"]', '$2y$13$l.B1VViGY0Q.SCHxmW3vDeSlztd7XryFKyu/f5R0wo3gp92M0sFZ2', 'Rachel', 'Cors', 'Av. Menorca 33', 633336633, 3),
(7, 'kevindebruyne77@gmail.com', '[\"ROLE_COMPRADOR\"]', '$2y$13$r/BjNGnpoB/QfDn/PEDnx./wjcv8Z5HxlVJG8why0eidJA6uhT/Ga', 'Kevin', 'De Bruyne', 'C/ Paises Bajos 23', 644588933, 3),
(8, 'misterpotato55@gmail.com', '[\"ROLE_COMPRADOR\"]', '$2y$13$s8JSiQRW0ohymvuiJ6jp1./3UUF7jRRUXGNEsAwV8icYyQTfbjet2', 'Vicente', 'del Bosque', 'C/ Olivares 13', 688444222, 3),
(9, 'andresiniesta33@gmail.com', '[\"ROLE_COMPRADOR\"]', '$2y$13$1xr688Y59m9PahxlVxtaCeOrcjeoudPZMyGj4IhE.0iVn/M/Qedzi', 'Andrés', 'Iniesta', 'C/ Culés 13', 613214777, 3),
(10, 'matiasprats66@gmail.com', '[\"ROLE_COMPRADOR\"]', '$2y$13$vFHBxQJMDvwSKelTUVAaiuGl5xCqE97sKZjen3dMos3ZwS1TIu2U2', 'Matías', 'Prats', 'C/ Periodistas 13', 613444758, 3),
(11, 'tomasgutierrez11@dealer.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$8mhp6HfMBmqHCSETgJVwWOK1lHY.ovUhBChpiz5a0OdmxkZw2pQ5u', 'Tomas', 'Gutierrez', 'C/ Domus 5', 699433577, 2),
(12, 'arturofernandez22@dealer.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$SOVbTluZDPUvuvcW59Yn9OP7HNnNKhvNcGy.EAe.AWooIgGSatyg2', 'Arturo', 'Fernandez', 'C/ Oliveira 14', 633444123, 2),
(13, 'martagomez33@dealer.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$skP9U2k1RBXOXFHvXOEgP.OMwTvXh2WGJ9BfbzZ1h7kEnoyEqhAw2', 'Marta', 'Gomez', 'C/ Fontana 7', 699444588, 2),
(14, 'blancaalvarez44@dealer.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$qj3Vcjs0MJF6EKqXPCeziOamgzShEm5XX98TQlX9eWZIpEa2NuGgS', 'Blanca', 'Alvarez', 'C/ Gustavo Adolfo Becker 2', 655255455, 2),
(15, 'alabamaholding55@dealer.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$LHFdhBlyo/XfIwxU2GK0QOzQ5Y3zpF0frJnIB5RAcY0Vi1rQ6tHIu', 'Alabama Holding', 'Company', 'C/ Cartago 23', 644577255, 2),
(16, 'appletreeholding66@dealer.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$SwGAs6Gy12bBv3r8FHJ7KeIq9XIxKrSQJ01nku9C9ieCT6TFJ.kBe', 'Apple tree Holding', 'Company', 'C/ Iliria 43', 677899883, 2),
(17, 'fiveriversholding77@dealer.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$dhN8t3J2oRuldNGhfEYSbOjHR0d64gN1RuEf5le4Vsr3o8pVSTvIK', 'Five Rivers Holding', 'Company', 'C/ Númidas 44', 688998788, 2),
(18, 'jeffbrezos88@dealer.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$2yXAzS4L1mRPpbi.Cg4wjeGvw9VBydWVNHbCAKYE2xkIP4pWnGDDm', 'Jeff', 'Brezos', 'C/ Million Dollar 33', 699599199, 2),
(19, 'andreubuenavista99@dealer.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$fuYTlQ6hkfOF80F7s21nlOF3mOX.T6Q/cSL5RBgKnyfToYxj7ES3O', 'Andreu', 'Buenavista', 'C/ Buen Humor 12', 611511811, 2),
(20, 'aliciamartinez10@dealer.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$9T8.IVJ/alrbxDj/0K.0w.2owu6JPh2OoX/uBpuwqt6uyIMTcKSPu', 'Alicia', 'Martinez', 'C/ Iberos 88', 622422722, 2);

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
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `usuario_id`, `inmueble_id`, `fechaventa`, `iva`, `total`, `reserva`) VALUES
(1, 6, 49, '2021-08-21 12:27:53', 21, '4715370.00', '3000.00'),
(2, 7, 54, '2021-08-24 13:15:46', 21, '1447160.00', '4000.00'),
(3, 8, 70, '2021-08-24 13:20:16', 21, '82280.00', '2000.00'),
(4, 10, 46, '2021-08-24 13:36:48', 21, '834900.00', '5000.00');

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
  ADD KEY `IDX_476C8979871C9A1E` (`comercializacion_id`),
  ADD KEY `IDX_476C8979DB38439E` (`usuario_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `FK_476C8979AE1A5CB9` FOREIGN KEY (`uso_id`) REFERENCES `uso` (`id`),
  ADD CONSTRAINT `FK_476C8979DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

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
