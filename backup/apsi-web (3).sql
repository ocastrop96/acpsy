-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 18-06-2021 a las 04:49:07
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apsi-web`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_diagnosticos` ()  SELECT idDiagnostico,UPPER(CONCAT(cie10,' - ',descripcion)) as descripcion FROM `apsi_diagnosticos`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_DIAGNOSTICO_NO_SELECCIONADO` (IN `_idDiagnostico` INT(11))  SELECT idDiagnostico,UPPER(CONCAT(cie10,' - ',descripcion)) as descripcion FROM apsi_diagnosticos WHERE idDiagnostico != _idDiagnostico$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_parentesco` ()  select idParentesco,descParent from apsi_parentesco$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_profesionales` ()  SELECT idProfesional,apellidos_nombres FROM apsi_profesionales ORDER BY apellidos_nombres ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_tipoSexo` ()  SELECT * FROM apsi_tiposexo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_tipSeguimiento` ()  SELECT idTipSeg,descTipSeg FROM apsi_tipseguimiento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_seguimiento_cf` (IN `_fechaRegSeg` DATE, IN `_tipoSeguimiento` INT(11), IN `_idprofesional` INT(11), IN `_nroDocPac` TEXT, IN `_nroHisPac` TEXT, IN `_nombApPac` TEXT, IN `_tipSexPac` INT(11), IN `_edadPac` TEXT, IN `_diag1Pac` INT(11), IN `_diag2Pac` INT(11), IN `_comFamiliar` TEXT, IN `_nroDocFam` TEXT, IN `_nombApFam` TEXT, IN `_parentFam` INT(11), IN `_tipSexFam` INT(11), IN `_edadFam` TEXT, IN `_diag1Fam` INT(11), IN `_diag2Fam` INT(11))  INSERT INTO apsi_seguimiento (
	fechaRegSeg,
	tipoSeguimiento,
	idprofesional,
	nroDocPac,
	nroHisPac,
	nombApPac,
	tipSexPac,
	edadPac,
	diag1Pac,
	diag2Pac,
	comFamiliar,
	nroDocFam,
	nombApFam,
	parentFam,
	tipSexFam,
	edadFam,
	diag1Fam,
	diag2Fam 
)
VALUES
	(
		_fechaRegSeg,
		_tipoSeguimiento,
		_idprofesional,
		_nroDocPac,
		_nroHisPac,
		_nombApPac,
		_tipSexPac,
		_edadPac,
		_diag1Pac,
		_diag2Pac,
		_comFamiliar,
		_nroDocFam,
		_nombApFam,
		_parentFam,
		_tipSexFam,
		_edadFam,
		_diag1Fam,
	_diag2Fam 
	)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_seguimiento_sf` (IN `_fechaRegSeg` DATE, IN `_tipoSeguimiento` INT(11), IN `_idprofesional` INT(11), IN `_nroDocPac` TEXT, IN `_nroHisPac` TEXT, IN `_nombApPac` TEXT, IN `_tipSexPac` INT(11), IN `_edadPac` TEXT, IN `_diag1Pac` INT(11), IN `_diag2Pac` INT(11), IN `_comFamiliar` TEXT)  INSERT INTO apsi_seguimiento ( fechaRegSeg, tipoSeguimiento, idprofesional, nroDocPac, nroHisPac, nombApPac, tipSexPac, edadPac, diag1Pac, diag2Pac, comFamiliar )
VALUES
	(_fechaRegSeg,_tipoSeguimiento,_idprofesional,_nroDocPac,_nroHisPac,_nombApPac,_tipSexPac,_edadPac,_diag1Pac,_diag2Pac,_comFamiliar)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apsi_condlaboral`
--

CREATE TABLE `apsi_condlaboral` (
  `idCondicion` int(11) NOT NULL,
  `desCond` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `apsi_condlaboral`
--

INSERT INTO `apsi_condlaboral` (`idCondicion`, `desCond`) VALUES
(1, 'Nombrado'),
(2, 'CAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apsi_diagnosticos`
--

CREATE TABLE `apsi_diagnosticos` (
  `idDiagnostico` int(11) NOT NULL,
  `cie10` text COLLATE utf8_bin,
  `descripcion` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `apsi_diagnosticos`
--

INSERT INTO `apsi_diagnosticos` (`idDiagnostico`, `cie10`, `descripcion`) VALUES
(1, '99401.19', 'Consejería para el autocuidado'),
(2, 'F32.0', 'Episodio depresivo leve'),
(3, 'F41.2', 'Trastorno mixto de ansiedad y depresión'),
(4, 'F41.9', 'Trastorno de ansiedad, no especificado'),
(5, 'F43.0', 'Reacción al estrés agudo'),
(6, 'F43.1', 'Trastorno de estrés postraumático'),
(7, 'F43.2', 'Trastornos de adaptación'),
(8, 'Z65.5', 'Problemas relacionados con la exposición a desastre, guerra u otras hostilidades'),
(9, '99404', 'Consejería en Salud Mental 1'),
(10, '99404.1', 'Consejería en Salud Mental 2'),
(11, '99404.2', 'Consejería en Salud Mental 3'),
(12, 'Z63.4', 'Desaparición o muerte de miembro de la familia'),
(13, 'Z63.7', 'Problemas relacionados con otros hechos estresantes que afectan a la familia y la casa'),
(14, '99499.08', 'Teleorientación Síncrona'),
(15, '98968.1', 'Seguimiento Telefónico 1'),
(16, '98968.2', 'Seguimiento Telefónico 2'),
(17, '98968.3', 'Seguimiento Telefónico 3'),
(18, 'SCCIE', 'Seguimiento al paciente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apsi_parentesco`
--

CREATE TABLE `apsi_parentesco` (
  `idParentesco` int(11) NOT NULL,
  `descParent` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `apsi_parentesco`
--

INSERT INTO `apsi_parentesco` (`idParentesco`, `descParent`) VALUES
(1, 'PADRE'),
(2, 'MADRE'),
(3, 'HIJO(A)'),
(4, 'ABUELO(A)'),
(5, 'NIETO(A)'),
(6, 'HERMANO(A)'),
(7, 'TIO(A)'),
(8, 'SOBRINO(A)'),
(9, 'ESPOSO(A)'),
(10, 'PRIMO(A)'),
(11, 'YERNO'),
(12, 'NUERA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apsi_profesionales`
--

CREATE TABLE `apsi_profesionales` (
  `idProfesional` int(11) NOT NULL,
  `dni` text COLLATE utf8_bin,
  `cpsp` text COLLATE utf8_bin NOT NULL,
  `apellidos_nombres` text COLLATE utf8_bin,
  `fecha_nacimiento` date NOT NULL,
  `condicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `apsi_profesionales`
--

INSERT INTO `apsi_profesionales` (`idProfesional`, `dni`, `cpsp`, `apellidos_nombres`, `fecha_nacimiento`, `condicion`) VALUES
(1, '6958470', '12936', 'CORDOVA CACHAY MATILDE', '1956-10-19', 1),
(2, '9851044', '4398', 'FLORES CASTILLO IRMA', '1958-05-05', 1),
(3, '9512967', '6287', 'MORI ZUBIATE ZONIA EMPERATRÍZ', '1968-12-10', 1),
(4, '9479664', '32629', 'PABLO JARAMILLO NORMA BEATRIZ', '1969-01-29', 1),
(5, '10725238', '10444', 'RAPRI SOLANO EDSON', '1977-11-25', 1),
(6, '6781469', '7045', 'SALDAÑA CHAVEZ KELLY', '1971-07-29', 1),
(7, '6123251', '10097', 'SANCHEZ AQUINO NORMA NELIDA', '1962-08-25', 1),
(8, '10288615', '25775', 'TRUJILLO CASTILLO MIRIAM ROCÍO', '1977-11-25', 2),
(9, '7178930', '34522', 'VELASQUEZ REYES MARIA ANGELA', '1966-08-02', 1),
(10, '46624029', '21470', 'ZAVALETA LOPEZ DARNELLY JAHAIRA', '1990-11-21', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apsi_seguimiento`
--

CREATE TABLE `apsi_seguimiento` (
  `idSeguimiento` int(11) NOT NULL,
  `fechaRegSeg` date NOT NULL,
  `tipoSeguimiento` int(11) NOT NULL,
  `idprofesional` int(11) NOT NULL,
  `nroDocPac` text COLLATE utf8_bin NOT NULL,
  `nroHisPac` text COLLATE utf8_bin NOT NULL,
  `nombApPac` text COLLATE utf8_bin NOT NULL,
  `tipSexPac` int(11) NOT NULL,
  `edadPac` text COLLATE utf8_bin NOT NULL,
  `diag1Pac` int(11) NOT NULL,
  `diag2Pac` int(11) NOT NULL DEFAULT '0',
  `comFamiliar` text COLLATE utf8_bin,
  `nroDocFam` text COLLATE utf8_bin,
  `nombApFam` text COLLATE utf8_bin,
  `parentFam` int(11) NOT NULL DEFAULT '0',
  `tipSexFam` int(11) NOT NULL DEFAULT '0',
  `edadFam` text COLLATE utf8_bin,
  `diag1Fam` int(11) NOT NULL DEFAULT '0',
  `diag2Fam` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `apsi_seguimiento`
--

INSERT INTO `apsi_seguimiento` (`idSeguimiento`, `fechaRegSeg`, `tipoSeguimiento`, `idprofesional`, `nroDocPac`, `nroHisPac`, `nombApPac`, `tipSexPac`, `edadPac`, `diag1Pac`, `diag2Pac`, `comFamiliar`, `nroDocFam`, `nombApFam`, `parentFam`, `tipSexFam`, `edadFam`, `diag1Fam`, `diag2Fam`) VALUES
(1, '2021-05-14', 2, 10, '74642267', '743643', 'Luis Rodriguez Garrafa', 1, '24', 1, 0, 'SI', '06901209', 'Pilar Garrafa Sanchez', 2, 2, '61', 4, 0),
(2, '2021-05-14', 2, 1, '10743021', '1305560', 'Tony Ruiz Villegas', 1, '43', 5, 0, 'SI', '08131002', 'Joana Deyra Gonzales', 8, 2, '51', 5, 0),
(3, '2021-05-14', 2, 1, '09045878', '1336172', 'Angel Ataucusi Ludeña', 1, '55', 5, 0, 'SI', '09521648', 'Elena Ataucusi Ludeña', 6, 2, '49', 5, 0),
(4, '2021-05-14', 2, 1, '09984155', '491430', 'Ynes Rivera Yupanqui', 2, '46', 5, 0, 'SI', '72896185', 'Pamela Critina Tarmeño Rivera', 3, 2, '26', 5, 0),
(5, '2021-05-14', 2, 1, '06857535', '310793', 'Tomas Corona Castillo', 1, '79', 5, 2, 'SI', '09472422', 'Hilda Maria Coronado Huaman', 3, 2, '53', 2, 0),
(6, '2021-05-14', 2, 1, '44600766', '1335290', 'Ismael Severino Rivas', 1, '36', 5, 0, 'SI', '80014709', 'Maria Mercedes Bocanegra Rivas', 6, 2, '49', 2, 0),
(7, '2021-05-14', 2, 1, '09030560', '185789', 'Jorge Monge Muñoz', 1, '68', 5, 0, 'SI', '49739988', 'Lisett Monge Soto', 3, 2, '33', 5, 0),
(8, '2021-05-14', 2, 1, '48193734', '1335076', 'Edson Zanca Cuadro', 1, '47', 5, 0, 'SI', '4366004', 'Luis Angel Vivanco Cuadro', 6, 1, '35', 5, 0),
(9, '2021-05-14', 2, 10, '80645612', '1336254', 'Marco Isaias Alva Fano', 1, '41', 4, 0, 'SI', '40196938', 'Edith Castillo Gonzales', 9, 2, '38', 4, 0),
(10, '2021-05-14', 2, 10, '80645612', '1336254', 'Marco Isaias Alva Fano', 1, '41', 4, 0, 'SI', '40196938', 'Edith Castillo Gonzales', 9, 2, '38', 4, 0),
(11, '2021-05-14', 2, 10, '07074275', '1335335', 'Carlos Chavez Abanto', 1, '64', 1, 0, 'SI', '47221722', 'Brenda Chavez Giraldo', 3, 2, '25', 4, 0),
(12, '2021-05-14', 2, 10, '73771531', '1116030', 'Emiliana Quispe Hancco', 2, '24', 2, 0, 'SI', '01552621', 'Flora Hancco Apaza', 7, 2, '43', 4, 0),
(13, '2021-05-14', 2, 10, '10155015', '1336149', 'Pedro Collantes Carrasco', 1, '47', 4, 0, 'SI', '27746345', 'Elma Garcia Berneo', 9, 2, '38', 4, 0),
(14, '2021-05-14', 2, 10, '09479847', '1336428', 'Cesar Giron Arteaga', 1, '53', 2, 0, 'SI', '09732019', 'Hayde Jeronimo Carbajal', 9, 2, '45', 4, 0),
(15, '2021-05-14', 2, 10, '09045878', '1336177', 'Angel Ataucusi Ludeña', 1, '55', 1, 0, 'SI', '74885034', 'Daniel Urrutia Medina', 8, 1, '28', 1, 0),
(16, '2021-05-14', 2, 10, '06054839', '1335583', 'Maria Giraldo Zanabria', 2, '61', 4, 0, 'SI', '44557018', 'Carlos Chavez Giraldo', 3, 1, '33', 1, 0),
(17, '2021-05-14', 2, 10, '06823126', '1336372', 'Saul Chuima Ayala', 1, '81', 1, 0, 'SI', '09547020', 'Carmela Chuima Lardizabal', 3, 2, '49', 4, 0),
(18, '2021-05-15', 2, 8, '06712654', '1335713', 'Cristóbal Cardenio Sánchez Quiroz', 1, '64', 4, 0, 'SI', '48417368', 'Yaruxa Yerlandine Sánchez Ramos', 3, 2, '27', 4, 0),
(19, '2021-05-15', 2, 8, '03692991', '1197765', 'José Zacarías Coveñas Namuche', 1, '43', 4, 0, 'SI', '80372498', 'María Martha Imán Flores', 9, 2, '42', 1, 0),
(20, '2021-05-15', 2, 8, '09250003', '1336442', 'Juan José Sandoval Jiménez', 1, '56', 4, 0, 'SI', '43227196', 'Erick Sandoval Vargas', 3, 1, '35', 1, 0),
(21, '2021-05-15', 2, 8, '10160446', '1334569', 'Rosario Susana Juan Hilario', 2, '63', 4, 0, 'SI', '44869333', 'Blaise Pascal Berru Huaman', 3, 1, '33', 4, 0),
(22, '2021-05-15', 2, 8, '07815407', '1336381', 'Francisco  Luis Jines Bravo', 1, '64', 4, 0, 'SI', '49586292', 'Carlos Javier Marroquín Buiza', 8, 1, '41', 4, 0),
(23, '2021-05-15', 2, 8, '1336147', '06733983', 'Julio Dolores Arévalo', 1, '65', 4, 0, 'SI', '06779591', 'Raquel Francisca Dolores Arévalo', 6, 2, '63', 2, 0),
(24, '2021-05-15', 2, 8, '08750121', '1333492', 'Ines Cuello Aguilar', 2, '56', 4, 0, 'SI', '45103230', 'Andrea Nathaly Mogollón Cuello', 3, 2, '32', 1, 0),
(25, '2021-05-15', 2, 8, '10391720', '672407', 'Pedro Jacob Guerrero Bello', 1, '44', 4, 0, 'SI', '42368722', 'María Del Pilar Carhuayal Soto', 9, 2, '38', 1, 0),
(26, '2021-05-15', 2, 8, '10743021', '1305560', 'Tony Ruiz Villegas', 1, '43', 4, 0, 'SI', '08131002', 'Joana Elsa Deyra Gonzáles', 6, 2, '52', 1, 0),
(27, '2021-05-15', 2, 8, '07059841', '657021', 'Andrés Walter Aguirre Yataco', 1, '62', 4, 0, 'SI', '41773512', 'Christian Andrés Aguirre Saavedra', 3, 2, '38', 1, 0),
(28, '2021-05-15', 2, 8, '06857535', '310793', 'Tomas Coronado Castillo', 1, '79', 4, 0, 'SI', '09472422', 'Hilda María Coronado Huamsn', 3, 2, '53', 2, 0),
(29, '2021-05-15', 2, 8, '22977852', '1062807', 'Florentino Huaranga Castañeda', 1, '72', 2, 0, 'SI', '40229921', 'Raquel Corina Huaranga Castro De Nazar', 3, 2, '42', 4, 0),
(30, '2021-05-17', 2, 10, '33255282', '13366546', 'Rafael Morí Vega', 1, '67', 4, 0, 'SI', '45787628', 'Nivardo Rafael Morí Moreno', 3, 1, '31', 1, 0),
(31, '2021-05-17', 2, 10, '80187653', '1336669', 'Delia Villanueva Martinez', 2, '53', 1, 0, 'SI', '76187018', 'Junior Bartolo Villanueva', 3, 1, '26', 1, 0),
(32, '2021-05-17', 2, 10, '09360790', '1336098', 'Feliz Capcha Capcha', 1, '53', 1, 0, 'SI', '08158916', 'Marilu Tasa Loayza', 9, 2, '47', 4, 0),
(33, '2021-05-17', 2, 10, '48193253', '1336590', 'Milagros Pacheco Gutierrez', 2, '33', 4, 0, 'SI', '73442980', 'Melany Pacheco Gutierrez', 6, 2, '26', 1, 0),
(34, '2021-05-17', 2, 10, '06892165', '1336657', 'Fredy Huaranga Rojas', 1, '57', 4, 0, 'SI', '09745345', 'Carmen Rosa Cardenas Mejia', 9, 2, '50', 1, 0),
(35, '2021-05-17', 2, 10, '09978974', '607219', 'Juan Bautista Cueva', 1, '47', 4, 0, 'SI', '07739512', 'Fidel  Bautista Cueva ', 6, 1, '56', 4, 0),
(36, '2021-05-17', 2, 10, '44469369', '1336251', 'Wilber Eder Alva Martines', 1, '36', 4, 0, 'NO', '', '', 0, 0, '', 0, 0),
(37, '2021-05-17', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 0, 'SI', '72978357', 'Maria Claudia Jeanneau Espinoza', 3, 2, '20', 2, 0),
(38, '2021-05-17', 2, 10, '06894119', '733889', 'Placido Huerta Gamboa', 1, '83', 1, 0, 'SI', '09737376', 'Maria Huertas Rodriguez', 3, 2, '50', 1, 0),
(39, '2021-05-17', 2, 10, '10392437', '932359', 'Elder Piscoya Malaver', 1, '50', 4, 0, 'SI', '09028968', 'Carmen Sofia Merino Rojas', 9, 2, '54', 4, 0),
(40, '2021-05-17', 2, 10, '44600766', '1335290', 'Isrrael Severino Rivas', 1, '36', 1, 0, 'NO', '', '', 0, 0, '', 0, 0),
(41, '2021-05-17', 2, 10, '09545910', '255336', 'Angel Silva Alca', 1, '52', 4, 0, 'NO', '', '', 0, 0, '', 0, 0),
(42, '2021-05-18', 2, 1, '06902138', '262835', 'Victoria Castro Guzmán', 2, '61', 5, 0, 'SI', '43733218', 'Alcira Sánchez Castro', 3, 2, '34', 5, 0),
(43, '2021-05-18', 2, 1, '06878591', '250999', 'Nila Espinoza Huamán', 2, '55', 5, 0, 'SI', '06845974', 'Teodore Juan De Dios Cáceres', 9, 1, '60', 5, 0),
(44, '2021-05-18', 2, 1, '32889076', '1335823', 'Custodio Estrella Llanos', 1, '85', 5, 0, 'SI', '40879094', 'Angel Miguel Olarte Estrella', 8, 1, '40', 5, 0),
(45, '2021-05-18', 2, 1, '06894119', '733889', 'Plácido Huerta Gamboa', 1, '83', 5, 0, 'SI', '09537376', 'Maria Huerta Rodriguez', 3, 2, '50', 2, 5),
(46, '2021-05-18', 2, 1, '10392437', '932359', 'Elder Piscoya Malaver', 1, '50', 5, 0, 'SI', '46123673', 'Sofia Velasquez Merino', 3, 2, '31', 2, 5),
(47, '2021-05-18', 2, 1, '08750121', '1333492', 'Ines Cuello Aguilar', 2, '56', 5, 0, 'SI', '45103230', 'Andrea Mogollon Cuello', 3, 2, '32', 5, 1),
(48, '2021-05-18', 2, 1, '09017936', '437285', 'Teofilo Paulino Veliz', 1, '70', 5, 0, 'SI', '10395972', 'Elizabeth Paulino Veliz', 3, 2, '45', 5, 1),
(49, '2021-05-18', 2, 8, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 0, 'SI', '72978357', 'María Claudia Jeanneau Espinoza', 3, 2, '20', 1, 0),
(50, '2021-05-18', 2, 8, '74642267', '743643', 'Luis Rodríguez Garrafa', 1, '24', 4, 0, 'SI', '41100883', 'Miguel Josly Jara Albarracín', 6, 1, '0', 1, 0),
(51, '2021-05-18', 2, 8, '08637218', '1336714', 'Raúl Alvarado Rodriguez', 1, '60', 4, 0, 'NO', '', '', 0, 0, '', 0, 0),
(52, '2021-05-18', 2, 8, '60087845', '1336395', 'Cesar Roque Jaramillo', 1, '25', 4, 0, 'SI', '71648162', 'Jhan Carlos  Roque Jaramillo ', 6, 1, '23', 1, 0),
(53, '2021-05-18', 2, 8, '45595288', '1336633', 'Giancarlo Chávez Crisóstomo', 1, '32', 3, 0, 'SI', '06829321', 'Juana Isabel Crisóstomo Vasquez', 2, 2, '61', 1, 0),
(54, '2021-05-18', 2, 8, '80645612', '1336254', 'Marcos Isaías Alva Fano', 1, '41', 4, 0, 'SI', '40196938', 'Edith Castillo Gonzales', 9, 2, '41', 1, 0),
(55, '2021-05-18', 2, 8, '06850616', '1336386', 'Alejandro Pallin Huarcaya', 1, '70', 4, 0, 'NO', '', '', 0, 0, '', 0, 0),
(56, '2021-05-18', 2, 8, '09544910', '255336', 'Angel Ramón Silca Alva', 1, '52', 4, 0, 'SI', '45530511', 'Diana Silva Chávez', 3, 2, '32', 1, 0),
(57, '2021-05-18', 2, 8, '09017936', '437285', 'Teófilo Paulino Véliz', 1, '70', 4, 0, 'SI', '10395972', 'Elizabeth Paulino Véliz', 3, 1, '45', 1, 0),
(58, '2021-05-18', 2, 8, '32889076', '1335823', 'Custodio Estrella Llanos', 1, '85', 4, 0, 'SI', '40879074', 'Angel Miguel Olarte Estrella', 8, 1, '40', 3, 0),
(59, '2021-05-18', 2, 8, '10396972', '204522', 'Issac Calderón Argume', 1, '48', 4, 0, 'NO', '', '', 0, 0, '', 0, 0),
(60, '2021-05-19', 4, 9, '09113777', '634164', 'Vuitton Vega Telma', 2, '55', 2, 1, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(61, '2021-05-19', 4, 9, '09193811', '221448', 'Reyna Rodríguez Adelaida', 2, '61', 5, 0, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(62, '2021-05-19', 4, 9, '42510126', '846432', 'Diana Flores Huete', 2, '36', 3, 0, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(63, '2021-05-19', 2, 1, '09545910', '255336', 'Angel Ramón Silva Alca', 1, '52', 5, 0, 'SI', '45530511', 'Diana Silva Chávez', 3, 2, '32', 5, 1),
(64, '2021-05-19', 2, 1, '06933881', '1170373', 'Ygúsquiza Arias Vda De Flores', 2, '83', 5, 0, 'SI', '10744342', 'José Flores Ygúsquiza', 3, 1, '43', 5, 1),
(65, '2021-05-19', 2, 1, '09545466', '1336193', 'Ana Ramírez Lozano', 2, '51', 5, 0, 'SI', '46211854', 'Sheila Rosario Delgado Ramírez', 3, 2, '31', 5, 1),
(66, '2021-05-19', 2, 1, '06895144', '821090', 'Ismael Canales Suarez', 1, '68', 5, 0, 'SI', '41352894', 'Jackeline Canales Quezada', 3, 2, '39', 5, 1),
(67, '2021-05-19', 2, 1, '070059841', '657021', 'Aguirre Yataco Andrés', 1, '62', 5, 0, 'SI', '41773512', 'Isaias Aguirre Saavedra', 3, 1, '34', 5, 1),
(68, '2021-05-19', 2, 1, '10743021', '1305560', 'Tony Ruiz Villegas', 1, '43', 5, 0, 'SI', '08131002', 'Yoana Deira Gonzales', 6, 2, '51', 5, 1),
(69, '2021-05-19', 2, 10, '10160446', '1334569', 'Rosario Susana Huaman Hilario', 2, '63', 4, 0, 'SI', '44869333', 'Blair Berru Huaman', 3, 1, '33', 1, 0),
(70, '2021-05-19', 2, 10, '08740384', '833277', 'Juana Quispe Malca', 2, '65', 4, 0, 'NO', '', '', 0, 0, '', 0, 0),
(71, '2021-05-19', 2, 10, '32116792', '1289162', 'María Villanueva De Urquiza', 2, '69', 1, 0, 'SI', '70471656', 'Silvana Geraldine Palomino Urquiza', 5, 2, '24', 4, 0),
(72, '2021-05-19', 2, 10, '06209024', '1336041', 'Luis Arturo Zevallos Rodriguez', 1, '68', 4, 0, 'SI', '42527962', 'Rosmery Zevallos Cóndor', 3, 2, '41', 4, 0),
(73, '2021-05-19', 2, 10, '43827657', '1336457', 'Deciderio Nuñes Chachapoyas', 1, '34', 1, 0, 'SI', '45871446', 'Carmen Merino Quispe', 9, 2, '32', 1, 0),
(74, '2021-05-19', 2, 10, '92642702', '704771', 'Jimmy Paredes Espinoza', 1, '42', 1, 0, 'SI', '70295027', 'Sheyla Castillo Espinoza', 6, 2, '28', 1, 0),
(75, '2021-05-19', 2, 10, '10396972', '204522', 'Issac Calderón Argume', 1, '48', 3, 0, 'SI', '76567576', 'Jimmy Calderón Caceres', 3, 1, '25', 2, 0),
(76, '2021-05-21', 2, 10, '07171635', '1336928', 'Santos Isabel Rodríguez Hurtado', 2, '67', 13, 9, 'SI', '72804901', 'Eduwar Andrés Vera Coello', 5, 1, '20', 13, 14),
(77, '2021-05-21', 2, 10, '06244998', '1179507', 'Américo Rodríguez Canicoba', 1, '56', 4, 9, 'SI', '09742681', 'Marisol Rodríguez Canicoba', 6, 2, '49', 13, 14),
(78, '2021-05-21', 2, 10, '06829321', '169433', 'Juana Crisostomo Vasquez', 2, '61', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(79, '2021-05-21', 2, 10, '08277253', '583956', 'Julian Castro Garro', 1, '69', 13, 9, 'SI', '76865778', 'Jessi Hermosilla Majino', 3, 2, '22', 4, 14),
(80, '2021-05-21', 2, 10, '33570439', '1336918', 'Ciro Galvez Rodas', 1, '89', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(81, '2021-05-21', 2, 10, '32116792', '1289162', 'Maria Villanueva De Urquiza', 2, '69', 13, 10, 'SI', '70471656', 'Silvana Geraldine Palomino Urquiza', 5, 2, '69', 4, 15),
(82, '2021-05-21', 2, 10, '48193253', '1336590', 'Milagros Pacheco Gutierrez', 2, '33', 2, 10, 'SI', '73442980', 'Melany Pacheco Gutierrez', 6, 2, '26', 13, 15),
(83, '2021-05-21', 2, 10, '80645612', '1336254', 'Marco Isaias Alva Fano', 1, '41', 4, 10, 'SI', '40196938', 'Edith Castillo Gonzales', 9, 2, '42', 4, 15),
(84, '2021-05-21', 2, 10, '08740384', '833277', 'Juana Quispe Malca', 2, '65', 4, 10, 'SI', '47483337', 'Maria Suarez Flores', 8, 2, '29', 9, 14),
(85, '2021-05-21', 2, 10, '10155015', '1336149', 'Pedro Collantes Carrasco', 1, '47', 13, 10, 'SI', '27746345', 'Elma Garcia Berneo', 9, 2, '50', 4, 15),
(86, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(87, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(88, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(89, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(90, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(91, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(92, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(93, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(94, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(95, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(96, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(97, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(98, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(99, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(100, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(101, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(102, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(103, '2021-05-21', 2, 10, '07469035', '1219409', 'Denis Jeanneau Cornejo', 1, '51', 4, 10, 'SI', '72978357', 'Maria Claudia Jeanneau', 3, 2, '20', 2, 15),
(104, '2021-05-21', 2, 8, '22753645', '1269227', 'Esteban Nolasco Midolo', 1, '68', 9, 0, 'NO', '', '', 0, 0, '', 0, 0),
(105, '2021-05-21', 2, 8, '09477022', '96012', 'Lucy Allauca Sotelo', 2, '52', 13, 0, 'SI', '70509987', 'Lucia Estefani Moreno Allauca', 3, 2, '24', 9, 0),
(106, '2021-05-21', 2, 8, '10438710', '1336727', 'Silver Camarena Caballero', 1, '58', 4, 0, 'SI', '20055260', 'Rosa Giovanna Suárez Leiva', 3, 2, '47', 9, 0),
(107, '2021-05-21', 2, 8, '42386539', '1336147', 'Maura Diestra Flores', 2, '39', 13, 0, 'NO', '', '', 0, 0, '', 0, 0),
(108, '2021-05-21', 2, 8, '33255282', '1336560', 'Maura Diestra Flores De', 2, '39', 13, 0, 'NO', '', '', 0, 0, '', 0, 0),
(109, '2021-05-21', 2, 8, '08637118', '1336714', 'Raúl Alvarado Rodriguez', 1, '60', 4, 0, 'NO', '', '', 0, 0, '', 0, 0),
(110, '2021-05-23', 2, 8, '19546367', '1087967', 'Antonia Marcelo Esteban', 2, '64', 13, 0, 'NO', '', '', 0, 0, '', 0, 0),
(111, '2021-05-23', 2, 8, '06854425', '1239824', 'Joya Gliceria Romero Espinoza', 2, '63', 4, 0, 'SI', '45770089', 'Yenifer Gisela Segundo Romero', 3, 2, '31', 4, 0),
(112, '2021-05-23', 2, 8, '03692991', '1197765', 'José Coveñas Namuche', 1, '43', 4, 0, 'SI', '80372498', 'María Martha Imán Flores', 9, 2, '42', 13, 0),
(113, '2021-05-23', 2, 8, '06829321', '169433', 'Juana Isabel Crisóstomo Vasquez', 2, '61', 4, 0, 'SI', '0954437210', 'María Crisóstomo Vasquez', 6, 2, '52', 13, 0),
(114, '2021-05-23', 2, 8, '01042552', '1186051', 'Yolanda Luz Silva Sandoval', 2, '69', 4, 0, 'SI', '41706736', 'Fernando Castañeda Silva', 3, 1, '38', 13, 0),
(115, '2021-05-23', 2, 8, '45855221', '1336558', 'Wilbert Poclin Mendoza', 1, '33', 3, 0, 'SI', '46801078', 'Medalith Suyon Chicana', 9, 2, '29', 3, 0),
(116, '2021-05-23', 2, 8, '09971482', '1132150', 'Marco Antonio Carrillo Quiroga', 1, '48', 4, 0, 'NO', '', '', 0, 0, '', 0, 0),
(117, '2021-05-23', 2, 8, '08535587', '1336965', 'Raúl Wilfredo León Antayhua', 1, '61', 4, 0, 'NO', '', '', 0, 0, '', 0, 0),
(118, '2021-05-23', 2, 8, '09479847', '1336428', 'Cesar Girón Arteaga', 1, '53', 4, 0, 'NO', '', '', 0, 0, '', 0, 0),
(119, '2021-05-23', 2, 8, '06244998', '1179507', 'Américo Rodríguez Canicoba', 1, '56', 4, 0, 'SI', '09742681', 'Marisol Benilda Rodríguez Canicoba', 6, 2, '49', 13, 0),
(120, '2021-05-23', 2, 8, '09477022', '96012', 'Lucy Allauca Sotelo', 2, '52', 13, 0, 'NO', '', '', 0, 0, '', 0, 0),
(121, '2021-05-23', 2, 8, '09518612', '1336940', 'Enrique Alberto Díaz Bríos', 1, '52', 4, 0, 'SI', '71730262', 'Ivette Mirella Cruz Díaz', 8, 2, '29', 13, 0),
(122, '2021-05-24', 2, 10, '05349441', '1154977', 'Ofelia Sonia Pineda Izquierdo', 2, '49', 13, 9, 'SI', '71126063', 'Jazmin Sinbala Pineda', 3, 2, '23', 4, 14),
(123, '2021-05-24', 2, 10, '09479847', '1336428', 'Cesar Giron Arteaga', 1, '53', 13, 10, 'SI', '09732019', 'Hayde Jeronimo Carbajal', 9, 2, '50', 4, 15),
(124, '2021-05-24', 2, 10, '07155112', '1337051', 'Mirtha Reategui Guerra', 2, '69', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(125, '2021-05-24', 2, 10, '80187653', '1336669', 'Delia Villanueva Martinez', 2, '53', 4, 10, 'NO', '', '', 0, 0, '', 0, 0),
(126, '2021-05-24', 2, 10, '43858360', '1337007', 'Rosa Amado Guerrero', 2, '34', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(127, '2021-05-24', 2, 10, '06244998', '1179507', 'Americo Rodriguez Canicoba', 1, '56', 4, 10, 'SI', '09742681', 'Marisol Rodriguez Canicoba', 6, 2, '49', 13, 15),
(128, '2021-05-24', 2, 10, '08740384', '833277', 'Juana Quispe Malca', 2, '65', 4, 11, 'SI', '47483337', 'Maria Suarez Flores', 8, 2, '29', 4, 15),
(129, '2021-05-24', 2, 1, '80066220', '597057', 'Luis Nolasco Hilario', 1, '45', 5, 0, 'SI', '77468779', 'Gabriela Nolasco Rojas', 3, 2, '20', 5, 1),
(130, '2021-05-24', 2, 1, '46338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 5, 0, 'SI', '08578720', 'Feliz Armando Huaman Año', 9, 1, '54', 5, 12),
(131, '2021-05-24', 2, 1, '06041838', '1335749', 'Neri Ingaroca Vargas', 1, '60', 5, 0, 'SI', '46474432', 'Enrique Ingaroca Quispe', 3, 1, '31', 5, 1),
(132, '2021-05-24', 2, 1, '09730060', '86365', 'Luis Flores Lazaro', 1, '51', 5, 0, 'SI', '10396416', 'Yudit Valle Tello', 9, 2, '49', 13, 5),
(133, '2021-05-24', 2, 1, '11418077', '1335549', 'Miguel Verde Benavides', 1, '48', 5, 0, 'SI', '11422160', 'Elizabeth Verde Benabides', 6, 2, '47', 5, 13),
(134, '2021-05-24', 2, 1, '28306722', '1336679', 'Maximiliana Quispe Torres', 2, '72', 5, 0, 'SI', '41049738', 'Luis Diaz Quispe', 3, 1, '39', 5, 13),
(135, '2021-05-24', 2, 1, '42828368', '1335488', 'Karina Ychpas Vilca', 2, '36', 5, 0, 'SI', '74543242', 'isabel reyna  zapana', 8, 2, '19', 12, 5),
(136, '2021-05-24', 2, 1, '10113788', '358404', 'johnny  condori angelino', 1, '49', 5, 0, 'SI', '06784402', 'Rocio Valdivia Muñante', 9, 2, '47', 2, 1),
(137, '2021-05-24', 2, 10, '08535587', '1336965', 'Raul León Antayhua', 1, '61', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(138, '2021-05-24', 2, 10, '8732952', '1337032', 'Sol Gonzáles Paredes', 2, '57', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(139, '2021-05-24', 2, 10, '45638538', '1337015', 'Ivan Carhuaz Villareal', 1, '36', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(140, '2021-05-24', 2, 10, '08277253', '583956', 'Julián Castro Garro', 1, '69', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(141, '2021-05-24', 2, 10, '06892165', '1336657', 'Fredy Huaranga Rojas', 1, '57', 4, 10, 'NO', '', '', 0, 0, '', 0, 0),
(142, '2021-05-24', 2, 10, '10391887', '1156002', 'Percy Pampas Rojas', 1, '49', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(143, '2021-05-24', 2, 10, '10391887', '1156002', 'Percy Pampas Rojas', 1, '49', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(144, '2021-05-24', 2, 10, '10391887', '1156002', 'Percy Pampas Rojas', 1, '49', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(145, '2021-05-24', 2, 10, '10391887', '1156002', 'Percy Pampas Rojas', 1, '49', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(146, '2021-05-24', 2, 10, '43478754', '1337028', 'Juan De Dios Quispe Quinto', 1, '37', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(147, '2021-05-24', 2, 10, '43478754', '1337028', 'Juan De Dios Quispe Quinto', 1, '37', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(148, '2021-05-24', 2, 10, '43478754', '1337028', 'Juan De Dios Quispe Quinto', 1, '37', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(149, '2021-05-24', 2, 10, '43478754', '1337028', 'Juan De Dios Quispe Quinto', 1, '37', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(150, '2021-05-24', 2, 10, '43478754', '1337028', 'Juan De Dios Quispe Quinto', 1, '37', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(151, '2021-05-24', 2, 10, '43478754', '1337028', 'Juan De Dios Quispe Quinto', 1, '37', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(152, '2021-05-24', 2, 10, '43478754', '1337028', 'Juan De Dios Quispe Quinto', 1, '37', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(153, '2021-05-24', 2, 10, '43478754', '1337028', 'Juan De Dios Quispe Quinto', 1, '37', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(154, '2021-05-24', 2, 10, '43478754', '1337028', 'Juan De Dios Quispe Quinto', 1, '37', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(155, '2021-05-24', 2, 10, '43478754', '1337028', 'Juan De Dios Quispe Quinto', 1, '37', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(156, '2021-05-24', 2, 10, '43478754', '1337028', 'Juan De Dios Quispe Quinto', 1, '37', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(157, '2021-05-24', 2, 10, '43478754', '1337028', 'Juan De Dios Quispe Quinto', 1, '37', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(158, '2021-05-24', 2, 10, '43478754', '1337028', 'Juan De Dios Quispe Quinto', 1, '37', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(159, '2021-05-25', 2, 8, '45638538', '1337015', 'Juan Carhuaz Villareal', 1, '36', 4, 0, 'SI', '41343680', 'Luis Carhuaz Villareal', 6, 1, '39', 13, 0),
(160, '2021-05-25', 2, 8, '09980430', '1094254', 'Euclides Marcelo Esteban', 1, '46', 4, 0, 'SI', '40129966', 'Bertila Victoria Maji Vega', 9, 2, '42', 13, 0),
(161, '2021-05-25', 2, 8, '07515245', '1336983', 'Rossana Muñoz Ríos', 2, '55', 8, 0, 'SI', '07319523', 'Luis Miguel Mejía Terreros', 9, 1, '54', 3, 0),
(162, '2021-05-25', 2, 8, '09029081', '1336136', 'Leoncio Aguilar Gómez', 1, '65', 4, 0, 'SI', '07202889', 'Miguel Alfonso Zevallos Chávez', 8, 1, '58', 13, 0),
(163, '2021-05-25', 2, 8, '09017936', '437285', 'Teófilo Paulino Véliz', 1, '70', 4, 0, 'SI', '10395972', 'Elizabeth Paulino Véliz', 3, 2, '45', 13, 0),
(164, '2021-05-25', 2, 8, '09544910', '255336', 'Angel Ramos Silva Alca', 1, '52', 4, 0, 'SI', '45530511', 'Diana Silca Chávez', 3, 2, '32', 13, 0),
(165, '2021-05-25', 2, 8, '20548719', '1236796', 'Faustina Páucar Aguirre', 2, '90', 4, 0, 'SI', '20543457', 'Máximo De La Cruz Páucar', 3, 1, '58', 13, 0),
(166, '2021-05-25', 2, 8, '06901199', '1109647', 'Lola Pastor Boza', 2, '84', 13, 0, 'SI', '06912579', 'Eugenio Efraín Matos Pastor', 3, 1, '56', 13, 0),
(167, '2021-05-25', 2, 8, '44610904', '1337036', 'José Gonzales Orbegoso', 1, '52', 13, 0, 'SI', '00374066', 'Carlos Humberto Gonzales Orbegoso', 6, 1, '55', 13, 0),
(168, '2021-05-25', 2, 8, '19546367', '1087967', 'Antonia Marcelo Esteban', 2, '64', 13, 0, 'SI', '76593720', 'Filiam Paredes Marcelo', 3, 1, '22', 4, 0),
(169, '2021-05-25', 2, 8, '8535587', '1336965', 'Raúl Wilfredo León Antayhua', 1, '61', 4, 0, 'SI', '48448415', 'Karina Díaz Rivera', 3, 2, '29', 4, 0),
(170, '2021-05-25', 2, 8, '10396972', '204522', 'Issac Calderón Argume', 1, '48', 4, 0, 'NO', '', '', 0, 0, '', 0, 0),
(171, '2021-05-26', 2, 10, '08277253', '583956', 'Julian Castro Garro', 1, '69', 13, 11, 'SI', '76865778', 'Jesi Hermosilla Majino', 3, 2, '22', 4, 15),
(172, '2021-05-26', 2, 10, '05349441', '1154977', 'Ofelia Pineda Izquierdo', 2, '49', 13, 10, 'SI', '71126063', 'Jazmin Sinbala Pineda', 3, 2, '23', 4, 15),
(173, '2021-05-26', 2, 10, '06892165', '1336657', 'Fredy Huaranga Rojas', 1, '57', 4, 11, 'SI', '09745345', 'Carmen Rosa Cardenas Mejia', 9, 2, '50', 13, 15),
(174, '2021-05-26', 2, 10, '48193253', '1336590', 'Milagros Pacheco Gutierrez', 2, '33', 2, 11, 'SI', '73442980', 'Melany Pacheco Gutierrez', 6, 2, '26', 13, 16),
(175, '2021-05-26', 2, 10, '10391887', '1156002', 'Percy Pampas Rojas', 1, '44', 13, 10, 'SI', '40587006', 'Erika Rojas Pampas', 6, 2, '40', 4, 14),
(176, '2021-05-26', 2, 10, '09028181', '1280076', 'Macario Quisiyupanqui Tecse', 1, '81', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(177, '2021-05-26', 2, 10, '43858360', '1337007', 'Rosa Amado Guerrero', 2, '34', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(178, '2021-05-26', 2, 1, '06878591', '250999', 'Nila Espinoza Huaman', 2, '55', 5, 0, 'SI', '06845974', 'Teodoro Juan De Dios Caceres', 9, 1, '60', 5, 1),
(179, '2021-05-26', 2, 1, '0901736', '437285', 'Teofilo Paulino Veliz', 1, '70', 5, 0, 'SI', '10395972', 'Elizabeth Paulino Veliz', 3, 2, '45', 5, 13),
(180, '2021-05-26', 2, 1, '16537352', '1325123', 'Jorge Lara Cruzado', 1, '64', 5, 0, 'SI', '41665589', 'Orfelinda Lara Lozano', 3, 2, '38', 5, 13),
(181, '2021-05-26', 2, 1, '09019081', '1336136', 'Leoncio Aguilar Gomez', 1, '65', 5, 0, 'SI', '07202889', 'Miguel Cevalloz Chavez', 8, 1, '57', 5, 2),
(182, '2021-05-26', 2, 1, '09545466', '1336193', 'Ana Ramirez Lozano', 2, '51', 5, 0, 'SI', '46211854', 'Sheila Rosario Delgado Ramirez', 3, 2, '31', 5, 1),
(183, '2021-05-26', 2, 10, '08543036', '1337179', 'Manuel Jesus Jara Chacon', 1, '65', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(184, '2021-05-26', 2, 10, '06933227', '835802', 'Jorge Chavez Carpio', 1, '69', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(185, '2021-05-26', 2, 10, '8732952', '1337032', 'Sol Gonzales Paredes', 2, '57', 4, 10, 'NO', '', '', 0, 0, '', 0, 0),
(186, '2021-05-26', 2, 10, '09173481', '1337191', 'Emiliana Villa Mendoza De Liñan', 2, '54', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(187, '2021-05-26', 2, 10, '40609520', '169770', 'Maria Duran Sanchez', 2, '40', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(188, '2021-05-26', 2, 10, '01042552', '1186051', 'Yolanda Silva Sandoval', 2, '69', 13, 9, 'SI', '41706736', 'Fernando Castañeda Silva', 3, 1, '38', 13, 9),
(189, '2021-05-26', 2, 10, '33570439', '1336918', 'Ciro Galvez Rodas', 1, '89', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(190, '2021-05-27', 2, 8, '06891299', '1337235', 'Jorge Mario Aranda García', 2, '59', 4, 0, 'SI', '42044775', 'Karla Marisol Aranda Gutierrez', 3, 2, '37', 4, 0),
(191, '2021-05-27', 2, 8, '09980430', '1094254', 'Euclides Contreras Ticona', 1, '46', 4, 0, 'SI', '40129966', 'Bertila Victoria Maji Vega', 9, 2, '42', 13, 0),
(192, '2021-05-27', 2, 8, '9971482', '1132150', 'Marco Antonio Carrillo Quiroga', 1, '48', 4, 0, 'SI', '09982585', 'Lourdes Magali Carrillo Quiroga', 6, 2, '46', 4, 0),
(193, '2021-05-27', 2, 8, '45638538', '1337015', 'Juan Alex Carhuaz Villareal', 1, '36', 4, 0, 'SI', '41343680', 'Luis Carhuaz Villareal', 6, 1, '39', 13, 0),
(194, '2021-05-27', 2, 8, '06915010', '1337238', 'Julio Modesto Chávez Milla', 1, '68', 4, 0, 'SI', '41720798', 'Jackeline Moly Chávez Nuñez', 3, 2, '38', 13, 0),
(195, '2021-05-27', 2, 8, '1299409', '1299409', 'Gleidys Josefina Machado Medina', 2, '40', 13, 0, 'SI', '19737222', 'Miguel Angel Páez Páez', 9, 1, '37', 13, 0),
(196, '2021-05-27', 2, 8, '42515485', '1280961', 'Yari Julia Enríquez Espiritu', 2, '39', 13, 0, 'NO', '', '', 0, 0, '', 0, 0),
(197, '2021-05-27', 2, 8, '43858360', '137007', 'Rosa Liliana Amado Guerrero', 2, '34', 13, 0, 'NO', '', '', 0, 0, '', 0, 0),
(198, '2021-05-27', 2, 8, '07815407', '1336381', 'Francisco Luis Jines Bravo', 1, '64', 4, 0, 'SI', '44869333', 'Carlos Javier Marroquín Buiza', 8, 1, '42', 4, 0),
(199, '2021-05-27', 2, 8, '06733983', '1336147', 'Julio Dolores Arévalo', 1, '65', 4, 11, 'SI', '06779502', 'Raquel Francisca Dolores Arévalo', 6, 2, '63', 2, 10),
(200, '2021-05-27', 2, 8, '09477022', '96012', 'Lucy Allauca Sotelo', 2, '52', 13, 0, 'NO', '', '', 0, 0, '', 0, 0),
(201, '2021-05-27', 2, 8, '06863133', '235498', 'Ignacio Cucche Pérez', 1, '77', 4, 0, 'SI', '09986281', 'Nada Y Marilú Tasayco Cunyarache', 3, 2, '45', 13, 0),
(202, '2021-05-28', 2, 10, '47008110', '427787', 'Vanessa Olaya Aguilar', 2, '32', 2, 9, 'NO', '', '', 0, 0, '', 0, 0),
(203, '2021-05-28', 2, 10, '42386539', '1336560', 'Maura Diestra Flores', 2, '39', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(204, '2021-05-28', 2, 10, '06565235', '1337278', 'Margarita Rios Camarena', 2, '65', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(205, '2021-05-28', 2, 10, '03692991', '1197765', 'Jose Zacarias Coveñas Namuche', 2, '43', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(206, '2021-05-28', 2, 10, '43858360', '1337007', 'Rosa Amado Guerrero', 2, '34', 13, 11, 'SI', '42945628', 'Carlos Amado Guerrero', 6, 1, '42', 13, 14),
(207, '2021-05-28', 2, 10, '08543036', '1337179', 'Manuel Jesus Jara Chacon', 1, '65', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(208, '2021-05-28', 2, 10, '41979207', '1337220', 'Edgar David Terrones Quispe', 1, '40', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(209, '2021-05-28', 2, 10, '05349441', '1154977', 'Ofelia Sonia Pinedo Izquierdo', 2, '49', 13, 11, 'SI', '71126063', 'Jazmin Sinbala Pineda', 3, 2, '23', 4, 16),
(210, '2021-05-28', 2, 10, '06904754', '1321508', 'Javier Juarez Espinoza', 1, '54', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(211, '2021-05-28', 2, 10, '47008110', '427787', 'Vanessa Olaya Aguilar', 2, '32', 2, 9, 'SI', '47817367', 'Maricruz Mediano Arias', 6, 2, '31', 13, 14),
(212, '2021-05-28', 2, 10, '16542300', '1234651', 'Jose Fernando Oliva Villanueva', 1, '59', 4, 9, 'SI', '09026173', 'Ana Diaz Gaspar', 9, 2, '54', 13, 14),
(213, '2021-05-28', 2, 10, '09017936', '437285', 'Teofilo Paulino Veliz', 1, '70', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(214, '2021-05-28', 2, 10, '40609520', '169770', 'Maria Durand Sanchez', 2, '40', 4, 10, 'NO', '', '', 0, 0, '', 0, 0),
(215, '2021-05-28', 2, 10, '01042552', '1186051', 'Yolanda Silva Sandoval', 2, '69', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(216, '2021-05-28', 2, 10, '06933227', '835802', 'Jorge Chavez Carpio', 1, '68', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(217, '2021-05-29', 2, 8, '45638538', '1337015', 'Iván Carhuaz Villareal', 1, '36', 4, 0, 'SI', '41343680', 'Luis Carhuaz Villareal', 6, 1, '39', 13, 0),
(218, '2021-05-29', 2, 8, '6915010', '1337238', 'Julio Modesto Chávez Milla', 1, '68', 4, 10, 'SI', '41720798', 'Jackeline Moly Chávez Núñez', 3, 2, '38', 13, 15),
(219, '2021-05-29', 2, 8, '09980430', '1094254', 'Euclides Contreras Ticona', 1, '46', 4, 11, 'SI', '40129966', 'Bertila Victoria Maji Vega', 9, 2, '42', 13, 16),
(220, '2021-05-29', 2, 8, '06823126', '1336372', 'Saúl Chuima Ayala', 1, '81', 4, 9, 'SI', '09547020', 'Carmela Fiorella Chuima Lardizabsl', 3, 2, '50', 13, 15),
(221, '2021-05-29', 2, 8, '09978974', '607219', 'Juan Bautista Cueva', 1, '47', 4, 9, 'SI', '07739522', 'Fidel Antonio Bautista Cueva', 6, 1, '56', 4, 14),
(222, '2021-05-29', 2, 8, '08543086', '1337179', 'Manuel Jesús Jara Chacón', 1, '65', 4, 9, 'SI', '10289008', 'Martha Lorena Jara Salaverry', 8, 2, '44', 4, 14),
(223, '2021-05-29', 2, 8, '08086781', '328847', 'Gloria Victoria Flores Maldonado', 2, '67', 4, 9, 'SI', '42825547', 'Edson Alexander Cordova Flores', 3, 1, '37', 13, 9),
(224, '2021-05-29', 2, 8, '09971482', '1232150', 'Marco Antonio Carrillo Quiroga', 1, '48', 4, 9, 'SI', '09982585', 'Lourdes Magali Carrillo Quiroga', 6, 2, '47', 4, 15),
(225, '2021-05-29', 2, 8, '40609520', '169770', 'María Durand Sánchez', 2, '40', 13, 9, 'SI', '43238311', 'Gerdine Vanessa', 6, 2, '35', 13, 14),
(226, '2021-05-29', 2, 8, '47338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 13, 0, 'SI', '08578720', 'Félix Armando Huaman Ano', 9, 1, '56', 4, 15),
(227, '2021-05-31', 2, 10, '47008110', '427787', 'Vanessa Olaya Aguilar', 2, '32', 2, 10, 'NO', '', '', 0, 0, '', 0, 0),
(228, '2021-05-31', 2, 10, '44834427', '581016', 'Vania Gomez Orellana', 2, '33', 13, 9, 'SI', '06862275', 'Ilda Gomez Cardenas', 7, 2, '72', 4, 14),
(229, '2021-05-31', 2, 10, '10391887', '1156002', 'Percy Pampas Rojas', 1, '44', 13, 11, 'SI', '40587006', 'Erika Rojas Pampas', 6, 2, '40', 4, 15),
(230, '2021-05-31', 2, 10, '06834044', '112293', 'Maria Pacheco Cerron', 2, '65', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(231, '2021-05-31', 2, 10, '07155112', '1337051', 'Mirta Reategui Guerra', 2, '69', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(232, '2021-05-31', 2, 10, '41979207', '1337220', 'Edgar David Terrones Quispe', 1, '40', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(233, '2021-05-31', 2, 10, '06904754', '1321508', 'Javier Juarez Espinoza', 1, '54', 4, 10, 'SI', '09971890', 'Rafael Juarez Espinoza', 6, 1, '48', 13, 14),
(234, '2021-05-31', 2, 10, '42386539', '1336560', 'Maura Diestra Flores', 2, '39', 13, 10, 'SI', '07121834', 'Siriaco Vega Diestra', 9, 1, '63', 13, 14),
(235, '2021-05-31', 2, 10, '76046164', '1215322', 'Robinson Liñan Chavez', 1, '26', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(236, '2021-05-31', 2, 10, '46338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 4, 9, 'SI', '08578720', 'Felix Armando Huaman', 9, 1, '56', 4, 14),
(237, '2021-05-31', 2, 10, '06829540', '267188', 'Alejandro Cajaleon Gaspar', 1, '64', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(238, '2021-05-31', 2, 10, '48965531', '1337421', 'Florisa Poma Salazar', 2, '61', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(239, '2021-05-31', 2, 1, '47008110', '427787', 'Vanesa Olaya Aguilar', 2, '32', 5, 0, 'SI', '47877367', 'Maricruz Medrano Arias', 8, 2, '31', 5, 1),
(240, '2021-05-31', 2, 1, '06733983', '1336147', 'Julio Dolores Arevalo', 1, '65', 5, 0, 'SI', '06779501', 'Raquel Dolores Arevalo', 6, 2, '49', 5, 13),
(241, '2021-05-31', 2, 1, '09477022', '96012', 'Lucy Allauca Sotelo', 2, '52', 5, 0, 'SI', '70509987', 'Lucia Morena Allauca', 3, 2, '24', 5, 13),
(242, '2021-05-31', 2, 1, '08277253', '583956', 'Julian Castro Garro', 1, '69', 5, 0, 'SI', '76865768', 'Yeslin Hermocilla Majino', 3, 2, '25', 5, 13),
(243, '2021-05-31', 2, 1, '06849292', '1042814', 'Melgarejo Montalvo De Balmaceda', 2, '80', 5, 0, 'SI', '09747066', 'Selene Malbaceda Melgarejo', 3, 2, '49', 5, 1),
(244, '2021-05-31', 2, 1, '32889076', '1335823', 'Custodio Estrella Llanos', 1, '85', 5, 0, 'SI', '40879074', 'Angel Miguel Olarte Estrella', 8, 1, '40', 5, 1),
(245, '2021-06-01', 2, 8, '80565221', '637665', 'Editha Guevara  malhaber', 2, '55', 4, 9, 'SI', '16508098', 'Segundo Custodio Villalobos Carmona', 9, 1, '59', 13, 9),
(246, '2021-06-01', 2, 8, '31938623', '1337528', 'Luisa Salinas Alvarado', 2, '76', 4, 9, 'SI', '31939354', 'Miguel Villanueva Salinas', 3, 1, '48', 4, 14),
(247, '2021-06-01', 2, 8, '07723192', '590725', 'María Del Carmen Duffaut Guembes', 2, '54', 13, 9, 'SI', '7080471', 'Daniella Analucia Falcot Duffaut', 3, 2, '18', 13, 9),
(248, '2021-06-01', 2, 8, '09966862', '673537', 'José Carrera Meléndez', 1, '48', 13, 9, 'SI', '08159035', 'Angélica Oncoy Sánchez De Carrera', 9, 2, '47', 13, 9),
(249, '2021-06-01', 2, 8, '70564669', '1337509', 'Alexander Vallejos Corro', 1, '20', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(250, '2021-06-01', 2, 8, '09040826', '1337463', 'José Romaña Solsol', 1, '59', 4, 9, 'SI', '20160336', 'Gloria Mercedes Romaña Solsol', 6, 2, '44', 12, 9),
(251, '2021-06-01', 2, 8, '069944579', '594234', 'Justo Araoz Zuñiga', 2, '57', 4, 9, 'SI', '29559758', 'Veronica Quispe Rivera', 9, 2, '49', 4, 9),
(252, '2021-06-01', 2, 8, '01042552', '1186051', 'Yolanda Silva Sandoval', 2, '69', 4, 10, 'SI', '41706736', 'Fernando Castañeda Silva', 3, 1, '38', 13, 15),
(253, '2021-06-01', 2, 8, '33255282', '1336546', 'Rafael Mori Vega', 1, '67', 13, 10, 'SI', '45787628', 'Eduardo Rafael Mori Vega', 3, 1, '31', 13, 15),
(254, '2021-06-01', 2, 8, '06933227', '835802', 'Adolfo Jorge Chavez Carpio', 1, '69', 4, 9, 'SI', '06934704', 'Bertha Garcia Meneses', 9, 2, '67', 13, 9),
(255, '2021-06-01', 2, 8, '32889076', '1335823', 'Custodio Estrella Llanos', 1, '85', 4, 10, 'SI', '40879074', 'Angel Miguel Olarte Estrella', 8, 1, '40', 4, 15),
(256, '2021-06-02', 3, 4, '43827657', '1336457', 'Deciderio Nuñez Chachapoyas', 1, '34', 15, 1, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(257, '2021-06-02', 3, 4, '06809024', '1336041', 'LUIS ZEVALLOS  RODRIGUEZ', 1, '68', 5, 1, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(258, '2021-06-02', 3, 4, '09002214', '133617', 'Baldeon Valdez Ernestina', 2, '65', 4, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(259, '2021-06-02', 2, 10, '47008110', '427787', 'Vanessa Olaya Aguilar', 2, '32', 2, 11, 'NO', '', '', 0, 0, '', 0, 0),
(260, '2021-06-02', 2, 10, '10776254', '1337523', 'Eli Samuel Rojas Rodriguez', 1, '44', 13, 9, 'SI', '41413896', 'Elizabeth Veronica Rojas Rodriguez', 6, 2, '38', 13, 14),
(261, '2021-06-02', 2, 10, '15827636', '1337561', 'Pepe Palacios Bandan', 1, '67', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(262, '2021-06-02', 2, 10, '46338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 4, 10, 'SI', '08578720', 'Felix Armando Huaman', 9, 1, '56', 4, 15),
(263, '2021-06-02', 2, 10, '46338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 4, 10, 'SI', '08578720', 'Felix Armando Huaman', 9, 1, '56', 4, 15),
(264, '2021-06-02', 2, 10, '46338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 4, 10, 'SI', '08578720', 'Felix Armando Huaman', 9, 1, '56', 4, 15),
(265, '2021-06-02', 2, 10, '46338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 4, 10, 'SI', '08578720', 'Felix Armando Huaman', 9, 1, '56', 4, 15),
(266, '2021-06-02', 2, 10, '46338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 4, 10, 'SI', '08578720', 'Felix Armando Huaman', 9, 1, '56', 4, 15),
(267, '2021-06-02', 2, 10, '46338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 4, 10, 'SI', '08578720', 'Felix Armando Huaman', 9, 1, '56', 4, 15),
(268, '2021-06-02', 2, 10, '46338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 4, 10, 'SI', '08578720', 'Felix Armando Huaman', 9, 1, '56', 4, 15),
(269, '2021-06-02', 2, 10, '46338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 4, 10, 'SI', '08578720', 'Felix Armando Huaman', 9, 1, '56', 4, 15),
(270, '2021-06-02', 2, 10, '46338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 4, 10, 'SI', '08578720', 'Felix Armando Huaman', 9, 1, '56', 4, 15),
(271, '2021-06-02', 2, 10, '46338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 4, 10, 'SI', '08578720', 'Felix Armando Huaman', 9, 1, '56', 4, 15),
(272, '2021-06-02', 2, 10, '46338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 4, 10, 'SI', '08578720', 'Felix Armando Huaman', 9, 1, '56', 4, 15),
(273, '2021-06-02', 2, 10, '46338604', '1336188', 'Yanet Huamanccari Año', 2, '38', 4, 10, 'SI', '08578720', 'Felix Armando Huaman', 9, 1, '56', 4, 15),
(274, '2021-06-02', 2, 10, '06565235', '1337278', 'Margarita Rios Camarena', 2, '65', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(275, '2021-06-02', 2, 10, '42386539', '1336560', 'Maura Diestra Flores', 2, '39', 13, 11, 'SI', '07121834', 'Siriaco Vega Diestra', 9, 1, '63', 13, 15),
(276, '2021-06-02', 2, 10, '76046164', '1215322', 'Robinson Liñan Chavez', 1, '26', 13, 10, 'SI', '42284961', 'Luzmila Mendieta Montalvo', 9, 2, '36', 4, 14),
(277, '2021-06-02', 2, 10, '70564669', '1337509', 'Alexander  Vallejos Corro ', 1, '20', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(278, '2021-06-02', 2, 10, '07120806', '1337571', 'Maximo Perez Soria', 1, '71', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(279, '2021-06-02', 2, 10, '06933227', '835802', 'Jorge Chavez Carpio', 1, '69', 13, 11, 'NO', '', '', 0, 0, '', 0, 0),
(280, '2021-06-02', 2, 1, '45638538', '1337015', 'Iban Carhuaz Villarreal', 1, '36', 5, 0, 'SI', '10385324', 'Madai Rivera Shugluncuy', 7, 2, '45', 5, 2),
(281, '2021-06-02', 2, 1, '09040826', '1337463', 'Jose Romaña Solsol', 1, '59', 13, 0, 'SI', '10160336', 'Gloria Romaña Solsol', 6, 2, '45', 12, 2),
(282, '2021-06-02', 2, 1, '06915010', '1337238', 'Julio Chavez Milla', 1, '68', 2, 0, 'SI', '41720798', 'Jackeline Chavez Nuñez', 3, 2, '38', 5, 13),
(283, '2021-06-02', 2, 1, '40609520', '169770', 'Maria Del Rosario Duran Sanchez', 2, '40', 5, 0, 'SI', '06926380', 'Olinda Sanchez Soto', 2, 2, '59', 5, 2),
(284, '2021-06-02', 2, 1, '090789974', '607219', 'Juan Bautista Cueva', 1, '47', 5, 0, 'SI', '06739512', 'Fidel Bautista Cueva', 6, 1, '56', 13, 5),
(285, '2021-06-02', 2, 1, '06829540', '267188', 'Alejandro Cajaleon Gaspar', 1, '64', 5, 0, 'SI', '45477367', 'Olinka Cajaleon Francisco', 3, 2, '33', 5, 2),
(286, '2021-06-02', 2, 1, '48965531', '1337421', 'Florisa Poma Salazar', 2, '61', 5, 0, 'SI', '6242219722', 'Heimy Poma Salazar', 3, 2, '22', 5, 13),
(287, '2021-06-02', 3, 4, '09469023', '1311129', 'Saturnina Elenacontreras Jibaja', 2, '53', 4, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(288, '2021-06-02', 3, 4, '09469023', '1311129', 'Elena Contreras Gibaja', 2, '53', 4, 1, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(289, '2021-06-02', 3, 4, '07146387', '1311130', 'Virgilio Estrada Huarancca', 1, '60', 6, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(290, '2021-06-02', 2, 10, '10388198', '221328', 'Carmelon Alzamora Medina', 1, '60', 13, 9, 'SI', '09977909', 'Jorgina Mondragon Palomino', 9, 2, '55', 4, 14),
(291, '2021-06-02', 2, 10, '48965531', '1337421', 'Florisa Poma Salazar', 2, '61', 4, 10, 'NO', '', '', 0, 0, '', 0, 0),
(292, '2021-06-02', 2, 10, '44834427', '581016', 'Vania Gomez Orellana', 2, '33', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(293, '2021-06-02', 2, 10, '09733347', '80954', 'Rafael Alberto Chumbes Rojas', 1, '52', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(294, '2021-06-03', 3, 8, '06933227', '835802', 'Adolfo Chavez Carpio', 1, '69', 4, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(295, '2021-06-03', 3, 8, '80565221', '637665', 'Editha Guevara Malhaber', 2, '55', 4, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(296, '2021-06-03', 3, 8, '70564669', '1337509', 'Alexander Vallejos Corro', 1, '20', 13, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(297, '2021-06-03', 1, 8, '80145883', '37652', 'Beatriz Molero Raymi', 2, '50', 8, 0, 'SI', '04012887', 'Jhon Huaranga Ferrer', 9, 1, '55', 12, 14),
(298, '2021-06-03', 2, 8, '09971995', '113374', 'Margarita Ramos Saenz', 2, '47', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(299, '2021-06-03', 2, 8, '44499337', '1156483', 'Juan Rodriguez Naveda', 1, '33', 4, 9, 'SI', '70910405', 'Susan Mendez Allende', 9, 2, '30', 4, 14),
(300, '2021-06-03', 2, 8, '06904754', '1321508', 'Javier Juarez Espinoza', 1, '54', 13, 9, 'SI', '10740514', 'Uliana Ines Borda Francia', 6, 2, '43', 13, 14),
(301, '2021-06-03', 2, 8, '48965531', '1337421', 'Florisa Poma Salazar', 1, '61', 8, 0, 'SI', '70910405', 'Susan Mendez Allende', 3, 2, '30', 4, 14),
(302, '2021-06-03', 2, 8, '09040826', '1337463', 'Jose Romaña Solsol', 1, '59', 4, 10, 'SI', '10160336', 'Gloria Mercedes Romaña Solsol', 9, 2, '44', 13, 15),
(303, '2021-06-03', 2, 8, '07120806', '1337571', 'Maximo Perez Soria', 1, '71', 4, 9, 'SI', '46525699', 'Eleazar Perez Almomacid', 3, 1, '0', 13, 14),
(304, '2021-06-03', 2, 8, '09966862', '673537', 'Jose Carrera Melendez', 1, '48', 4, 10, 'SI', '08159035', 'Angelica Oncoy Sanchez De Carrera', 9, 2, '47', 13, 15),
(305, '2021-06-03', 2, 8, '08277253', '583956', 'Julian Castro Garro', 1, '69', 4, 9, 'SI', '76865778', 'Yesslin Hermosilla Majino', 3, 2, '25', 13, 0),
(306, '2021-06-03', 2, 8, '42386539', '1336560', 'Maura Diestra Flores', 2, '39', 6, 9, 'NO', '', '', 0, 0, '', 0, 0),
(307, '2021-06-03', 2, 8, '06829540', '267188', 'Alejandro Cajaleon Gaspar', 1, '64', 8, 0, 'SI', '45477367', 'Solinka Vanessa Cajaleon Francisco', 3, 2, '33', 4, 14),
(308, '2021-06-04', 2, 1, '10391887', '1156002', 'Percy Pampas Rojas', 1, '44', 5, 0, 'SI', '40587006', 'Ericka Rojas Pampas', 8, 2, '40', 5, 2),
(309, '2021-06-04', 2, 1, '10160446', '1334569', 'Rosario Susana Huaman Hilario', 2, '63', 5, 0, 'SI', '44869333', 'Blay Berru Huaman', 3, 1, '33', 2, 0),
(310, '2021-06-04', 2, 1, '09466931', '616802', 'Alfredo Mendoza Revilla', 1, '54', 5, 0, 'SI', '74031717', 'Anya Mendoza Rios', 3, 2, '20', 2, 5),
(311, '2021-06-04', 2, 1, '80645612', '1336254', 'Marcos Isaias Alva Fano', 1, '41', 5, 0, 'SI', '40196938', 'Edit Castillo Gonzales', 9, 2, '41', 5, 1),
(312, '2021-06-04', 2, 1, '33255282', '1336546', 'Rafael Mori Vega', 1, '67', 5, 0, 'SI', '45787628', 'Rafael Mori Moreno', 3, 1, '31', 12, 2),
(313, '2021-06-04', 2, 1, '06834044', '112293', 'Maria Teresa Pacheco Cerro', 2, '65', 5, 0, 'SI', '40243091', 'Carlos Enrrique Salazar Pacheco', 3, 1, '42', 5, 13),
(314, '2021-06-04', 2, 1, '45638538', '1337015', 'Ivan Carhuaz Villarreal', 1, '36', 5, 0, 'SI', '41343680', 'Ruiz Carhuaz Villarreal', 6, 1, '39', 5, 1),
(315, '2021-06-04', 2, 10, '15287636', '1337561', 'Pepe Palacios Bandan', 1, '67', 13, 10, 'SI', '40666313', 'Eulalia Margot Palacios Livia', 3, 2, '40', 13, 9),
(316, '2021-06-04', 2, 10, '08554136', '1337636', 'Bertha Gonzales Egusquiza', 2, '66', 4, 9, 'SI', '09478189', 'Anibal Lozano Rojas', 9, 1, '55', 13, 9),
(317, '2021-06-04', 2, 10, '06880338', '713937', 'Segundo De La Cruz Avila', 1, '70', 4, 9, 'SI', '09368748', 'Zenobia Chauta Campos', 8, 2, '50', 13, 14),
(318, '2021-06-04', 2, 10, '07723192', '590725', 'Maria Del Carmen Duffaut Guembes', 2, '54', 13, 9, 'SI', '70800471', 'Daniela Falcon Duffaut', 3, 2, '18', 4, 14),
(319, '2021-06-04', 2, 10, '76046164', '1215322', 'Robinson Liñan Chavez', 1, '26', 13, 11, 'SI', '42284961', 'Luzmila Mendieta Montalvo', 9, 2, '36', 4, 15),
(320, '2021-06-04', 2, 10, '44834427', '581016', 'Vania Gomez Orellana', 2, '33', 13, 11, 'SI', '06862275', 'Ilda Gomez Cardenas', 7, 2, '72', 4, 15),
(321, '2021-06-04', 3, 4, '60087845', '1336395', 'Cesar Roque Jaramillo', 1, '25', 13, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(322, '2021-06-04', 3, 4, '07059841', '657021', 'Aguirre Yataco Andres', 1, '62', 14, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(323, '2021-06-04', 3, 4, '10743021', '1305560', 'Tony Ruiz Villegas', 1, '43', 4, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(324, '2021-06-04', 3, 4, '06857535', '310793', 'Tomas Coronado Castillo', 1, '79', 5, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(325, '2021-06-04', 3, 4, '09045878', '1336172', 'Angel Ataucusi Ludeña', 1, '55', 15, 1, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(326, '2021-06-04', 3, 4, '09030560', '185789', 'Jorge Monge Muñoz', 1, '68', 1, 15, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(327, '2021-06-04', 3, 4, '06894119', '733889', 'Placido Huerta Gamboa', 1, '83', 13, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(328, '2021-06-04', 2, 10, '10776254', '1337523', 'Eli Rojas Rodriguez', 1, '44', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(329, '2021-06-04', 2, 10, '00033764', '1307788', 'Maria Capuena Aspajo', 2, '57', 4, 9, 'SI', '45211548', 'Maria Rucoba Capuena', 3, 2, '33', 4, 14),
(330, '2021-06-04', 2, 10, '25459554', '1337698', 'Carlos Cordova Alonso', 1, '59', 2, 9, 'SI', '10383564', 'Ana Maria Roque Ichagay', 9, 2, '47', 4, 14),
(331, '2021-06-04', 2, 10, '47597172', '1337710', 'Alex Almanza Ccama', 1, '29', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(332, '2021-06-04', 2, 10, '25836893', '987579', 'Roberto Santos Holguin', 1, '44', 13, 9, 'SI', '40880216', 'Esperanza Casafranca Diaz', 9, 2, '40', 4, 14),
(333, '2021-06-05', 2, 8, '40609520', '169770', 'Maria Durand Sanchez', 2, '40', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(334, '2021-06-05', 3, 8, '09980430', '1094254', 'Euclides Contreras Ticona', 1, '46', 4, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(335, '2021-06-05', 3, 8, '06733983', '1336147', 'Julio Eusebio Dolores Arevalo', 1, '46', 4, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(336, '2021-06-05', 3, 8, '80645612', '1336254', 'Marcos Isaias Alva Fano', 1, '41', 4, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(337, '2021-06-05', 3, 8, '03692991', '1197765', 'Jose Zacarias Coveñas Namuche', 1, '43', 4, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(338, '2021-06-05', 2, 8, '41646789', '211403', 'Lennart Erick Fernandez Mendieta', 1, '38', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(339, '2021-06-05', 2, 8, '08554136', '1337636', 'Bertha Gonzales Egusquiza', 2, '66', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(340, '2021-06-05', 2, 8, '33255282', '1336546', 'Rafael Mori Vega', 1, '67', 4, 10, 'NO', '', '', 0, 0, '', 0, 0),
(341, '2021-06-05', 2, 8, '09466831', '616802', 'Alfredo Mendoza Revilla', 1, '53', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(342, '2021-06-05', 2, 8, '09040826', '1337463', 'Jose Romaña Solsol', 1, '59', 4, 11, 'SI', '10160336', 'Gloria Mercedes Romaña Solsol', 6, 2, '44', 12, 17),
(343, '2021-06-05', 2, 8, '08381097', '548921', 'Javier Salas Guzman', 1, '57', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(344, '2021-06-05', 2, 8, '09232069', '473047', 'Luis Enrique Apolaya Acosta', 1, '60', 4, 9, 'SI', '74215274', 'Mayte Belen Apolaya Vega', 3, 2, '17', 13, 14),
(345, '2021-06-05', 2, 8, '09733347', '80954', 'Rafael Alberto Chumbes Rojas', 1, '52', 4, 9, 'SI', '06945836', 'Janet Vilma Chumbes Rojas', 6, 2, '55', 4, 14),
(346, '2021-06-05', 2, 8, '43093508', '1337559', 'Nelson Shapiana Valles', 1, '37', 4, 9, 'SI', '42079664', 'Liz Mirelly Tello Valles', 6, 2, '37', 13, 14),
(347, '2021-06-05', 2, 8, '06822868', '354867', 'Jose Llamocca Prado', 1, '59', 4, 9, 'SI', '45807239', 'Alex Sander Llamoca Pacheco', 3, 1, '32', 4, 14);
INSERT INTO `apsi_seguimiento` (`idSeguimiento`, `fechaRegSeg`, `tipoSeguimiento`, `idprofesional`, `nroDocPac`, `nroHisPac`, `nombApPac`, `tipSexPac`, `edadPac`, `diag1Pac`, `diag2Pac`, `comFamiliar`, `nroDocFam`, `nombApFam`, `parentFam`, `tipSexFam`, `edadFam`, `diag1Fam`, `diag2Fam`) VALUES
(348, '2021-06-05', 2, 8, '06915010', '1337238', 'JULIO MODESTO CHAVEZ  MILLA ', 1, '68', 4, 9, 'SI', '41720798', 'Jackeline Moly Chavez Nuñez', 3, 2, '0', 13, 15),
(349, '2021-06-05', 2, 8, '32889076', '1335823', 'CUSTODIO ESTRELLA  LLANOS ', 1, '85', 2, 0, 'NO', '', '', 0, 0, '', 0, 0),
(350, '2021-06-07', 2, 10, '25459554', '1337698', 'Carlos Cordova Alonso', 1, '59', 2, 10, 'SI', '10383564', 'Ana Maria Roque Ichagay', 9, 2, '47', 4, 15),
(351, '2021-06-07', 2, 10, '10388198', '221328', 'Camelon Alzamora Medina', 1, '60', 13, 10, 'SI', '09977909', 'Jorgina Mondragon Palomino', 9, 2, '55', 4, 15),
(352, '2021-06-07', 2, 10, '06565235', '1337278', 'Margarita Rios Camarena', 2, '65', 13, 11, 'NO', '', '', 0, 0, '', 0, 0),
(353, '2021-06-07', 2, 10, '07155112', '1337051', 'Mirtha Reategui Guerra', 2, '69', 13, 11, 'NO', '', '', 0, 0, '', 0, 0),
(354, '2021-06-07', 2, 10, '06880338', '713937', 'Segunda De La Cruz Avila', 1, '70', 4, 10, 'NO', '', '', 0, 0, '', 0, 0),
(355, '2021-06-07', 2, 10, '07723192', '590725', 'Maria Del Carmen Duffaut Guembes', 2, '54', 13, 10, 'SI', '70800471', 'Daniela Falcon Duffaut', 3, 2, '18', 4, 15),
(356, '2021-06-07', 2, 10, '47597172', '1337710', 'Alex Almanza Ccama', 1, '29', 13, 10, 'SI', '08218139', 'Margarita Ccama Caceres', 2, 2, '55', 4, 14),
(357, '2021-06-07', 2, 10, '46338604', '1336188', 'Yanet Huamancari Año', 2, '38', 4, 11, 'SI', '08578720', 'Felix Armando Huaman', 9, 1, '56', 4, 16),
(358, '2021-06-07', 2, 10, '00033764', '1307788', 'Maria Capuena Aspajo', 2, '57', 4, 10, 'NO', '', '', 0, 0, '', 0, 0),
(359, '2021-06-07', 2, 10, '06657692', '1337887', 'Victoria Rivas Solorzano', 2, '60', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(360, '2021-06-07', 2, 10, '46438277', '341444', 'Jorge Luis Alzamora Mondragon', 1, '31', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(361, '2021-06-07', 2, 10, '10392945', '326564', 'Oscar Narciso Velasquez Avalo', 1, '53', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(362, '2021-06-07', 2, 10, '43327737', '1337676', 'Diana Alva Cachique', 2, '36', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(363, '2021-06-07', 2, 10, '25836893', '987579', 'Roberto Santos Holguin', 1, '44', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(364, '2021-06-08', 3, 4, '06850616', '1336386', 'Pallin Huarcaya Alejandro', 1, '70', 14, 1, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(365, '2021-06-08', 3, 4, '45595288', '1336633', 'Chavez Crisostomo Giancarlo', 1, '32', 14, 1, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(366, '2021-06-08', 3, 4, '09360790', '1336098', 'FELIX CAPCHA  CAPCHA', 1, '53', 14, 1, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(367, '2021-06-08', 3, 4, '42642702', '704771', 'Jimmy Paredes Espinoza', 1, '43', 5, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(368, '2021-06-08', 2, 4, '63570876', '1015941', 'Patrick Onofre Nazario', 1, '12', 4, 1, 'NO', '', '', 0, 0, '', 0, 0),
(369, '2021-06-08', 2, 4, '60259728', '1337950', 'Gabina Lopez Matos', 2, '23', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(370, '2021-06-08', 2, 8, '47597172', '1337710', 'Alex Daniel Almanza Ccama', 1, '29', 4, 9, 'SI', '08218139', 'Margarita Ccama Caceres', 2, 2, '54', 4, 14),
(371, '2021-06-08', 2, 8, '09466831', '616802', 'Alfredo Eduardo Mendoza Revilla', 1, '54', 4, 9, 'SI', '74031717', 'Anya Christine Mendoza Rios', 3, 2, '20', 13, 14),
(372, '2021-06-08', 2, 8, '4164789', '211403', 'Lennart Erick Fernandez Mendieta', 1, '38', 4, 9, 'SI', '46362094', 'Katia Velasquez Castañeda', 6, 2, '31', 13, 14),
(373, '2021-06-08', 2, 8, '45099391', '440238', 'Quevedo Santiago Mallqui Laurencio', 1, '55', 3, 9, 'SI', '40379111', 'Becksy Antonieta Ramos Sanchez', 8, 2, '41', 13, 14),
(374, '2021-06-08', 2, 8, '07723192', '590725', 'Maria Duffaut Guembes', 2, '54', 4, 10, 'SI', '70800471', 'Daniella Analucia Falcot Duffaut', 3, 2, '18', 13, 15),
(375, '2021-06-08', 2, 8, '44086759', '410452', 'Manuel Alzamora Mondragon', 1, '34', 4, 9, 'SI', '43051651', 'Felicitas Alzamora Mondragon', 6, 2, '35', 4, 14),
(376, '2021-06-08', 2, 8, '08680845', '1337583', 'Hugo Rolando Jaque Vergaray', 1, '53', 12, 9, 'SI', '41071992', 'Milagros Del Pilar Vidal Lopez De Jaque', 9, 2, '39', 13, 14),
(377, '2021-06-08', 2, 8, '08711591', '1337969', 'Cesar Silva Vilchez', 1, '70', 4, 9, 'SI', '40921954', 'Liliana Vanesa Silva Saavedra', 3, 2, '40', 13, 14),
(378, '2021-06-08', 2, 8, '46438277', '341444', 'Jorge Luis Alzamora Mondragon', 1, '31', 4, 0, 'SI', '43051651', 'Felicitas Alzamora Mondragon', 6, 2, '35', 4, 0),
(379, '2021-06-08', 2, 8, '44499337', '1156483', 'Juan Rodriguez Naveda', 1, '33', 4, 10, 'NO', '', '', 0, 0, '', 0, 0),
(380, '2021-06-08', 2, 8, '08466806', '1337953', 'Froilan Marcelino Sanchez Aguilar', 1, '77', 4, 9, 'SI', '08688784', 'Olga Giovana Sanchez Sotelo De Contreras', 3, 2, '52', 4, 0),
(381, '2021-06-08', 2, 8, '80187653', '1336669', 'Delia Lusila Villanueva Martinez', 2, '53', 13, 0, 'SI', '76187018', 'Junior Yampier Bartolo Villanueva', 3, 1, '26', 13, 0),
(382, '2021-06-09', 2, 1, '06829321', '169433', 'Juana Crisóstomo Vásquez', 2, '61', 5, 0, 'SI', '10213347', 'Martín Crisóstomo Vásquez', 6, 1, '36', 5, 1),
(383, '2021-06-09', 2, 1, '07155112', '1337051', 'Mirta Reategui Guerra', 2, '69', 5, 0, 'SI', '09788137', 'KARINA  QUICAÑA REATEGUI', 3, 2, '50', 5, 1),
(384, '2021-06-09', 2, 1, '10388198', '221328', 'Carmelon Alzamora Medina', 1, '60', 5, 0, 'SI', '43051651', 'Felicitas Alzamora Mondragon', 3, 2, '35', 5, 1),
(385, '2021-06-09', 2, 1, '80187653', '1336669', 'Delia Villanueva Martinez', 2, '53', 5, 0, 'SI', '76187018', 'Junior Bartolo Villanueva', 3, 1, '26', 5, 13),
(386, '2021-06-09', 2, 1, '25836893', '987579', 'Roberto Santos Olguin', 1, '44', 5, 0, 'SI', '40888216', 'Esperanza Casafranco Diaz', 9, 2, '40', 5, 1),
(387, '2021-06-09', 2, 1, '08711591', '1337969', 'Cesar Silva Vilchez', 1, '70', 5, 0, 'SI', '40921954', 'Liliana Silva Saavedra', 3, 2, '40', 2, 1),
(388, '2021-06-09', 2, 10, '25459554', '1337698', 'Carlos Cordova Alonso', 1, '54', 2, 11, 'SI', '10383564', 'Ana Maria Roque Ichagay', 9, 2, '47', 4, 16),
(389, '2021-06-09', 2, 10, '25836893', '987579', 'Roberto Santos Holguin', 1, '44', 13, 11, 'SI', '40880216', 'Esperanza Cazafranca Diaz', 9, 2, '40', 4, 15),
(390, '2021-06-09', 2, 10, '43327737', '1337676', 'Diana Alva Cachique', 2, '36', 13, 10, 'SI', '10538456', 'Dolores Cachique Cahuasa', 2, 2, '62', 4, 14),
(391, '2021-06-09', 2, 10, '06921471', '1298560', 'Maura Onsehuay Osorio', 2, '80', 2, 9, 'SI', '09732722', 'Aida Galarza Gonzales', 8, 2, '48', 4, 14),
(392, '2021-06-09', 2, 10, '07760458', '1107097', 'Juan Vega Alejandro', 1, '48', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(393, '2021-06-09', 2, 10, '15287636', '1337561', 'Pepe Palacios Bandan', 1, '67', 13, 11, 'SI', '40666313', 'Eulalia Palacios Livia', 3, 2, '40', 13, 15),
(394, '2021-06-09', 2, 10, '00033764', '1307788', 'Maria Capuena Aspajo', 2, '57', 4, 11, 'SI', '45211548', 'Maria Rucoba Capuena', 3, 2, '33', 4, 15),
(395, '2021-06-09', 2, 10, '08554136', '1337636', 'Bertha Gonzales Egusquiza', 2, '66', 4, 10, 'SI', '09478189', 'Anibal Lozano Rojas', 9, 1, '55', 13, 15),
(396, '2021-06-09', 2, 10, '06880338', '713937', 'Segundo De La Cruz Avila', 1, '70', 4, 11, 'SI', '09368748', 'Zenobia Chauta Campos', 12, 2, '50', 13, 15),
(397, '2021-06-10', 3, 4, '45638538', '1337015', 'Ivan Alex Carhuaz Villarreal', 1, '36', 5, 1, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(398, '2021-06-10', 3, 4, '06940872', '200448', 'Marina Tapullima Saldaña', 2, '61', 5, 1, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(399, '2021-06-10', 3, 4, '60259728', '1337950', 'Gabina Lopez Matos', 2, '23', 13, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(400, '2021-06-10', 3, 4, '07469035', '1188599', 'Denis Jeanneau Cornejo', 1, '51', 15, 1, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(401, '2021-06-10', 3, 4, '06244998', '1179507', 'Americo Rodriguez Canicoba', 1, '56', 4, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(402, '2021-06-10', 2, 8, '09733347', '80954', 'Rafael Chumbe Rojas', 1, '52', 4, 10, 'NO', '', '', 0, 0, '', 0, 0),
(403, '2021-06-10', 2, 8, '44086759', '410452', 'Manuel Alzamora Mondragon', 1, '34', 4, 10, 'NO', '', '', 0, 0, '', 0, 0),
(404, '2021-06-10', 2, 8, '46438277', '341444', 'Jorge Luis Alzamora Mondragon', 1, '31', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(405, '2021-06-10', 2, 8, '08680845', '1337583', 'Hugo Rolando Jaque Vergaray', 1, '53', 12, 10, 'NO', '', '', 0, 0, '', 0, 0),
(406, '2021-06-10', 2, 8, '45099391', '440238', 'Quevedo Santiago Mallqui Laurencio', 1, '55', 4, 10, 'NO', '', '', 0, 0, '', 0, 0),
(407, '2021-06-10', 2, 8, '10160446', '1334569', 'Rosario Susana Huaman Hilario', 2, '63', 13, 9, 'NO', '', '', 0, 0, '', 0, 0),
(408, '2021-06-10', 2, 8, '10160446', '1334569', 'Rosario Susana Huaman Hilario', 2, '63', 13, 10, 'SI', '44869333', 'Blaise Pascal Berru Huaman', 3, 1, '33', 13, 15),
(409, '2021-06-10', 2, 8, '08277253', '583956', 'Julian Castro Garro', 1, '69', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(410, '2021-06-10', 2, 8, '22516365', '43737', 'Julio Vasquez Consa', 1, '51', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(411, '2021-06-10', 2, 8, '44499337', '1156483', 'Juan Rodriguez Naveda', 1, '33', 4, 11, 'NO', '', '', 0, 0, '', 0, 0),
(412, '2021-06-10', 2, 8, '06858227', '1336307', 'Gonzalo Briceño Farfan', 1, '80', 4, 9, 'SI', '09735014', 'Federico Marcial Briceño Ojeda', 8, 1, '51', 13, 14),
(413, '2021-06-10', 2, 8, '25459554', '1337698', 'Carlos Cordova Alonso', 1, '59', 13, 9, 'SI', '10383564', 'Ana Roque Ichagay', 9, 2, '46', 4, 14),
(414, '2021-06-10', 3, 8, '01042552', '1186051', 'Yolanda Luz Silva Sandoval', 2, '69', 13, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(415, '2021-06-10', 3, 8, '42386539', '1336560', 'Maura Diestra Flores', 2, '39', 4, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(416, '2021-06-10', 3, 8, '45638538', '1337015', 'Ivan Carhuaz Villareal', 1, '36', 6, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(417, '2021-06-10', 3, 8, '10391887', '1156002', 'Percy Pampas Rojas', 1, '44', 13, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(418, '2021-06-10', 2, 8, '06915010', '1337238', 'Julio Modesto Chavez Milla', 1, '68', 4, 10, 'NO', '', '', 0, 0, '', 0, 0),
(419, '2021-06-10', 2, 8, '43093508', '1337559', 'Nelson Shapiana Valles', 1, '37', 4, 10, 'NO', '', '', 0, 0, '', 0, 0),
(420, '2021-06-11', 2, 1, '10392739', '199768', 'Maria Encalada Morales', 2, '80', 5, 0, 'SI', '09735154', 'Zuli Paredes Sanchez', 8, 2, '54', 2, 13),
(421, '2021-06-11', 2, 1, '06827023', '194146', 'Carlos Torres Longinote', 1, '35', 5, 0, 'SI', '42290266', 'Evelin Paucar Calderon', 3, 2, '37', 12, 13),
(422, '2021-06-11', 2, 1, '09978974', '607219', 'Juan Bautista Cueva', 1, '47', 5, 0, 'SI', '09540751', 'Ronny Gonzales Vilches', 8, 1, '49', 5, 1),
(423, '2021-06-11', 2, 1, '22516365', '43737', 'Julio Vaquez Consa', 1, '51', 5, 0, 'SI', '10749275', 'Luisa Trujillo Mamani', 9, 2, '42', 5, 1),
(424, '2021-06-11', 2, 1, '08172543', '1338140', 'Rafael Chauca Cano', 1, '45', 5, 0, 'SI', '41982854', 'Lesly Nuñez Diaz', 9, 2, '37 ', 5, 1),
(425, '2021-06-11', 2, 1, '15287636', '1337561', 'Pepe Palacios Bandan', 1, '67', 5, 0, 'SI', '44790322', 'Jose Alberto Palacios Livia', 3, 1, '33', 5, 1),
(426, '2021-06-11', 2, 10, '00817725', '1338139', 'Maria Del Carmen Apuela Conche', 2, '67', 13, 9, 'SI', '43334221', 'Rosario Etiquen Apuela', 3, 2, '37', 4, 14),
(427, '2021-06-11', 2, 10, '0692147', '1298560', 'Maura Onsehuay Osorio', 2, '80', 2, 10, 'SI', '09732722', 'Aida Galarza Gonzales', 8, 2, '48', 4, 15),
(428, '2021-06-11', 2, 10, '7424994', '1338008', 'Ricardo Chuzon Alaban', 1, '60', 4, 9, 'SI', '75009132', 'Herman Torres Chuzon', 8, 1, '27', 13, 14),
(429, '2021-06-11', 2, 10, '10392739', '199768', 'Maria Lidia Velasquez Perez', 2, '80', 13, 9, 'SI', '09735154', 'Zuly Paredes Sanchez', 8, 2, '54', 13, 14),
(430, '2021-06-11', 2, 10, '10392945', '326564', 'Oscar Narciso Velasquez', 1, '53', 13, 10, 'SI', '70011509', 'Medalix Velasquez Peres', 3, 2, '26', 13, 14),
(431, '2021-06-11', 2, 10, '08554136', '1337636', 'Bertha Gonzales Egusquiza', 2, '66', 4, 11, 'NO', '', '', 0, 0, '', 0, 0),
(432, '2021-06-11', 2, 10, '07723192', '590725', 'Maria Del Carmen Duffaut Guembes', 2, '54', 13, 11, 'SI', '70800471', 'Daniela Falcon Duffaut', 3, 2, '18', 4, 16),
(433, '2021-06-11', 2, 10, '08172543', '1338140', 'Rafael Fausto Chauca Calvo', 1, '45', 4, 9, 'SI', '41982854', 'Britt Nuñez Diaz', 9, 1, '37', 13, 14),
(434, '2021-06-11', 2, 10, '7760458', '1107097', 'Juan Vega Alejandro', 1, '48', 13, 10, 'SI', '27725904', 'Dalila Tapia Rubio', 9, 2, '48', 4, 14),
(435, '2021-06-11', 2, 10, '06827023', '194146', 'Carlos Torres Conginote', 1, '55', 13, 9, 'SI', '42290267', 'Evelyn Paucar Calderon', 3, 2, '36', 13, 14),
(436, '2021-06-11', 2, 10, '19810782', '1338159', 'Yauri Ramires David', 1, '67', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(437, '2021-06-12', 2, 8, '80066220', '597057', 'Luis Nolasco Hilario', 1, '45', 8, 0, 'SI', '77468779', 'Evelyn Gabriela Nolasco Rojas', 1, 2, '20', 13, 14),
(438, '2021-06-12', 2, 8, '9628403', '1337554', 'Pedro Perales Cabezas', 1, '51', 8, 0, 'SI', '73884361', 'Diego Alexander Perales Paz', 3, 1, '20', 13, 0),
(439, '2021-06-12', 2, 8, '45855221', '1336558', 'Wilbert Poclin Mendoza', 1, '33', 8, 0, 'SI', '46801078', 'Medalith Suyon Chicana', 9, 2, '29', 13, 0),
(440, '2021-06-12', 1, 8, '09466831', '616802', 'Alfeedo Eduardo Mendoza Revilla', 1, '54', 8, 0, 'SI', '71730262', 'Ivette Mirella Cruz Diaz', 3, 2, '29', 12, 9),
(441, '2021-06-12', 1, 8, '06944574', '594234', 'Justo Araoz Zuñiga', 1, '57', 8, 0, 'SI', '29559758', 'Veronica Quispe Rivera', 9, 2, '49', 12, 14),
(442, '2021-06-12', 3, 4, '41951009', '980527', 'Julian Nolasco Hilario', 1, '41', 15, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(443, '2021-06-12', 1, 8, '0688038', '713937', 'Segundo De La Cruz Avila', 1, '70', 8, 0, 'SI', '40790484', 'Juan Carlos De La Cruz Morales', 3, 1, '42', 12, 14),
(444, '2021-06-12', 3, 4, '06892165', '1336657', 'Fredy Huaranga Rojas', 1, '57', 6, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(445, '2021-06-12', 2, 8, '041646789', '211403', 'Lennart Fernandez Mendieta', 1, '38', 4, 10, 'SI', '45341862', 'Arturo Antony Fernandez Mendieta', 6, 1, '32', 13, 15),
(446, '2021-06-12', 3, 4, '48193253', '1336590', 'Milagros Pacheco Gutierrez', 2, '33', 15, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(447, '2021-06-12', 2, 8, '06858227', '1336307', 'Gonzalo Briceño Farfan', 1, '80', 4, 10, 'SI', '09735014', 'Federico Marcial Briceño Ojeda', 8, 1, '51', 13, 15),
(448, '2021-06-12', 3, 4, '08750121', '1333492', 'Ines Cuello Aguilar', 2, '56', 9, 10, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(449, '2021-06-12', 2, 8, '09978974', '607219', 'Juan Bautista Cueva', 1, '47', 4, 11, 'NO', '', '', 0, 0, '', 0, 0),
(450, '2021-06-12', 3, 4, '22753645', '1269227', 'Esteban Nolasco Midolo', 1, '68', 15, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(451, '2021-06-12', 2, 8, '46864205', '1338122', 'Richard Chanel Lopez Montalvo', 1, '30', 4, 9, 'SI', '74848815', 'TOMY  RODIALDO CASTILLEJO RIOS ', 6, 1, '25', 13, 14),
(452, '2021-06-12', 2, 8, '06915010', '1337238', 'JULIO MODESTO CHAVEZ  MILLA', 1, '68', 4, 11, 'SI', '41720798', 'Jackelyne Moly Chavez Nuñez', 3, 2, '0', 13, 15),
(453, '2021-06-12', 2, 8, '06902603', '1148569', 'Rodolfo Edilberto Vergara Rodriguez', 1, '55', 4, 9, 'SI', '72541348', 'Milagros Angelica Vergara Paredes', 3, 1, '22', 13, 14),
(454, '2021-06-12', 2, 8, '09470865', '960050', 'Carlos Enrique Fernandez Montenegro', 1, '53', 4, 9, 'SI', '47009564', 'Junior Enrique Fernandez Ortiz', 3, 1, '29', 13, 14),
(455, '2021-06-12', 2, 8, '00032368', '217878', 'Manuel Perez Coral', 1, '78', 12, 9, 'SI', '00076261', 'Liana Perez Garcia', 3, 2, '52', 12, 14),
(456, '2021-06-14', 2, 1, '00817725', '1338139', 'María Apuela Conche', 2, '67', 5, 0, 'SI', '43334221', 'Rosario Epiquen Apuela', 3, 2, '37', 5, 1),
(457, '2021-06-14', 2, 1, '468664205', '1338122', 'Richard Lopez Momtalvo', 1, '30', 5, 0, 'SI', '46354102', 'Tania Castillejo Rios', 9, 2, '33', 5, 1),
(458, '2021-06-14', 2, 1, '09607189', '427977', 'Raúl Mendoza Toribio', 1, '51', 5, 0, 'SI', '46616998', 'Madelene Leydi Mendoza Calle', 3, 2, '32', 2, 1),
(459, '2021-06-14', 2, 1, '002965053', '1337319', 'Jose Luiscri Jimenez Requena', 1, '38', 5, 0, 'SI', '002945155', 'Rosmary García Aguiar', 10, 2, '32', 5, 1),
(460, '2021-06-14', 2, 1, '9628403', '1337554', 'Pedro Perales Cabezas', 1, '51', 5, 0, 'SI', '73884361', 'Diego Alexander Perales Paz', 3, 1, '20', 2, 1),
(461, '2021-06-14', 2, 1, '10776264', '1337523', 'Elí Rojas Rodríguez', 1, '44', 5, 0, 'SI', '41413896', 'Elizabeth Rojas Rodríguez', 6, 2, '38', 2, 1),
(462, '2021-06-14', 2, 1, '45855221', '1336558', 'Wilber Poclín Mendoza', 1, '33', 5, 0, 'SI', '46801078', 'Medalich Suyon Chipana', 9, 2, '29', 2, 1),
(463, '2021-06-14', 2, 10, '15655331', '1338219', 'Lucila Vasquez Espinoza', 2, '55', 2, 9, 'SI', '15730633', 'Jesusa Vasquez Espinoza', 6, 2, '53', 13, 14),
(464, '2021-06-14', 2, 10, '15280950', '1338253', 'Ines Oscanoa Barreto', 2, '71', 13, 9, 'SI', '41568972', 'Mabel Huaman Cajavilca', 8, 2, '40', 13, 14),
(465, '2021-06-14', 2, 10, '19810782', '1338159', 'David Yauri Ramires', 1, '67', 13, 10, 'SI', '45978680', 'Jaquelin Yauri Campo', 3, 2, '33', 4, 14),
(466, '2021-06-14', 2, 10, '00817725', '1338139', 'Maria Del Carmen Apuela Conche', 2, '67', 13, 10, 'SI', '43334221', 'Rosario Etiquen Apuela', 3, 2, '37', 4, 15),
(467, '2021-06-14', 2, 10, '07424994', '1338008', 'Ricardo Chuzon Alaban', 1, '60', 4, 10, 'SI', '75009132', 'German Torres Chuzon', 8, 1, '27', 13, 15),
(468, '2021-06-14', 3, 4, '09002214', '133617', 'Baldeon Valdez Ernestina', 2, '66', 5, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(469, '2021-06-14', 3, 4, '09984155', '491430', 'Ines Rivero Yupanqui', 2, '46', 15, 4, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(470, '2021-06-14', 3, 4, '74642267', '743643', 'Luis Eduardo Rodriguez Garrafa', 1, '24', 13, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(471, '2021-06-14', 3, 4, '10438710', '1336727', 'Wilmer Camarena Caballero', 1, '46', 4, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(472, '2021-06-14', 3, 4, '63570876', '1015941', 'Patrick Onofre Nazaria', 1, '12', 4, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(473, '2021-06-14', 2, 10, '08172543', '1338140', 'Rafael Fausto Chauca Calvo', 1, '46', 4, 10, 'SI', '41982854', 'Britt Nuñez Diaz', 9, 2, '37', 13, 15),
(474, '2021-06-14', 2, 10, '10392739', '199768', 'Maria Lidia Encalada Morales', 2, '80', 13, 10, 'NO', '', '', 0, 0, '', 0, 0),
(475, '2021-06-14', 2, 10, '7760458', '1107097', 'Juan Vega Alejandro', 1, '48', 13, 11, 'SI', '27725904', 'Dalila Tapia Rubio', 9, 2, '48', 4, 15),
(476, '2021-06-14', 2, 10, '41646789', '211403', 'Lennart Fernandez Mendieta', 1, '38', 4, 9, 'SI', '45341862', 'Arturo Fernandez Mendieta', 6, 1, '32', 4, 14),
(477, '2021-06-14', 3, 4, '32601376', '1335602', 'Epifanio Miranda Villanueva', 1, '60', 15, 1, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(478, '2021-06-15', 2, 8, '43093508', '1337559', 'Nelson Shapiama Valles', 1, '35', 4, 0, 'SI', '42079664', 'Liz Mirelly Tello Valles', 2, 2, '37', 4, 0),
(479, '2021-06-15', 2, 8, '44086759', '410452', 'Manuel Alzamora Mondragón', 1, '34', 4, 0, 'SI', '43051651', 'Felicitas Alzamora Mondragón', 6, 2, '35', 4, 0),
(480, '2021-06-15', 2, 8, '08277253', '583956', 'Julián Castro Garro', 1, '69', 4, 0, 'NO', '', '', 0, 0, '', 0, 0),
(481, '2021-06-15', 2, 8, '08277253', '583956', 'Julián Castro Garro', 1, '69', 4, 0, 'NO', '', '', 0, 0, '', 0, 0),
(482, '2021-06-15', 2, 8, '150269676', '1338242', 'Keile Grimaldo Barrera', 2, '33', 4, 0, 'NO', '', '', 0, 0, '', 0, 0),
(483, '2021-06-15', 3, 8, '33255282', '1336546', 'Rafael Morí Vega', 1, '67', 13, 0, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(484, '2021-06-15', 3, 8, '10388198', '221328', 'Carmelon Alzamora Medina', 1, '60', 13, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(485, '2021-06-15', 3, 8, '46438277', '341444', 'Jorge Luis Alzamora Mondragón', 1, '31', 13, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(486, '2021-06-15', 3, 8, '09971995', '113374', 'Margarita Ramos Sáenz', 2, '47', 13, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(487, '2021-06-15', 2, 8, '46864205', '1338122', 'Richard López Montalvo', 1, '30', 4, 0, 'SI', '46354102', 'Tania Erica Castillejo Ríos', 9, 2, '33', 13, 15),
(488, '2021-06-15', 2, 8, '45099391', '440238', 'Quevedo Mallqui Laurencio', 1, '55', 4, 0, 'SI', '40379111', 'Becksy Ramos Sánchez', 9, 2, '41', 13, 0),
(489, '2021-06-15', 2, 8, '00032368', '217878', 'Manuel Pérez Coral', 1, '78', 12, 0, 'SI', '00076261', 'Liana Pérez García', 3, 2, '52', 12, 0),
(490, '2021-06-15', 2, 8, '22516365', '43737', 'Julio Fernando Vasquez Consta', 1, '51', 4, 0, 'SI', '10749275', 'Luisa Yenny Trujillo Mamani', 9, 2, '42', 13, 0),
(491, '2021-06-16', 2, 1, '06933992', '1282239', 'Melanio Santi Ramirez', 1, '70', 5, 0, 'SI', '40637236', 'Andres Huayllaquispe Santi', 8, 1, '41', 5, 2),
(492, '2021-06-16', 2, 1, '06830948', '1338159', 'Hugo Tejada Llauce', 1, '67', 5, 0, 'SI', '47352693', 'Khaterine Janet Tejada Rodriguez', 8, 2, '29', 5, 1),
(493, '2021-06-16', 2, 1, '19810782', '1338159', 'David Angel Yahuri Ramirez', 1, '67', 5, 0, 'SI', '45978680', 'Yakeline Yahuri Campos', 3, 2, '33', 5, 1),
(494, '2021-06-16', 2, 1, '06879048', '935126', 'Humberto Nuñez Morales', 1, '63', 5, 0, 'SI', '44725361', 'Maria Gabriela Nuñez Sotelo', 3, 2, '33', 13, 1),
(495, '2021-06-16', 2, 1, '41646789', '211403', 'Lennart Fernadez Medieta', 1, '38', 5, 0, 'SI', '46362094', 'Katia Velasquez Castañeda', 6, 2, '31', 2, 1),
(496, '2021-06-16', 2, 1, '01766965', '243714', 'Julia Roque Estaña', 2, '58', 5, 0, 'SI', '41911987', 'Rosmery Quispe Roque', 3, 2, '35', 13, 1),
(497, '2021-06-16', 3, 4, '45099391', '440238', 'Santiago Mallqui Laurecio', 1, '55', 13, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(498, '2021-06-16', 3, 4, '46338604', '1336188', 'YANET HUAMANCCARI  AÑO', 2, '38', 4, 9, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(499, '2021-06-16', 2, 10, '0692147', '1298560', 'Maura Onsehuay Osorio', 2, '80', 13, 11, 'SI', '09732722', 'Aida Galarza Gonzales', 8, 2, '48', 4, 17),
(500, '2021-06-16', 2, 10, '15280950', '1338253', 'Ines Oscanoa Barreto', 2, '71', 13, 10, 'SI', '41568972', 'Mabel Eva Huaman Cajavilca', 8, 2, '40', 13, 15),
(501, '2021-06-16', 2, 10, '22516365', '43737', 'Julio Vasquez Consa', 1, '51', 4, 9, 'SI', '10748275', 'Jeny Luisa Trujillo Mamani', 9, 2, '42', 4, 14),
(502, '2021-06-16', 3, 4, '07723192', '590725', 'Maria Duffaut Guembes', 2, '54', 15, 4, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(503, '2021-06-16', 2, 10, '07424994', '1338008', 'Ricardo Chuzon Alaban', 1, '60', 4, 11, 'SI', '75009132', 'German Torres Chuzon', 8, 1, '27', 13, 16),
(504, '2021-06-16', 2, 10, '08172543', '1338140', 'Rafael Fausto Chauca Calvo', 1, '45', 4, 11, 'NO', '', '', 0, 0, '', 0, 0),
(505, '2021-06-16', 2, 10, '10392739', '199768', 'Maria Lidia Encalada', 2, '80', 13, 11, 'SI', '09735154', 'Zuly Paredes Sanchez', 8, 2, '55', 13, 16),
(506, '2021-06-16', 2, 10, '06879048', '935126', 'Humberto Nuñez Morales', 1, '63', 13, 9, 'SI', '44725361', 'Maria Nuñez Sotelo', 9, 2, '33', 4, 14),
(507, '2021-06-16', 2, 10, '06830948', '63066', 'Hugo Tejada Llauce', 1, '63', 13, 9, 'SI', '47352693', 'Katherin Tejada Rodriguez', 8, 2, '29', 13, 14),
(508, '2021-06-16', 2, 10, '150269676', '1338242', 'Keile Tejada Rodriguez', 2, '33', 4, 9, 'SI', '004272135', 'Andreina Perez Leon', 10, 2, '22', 13, 14),
(509, '2021-06-16', 2, 10, '00817725', '1338139', 'Maria Del Carmen Apuela Conche', 2, '67', 13, 11, 'SI', '43334221', 'Rosario Etiquen Apuela', 3, 2, '37', 4, 16),
(510, '2021-06-17', 3, 8, '80187653', '1336669', 'Delia Lusila Villanueva Martinez', 2, '53', 13, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(511, '2021-06-17', 3, 8, '06829321', '169433', 'Juana Isabel Crisostomo Vasquez', 2, '61', 13, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(512, '2021-06-17', 3, 8, '09017936', '437285', 'Teofilo Paulino Veliz', 1, '70', 13, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(513, '2021-06-17', 3, 8, '09340730', '1336528', 'Johnny Javier Sanchez Amat', 1, '49', 6, 14, 'NO', NULL, NULL, 0, 0, NULL, 0, 0),
(514, '2021-06-17', 2, 8, '81455260', '1338190', 'Yashira Corpuna Ventura', 2, '17', 4, 9, 'NO', '', '', 0, 0, '', 0, 0),
(515, '2021-06-17', 2, 8, '06849292', '1042814', 'Bertila Melgarejo Montalvo De Balmaceda', 2, '80', 4, 9, 'SI', '09747066', 'Selene Balmaceda Melgarejo', 3, 2, '49', 13, 14),
(516, '2021-06-17', 2, 8, '43093508', '1337559', 'Nelson Enrique Shapiana Valles', 1, '35', 4, 11, 'SI', '42079664', 'Liz Mirelly Tello Valles', 6, 2, '37', 4, 16),
(517, '2021-06-17', 2, 8, '06879048', '935126', 'Humberto Nicasio Nuñez Morales', 1, '63', 4, 9, 'SI', '44725361', 'Maria Gasbiela Nuñez Sotelo', 3, 2, '33', 4, 14),
(518, '2021-06-17', 2, 8, '15287636', '1337561', 'Pepe Palacios Bandan', 1, '67', 4, 9, 'SI', '40666313', 'Eulalia Margot Palacios Liria', 3, 2, '40', 4, 14),
(519, '2021-06-17', 2, 8, '7760458', '1107097', 'Juan Vega Alejandro', 1, '48', 13, 9, 'SI', '27725904', 'Dalila Tapia Rubio', 9, 2, '48', 13, 14),
(520, '2021-06-17', 2, 8, '46864205', '1338122', 'Richard Lopez Montalvo', 1, '30', 4, 10, 'SI', '46354102', 'Tania Erica Castillejo Rios', 9, 2, '33', 13, 15),
(521, '2021-06-17', 2, 8, '09733347', '80954', 'Rafael Chumbes Rojas', 1, '52', 4, 11, 'SI', '06945836', 'Janet Vilma Chumbes Rojas', 6, 2, '55', 4, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apsi_tiposexo`
--

CREATE TABLE `apsi_tiposexo` (
  `idTipSexo` int(11) NOT NULL,
  `desctipSexo` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `apsi_tiposexo`
--

INSERT INTO `apsi_tiposexo` (`idTipSexo`, `desctipSexo`) VALUES
(1, 'MASCULINO'),
(2, 'FEMENINO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apsi_tipseguimiento`
--

CREATE TABLE `apsi_tipseguimiento` (
  `idTipSeg` int(11) NOT NULL,
  `descTipSeg` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `apsi_tipseguimiento`
--

INSERT INTO `apsi_tipseguimiento` (`idTipSeg`, `descTipSeg`) VALUES
(1, 'FAM. FALLECIDO'),
(2, 'HOSPITALIZADOS'),
(3, 'PAC. ALTA MEDICA'),
(4, 'PERSONAL DE SALUD');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apsi_condlaboral`
--
ALTER TABLE `apsi_condlaboral`
  ADD PRIMARY KEY (`idCondicion`);

--
-- Indices de la tabla `apsi_diagnosticos`
--
ALTER TABLE `apsi_diagnosticos`
  ADD PRIMARY KEY (`idDiagnostico`);

--
-- Indices de la tabla `apsi_parentesco`
--
ALTER TABLE `apsi_parentesco`
  ADD PRIMARY KEY (`idParentesco`);

--
-- Indices de la tabla `apsi_profesionales`
--
ALTER TABLE `apsi_profesionales`
  ADD PRIMARY KEY (`idProfesional`);

--
-- Indices de la tabla `apsi_seguimiento`
--
ALTER TABLE `apsi_seguimiento`
  ADD PRIMARY KEY (`idSeguimiento`);

--
-- Indices de la tabla `apsi_tiposexo`
--
ALTER TABLE `apsi_tiposexo`
  ADD PRIMARY KEY (`idTipSexo`);

--
-- Indices de la tabla `apsi_tipseguimiento`
--
ALTER TABLE `apsi_tipseguimiento`
  ADD PRIMARY KEY (`idTipSeg`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apsi_condlaboral`
--
ALTER TABLE `apsi_condlaboral`
  MODIFY `idCondicion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `apsi_diagnosticos`
--
ALTER TABLE `apsi_diagnosticos`
  MODIFY `idDiagnostico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `apsi_parentesco`
--
ALTER TABLE `apsi_parentesco`
  MODIFY `idParentesco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `apsi_profesionales`
--
ALTER TABLE `apsi_profesionales`
  MODIFY `idProfesional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `apsi_seguimiento`
--
ALTER TABLE `apsi_seguimiento`
  MODIFY `idSeguimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=522;

--
-- AUTO_INCREMENT de la tabla `apsi_tiposexo`
--
ALTER TABLE `apsi_tiposexo`
  MODIFY `idTipSexo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `apsi_tipseguimiento`
--
ALTER TABLE `apsi_tipseguimiento`
  MODIFY `idTipSeg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;