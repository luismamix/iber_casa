-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2021 a las 10:35:18
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
(4, 6, 19, '500.00', '2021-08-31 13:51:34', '2021-09-05 13:51:34', '100.00'),
(5, 10, 19, '500.00', '2021-09-07 17:42:07', '2021-09-12 17:42:07', '120.00'),
(6, 22, 47, '1500.00', '2021-09-07 17:46:32', '2021-12-31 21:50:32', '400.00'),
(7, 22, 4, '6000.00', '2021-09-07 17:49:07', '2022-02-28 17:49:07', '800.00');

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
(2, 'venta'),
(3, 'subasta');

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
('DoctrineMigrations\\Version20210830094831', '2021-08-30 11:51:57', 278),
('DoctrineMigrations\\Version20210906174538', '2021-09-06 19:47:43', 333),
('DoctrineMigrations\\Version20210908162505', '2021-09-08 18:25:40', 167);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE `inmueble` (
  `id` int(11) NOT NULL,
  `tipologia_id` int(11) DEFAULT NULL,
  `cartera_id` int(11) DEFAULT NULL,
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

INSERT INTO `inmueble` (`id`, `tipologia_id`, `cartera_id`, `status1_id`, `status2_id`, `uso_id`, `comercializacion_id`, `precio`, `direccion`, `localidad`, `provincia`, `anoconstruccion`, `calefaccion`, `aireacondicionado`, `piscina`, `garaje`, `banos`, `cocina`, `dormitorios`, `ascensor`, `trastero`, `buhardilla`, `plantas`, `salas`, `porcentajeconstruido`, `m2construido`, `m2parcela`, `licactividad`, `suministroagua`, `suministroelectricidad`, `pozo`, `aperos`, `m2superficie`, `rutaimagen`, `certenergetico`, `terrazas`, `descripcion`, `usuario_id`) VALUES
(1, 4, 1, 1, 1, 2, 1, '3800.00', 'C/ Pinares 27 2ª Planta', 'MADRID', 'MADRID', 2003, 1, 1, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, 7, NULL, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_610f9cae161c1.jpg;images/img_610f9cae167e2.jpg;images/img_610f9cae16cd1.jpg', NULL, NULL, 'Oficina en entreplanta de 225 m2 con ventanas a la fachada principal. Consta de 7 salas espaciosas. Con cocina, calefacción y aire acondicionado. Está muy bien conectada porque pasan varias líneas de autobuses.', 17),
(2, 1, 6, 4, 1, 1, 2, '529000.00', 'C/ Finisterre 34', 'Sant Carles De La Rapita', 'Tarragona', 1987, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_610ed49a34fda.jpg;images/img_610ed49a355fd.jpg;images/img_610ed49a359c6.jpg', NULL, NULL, 'El edificio tiene 6 plantas y un total de 16 viviendas que ocupan los pisos superiores. La planta baja está destinada a un amplio local comercial. Cada planta tiene 3 pisos que tienen amplias terrazas y bonitas vistas. Algunos de ellos tienen vistas al mar mientras que otros disfrutan de un agradable paisaje de montaña.', 20),
(3, 2, 1, 1, 1, 2, 1, '361.00', 'C/ Fontana 23 Local B', 'SAN BLAS', 'ALICANTE', 2003, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'images/img_610ed7f9123df.jpg;images/img_610ed7f912926.jpg;images/img_610ed7f912cf6.jpg', 0, NULL, 'El local tiene 93 m² posee lic. Actividad como tienda de Alimentación. Tiene 1 baño, posee cert. energético. Es una zona que disfruta de todo tipo de servicios, con elevado tránsito de peatones, en una de las zonas comerciales de la población. Está bien comunicada mediante transporte público con el centro de la población.', 11),
(4, 3, 5, 3, 1, 2, 1, '6000.00', 'C/ Arrabales 33', 'COSLADA', 'MADRID', 2010, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 2335, 4000, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_611012c557f92.jpg;images/img_611012c5585ac.jpg;images/img_611012c5589b6.jpg', NULL, NULL, 'Nave exenta, cerrada y vallada, de 2.335m2 construidos sobre parcela de 4.000m2 en zona Ctra. Coslada, frente a Mercaliebre. Se distribuye en almacén diáfano de 2.070m2 y oficinas dotadas y equipadas en 1ª planta, con entrada independiente, 5 muelles más puertas laterales y trasera de carga y descarga. Excelentes comunicaciones.', 11),
(5, 5, 4, 1, 1, 1, 2, '209000.00', 'C/ Machupichu 13 2B', 'MADRID', 'MADRID', 1992, 1, NULL, NULL, NULL, 2, 1, 2, 1, 1, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6110f0c01fd77.jpg;images/img_6110f0c0215bd.jpg;images/img_6110f0c02240c.jpg', NULL, 1, 'Se trata de un apartamento de 59 m2, localizado en Madrid. La vivienda está distribuida en distintas estancias. Está ubicada en una zona residencial muy consolidad, muy cerca del centro de la población, en la que podemos encontrar todo tipo de servicios y comercios.', 13),
(6, 6, 5, 1, 1, 4, 1, '1550.00', 'AV. Fuerzas Armadas 33', 'MADRID', 'MADRID', 2018, 1, 1, 1, 1, 2, 1, 3, NULL, NULL, 1, 2, NULL, NULL, 240, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6110ff636ba48.jpg;images/img_6110ff636bfeb.jpg;images/img_6110ff636c3a5.jpg;images/img_6110ff636c793.jpg;images/img_6110ff636cb5c.jpg;images/img_6110ff636cf19.jpg', NULL, 1, 'Amplio adosado en zona residencial, con piscina comunitaria, zonas verdes, 3 dormitorios, dormitorio principal con baño y vestidor, 2 baños, 1 aseo, salón-comedor con chimenea y salida a terraza de 20 m2 y jardín de 100 m2, cocina amueblada y equipada con office, salón en semi-sótano de 30 m2, GARAJE para 2 vehículos, VIGILANCIA 24 h.', 15),
(7, 7, 2, 1, 1, 1, 2, '580000.00', 'C/ Mortimer 33', 'VALDEMORILLLO', 'MADRID', 1992, 1, 1, 1, 1, 4, 1, 7, NULL, NULL, NULL, 2, NULL, NULL, 451, 1870, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_611103ab30356.jpg;images/img_611103ab30978.jpg;images/img_611103ab30f02.jpg;images/img_611103ab31328.jpg;images/img_611103ab31712.jpg;images/img_611103ab31ae9.jpg;images/img_611103ab31ec6.jpg', NULL, 1, 'Magnífico chalet independiente en la reconocida urbanización Cotos de Monterrey. El chalet tiene una superficie construida de 451,58 m2 sobre una parcela de 1.870 m2, totalmente vallada en piedra y valla metálica. Dispone de 1 puerta de acceso peatonal con portero automático y 2 entradas para vehículos (automática). La parcela se encuentra totalmente ajardinada con árboles y riego automático y dispone de garaje exterior techado para 2 coches.\r\n\r\nPLANTA BAJA. - Hall de entrada. - Salón / comedor con chimenea en 2 ambientes. - Cocina comunicada con el comedor y con zona de servicio (habitación y zona de lavandería). - 2 dormitorios secundarios con vestidor. - Baño completo con bañera hidromasaje. - Dormitorio principal con baño en suite con bañera de hidromasaje y plato de ducha, vestidor y con salida a parcela. - Despacho. - Habitación de servicio con baño con ducha. - Piscina cubierta y climatizada con ducha y sauna\r\n\r\nPLANTA PRIMERA. - 3 dormitorios secundarios (2 de ellos dobles y el', 17),
(8, 8, 4, 1, 1, 1, 2, '40000.00', 'C/ cipreses 4', 'MENTRIDA', 'TOLEDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 472, 'images/img_6111053dd497e.jpg;images/img_6111053dd5369.jpg', NULL, NULL, 'Parcela de 472 m² en la urbanización Los Altos de Méntrida (Toledo) cuyas parcelas se encuentran ya prácticamente todas construidas recientemente.\r\nSituada en un fondo de saco, muy tranquila, llana, con construcciones ya realizadas en los laterales y fondo.', 11),
(9, 9, 4, 1, 2, 7, 2, '75000.00', 'C/ Lagartera s/n', 'La Campana de Oropesa', 'TOLEDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 40000, 'images/img_611106a39d86d.jpg;images/img_611106a39dde7.jpg;images/img_611106a39e244.jpg;images/img_611106a39e690.jpg', NULL, NULL, 'Finca de 4 hectáreas (finca viña del Médico).Tiene casa de 100m de 1975 para rehabilitar sin agua ni luz y 1 pozo.\r\n\r\n27198m de labor o labradío de secano\r\n3223m de olivos de secano\r\n6349m de labor o labradío de regadío\r\n3805m de olivos de secano', 19),
(10, 2, 3, 1, 3, 2, 2, '59000.00', 'C/ Albatros 33', 'BEJAR', 'SALAMANCA', 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '70.00', 140, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'images/img_61110a00c73ac.jpg;images/img_61110a00c78ef.jpg;images/img_61110a00c7ced.jpg', NULL, NULL, 'Local comercial en venta en Sahagún (León) con una superficie de 140 m². El inmueble tiene acceso a la calle por una puerta metálica y tiene una única planta diáfana. Está cerca del la zona centro de Sahagún ', 14),
(11, 2, 6, 1, 1, 2, 1, '38400.00', 'AV. Contreras 27', 'TORRE-PACHECO', 'MURCIA', 2007, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 344, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'images/img_610fa31b0f0aa.jpg;images/img_610fa31b0f5e3.jpg;images/img_610fa39ab9928.jpg', 1, NULL, 'Local en venta en Torre- Pacheco, Murcia. Dispone de Lic. Actividad comercial y Cert. Energético. A pocos metros de la Avenida de la Estación y de la Torre Campanario. Es una zona con gran densidad comercial y está rodeado de varios comercios como oficinas bancarias, restaurantes, comercios locales y farmacias.', 13),
(12, 7, 2, 4, 1, 1, 2, '498000.00', 'C/ Fontana 44', 'NAVACERRADA', 'MADRID', 2008, 1, 1, NULL, 1, 3, 1, 4, NULL, NULL, NULL, 3, NULL, NULL, 313, 1300, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6112530c6bd2e.jpg;images/img_6112530c6c28a.jpg;images/img_6112530c6c691.jpg;images/img_6112530c6ca60.jpg;images/img_6112530c6ce22.jpg;images/img_6112530c6d228.jpg', NULL, 1, 'La vivienda fue construida en 2008 sobre una parcela de mas de 1.300 m2. Actualmente la vivienda tiene 313 m2 construidos distribuidos en 3 plantas.\r\n', 18),
(13, 7, 6, 1, 1, 1, 2, '225000.00', 'C/ Castañar 33', 'VALDEMORILLLO', 'MADRID', 1995, 1, NULL, NULL, NULL, 2, 1, 4, NULL, NULL, NULL, 2, NULL, NULL, 220, 744, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_611234f0de5ca.jpg;images/img_611234f0df35e.jpg;images/img_611234f0df848.jpg', NULL, 1, 'Chalet independiente con parcela de 744m2 y vivienda de 220m2, 4 habitaciones, 2 baños, salón comedor, cocina, bodega. La vivienda se distribuye en dos plantas, en la planta principal contamos con hall de entrada, salón-comedor con chimenea, cocina independiente con salida al jardín trasero de la vivienda, en esta planta también contamos con 4 dormitorios dos de ellos con armarios empotrados y un baño que da servicio a toda la planta y amplia terraza totalmente acristalada.', 20),
(14, 7, 6, 1, 1, 1, 2, '350000.00', 'C/ Olimpo 33', 'VALDEMAQUEDA', 'MADRID', 2005, 1, 1, 1, NULL, 2, 1, 3, NULL, NULL, NULL, 2, NULL, NULL, 218, 2500, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_611236cb2a018.jpg;images/img_611236cb2a565.jpg;images/img_611236cb2a953.jpg;images/img_611236cb2ad4c.jpg', NULL, NULL, ' La vivienda tiene bomba de frio y calor. Tiene estufa de leña, carbón con conducto interno para calentar toda la vivienda,\r\nEn 2.500 metros de parcela con piscina de 45 metros aproximadamente, se ha construido este chalet de 180 metros útiles en dos plantas encontramos una vivienda con ambiente rustico que lo hace acogedor y con encanto propio.\r\n', 15),
(15, 7, 1, 1, 1, 1, 1, '890.00', 'C/ Ultramar 22', 'SANTA MARIA DE LA ALAMEDA', 'MADRID', 2002, 1, 1, 1, NULL, 1, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, 130, 700, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6112381c44425.jpg;images/img_6112381c44d15.jpg;images/img_6112381c450f6.jpg;images/img_6112381c454f0.jpg', NULL, NULL, 'Precioso chalet tipo loft de diseño minimalista. Zona muy tranquila. Magníficas vistas. Muy luminoso y espacioso. Suelo porcelánico. Calefacción por suelo radiante. Jardín independiente 700 metros. La piscina es de la comunidad de propietarios. Se alquila sólo la planta baja (que aparece en las fotografías, que tiene 130 metros cuadrados). Para una persona o pareja sin niños. No se admiten mascotas.', 16),
(16, 7, 5, 1, 1, 1, 2, '409000.00', 'C/ Sotomonte 21', 'NAVALCARNERO', 'MADRID', 2002, 1, 1, 1, 1, 3, 1, 5, NULL, NULL, NULL, 3, NULL, NULL, 444, 2541, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61123982a6e3c.jpg;images/img_61123982a739e.jpg;images/img_61123982a77ca.jpg;images/img_61123982a7c7f.jpg;images/img_61123982a8101.jpg;images/img_61123982a8533.jpg', NULL, NULL, 'Chalet de 444 m² construidos según catastro y parcela de 2541 m². Consta de tres plantas, 5 habitaciones, 3 baños, salón a doble altura con biblioteca, comedor, cocina, garaje, leñera, trastero y piscina.', 14),
(17, 7, 2, 1, 1, 1, 1, '1600.00', 'C/ Baratija 12', 'CHAPINERIA', 'MADRID', 2007, 1, 1, 1, 1, 1, 1, 4, NULL, NULL, NULL, 2, NULL, NULL, 200, 1500, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61123b6678956.jpg;images/img_61123b6678ee2.jpg;images/img_61123b66792cc.jpg;images/img_61123b66796b4.jpg;images/img_61123b6679adb.jpg', NULL, NULL, 'Precioso chalet en parcela de 1500 m2 en urbanización cerrada con vigilancia 24 horas y a tan solo 30 minutos de la capital , en un entorno privilegiado ideal para descansar del ajetreo de la ciudad.\r\nLa vivienda consta de:\r\n\r\n-2 plantas con 4 dormitorios uno principal en suite con baño completo, gran salón con chimenea y salida al jardín, cocina equipada con todos los electrodomésticos y salida a precioso porche, otro baño completo, garaje propio, gran parcela con piscina construida en 2018, preciosas vistas a la sierra, calefacción por suelo radiante con caldera de gasóleo, ventanas climalit y mágnificas calidades.', 16),
(18, 7, 5, 1, 1, 1, 2, '725000.00', 'C/ Resistance 2', 'GALAPAGAR', 'MADRID', 2009, 1, 1, 1, 1, 5, 1, 5, NULL, NULL, NULL, 3, NULL, NULL, 450, 1500, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61123ea13d2e5.jpg;images/img_61123ea13d870.jpg;images/img_61123ea13e13a.jpg;images/img_61123ea13e568.jpg;images/img_61123ea13e94c.jpg;images/img_61123ea13ed30.jpg;images/img_61123ea13f125.jpg;images/img_61123ea13f500.jpg;images/img_61123ea13f8d', NULL, 1, 'Espectacular Kasoplón de lujo, con acabados de alta calidad, jardin de escándalo con piscina. El chalet se encuentra ubicado en una posición centrada dentro de la parcela, permitiendo disponer de unas amplias zonas ajardinadas tanto en la parte frontal, como en la parte posterior. Consta de un gran salón comedor, con chimenea, y 3 grandes ventanales que acceden a un porche.  Dispone de una amplia cocina, un aseo de cortesía, y 2 habitaciones dobles, que comparten un amplio baño completo.       Espectacular terraza, con vistas al sotomonte. dispone de 2 habitaciones, con un baño completo a compartir, y una gran suite, con baño completo con hidromasaje. Garaje con capacidad para un vehículo. Si buscas algo excepcional, este es el chalet.', 15),
(19, 7, 5, 3, 1, 4, 1, '500.00', 'C/ Lagar s/n', 'ONDES', 'ASTURIAS', 1987, 1, NULL, NULL, NULL, 2, 1, 3, NULL, NULL, NULL, 2, NULL, NULL, 120, 16000, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6112430938f43.jpg;images/img_61124309394ac.jpg;images/img_611243093986c.jpg;images/img_6112430939c36.jpg;images/img_611243093a000.jpg;images/img_611243093a48a.jpg;images/img_611243093a8cd.jpg', NULL, NULL, 'Acogedora casa rural de 2 plantas con amplio salón con chimenea, rodeados de inmejorable ambiente natural. Amplio jardín con barbacoa par disfrutar de los cachopos y las sidrinas.', 11),
(20, 7, 4, 1, 2, 1, 2, '14000.00', 'C/ mercaderes 11', 'MIERES', 'ASTURIAS', 1951, NULL, NULL, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, 2, NULL, NULL, 44, 88, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_611248840d64b.jpg;images/img_611248840dbe3.jpg;images/img_611248840e3b0.jpg;images/img_611248840e7a7.jpg;images/img_611248840eb88.jpg;images/img_611248840ef49.jpg;images/img_611248840f31c.jpg', NULL, 1, 'Casa en venta en Mieres, Asturias. Tiene 88 m² distribuidos en salón comedor, cocina, 3 habitaciones, 1 baño y terraza. Tiene un agradable jardín privado y vistas a la montaña asturiana. Interior mugroso. Ideal para  una buena reforma.', 17),
(21, 7, 4, 2, 4, 1, 2, '8900.00', 'C/ Protos 11', 'RAÑAS', 'PONTEVEDRA', 2008, NULL, NULL, 1, NULL, 1, NULL, 1, NULL, NULL, NULL, 2, NULL, NULL, 36, 80, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61124bbad14f5.jpg;images/img_61124bbad1bbd.jpg;images/img_61124bbad2099.jpg;images/img_61124bbad24c3.jpg;images/img_61124bbad299b.jpg;images/img_61124bbad2dcf.jpg;images/img_61124bbad31fb.jpg', NULL, NULL, 'Casa pequeña de piedra con posibilidades. Casa en ruinas en Valongo, Cotobade, Pontevedra. Casita del S. XIX con granito de excelente calidad, piedra de cantería \"morena país\" con 38 m2 aprox distribuidos en dos plantas. Estado en ruina pero muy bien consolidada sin problemas estructurales, muros de 80 cm de grosor.\r\nDispone de un pequeño jardín delantero con un cruceiro de piedra(protegido). Zona tranquila, en la misma aldea dos bares muy recomendables y autobús diario a Pontevedra. Dispone de charca en la parte trasera.  Es ideal para hacer reforma ya que es una construcción típica gallega protegida y si lo ves y no t gusta te tomas un vinito con vieiras.', 16),
(37, 2, 1, 1, 1, 2, 1, '750.00', 'C/ Fake 13 Bajo', 'MOSTOLES', 'MADRID', 2013, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'images/img_610d0c138cd2a.jpg;images/img_610d0c138d36d.jpg;', 1, NULL, 'Local Comercial en Móstoles, Madrid. El local tiene 93 m² totalmente diáfano. Es una zona que disfruta de todo tipo de servicios, con elevado tránsito de peatones, en una de las zonas comerciales de la población. Está bien comunicada mediante transporte público con el centro de la población, así como con la capital, Madrid, por la A5.', 12),
(38, 2, 1, 1, 1, 2, 2, '225000.00', 'C/ Olivas 1', 'MOSTOLES', 'MADRID', 2002, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'images/img_610d1da619321.jpg;images/img_610d1da6198a7.jpg;images/img_610d1da619c87.jpg', 1, NULL, 'Local en venta Mostoles, Madrid. Tiene una superficie de construcción de 86 m² en varios espacios diáfanos. A pocos metros de la Avenida de la Estación y de la Torre Campanario. Es una zona con gran densidad comercial y está rodeado de varios comercios como oficinas bancarias, restaurantes, comercios locales y farmacias. Posee Lic Actividad tienda de alimentacion y cert.energético.', 17),
(39, 3, 3, 1, 1, 2, 2, '385000.00', 'C/ Fortuny 17', 'VILLAVERDE', 'MADRID', 1999, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 541, 44, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_611254f783777.jpg;images/img_611254f783cb5.jpg;images/img_611254f78408a.jpg;images/img_611254f78444d.jpg;images/img_611254f7848b3.jpg', NULL, NULL, 'NAVE distribuida en 3 plantas en calle principal. Incluye 4 plazas de aparcamiento en el precio.\r\nCuenta con 541 m2 divididos en:\r\nPlanta Baja: Almacén\r\nPlanta 1º Oficina\r\nPlanta 2º Almacén', 18),
(40, 3, 3, 1, 1, 8, 2, '70000.00', 'C/ Albercas 17', 'NAVARRETE', 'LA RIOJA', 1961, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 280, 175, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61125604af657.jpg;images/img_61125604afb9c.jpg;images/img_61125604aff70.jpg', NULL, NULL, 'En Navarrete (La Rioja) 280 m2 de naves ganaderas con patio cubierto de 175 m2. Con agua y luz.', 18),
(41, 9, 4, 1, 1, 6, 2, '46900.00', 'C/ Vegas s/n', 'NAVALCARNERO', 'MADRID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 22600, 'images/img_6112573562d43.jpg;images/img_611257356328a.jpg;images/img_611257356367f.jpg;images/img_6112573563a57.jpg', NULL, NULL, 'ESPECTACULAR PARCELA RÚSTICA.\r\nTe ofrecemos una magnífica Parcela rústica de 22.600 m2.', 19),
(42, 4, 2, 1, 1, 2, 2, '340000.00', 'C/ Tejar 11', 'ALMERIA', 'ALMERIA', 2004, 1, 1, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, 7, NULL, 331, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_610f9fc43aa9e.jpg;images/img_610f9fc43af7c.jpg;images/img_610f9fc43b340.jpg', NULL, NULL, 'Oficina en el polígono de San Onofre. 176 metros cuadrados distribuidos en varias dependencias y 2 cuartos de baño. Buen estado, exterior y con aparatos de aire acondicionado. Bien comunicado y fácil acceso por carretera.', 18),
(43, 2, 6, 1, 2, 3, 2, '41000.00', 'C/ Sant Jaume 5 Bajo', 'XIRIVELLA', 'VALENCIA', 2003, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'images/img_611250381ec99.jpg;images/img_611250381f173.jpg;images/img_611250381f509.jpg;images/img_611250381f88c.jpg', NULL, NULL, 'Local comercial en venta en Xirivella, provincia de Valencia con una superficie de 102 m². El local se distribuye en una planta con una estancia diáfana, con dos estancias diferentes y un baño completo. El local está preparado para establecer un bar - restaurante con salida de humos. Cuenta con persianas de seguridad en metal, suelos de plaqueta y cerámicos. El local se encuentra en la planta baja de un edificio de cuatro alturas. Ubicado en una zona tranquila de la localidad de Xirivella, muy próxima al Ayuntamiento local. ', 20),
(44, 5, 5, 3, 1, 1, 1, '1800.00', 'C/ TORRENT 7 3C', 'PLAYA DE SAN JUAN', 'ALICANTE', 1999, NULL, 1, 1, 1, 3, 1, 5, 1, NULL, NULL, NULL, NULL, NULL, 270, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6113996c0e301.jpg;images/img_6113996c0ee08.jpg;images/img_6113996c0f625.jpg;images/img_6113996c0fdfb.jpg;images/img_6113996c1066c.jpg;images/img_6113996c10e7c.jpg;images/img_6113996c1164f.jpg', NULL, 1, 'For rent long term, or sale. PRIME LOCATION. The House has 270mt2 expandable up to 350mt2. 5 bethrooms plus living room. 2 larges terraces and solárium. 3 bathrooms.\r\nLarge garage (capacity for 5 cars and more than 6m high). Direct access to gardens and pools from the livin room. Very bright. Beautiful views of the bay of Alicante.', 12),
(45, 6, 2, 1, 1, 4, 1, '1925.00', 'C/ Espetos 12 2A', 'ESTEPONA', 'MALAGA', 2002, NULL, 1, 1, NULL, 2, 1, 3, NULL, NULL, NULL, 2, NULL, NULL, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61139b71979c4.jpg;images/img_61139b71983ef.jpg;images/img_61139b7198bc4.jpg;images/img_61139b7199422.jpg;images/img_61139b7199dee.jpg', NULL, 1, 'Fantástico ático con fabulosas vistas sobre el mar en 1ª LINEA DE PLAYA, con un agradable jardín con dos piscinas una de ellas para niños. Completamente cerrado y muy seguro, orientado al sur, sobre maduros jardines. Ubicado entre Estepona y La Duquesa, donde encontrará toda clase de comercios y lugares de ocio.', 18),
(46, 5, 5, 4, 1, 1, 2, '741000.00', 'C/ Romescu 23 6B', 'CALVIÁ', 'BALEARES', 2003, 1, 1, 1, 1, 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61139d685349b.jpg;images/img_61139d68540d2.jpg;images/img_61139d6854a7e.jpg;images/img_61139d68553bf.jpg;images/img_61139d6855ec1.jpg;images/img_61139d685681b.jpg', NULL, 1, 'Cuenta con 61 m2 de superficie perfectamente distribuidos e iluminados. La vivienda se vende totalmente amueblada con todo lujo de detalles y cuenta con 2 habitaciones con armarios empotrados y 1 baño completo al que se accede desde ambos dormitorios. La entrada nos conduce directamente al espacio de cocina equipada, un gran módulo con mobiliario integrado abierto al salón-comedor que mira hacia fuera gracias a grandes ventanales y desde el que se sale a la terraza de 8 m2 que nos ofrece la vivienda para disfrutar de un espacio exterior íntimo y del mar.', 27),
(47, 2, 3, 3, 1, 3, 1, '1500.00', 'C/ HUERTAS 13', 'MADRID', 'MADRID', 1999, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 160, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'images/img_61139f49cd272.jpg;images/img_61139f49ce6d1.jpg;images/img_61139f49cf557.jpg', 1, NULL, 'Amplio y luminoso local de 160 m2, situado en una zona muy transitada, junto al metro Antón Martín.\r\nPlanta de entrada: Fachada de 5 metros lineales. Espacio diáfano y luminoso, con espacio para varias mesas y barra de degustación. Zona de cocina. 3 aseos.\r\nPlanta semisótano: Zona de almacenaje.\r\nEl local dispone de suelo de terrazo y gres, puerta de seguridad, salida de humos, aire acondicionado y calefacción con bomba de frío/ calor, extintores y luces de emergencia.', 16),
(48, 1, 5, 1, 1, 4, 2, '4500000.00', 'PASEO DE LA CASTELLANA 198', 'MADRID', 'MADRID', 1951, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, 2656, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6113a1cd1e301.jpg;images/img_6113a1cd1ed13.jpg;images/img_6113a1cd1f4d0.jpg;images/img_6113a1cd1fc8d.jpg;images/img_6113a1cd20419.jpg', NULL, NULL, 'Superficie construida: 2.656 m²; 924 m² bajo rasante y 1.732 m² sobre rasante.\r\n\r\nDispone de las correspondientes licencias administrativas para el ejercicio de la actividad. Tiene una clasificación de tres estrellas. En pleno rendimiento.\r\nConstruido sobre un solar de 465 metros cuadrados. Consta de planta baja, entreplanta, cinco plantas de pisos, planta ático y dos plantas de sótano.\r\n40 habitaciones (5 exteriores y 2 dando al patio de manzana, en la planta sexta hay 4 habitaciones), todas ellas con baño en suite.\r\n10 plazas de aparcamiento ubicadas en el mismo edificio.\r\nHall de acceso y recepción.\r\nEl hotel está en perfecto estado.', 18),
(49, 1, 1, 4, 1, 4, 2, '3900000.00', 'C/ Bellice 33', 'SAN SEBASTIAN', 'PAIS VASCO', 1998, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6113a47dc1a9e.jpg;images/img_6113a47dc2494.jpg;images/img_6113a47dc2c63.jpg;images/img_6113a47dc3464.jpg;images/img_6113a47dc3c8c.jpg', NULL, NULL, 'Tiene una superficie de 2.000 m² distribuidos en 8 plantas + 2 sótanos. 48 habitaciones, 24 dobles y 24 sencillas.\r\nCategoría 3 estrellas | ***', 15),
(50, 1, 1, 4, 3, 1, 3, '268000.00', 'C/ Palomeras bajas 17', 'VALLECAS', 'MADRID', 2018, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, '30.00', 162, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6113a96b7ef4b.jpg;images/img_6113a96b7f941.jpg;images/img_6113a96b800c5.jpg', NULL, NULL, 'EDIFICIO EN CONSTRUCCIÓN Venta de cuatro viviendas en edificio en construcción compuesto por un total de cinco viviendas y un local comercial. La obra actualmente se encuentra parada. Cada vivienda tiene una superficie construida de 45,30 m2. ', 17),
(51, 2, 1, 1, 1, 1, 2, '130000.00', 'C/ Herreros 25 LOCAL B', 'MADRID', 'MADRID', 2012, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 155, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6113acede700a.jpg;images/img_6113acede79e8.jpg;images/img_6113acede83cf.jpg;images/img_6113acede8cf4.jpg;images/img_6113acede9544.jpg', 1, NULL, 'Loft de  un total de 155 m², con mucha luz y vistas despejadas. La calefacción es por gas natural y el uso puede ser de vivienda. \r\nLos servicios comunes incluyen jardines cuidados en un entorno moderno con conserje y vigilancia las 24 horas.\r\nSe trata de un inmueble muy luminoso con una distribución muy funcional pensada para garantizar el confort y el bienestar de sus futuros inquilinos.', 18),
(52, 3, 1, 1, 1, 7, 2, '195000.00', 'C/ Huertazo s/n', 'CAMPOHERMOSO', 'ALMERIA', 2014, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 325, 3200, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61162efd06a51.jpg;images/img_61162efd07300.jpg;images/img_61162efd07713.jpg;images/img_61162efd07b54.jpg', NULL, NULL, ' naves, invernadero y terreno en Campohermoso.   la finca cuenta con dos naves, una de ellas de unos 165m2 construidos, otra con unos 175m2 construidos, ambas con oficina,  aseo y contadores independientes de luz.   zona de almacén junto al Invernadero, el cual cuenta con unos 80m2 construidos, destinado al cultivo de hortalizas.  amplio terreno con zona de huerta, invernadero,toma de agua ', 19),
(53, 4, 1, 3, 1, 2, 1, '4450.00', 'Gran Vía de Hortaleza 105', 'MADRID', 'MADRID', 1997, 1, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, 269, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6113b10592d92.jpg;images/img_6113b1059379a.jpg;images/img_6113b10593f51.jpg;images/img_6113b1059471b.jpg', NULL, NULL, 'Edificio exclusivo de oficinas, excelentes comunicaciones.\r\nAire acondicionado central.\r\nCuatro fachadas a calle.\r\nEdificio reformado.\r\nExcelente dotación de servicios en la zona\r\n• Tipo de inmueble: Ed. Exclusivo\r\n• Superficie: 269m²\r\n• Parking publico cercano: Parking en el edificio: 95 € / plaza / mes\r\n• Distribucion: Diáfana\r\n• Estado de conservacion: A estrenar\r\n• Techo: Falso techo modular con luminarias empotradas\r\n• Suelo: Suelo técnico elevado para cableado\r\n• Fibra optica\r\n• Control de acceso\r\n• Seguridad: 24 horas y control de accesos\r\n• Sistema de climatización sectorizable VRV\r\n• Certificación energética: E\r\n• Luminarias tipo LED\r\n• Excelente luminosidad natural\r\n• Fachada acristalada\r\n• Ascensores: 4\r\n• Sistema de proteccion contra incendios\r\n• Adaptado a movilidad reducida', 16),
(54, 6, 1, 4, 1, 1, 2, '1200000.00', 'C/ RICO GODOY 12', 'MADRID', 'MADRID', 2018, 1, 1, 1, 1, 3, 1, 4, NULL, NULL, 1, 3, NULL, NULL, 290, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6113b366537b0.jpg;images/img_6113b36654230.jpg;images/img_6113b36654a27.jpg;images/img_6113b3665523f.jpg;images/img_6113b36655a15.jpg;images/img_6113b36656205.jpg', NULL, 1, 'La vivienda cuenta con 320 m2, de los cuales 290 son útiles y están distribuidos en 4 plantas.  En la planta baja hay un gran salón-comedor, cocina americana completamente equipada, un aseo y una pequeña terraza que da acceso al jardín de la propiedad. En la primera planta, 1 dormitorio-suite, con cuarto de baño propio y dos vestidores, además de terraza privada. También consta de otro dormitorio y cuarto de baño. La segunda planta es un solárium de 100 m2, con un excelente jacuzzi. Finalmente, nos encontramos un sótano con garaje con capacidad para dos coches y una pequeña estancia de usos múltiples.', 17),
(55, 7, 2, 1, 1, 1, 2, '228000.00', 'C/ Desembarco del rey 9', 'CHICLANA', 'CADIZ', 1990, NULL, 1, NULL, NULL, 2, 1, 2, NULL, NULL, NULL, 2, NULL, NULL, 81, 80, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_611797d649089.jpg;images/img_611797d64980b.jpg;images/img_611797d649d30.jpg;images/img_611797d64a119.jpg;images/img_611797d64a50d.jpg;images/img_611797d64a8bd.jpg;images/img_611797d64ac54.jpg', NULL, 1, 'En la Primera Pista de La Playa de la Barrosa se encuentra esta fantástica vivienda a escasos metros del mar, tiene vistas al jardín común y con una orientación sur, por lo que la luz es protagonista absoluta en la vivienda.\r\nSe distribuye en planta baja en terraza con barbacoa, salón-comedor, cocina, aseo y patio trasero. En la primera planta nos encontramos con 2 dormitorios, baño y terraza.\r\ncocina reformada, ventanas PVC climalit color blanco y oscilobatientes, puertas de madera color blancas.', 20),
(56, 5, 5, 1, 1, 4, 1, '750.00', 'C/ Tarongeta 4', 'CADAQUÉS', 'GIRONA', 1997, NULL, 1, NULL, 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6117a10aec175.jpg;images/img_6117a10aeccce.jpg;images/img_6117a10aed1e3.jpg;images/img_6117a10aed5ce.jpg;images/img_6117a10aed972.jpg', NULL, 1, 'Moderno y luminoso apartamento con jardín y parking.\r\nSe alquila desde Junio a Septiembre.\r\nConexión a Internet por fibra\r\nContactar por email, watsapp. llamadas solo a partir del 1 de septiembre (estoy en extrangero actualmente).', 13),
(64, 2, 1, 1, 1, 1, 1, '980.00', 'C/ Sant Gervasi 21 Bajo C', 'BARCELONA', 'BARCELONA', 2007, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6124c19f8794d.jpg;images/img_6124c19f87e8b.jpg;images/img_6124c19f882ec.jpg;images/img_6124c19f887bc.jpg;images/img_6124c19f88c74.jpg', 1, NULL, 'El Loft está recién reformado con calidades altas. El Loft se compone de un salón-comedor bastante amplio con una cocina abierta. El loft es diáfano, por lo que junto al espacio del salón-comedor, pero separado con un escalón, se ubica el dormitorio, que además dispone de un vestidor al lado. Seguidamente, junto a la cocina encontramos un baño completo.\r\n\r\nLoft reformado ideal para aquellos que deseen disfrutar de una vivienda acogedora y con vistas a la ciudad.', 20),
(65, 6, 3, 1, 1, 1, 1, '1000.00', 'C/ George Lucas 14', 'RIVAS-VACIAMADRID', 'MADRID', 2007, 1, 1, 1, 1, 3, 1, 4, NULL, NULL, NULL, 2, NULL, NULL, 234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6124c78c9b79c.jpg;images/img_6124c78c9bdf8.jpg;images/img_6124c78c9c2e7.jpg;images/img_6124c78c9c726.jpg;images/img_6124c78c9cb78.jpg;images/img_6124c78c9cf63.jpg', NULL, 1, 'vivienda unifamiliar de 4 dormitorios, pareados y adosados con jardín. La extensión de la parcela que tendrá viales privados ha permitido diseñar una urbanización con diferentes zonas comunes contando con piscina, pádel parque infantil, club social y zonas ajardinadas.\r\n\r\nViviendas adosadas y pareadas 4 dormitorios en 2 plantas con aparcamiento en parcela privativa hasta de 250 m2.', 12),
(66, 6, 5, 1, 1, 1, 1, '850.00', 'C/ Traspalacio 23', 'VILLALBILLA', 'MADRID', 2002, 1, 1, 1, 1, 3, 1, 3, NULL, NULL, 1, 3, NULL, NULL, 171, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6124cc0532a29.jpg;images/img_6124cc0533012.jpg;images/img_6124cc053341d.jpg;images/img_6124cc053394e.jpg;images/img_6124cc0533e66.jpg', NULL, NULL, ' Te presentamos este impecable y acogedor adosado, de esquina, de 171 m2, que cuenta con 3 dormitorios mas buhardilla, 2 baños y 1 aseo, además de una gran plaza de garaje y un amplísimo trastero. La urbanización a la que pertenece es tranquila y formada por pocos vecinos. Es perfecto para que familias con niños hagan de el su nuevo hogar. Destaca por su cercanía al centro de la población y su proximidad a los principales servicios, autobuses, colegios, centro de salud, biblioteca, etc. Su distribución es la siguiente: Planta calle: cocina muy luminosa, amueblada, con campana, vitrocerámica y horno, salón con acceso a planta superior y 1 aseo. Planta primera: 3 habitaciones con amplios armarios empotrados, una de ellas en suite y 2 baños completos. Además cuenta con una bonita buhardilla decorada con techos de madera y velúx,, cerrada a la escalera donde podrás montar un cuarto de juegos, sala de cine o despacho. La calefacción es de gas natural por suelo radiante, las ventanas son abatibles de PVC y cristales climalit, los suelos de parquet y las paredes lisas.', 15),
(67, 3, 3, 1, 1, 2, 2, '543800.00', 'C/ SOLANA 12', 'TORREJON DE ARDOZ', 'MADRID', 1990, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1204, 50, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6124cd67d8e4c.jpg;images/img_6124cd67d937f.jpg;images/img_6124cd67d978f.jpg;images/img_6124cd67d9bf5.jpg', NULL, NULL, 'nave industrial adosada en c/solana, en torrejón de ardoz, madrid.\r\nLa nave dispone de 1204 m2 de superficie, distribuidos en dos plantas sobre rasante.\r\nDispone de zona de oficina, baño y patio.\r\nSituada en el polígono industrial de torrejón, bien comunicada con el centro urbano.', 18),
(68, 4, 1, 1, 1, 2, 2, '244900.00', 'C/ JULIAN CAMARILLO 7', 'MADRID', 'MADRID', 1991, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6124cff64fca5.jpg;images/img_6124cff65022b.jpg;images/img_6124cff6506a4.jpg;images/img_6124cff650ab7.jpg;images/img_6124cff650fc6.jpg', NULL, NULL, 'OFICINA compuesta de sala diáfana con mucha luz gracias a los ventanales de techo a suelo, cuarto de comunicaciones, dos despachos separados y cuarto de baño. Además con plaza de garaje exterior incluida en el precio. Calefacción y aire acondicionado mediante conductos, suelos de tarima flotante y buena iluminación. Se sitúa en una primera planta con ascensor. Tiene una inmejorable ubicación, en pleno parque empresarial Julián Camarillo, próximo a los juzgados de lo penal y de la Subdirección General de Gestión de Multas. En sus cercanías un Mercadona, farmacia y multitud de bares y restaurantes. Bien comunicado tanto en transporte público como privado.', 11),
(69, 8, 5, 1, 1, 1, 2, '2700000.00', 'Paseo de los Lagos 11', 'POZUELO DE ALARCON', 'MADRID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 3000, 'images/img_6124d20f30a9d.jpg', NULL, NULL, 'Presentamos esta fantástica parcela de terreno urbano en la urbanización La Finca. Una parcela de 3000 m², situada en una de las mejores zonas residenciales de Pozuelo de Alarcón, situada en una urb privada por lo que la tranquilidad está asegurada. El uso residencial permitido es la construcción de una vivienda unifamiliar con las siguientes características: ocupación 18%, altura máxima 8 metros, dos plantas + bajo cubierta, con una ocupación máxima en planta de 236,03 m², volumen máximo edificable 1.888,29 m³, coeficiente de edificabilidad (m2/m2) en parcela neta de 0,44 y los retranqueos son de 10 metros a frente de calles y 5 metros a laterales y fondo.', 17),
(70, 8, 3, 4, 1, 1, 2, '70000.00', 'C/ del Piú 13', 'Camarma de Esteruelas', 'MADRID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1000, 'images/img_6124d3d9ea9ce.jpg;images/img_6124d3d9eaed4.jpg;images/img_6124d3d9eb2d4.jpg', NULL, NULL, 'venta de 24 parcelas urbanizables en El Practicante, urbanización perteneciente a Camarma de Esteruelas, Madrid.\r\n\r\nParcelas de 1.000 m2 a partir de 70 mil euros más impuestos.\r\n\r\nUbicadas a 10 minutos de Espartales en Alcalá de Henares y de la A2.\r\n\r\n\r\n', 15),
(71, 5, 2, 1, 1, 1, 2, '430000.00', 'C/ Viladomat 7 3C', 'BARCELONA', 'BARCELONA', 1980, 1, NULL, NULL, NULL, 2, 1, 4, 1, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_612dec529ae28.jpg;images/img_612dec529b3e3.jpg;images/img_612dec529b7b7.jpg;images/img_612dec529bb95.jpg;images/img_612dec529bf36.jpg;images/img_612dec529c2dd.jpg', NULL, 1, 'Fantástico piso de 92m² en venta ubicado en la calle Viladomat.\r\nDistribuido en salón comedor con salida a un balcón de 5m², cocina, 4 habitaciones (3 dobles), 2 baños y zona de aguas.\r\nDispone de aire acondicionado, calefacción individual de gas y carpintería exterior de aluminio. Exterior y luminoso.\r\nUbicado en una finca con servicio de conserjería.\r\nUbicado en l\'Esquerra de l\'Eixample, una zona comercial con todo tipo de servicios y muy bien comunicada por transporte público.', 20),
(73, 9, 1, 1, 1, 6, 1, '60000.00', 'C/ Eras s/n', 'ARANCON', 'SORIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 125000, 'images/img_6130e54df337e.jpg;images/img_6130e54df3ba8.jpg;images/img_6130e54df3fc4.jpg;images/img_6130e54e0024b.jpg', NULL, NULL, 'Venta de finca rústica con 12.5 hectareas de terreno potencialmente apta para proyecto de energia eolica o solar. También es apta para proyecto de granja porcina u otros usos agricolas o ganaderos. La finca esta situada a 22 km de soria capital y tiene buenos accesos desde la nacional 122 encontrandose muy próxima a la carretera. Por la finca pasa la linea eléctrica. Se encuentra a una altura de mas de 1100 metros en una zona con abundantes corrientes de aire. La forma de la finca es rectangular y tiene 1.5 km entre un extremo y otro. Se adjuntan planos.', 24),
(74, 8, 4, 4, 1, 1, 2, '1347000.00', 'Camino viejo Burgos', 'LAS CARCAVAS', 'MADRID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 763, 'images/img_6130e6ff71c42.jpg;images/img_6130e6ff72268.jpg', NULL, NULL, 'SE vende dos parcelas en la calle Camino Viejo de Burgos. Las parcelas tienen una superficie de 366 m² y 397 m².\r\nSegún los datos de la normativa urbanística la edificabilidad de cada parcela será de 0.75 m²/m², con una ocupación del 50% con dos plantas sobre rasante y posibilidad de sótano o semisótano\r\nSituado en las Cárcavas, de fácil acceso las principales vías de circunvalación: M-30, M-40 M-11, A-1. Se encuentra a 10 minutos del Aeropuerto de Barajas y de Plaza Castilla\r\nA cinco minutos andando del parque forestal de Valdebebas - Felipe VI, pocos minutos más a la ciudad deportiva del Real Madrid, varias líneas de autobuses (171, 174, 87) tren de cercanías línea C1, estación Valdebebas.\r\nServicios cercanos: Carrefour Mar de Cristal, IFEMA Recinto ferial, campo de golf de la Hinojosa, Palacio de Hielo, Corte inglés de Sanchinarro y de Campo de las Naciones. Hospitales cercanos: Ramón y Cajal, Hospital Sanchinarro y Hospital Enfermera Isabel Zendal.', 25),
(75, 6, 6, 1, 1, 1, 2, '1360000.00', 'C/ Villa Regux 23', 'LA MORALEJA', 'MADRID', 2001, 1, 1, 1, 1, 5, 1, 5, NULL, NULL, 1, 3, NULL, NULL, 308, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6130f21477e28.jpg;images/img_6130f21478349.jpg;images/img_6130f214787ff.jpg;images/img_6130f21478c5a.jpg;images/img_6130f2147903d.jpg;images/img_6130f21479405.jpg;images/img_6130f21479798.jpg', NULL, 1, 'La vivienda se distribuye en tres cómodas plantas, más sótano acondicionado. Iniciando su recorrido, tras el hall, encontramos un luminoso salón, orientado al Sur.\r\nToda esta estancia linda son su amplio jardín privado, con un magnífico cerramiento acristalado pudiendo disfrutar de un salón de verano. Cocina con office y todos los electrodomésticos.\r\n\r\nEn la primera planta se distribuyen tres generosos dormitorios y dos baños completos. Uno de los dormitorios con baño en suite. Buhardilla, actualmente la suite principal con su baño, totalmente reformado con vestidor abierto e independiente.\r\nBajo rasante obtenemos zona multifuncional, ideal para sala de TV o juegos, otro dormitorio de invitados con baño propio y garaje privado para dos vehículos.', 25),
(76, 6, 6, 4, 1, 1, 2, '499000.00', 'C/ Nogales 3', 'VILLAVICIOSA DE ODON', 'MADRID', 1989, 1, NULL, 1, 1, 4, 1, 4, NULL, NULL, 1, 4, NULL, NULL, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6130f41d4845a.jpg;images/img_6130f41d489e4.jpg;images/img_6130f41d48ea0.jpg;images/img_6130f41d492fe.jpg;images/img_6130f41d497c1.jpg;images/img_6130f41d49c27.jpg;images/img_6130f41d4a018.jpg', NULL, 1, 'Parcela 286 m² con piscina. 4 dormitorios amplios y gran salón de 39 m² con chimenea. La distribución es la siguiente:\r\n\r\nPlanta baja\r\n\r\nPorche entrada principal\r\nHall con armario\r\nSalón en 3 ambientes, con chimenea de mármol con casete; y salida al jardín posterior\r\nCocina amueblada\r\nPorche posterior con toldo y salida al jardín\r\n\r\nPlanta primera\r\n\r\nDistribuidor-escalera\r\nDormitorio 1 principal con salida a terraza, armario y baño 1 principal incorporado\r\n3 dormitorios con armario\r\nBaño 2 de mármol con ducha para dar servicio a estos dormitorios\r\n\r\nBuhardilla\r\n\r\nEstancia con ventana de velux\r\n2 Trasteros\r\nTerraza\r\n\r\nPlanta semisótano\r\n\r\nDistribuidor-escalera con armario\r\nSalón-bodega\r\nBaño con ducha\r\nCuarto de caldera\r\nGaraje con puerta automática', 25),
(77, 5, 2, 1, 1, 1, 2, '100000.00', 'C/ Grafito 1 3A', 'VILLAVERDE ALTO', 'MADRID', 1966, NULL, NULL, NULL, NULL, 1, 1, 3, 1, NULL, NULL, NULL, NULL, NULL, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6130f649ae9b1.jpg;images/img_6130f649aeef6.jpg;images/img_6130f649af340.jpg;images/img_6130f649af77d.jpg;images/img_6130f649afc47.jpg;images/img_6130f649b0032.jpg', NULL, 1, 'Piso exterior muy luminoso en calle tranquila a tres minutos andando de la Avenida Alberto Palacios y al lado del Día Market. Bien comunicado y con colegios y parque cercanos\r\nFinca rehabilitada con portal adaptado. Ascensor recién estrenado.\r\n\r\nLa vivienda cuenta con 3 habitaciones, cocina, 1 baño y una gran terraza. Los suelos son actualmente de gres. Tiene preinstalación de gas natural. La luz entra tanto por la mañana como por la tarde.\r\n', 23),
(78, 5, 4, 1, 1, 1, 2, '113000.00', 'C/ Puerta Bonita 22 3B', 'MADRID', 'MADRID', 1972, 1, NULL, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6130facaddd06.jpg;images/img_6130facade251.jpg;images/img_6130facade6c5.jpg;images/img_6130facadead8.jpg;images/img_6130facadeee9.jpg;images/img_6130facadf292.jpg', NULL, 1, 'La vivienda se encuentra para actualizar y entrar a vivir. Esta compuesto por salón comedor, 2 dormitorios, cocina independiente con tendedero, baño completo y salón con terraza, tarima en todas las estancias y acumuladores eléctricos e instalación de gas natural. es muy luminoso. La propiedad cuenta con grandes posibilidades de reforma y configuración para ajustar a tus necesidades.\r\n\r\nPerfectamente comunicada estando cerca del inmueble las paradas de metro de Abrantes, Oporto y Opañel además de diversas líneas de autobuses.', 23),
(79, 4, 1, 1, 1, 2, 2, '275000.00', 'C/ MEDEA 4', 'MADRID', 'MADRID', 1990, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6130fc6240156.jpg;images/img_6130fc6240700.jpg;images/img_6130fc6240c29.jpg;images/img_6130fc624102d.jpg;images/img_6130fc62413ea.jpg', NULL, NULL, 'Oficina en venta en calle de medea, 4.\r\nDistribución mamparas.\r\nConserje y control de accesos\r\nPuerta de seguridad\r\nDetectores de incendios\r\nPuerta cortafuegos\r\nLuces de salida emergencia\r\nAgua caliente\r\nAire acondicionado de frío/calor\r\nVentanas con doble acristalamiento\r\nFalso techo', 24),
(80, 1, 1, 1, 1, 5, 1, '37000.00', 'C/ CAMPEZO 6', 'COSLADA', 'MADRID', 1989, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 4536, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61310b335346c.jpg;images/img_61310b3353adb.jpg;images/img_61310b3353efe.jpg;images/img_61310b3354361.jpg;images/img_61310b3354761.jpg;images/img_61310b3354b49.jpg;images/img_61310b3354f10.jpg;images/img_61310b3355300.jpg', NULL, NULL, 'Parcela urbana situada en el polígono \"LAS MERCEDES\" en Madrid de 6.395 m2s. de superficie. Con una edificabilidad de 12.589 m2e sobre rasante para uso industrial y de 10.072 m2e para uso dotacional o terciario. Muy cerca del nudo EISENHOWER y del aeropuerto de Barajas. Con fachada este a la calle Campezo 6 y oeste a la calle Bernedo.\r\nTiene un edificio de actividades de uso industrial con oficinas y nave anexa (posibilidad de uso dotacional o terciario), Superficie construida sobre rasante de 3.463 m2c y superficie construida bajo rasante de 1.073 m2c.\r\nAlquiler negociable, posibilidad de arrendamiento con opción a compra.', 23),
(81, 1, 5, 1, 1, 2, 1, '26500.00', 'C/ Julián Camarillo12', 'MADRID', 'MADRID', 1973, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, 4660, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61310cd9726cc.jpg;images/img_61310cd972cb8.jpg;images/img_61310cd9731cd.jpg;images/img_61310cd9736a1.jpg;images/img_61310cd973ad8.jpg;images/img_61310cd973e66.jpg', NULL, NULL, 'Descripción: edificio de oficinas de 8 plantas: 2 plantas de garaje y 6 plantas de oficinas. Excelente luz y ventilación natural en todas las fachadas.\r\nDistrito de San Blas - Barrio de Simancas. Polígono Julián Camarillo.\r\nTodas las instalaciones están canalizadas por techo técnico. Aire acondicionado independiente frio-calor con ventilación forzada y recuperación térmica en todas las plantas. Cuarto de Rack y cableado completo en el edificio.\r\nOffice completo y varios baños de señoras y caballeros por planta.\r\nÚltima actividad telemarketing con aproximadamente con más de 500 puestos de trabajo.', 25),
(82, 7, 5, 1, 1, 1, 2, '240000.00', 'c/ veinticuatro 24', 'FAKELAND', 'NEVERLAND', 2021, NULL, 1, 1, NULL, 24, 1, 24, NULL, NULL, NULL, 24, NULL, NULL, 24, 24, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_613661d59341e.jpg', NULL, 24, 'DUMMY DUMM DUM', 17),
(83, 7, 4, 4, 1, 1, 3, '28800.00', 'C/ Espinar 23', 'TRIJUEQUE', 'GUADALAJARA', 1985, NULL, NULL, NULL, NULL, 2, 1, 2, NULL, NULL, NULL, 1, NULL, NULL, 77, 254, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_6137742548dc4.jpg;images/img_613774254941d.jpg', NULL, NULL, 'Oportunidad de Inversión. La adquisición del inmueble publicitado en este anuncio se realizará exclusivamente en el marco del proceso de Subasta Judicial en el que se encuentra. Al no tratarse de una compraventa directa, el importe publicado ha de ser considerado como una orientación al precio por el cual puede adjudicarse el inmueble. Toda la información aquí publicada se encuentra disponible de manera pública en el Boletín Oficial del Estado. Casa unifamiliar localizada en Trijueque, Guadalajara. Tiene una superficie construida de 77 m2. La casa está distribuida en distintas estancias. Cuenta con 2 habitaciones y 2 cuartos de baño.', 15),
(84, 6, 4, 1, 2, 1, 3, '55600.00', 'C/ Camilo José Celá 4', 'TARANCON', 'CUENCA', 1960, NULL, NULL, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, 2, NULL, NULL, 260, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_613776804ce55.jpg;images/img_613776804d39c.jpg;images/img_613776804d7ac.jpg;images/img_613776804dbbf.jpg;images/img_613776804dfa6.jpg;images/img_613776804e380.jpg;images/img_613776804e74c.jpg', NULL, 1, 'Casa adosada en venta en Tarancon con 260 m². La vivienda está distribuida en dos plantas, y tiene un amplio salón, cocina independiente sin amueblar, 3 habitaciones, 1 baño, terraza, patio y trastero. Está entre la Calle Camilo José Cela y el Ayuntamiento del municipio. El inmueble necesita una reforma que se adapte a sus futuros compradores.', 15),
(85, 5, 4, 1, 1, 1, 3, '196000.00', 'C/ de los Morenos 11 2C', 'CHICLANA DE LA FRONTERA', 'CADIZ', 2007, NULL, NULL, NULL, NULL, 2, 1, 3, 1, NULL, NULL, NULL, NULL, NULL, 245, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61377945a9a3b.jpg;images/img_61377945aa07c.jpg;images/img_61377945aa4fd.jpg;images/img_61377945aa995.jpg', NULL, NULL, '¡OPORTUNIDAD! Piso en excelente zona de Chiclana de la Frontera, muy bien comunicado y con todos los servicios a un paso. Se distribuye en vestíbulo, distribuidor, cocina, salón, comedor, sala de estar, tres dormitorios, dos cuartos de baño, lavadero, tendedero y patio de 123,25 metros cuadrados. No se trata de una compra-venta, sino que la vivienda tiene señalada fecha muy próxima de Subasta. Su valor real es muy superior, (Valoración 379.191 Euros), pero al tratarse de una Subasta ES POSIBLE SU ADQUISICIÓN por sólo 196.000 Euros, que es el precio estimado de cierre para dicha Subasta. Se necesita disponer de todo el dinero. No es posible visitarla interiormente.', 15);
INSERT INTO `inmueble` (`id`, `tipologia_id`, `cartera_id`, `status1_id`, `status2_id`, `uso_id`, `comercializacion_id`, `precio`, `direccion`, `localidad`, `provincia`, `anoconstruccion`, `calefaccion`, `aireacondicionado`, `piscina`, `garaje`, `banos`, `cocina`, `dormitorios`, `ascensor`, `trastero`, `buhardilla`, `plantas`, `salas`, `porcentajeconstruido`, `m2construido`, `m2parcela`, `licactividad`, `suministroagua`, `suministroelectricidad`, `pozo`, `aperos`, `m2superficie`, `rutaimagen`, `certenergetico`, `terrazas`, `descripcion`, `usuario_id`) VALUES
(86, 1, 6, 1, 1, 2, 3, '150000.00', 'C/ San Roke 3', 'BILBAO', 'BILBAO', 1972, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 307, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_61377c2d6fc55.jpg;images/img_61377c2d70134.jpg;images/img_61377c2d70515.jpg;images/img_61377c2d708d1.jpg;images/img_61377c2d70c9b.jpg', NULL, NULL, 'Subasta de concurso de acreedores. Uso Comercial o Industrial. Distribución diáfana. Si no te gusta puedes ir a la bodega de la esquina y tomarte unos katxis.', 17),
(87, 8, 4, 4, 1, 1, 3, '510000.00', 'C/ Hermanos d\'Elhuyar, 1', 'HARO ', 'LA RIOJA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 2170, 'images/img_61377dfe47915.jpg;images/img_61377dfe47e74.jpg;images/img_61377dfe482f6.jpg', NULL, NULL, 'Terreno en venta en haro LA RIOJA. \r\nCalificado para residencial en altura (bloques).\r\nSuperficie mínima en venta 2.170 m².\r\nSuperficie edificable 11.871 m².', 17),
(88, 2, 1, 1, 1, 2, 3, '119000.00', 'Av. de las Mercedes LOCAL C', 'ALOVERA', 'GUADALAJARA', 2003, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 178, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_613780224e6f7.jpg;images/img_613780224ec0d.jpg;images/img_613780224f00b.jpg;images/img_613780224f3f3.jpg;images/img_613780224f7cd.jpg', 1, NULL, 'Se trata de un local prácticamente diáfano, muy bien situado en la esquina de la planta baja de una gran avenida comercial, rodeado de más locales. Perfecto para poner su negocio.\r\n\r\nTiene un tamaño ideal, con una superficie de 170m2 construidos, y el gran escaparate de esquina, así como un cuarto de baño adaptado a personas con discapacidad.', 17),
(89, 3, 6, 1, 1, 2, 3, '202000.00', 'Av. Yermo 17', 'EL EJIDO', 'ALMERIA', 2002, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 600, 150, NULL, NULL, NULL, NULL, NULL, NULL, 'images/img_613781fd7e79d.jpg;images/img_613781fd7ee15.jpg;images/img_613781fd7f3da.jpg;images/img_613781fd7f989.jpg;images/img_613781fd7fda2.jpg', NULL, NULL, 'NAVE DIVISIBLE sobre la parcela número ONCE, en término de El Ejido, paraje de los Tres Algibes, Cañada de Cortés, sobre una parcela de seiscientos diecinueve metros con sesenta y tres decímetros cuadrados; y que ocupa la totalidad de la misma, entendiéndose ésta superficie por tanto como construida. Linda: Norte, parcela número diez; Sur, Bulevar Sur-Poniente; Este, Almacén Agrícola Uniagro; y Oeste, parcela número doce.\r\n\r\nEdificación destinada a concesionario de vehículos construida sobre tres fincas registrales distintas formando parte la finca registral que se subasta del conjunto de la edificación.', 17);

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
(20, 'aliciamartinez10@dealer.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$9T8.IVJ/alrbxDj/0K.0w.2owu6JPh2OoX/uBpuwqt6uyIMTcKSPu', 'Alicia', 'Martinez', 'C/ Iberos 88', 622422722, 2),
(21, 'pericodelgado77@xn--vueltaespaa-beb.com', '[\"ROLE_COMPRADOR\"]', '$2y$13$EWJC6SDrul2IZxylrzz6suSRpfg0wQYv.hZNoMG4VsnqjfeqFK/ta', 'Pedro', 'Delgado', 'C/ Puerto de los Leones s/n', 633411533, 3),
(22, 'miguelindurain33@letourdefrance.com', '[\"ROLE_COMPRADOR\"]', '$2y$13$uVTvkTNtHQLlxnZmcrfaGukMVe/AS/vAE7QZHSGA1oh.ir4O4uef6', 'Miguel', 'Indurain', 'C/ Estafeta 7', 644533411, 3),
(23, 'granwyoming33@caigaquiencaiga.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$5ylHrMIPZNoTzERyTxGhtudOm/ECyv6TlXPzebq1QqT5eeST9rnFG', 'Jose Miguel', 'Monzon Navarro', 'C/ Benavente 33', 644744588, 2),
(24, 'jesuscalleja23@xn--montaasaltas-ehb.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$eBRy98xLuXTVg89gdpG5xe81x79e6gnzoWHpb0is0qPJrjcPPnmbK', 'Jesus', 'Calleja', 'C/ Annapurna 1', 688988388, 2),
(25, 'presifloren70@realmadrid.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$KK12G7r2UTzjCsEe6Uh9be89TeXa6cZMcq4JXAgF.Isb.I2oZhDBm', 'Florentino', 'Perez', 'Av. Concha Espina 1', 699887988, 2),
(26, 'matiasprats66@dealer.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$SkxRR/76krDH6EVfBN5MCupfKFTq.v0YfzQBpppSnsQPAe09V7RLq', 'Matías', 'Prats', 'C/ Periodistas 13', 613444758, 2),
(27, 'investor33@dealer.com', '[\"ROLE_VENDEDOR\"]', '$2y$13$U0ynWJd2Q5k8KVeF5J1daORjpDEmTc8Cv2hk8/9FBdQKVytuMzIhi', 'Rachel', 'Cors', 'Av. Menorca 33', 633336633, 2);

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
  `reserva` decimal(10,2) NOT NULL,
  `propietario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `usuario_id`, `inmueble_id`, `fechaventa`, `iva`, `total`, `reserva`, `propietario_id`) VALUES
(1, 6, 49, '2021-08-21 12:27:53', 21, '4715370.00', '3000.00', 15),
(2, 7, 54, '2021-08-24 13:15:46', 21, '1447160.00', '4000.00', 17),
(3, 8, 70, '2021-08-24 13:20:16', 21, '82280.00', '2000.00', 15),
(4, 10, 46, '2021-08-24 13:36:48', 21, '834900.00', '5000.00', 17),
(5, 3, 50, '2021-09-01 20:54:02', 21, '318230.00', '5000.00', 17),
(6, 10, 83, '2021-09-07 17:43:16', 21, '29766.00', '4200.00', 15),
(7, 10, 12, '2021-09-07 17:44:24', 21, '597498.00', '4200.00', 18),
(8, 22, 2, '2021-09-07 17:47:53', 21, '632830.00', '6000.00', 20),
(9, 22, 87, '2021-09-07 17:49:59', 21, '609840.00', '6000.00', 17),
(10, 21, 76, '2021-09-07 17:57:55', 21, '596288.00', '6200.00', 25),
(11, 7, 74, '2021-09-07 17:59:33', 21, '1593570.00', '30000.00', 25),
(12, 6, 46, '2021-09-08 17:47:40', 21, '878762.50', '3500.00', 26),
(13, 21, 46, '2021-09-08 18:53:04', 21, '890923.00', '4700.00', 27);

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
  ADD KEY `IDX_476C897963D715A2` (`status1_id`),
  ADD KEY `IDX_476C89797162BA4C` (`status2_id`),
  ADD KEY `IDX_476C8979AE1A5CB9` (`uso_id`),
  ADD KEY `IDX_476C8979871C9A1E` (`comercializacion_id`),
  ADD KEY `IDX_476C8979DB38439E` (`usuario_id`);

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
  ADD KEY `IDX_8FE7EE55932498D9` (`inmueble_id`),
  ADD KEY `IDX_8FE7EE5553C8D32C` (`propietario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cartera`
--
ALTER TABLE `cartera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `comercializacion`
--
ALTER TABLE `comercializacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  ADD CONSTRAINT `FK_8FE7EE5553C8D32C` FOREIGN KEY (`propietario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_8FE7EE55932498D9` FOREIGN KEY (`inmueble_id`) REFERENCES `inmueble` (`id`),
  ADD CONSTRAINT `FK_8FE7EE55DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
