-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 18-06-2021 a las 20:14:24
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
-- Base de datos: `acpsy`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ANULAR_ATENCION` (IN `_idAtencion` INT(11))  UPDATE acpsy_atencion SET idEpisodio = "ANULADA", cuentaAtencion = "ANULADA", idEstadoAte = 2 WHERE idAtencion = _idAtencion$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_PACIENTE` (IN `_termino` TEXT)  SELECT
idAtencion,cuentaAtencion,tipdocAtencion,nrodocAtencion,CONCAT(nombAtencion,' ',apPaternoAtencion,' ',apMaternoAtencion) AS paciente,acpsy_estadopaciente.detaEstadoPacAtencion
FROM
	acpsy_atencion
INNER JOIN
	acpsy_estadopaciente
	ON 
		acpsy_atencion.idEstadoPacAtencion = acpsy_estadopaciente.idEstadoPacAtencion
WHERE (acpsy_atencion.cuentaAtencion LIKE CONCAT('%',UPPER(_termino),'%') OR acpsy_atencion.apPaternoAtencion LIKE CONCAT('%',UPPER(_termino),'%') OR acpsy_atencion.apMaternoAtencion LIKE CONCAT('%',UPPER(_termino),'%') OR acpsy_atencion.nombAtencion LIKE CONCAT('%',UPPER(_termino),'%')) AND (acpsy_atencion.idEstadoAte != 2)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DESBLOQUEAR_USUARIO` (IN `_idUsuario` INT(11))  UPDATE acpsy_usuarios SET intentosUsuario = 0 WHERE idUsuario = _idUsuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EDITAR_ATENCION` (IN `_idEpisodio` TEXT, IN `_cuentaAtencion` VARCHAR(20), IN `_historiaAtencion` VARCHAR(20), IN `_idEstadoPacAtencion` INT(11), IN `_fechaPacNacimiento` DATE, IN `_tipdocAtencion` VARCHAR(20), IN `_nrodocAtencion` VARCHAR(15), IN `_apPaternoAtencion` VARCHAR(30), IN `_apMaternoAtencion` VARCHAR(30), IN `_nombAtencion` VARCHAR(30), IN `_fIngresoAtencion` DATE, IN `_servAtencion` VARCHAR(100), IN `_camaAtencion` VARCHAR(20), IN `_distritoAtencion` VARCHAR(100), IN `_edadAtencion` VARCHAR(20), IN `_tipSexoAtencion` INT(11), IN `_financiaAtencion` VARCHAR(50), IN `_idAtencion` INT(11))  UPDATE acpsy_atencion SET idEpisodio = _idEpisodio,
cuentaAtencion = _cuentaAtencion,
historiaAtencion = _historiaAtencion,
idEstadoPacAtencion = _idEstadoPacAtencion,
fechaPacNacimiento = _fechaPacNacimiento,
tipdocAtencion = _tipdocAtencion,
nrodocAtencion = _nrodocAtencion,
apPaternoAtencion = _apPaternoAtencion,
apMaternoAtencion = _apMaternoAtencion,
nombAtencion = _nombAtencion,
fIngresoAtencion = _fIngresoAtencion,
servAtencion = _servAtencion,
camaAtencion = _camaAtencion,
distritoAtencion = _distritoAtencion,
edadAtencion = _edadAtencion,
tipSexoAtencion = _tipSexoAtencion,
financiaAtencion = _financiaAtencion
WHERE
	idAtencion = _idAtencion$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EDITAR_DIAGNOSTICO` (IN `_idDiagnostico` INT(11), IN `_cieDiagnostico` VARCHAR(20), IN `_detaDiagnostico` VARCHAR(100))  UPDATE acpsy_diagnosticos SET cieDiagnostico = _cieDiagnostico,detaDiagnostico = _detaDiagnostico WHERE idDiagnostico = _idDiagnostico$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EDITAR_FAMILIARES` (IN `_idFamiliar` INT(11), IN `_idAtencion` INT(11), IN `_idParentesco` INT(11), IN `_idTipSexo` INT(11), IN `_tipdocFamiliar` VARCHAR(20), IN `_ndocFamiliar` VARCHAR(20), IN `_nombApFamiliar` VARCHAR(100), IN `_edadFamiliar` VARCHAR(20), IN `_telcelFamiliar` VARCHAR(12))  UPDATE acpsy_famatencion 
SET idAtencion = _idAtencion,
idParentesco = _idParentesco,
idTipSexo = _idTipSexo,
tipdocFamiliar = _tipdocFamiliar,
ndocFamiliar = _ndocFamiliar,
nombApFamiliar = _nombApFamiliar,
edadFamiliar = _edadFamiliar,
telcelFamiliar = _telcelFamiliar 
WHERE
	idFamiliar = _idFamiliar$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EDITAR_PROFESIONAL` (IN `_idProfesional` INT(11), IN `_idCondicion` INT(11), `_dniProfesional` VARCHAR(15), IN `_cpspProfesional` VARCHAR(25), IN `_apellidosProfesional` VARCHAR(50), IN `_nombresProfesional` VARCHAR(50))  UPDATE acpsy_profesionales SET idCondicion = _idCondicion, dniProfesional = _dniProfesional, cpspProfesional = _cpspProfesional, apellidosProfesional = _apellidosProfesional, nombresProfesional = _nombresProfesional WHERE idProfesional = _idProfesional$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EDITAR_USUARIO` (IN `_idUsuario` INT(11), IN `_idPerfil` INT(11), IN `_dniUsuario` VARCHAR(20), IN `_apellidosUsuario` VARCHAR(50), IN `_nombresUsuario` VARCHAR(50), IN `_cuentaUsuario` VARCHAR(50), IN `_correoUsuario` VARCHAR(50), IN `_claveUsuario` VARCHAR(100))  UPDATE acpsy_usuarios 
SET idPerfil = _idPerfil,
dniUsuario = _dniUsuario,
apellidosUsuario = _apellidosUsuario,
nombresUsuario = _nombresUsuario,
cuentaUsuario = _cuentaUsuario,
correoUsuario = _correoUsuario,
claveUsuario = _claveUsuario 
WHERE
	idUsuario = _idUsuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_DIAGNOSTICO` (IN `_idDiagnostico` INT(11))  DELETE FROM acpsy_diagnosticos WHERE idDiagnostico = _idDiagnostico$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_FAMILIAR` (IN `_idFamiliar` INT(11), OUT `nExistencia` INT(11))  BEGIN
    DECLARE conteo INT;
	SET conteo = (SELECT count(idFamiliar) as existencia FROM acpsy_famatencion fam
	WHERE EXISTS (SELECT NULL
	FROM acpsy_seguimiento seg
	WHERE seg.idFamAtSeg = fam.idFamiliar) AND idFamiliar = _idFamiliar);
    IF(conteo >= 1) THEN
       SET nExistencia = 1;
    ELSE
       DELETE FROM acpsy_famatencion WHERE idFamiliar = _idFamiliar;
       SET nExistencia = 0;
    END IF;
    SELECT nExistencia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_PROFESIONAL` (IN `_idProfesional` INT(11))  DELETE FROM acpsy_profesionales WHERE idProfesional = _idProfesional$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_USUARIO` (IN `_idUsuario` INT(11))  DELETE FROM acpsy_usuarios WHERE idUsuario = _idUsuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `HABILITAR_PROFESIONAL` (IN `_idProfesional` INT(11), IN `_idEstado` INT(11))  UPDATE acpsy_profesionales SET idEstado = _idEstado WHERE idProfesional = _idProfesional$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `HABILITAR_USUARIO` (IN `_idUsuario` INT(11), IN `_idEstado` INT(11))  UPDATE acpsy_usuarios SET idEstado = _idEstado WHERE idUsuario = _idUsuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_ATENCIONES` ()  SELECT
	acpsy_atencion.idAtencion, 
	acpsy_atencion.correlativo_Atencion, 
	date_format(acpsy_atencion.fRegistroAtencion,'%d/%m/%Y') as fRegistroAtencion,
	acpsy_atencion.idEpisodio, 
	acpsy_atencion.cuentaAtencion, 
	acpsy_atencion.historiaAtencion, 
	acpsy_atencion.idEstadoPacAtencion, 
	acpsy_estadopaciente.detaEstadoPacAtencion, 
	date_format(acpsy_atencion.fechaPacNacimiento,'%d/%m/%Y')as fechaPacNacimiento, 
	acpsy_atencion.tipdocAtencion, 
	acpsy_atencion.nrodocAtencion, 
	acpsy_atencion.apPaternoAtencion, 
	acpsy_atencion.apMaternoAtencion, 
	acpsy_atencion.nombAtencion, 
	date_format(acpsy_atencion.fIngresoAtencion,'%d/%m/%Y')as fIngresoAtencion, 
	acpsy_atencion.servAtencion, 
	acpsy_atencion.camaAtencion, 
	acpsy_atencion.distritoAtencion, 
	acpsy_atencion.edadAtencion, 
	acpsy_atencion.tipSexoAtencion, 
	acpsy_tipsexo.detaTipSexo, 
	acpsy_atencion.financiaAtencion, 
	acpsy_atencion.idEstadoAte, 
	acpsy_estadoatencion.detaEstadoAte
FROM
	acpsy_atencion
	INNER JOIN
	acpsy_estadoatencion
	ON 
		acpsy_atencion.idEstadoAte = acpsy_estadoatencion.idEstadoAte
	INNER JOIN
	acpsy_estadopaciente
	ON 
		acpsy_atencion.idEstadoPacAtencion = acpsy_estadopaciente.idEstadoPacAtencion
	INNER JOIN
	acpsy_tipsexo
	ON 
		acpsy_atencion.tipSexoAtencion = acpsy_tipsexo.idTipSexo
	ORDER BY acpsy_atencion.correlativo_Atencion DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_CONDICIONES_PROF` ()  SELECT idCondicion,detaCondicion FROM acpsy_condicionprof$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_DIAGNOSTICOS` ()  SELECT
acpsy_diagnosticos.idDiagnostico,
acpsy_diagnosticos.cieDiagnostico,
acpsy_diagnosticos.detaDiagnostico 
FROM
	acpsy_diagnosticos 
ORDER BY acpsy_diagnosticos.cieDiagnostico$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_ESTADOS_PACIENTE` ()  SELECT
	acpsy_estadopaciente.idEstadoPacAtencion, 
	acpsy_estadopaciente.detaEstadoPacAtencion
FROM
	acpsy_estadopaciente$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_FAMILIARES` ()  SELECT
	acpsy_famatencion.idFamiliar,
	date_format(acpsy_famatencion.fechaRegistro,'%d/%m/%Y') as fechaRegistro, 
	acpsy_famatencion.idAtencion, 
	acpsy_atencion.cuentaAtencion, 
	acpsy_atencion.historiaAtencion, 
	acpsy_atencion.apPaternoAtencion, 
	acpsy_atencion.apMaternoAtencion, 
	acpsy_atencion.nombAtencion, 
	acpsy_famatencion.tipdocFamiliar, 
	acpsy_famatencion.ndocFamiliar, 
	acpsy_famatencion.nombApFamiliar, 
	acpsy_famatencion.idParentesco, 
	acpsy_parentescofam.detaParentesco, 
	acpsy_famatencion.idTipSexo, 
	acpsy_tipsexo.detaTipSexo, 
	acpsy_famatencion.edadFamiliar, 
	acpsy_famatencion.telcelFamiliar
FROM
	acpsy_famatencion
	INNER JOIN
	acpsy_atencion
	ON 
		acpsy_famatencion.idAtencion = acpsy_atencion.idAtencion
	INNER JOIN
	acpsy_parentescofam
	ON 
		acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
	INNER JOIN
	acpsy_tipsexo
	ON 
		acpsy_famatencion.idTipSexo = acpsy_tipsexo.idTipSexo
	ORDER BY acpsy_famatencion.fechaRegistro DESC, acpsy_famatencion.idFamiliar DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_PARENTESCO` ()  SELECT idParentesco,detaParentesco FROM `acpsy_parentescofam` ORDER BY idParentesco$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_PERFILES_USUARIO` ()  SELECT
	acpsy_perfiles.idPerfil, 
	acpsy_perfiles.detallePerfil
FROM
	acpsy_perfiles$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_PROFESIONALES` ()  SELECT
	acpsy_profesionales.idProfesional,
	acpsy_profesionales.idEstado, 
	acpsy_estadoprof.detaEstadoProf, 
	acpsy_profesionales.idCondicion, 
	acpsy_condicionprof.detaCondicion, 
	acpsy_profesionales.dniProfesional, 
	acpsy_profesionales.cpspProfesional, 
	acpsy_profesionales.apellidosProfesional, 
	acpsy_profesionales.nombresProfesional
FROM
	acpsy_profesionales
	INNER JOIN
	acpsy_estadoprof
	ON 
		acpsy_profesionales.idEstado = acpsy_estadoprof.idEstadoProf
	INNER JOIN
	acpsy_condicionprof
	ON 
		acpsy_profesionales.idCondicion = acpsy_condicionprof.idCondicion$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_SEXO` ()  SELECT
	acpsy_tipsexo.idTipSexo, 
	acpsy_tipsexo.detaTipSexo
FROM
	acpsy_tipsexo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_USUARIOS` ()  SELECT
	acpsy_usuarios.idUsuario, 
	acpsy_usuarios.dniUsuario, 
	acpsy_usuarios.apellidosUsuario, 
	acpsy_usuarios.nombresUsuario, 
	acpsy_usuarios.cuentaUsuario, 
	acpsy_usuarios.correoUsuario, 
	acpsy_usuarios.claveUsuario, 
	acpsy_usuarios.intentosUsuario,
	date_format(acpsy_usuarios.fechaAlta,'%d/%m/%Y') as fechaAlta, 
	acpsy_usuarios.profileUsuario, 
	acpsy_usuarios.idPerfil, 
	acpsy_perfiles.detallePerfil, 
	acpsy_usuarios.idEstado, 
	acpsy_estadosu.detalleEstadoU
FROM
	acpsy_usuarios
	INNER JOIN
	acpsy_perfiles
	ON 
		acpsy_usuarios.idPerfil = acpsy_perfiles.idPerfil
	INNER JOIN
	acpsy_estadosu
	ON 
		acpsy_usuarios.idEstado = acpsy_estadosu.idEstado 
	ORDER BY acpsy_usuarios.idPerfil ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LOGIN_USUARIO` (IN `_cuentaUsuario` VARCHAR(50))  SELECT
	acpsy_usuarios.idUsuario, 
	acpsy_usuarios.dniUsuario, 
	acpsy_usuarios.apellidosUsuario, 
	acpsy_usuarios.nombresUsuario, 
	acpsy_usuarios.cuentaUsuario, 
	acpsy_usuarios.correoUsuario, 
	acpsy_usuarios.claveUsuario, 
	acpsy_usuarios.intentosUsuario, 
	acpsy_usuarios.fechaAlta, 
	acpsy_usuarios.profileUsuario, 
	acpsy_usuarios.idPerfil, 
	acpsy_perfiles.detallePerfil, 
	acpsy_usuarios.idEstado, 
	acpsy_estadosu.detalleEstadoU
FROM
	acpsy_usuarios
	INNER JOIN
	acpsy_perfiles
	ON 
		acpsy_usuarios.idPerfil = acpsy_perfiles.idPerfil
	INNER JOIN
	acpsy_estadosu
	ON 
		acpsy_usuarios.idEstado = acpsy_estadosu.idEstado 
WHERE acpsy_usuarios.cuentaUsuario = _cuentaUsuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_ATENCION` (IN `_fRegistroAtencion` DATE, IN `_idEpisodio` TEXT, IN `_cuentaAtencion` VARCHAR(20), IN `_historiaAtencion` VARCHAR(20), IN `_idEstadoPacAtencion` INT(11), IN `_fechaPacNacimiento` DATE, IN `_tipdocAtencion` VARCHAR(20), IN `_nrodocAtencion` VARCHAR(15), IN `_apPaternoAtencion` VARCHAR(30), IN `_apMaternoAtencion` VARCHAR(30), IN `_nombAtencion` VARCHAR(30), IN `_fIngresoAtencion` DATE, IN `_servAtencion` VARCHAR(100), IN `_camaAtencion` VARCHAR(20), IN `_distritoAtencion` VARCHAR(100), IN `_edadAtencion` VARCHAR(20), IN `_tipSexoAtencion` INT(11), IN `_financiaAtencion` VARCHAR(50), IN `_idURegAtencion` INT(11))  INSERT INTO acpsy_atencion (
	fRegistroAtencion,
	idEpisodio,
	cuentaAtencion,
	historiaAtencion,
	idEstadoPacAtencion,
	fechaPacNacimiento,
	tipdocAtencion,
	nrodocAtencion,
	apPaternoAtencion,
	apMaternoAtencion,
	nombAtencion,
	fIngresoAtencion,
	servAtencion,
	camaAtencion,
	distritoAtencion,
	edadAtencion,
	tipSexoAtencion,
	financiaAtencion,
	idURegAtencion 
)
VALUES
	(
		_fRegistroAtencion,
		_idEpisodio,
		_cuentaAtencion,
		_historiaAtencion,
		_idEstadoPacAtencion,
		_fechaPacNacimiento,
		_tipdocAtencion,
		_nrodocAtencion,
		_apPaternoAtencion,
		_apMaternoAtencion,
		_nombAtencion,
		_fIngresoAtencion,
		_servAtencion,
		_camaAtencion,
		_distritoAtencion,
		_edadAtencion,
		_tipSexoAtencion,
		_financiaAtencion,
	_idURegAtencion 
	)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_AUDATENCION` (IN `_idAtencion` INT(11), IN `_fechaRegAudi` DATE, IN `_idUsuario` INT(11), IN `_AccRealizada` TEXT, IN `_cuentaAnterior` TEXT, IN `_EpisodioAnterior` TEXT, IN `_cuentaNueva` TEXT, IN `_EpisodioNuevo` TEXT)  INSERT INTO zacpsy_aud_atenciones ( idAtencion, fechaRegAudi, idUsuario, AccRealizada, cuentaAnterior, EpisodioAnterior, cuentaNueva, EpisodioNuevo )
VALUES
	(
		_idAtencion,
		_fechaRegAudi,
		_idUsuario,
		_AccRealizada,
		_cuentaAnterior,
		_EpisodioAnterior,
	_cuentaNueva,
	_EpisodioNuevo)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_AUDATENCION2` (IN `_idAtencion` INT(11), IN `_fechaRegAudi` DATE, IN `_idUsuario` INT(11), IN `_AccRealizada` TEXT, IN `_cuentaAnterior` TEXT, IN `_EpisodioAnterior` TEXT)  INSERT INTO zacpsy_aud_atenciones (idAtencion, fechaRegAudi, idUsuario, AccRealizada, cuentaAnterior, EpisodioAnterior)
VALUES
	(
		_idAtencion,
		_fechaRegAudi,
		_idUsuario,
		_AccRealizada,
		_cuentaAnterior,
		_EpisodioAnterior)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_AUDFAMILIAR` (IN `_idFamiliar` INT(11), IN `_fecRegAudi` DATE, IN `_idUsuario` INT(11), IN `_AccRealizada` TEXT, IN `_idAtencionAnt` INT(11), IN `_ndocAnt` VARCHAR(20), IN `_idAtencionNueva` INT(11), IN `_ndocNuevo` VARCHAR(20))  INSERT INTO zacpsy_aud_familiares (idFamiliar,fecRegAudi, idUsuario, AccRealizada, idAtencionAnt, ndocAnt, idAtencionNueva, ndocNuevo )
VALUES
	( _idFamiliar,_fecRegAudi, _idUsuario, _AccRealizada, _idAtencionAnt, _ndocAnt, _idAtencionNueva, _ndocNuevo )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_AUDFAMILIAR2` (IN `_idFamiliar` INT(11), IN `_fecRegAudi` DATE, IN `_idUsuario` INT(11), IN `_AccRealizada` TEXT, IN `_idAtencionAnt` INT(11), IN `_ndocAnt` VARCHAR(20))  INSERT INTO zacpsy_aud_familiares ( idFamiliar,fecRegAudi, idUsuario, AccRealizada, idAtencionAnt, ndocAnt)
VALUES
	(_idFamiliar,_fecRegAudi, _idUsuario, _AccRealizada, _idAtencionAnt, _ndocAnt)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_DIAGNOSTICO` (IN `_cieDiagnostico` VARCHAR(20), IN `_detaDiagnostico` VARCHAR(100))  INSERT INTO acpsy_diagnosticos(cieDiagnostico,detaDiagnostico) VALUES(_cieDiagnostico,_detaDiagnostico)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_FAMILIARES` (IN `_fechaRegistro` DATE, IN `_idUsuario` INT(11), IN `_idAtencion` INT(11), IN `_idParentesco` INT(11), IN `_idTipSexo` INT(11), IN `_tipdocFamiliar` VARCHAR(20), IN `_ndocFamiliar` VARCHAR(20), IN `_nombApFamiliar` VARCHAR(100), IN `_edadFamiliar` VARCHAR(20), IN `_telcelFamiliar` VARCHAR(12))  INSERT INTO acpsy_famatencion ( fechaRegistro, idUsuario, idAtencion, idParentesco, idTipSexo, tipdocFamiliar, ndocFamiliar, nombApFamiliar, edadFamiliar, telcelFamiliar )
VALUES
	( _fechaRegistro, _idUsuario, _idAtencion, _idParentesco, _idTipSexo, _tipdocFamiliar, _ndocFamiliar, _nombApFamiliar, _edadFamiliar, _telcelFamiliar )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_PROFESIONAL` (IN `_idCondicion` INT(11), `_dniProfesional` VARCHAR(15), IN `_cpspProfesional` VARCHAR(25), IN `_apellidosProfesional` VARCHAR(50), IN `_nombresProfesional` VARCHAR(50))  INSERT INTO acpsy_profesionales(idCondicion,dniProfesional,cpspProfesional,apellidosProfesional,nombresProfesional) VALUES(_idCondicion,_dniProfesional,_cpspProfesional,_apellidosProfesional,_nombresProfesional)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_USUARIO` (IN `_idPerfil` INT(11), IN `_dniUsuario` VARCHAR(20), IN `_apellidosUsuario` VARCHAR(50), IN `_nombresUsuario` VARCHAR(50), IN `_cuentaUsuario` VARCHAR(50), IN `_correoUsuario` VARCHAR(50), IN `_claveUsuario` VARCHAR(100))  INSERT INTO acpsy_usuarios ( idPerfil, dniUsuario, apellidosUsuario, nombresUsuario, cuentaUsuario, correoUsuario, claveUsuario )
VALUES
	( _idPerfil, _dniUsuario, _apellidosUsuario, _nombresUsuario, _cuentaUsuario, _correoUsuario, _claveUsuario )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRO_INTENTOS` (IN `_idUsuario` INT(11))  BEGIN
UPDATE acpsy_usuarios SET intentosUsuario = intentosUsuario + 1 WHERE idUsuario = _idUsuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VALIDA_FAMILIAR` (IN `_idAtencion` INT(11), IN `_ndocFamiliar` VARCHAR(20))  SELECT
	acpsy_famatencion.idFamiliar, 
	acpsy_famatencion.idAtencion, 
	acpsy_famatencion.ndocFamiliar
FROM
	acpsy_famatencion
WHERE idAtencion = _idAtencion AND ndocFamiliar = _ndocFamiliar$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_atencion`
--

CREATE TABLE `acpsy_atencion` (
  `idAtencion` int(11) NOT NULL,
  `correlativo_Atencion` text COLLATE utf8_bin,
  `fRegistroAtencion` date NOT NULL,
  `idEpisodio` text COLLATE utf8_bin NOT NULL,
  `cuentaAtencion` varchar(20) COLLATE utf8_bin NOT NULL,
  `historiaAtencion` varchar(20) COLLATE utf8_bin NOT NULL,
  `idEstadoPacAtencion` int(11) DEFAULT '0',
  `fechaPacNacimiento` date NOT NULL,
  `tipdocAtencion` varchar(20) COLLATE utf8_bin NOT NULL,
  `nrodocAtencion` varchar(15) COLLATE utf8_bin NOT NULL,
  `apPaternoAtencion` varchar(30) COLLATE utf8_bin NOT NULL,
  `apMaternoAtencion` varchar(30) COLLATE utf8_bin NOT NULL,
  `nombAtencion` varchar(30) COLLATE utf8_bin NOT NULL,
  `fIngresoAtencion` date NOT NULL,
  `servAtencion` varchar(100) COLLATE utf8_bin NOT NULL,
  `camaAtencion` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `distritoAtencion` varchar(100) COLLATE utf8_bin NOT NULL,
  `edadAtencion` varchar(20) COLLATE utf8_bin NOT NULL,
  `tipSexoAtencion` int(11) NOT NULL,
  `financiaAtencion` varchar(50) COLLATE utf8_bin NOT NULL,
  `idURegAtencion` int(11) NOT NULL,
  `idEstadoAte` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_atencion`
--

INSERT INTO `acpsy_atencion` (`idAtencion`, `correlativo_Atencion`, `fRegistroAtencion`, `idEpisodio`, `cuentaAtencion`, `historiaAtencion`, `idEstadoPacAtencion`, `fechaPacNacimiento`, `tipdocAtencion`, `nrodocAtencion`, `apPaternoAtencion`, `apMaternoAtencion`, `nombAtencion`, `fIngresoAtencion`, `servAtencion`, `camaAtencion`, `distritoAtencion`, `edadAtencion`, `tipSexoAtencion`, `financiaAtencion`, `idURegAtencion`, `idEstadoAte`) VALUES
(1, 'ACP-2021-000001', '2021-05-14', '448978', '1897886', '743643', 2, '1996-08-15', 'DNI', '74642267', 'RODRIGUEZ', 'GARRAFA', 'LUIS', '2021-05-12', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '25', 1, 'PARTICULAR', 1, 1),
(2, 'ACP-2021-000002', '2021-05-14', '449679', '1896174', '1305560', 2, '1977-11-25', 'DNI', '10743021', 'RUIZ', 'VILLEGAS', 'TONY', '2021-05-15', 'COVID VI HOSPITALIZACION (PAB_PEDIATRIA) - HOSPITALIZACIÓN ', '', 'COMAS', '44', 1, 'PARTICULAR', 1, 1),
(3, 'ACP-2021-000003', '2021-05-14', '448431', '1897872', '1336172', 2, '1966-02-05', 'DNI', '09045878', 'ATAUCUSI', 'LUDEÑA', 'ANGEL', '2021-05-10', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'INDEPENDENCIA', '55', 1, 'PARTICULAR', 1, 1),
(4, 'ACP-2021-000004', '2021-05-14', '449219', '1898576', '491430', 2, '1974-08-31', 'DNI', '09984155', 'RIVERA', 'YUPANQUI', 'YNES', '2021-05-13', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '47', 2, 'SOAT', 1, 1),
(5, 'ACP-2021-000005', '2021-05-14', '444305', '1893913', '310793', 2, '1942-01-02', 'DNI', '06857535', 'CORONADO', 'CASTILLO', 'TOMAS', '2021-04-19', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '79', 1, 'CONVENIOS PÚBLICOS', 1, 1),
(6, 'ACP-2021-000006', '2021-05-14', '448733', '1895833', '1335290', 2, '1984-11-25', 'DNI', '44600766', 'SEVERINO', 'RIVAS', 'ISRRAEL', '2021-05-11', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '37', 1, 'PARTICULAR', 1, 1),
(7, 'ACP-2021-000007', '2021-05-14', '449217', '1898480', '185789', 2, '1953-04-04', 'DNI', '09030560', 'MONGE', 'MUÑOZ', 'JORGE', '2021-05-13', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '68', 1, 'PARTICULAR', 1, 1),
(8, 'ACP-2021-000008', '2021-05-14', '448708', '1895344', '1335076', 2, '1973-11-22', 'DNI', '48193734', 'ZANCA', 'CUADROS', 'EDSON', '2021-05-11', 'COVID VI HOSPITALIZACION (PAB_PEDIATRIA) - HOSPITALIZACIÓN ', '', 'COMAS', '48', 1, 'CONVENIOS PÚBLICOS', 1, 1),
(9, 'ACP-2021-000009', '2021-05-14', '448735', '1898116', '1336254', 1, '1979-10-21', 'DNI', '80645612', 'ALVA', 'FANO', 'MARCOS', '2021-05-11', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'LOS OLIVOS', '42', 1, 'PARTICULAR', 1, 1),
(10, 'ACP-2021-000010', '2021-05-14', '446113', '1895970', '1335355', 3, '1956-09-17', 'DNI', '07074275', 'CHAVEZ', 'ABANTO', 'CARLOS', '2021-04-28', 'CORONAVIRUS - EMERGENCIA', '', 'EL AGUSTINO', '65', 1, 'PARTICULAR', 1, 1),
(11, 'ACP-2021-000011', '2021-05-14', '448246', '1897753', '1116030', 3, '1997-11-26', 'DNI', '73771531', 'QUISPE', 'HANCCO', 'EMILIANA', '2021-05-09', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '24', 2, 'PARTICULAR', 1, 1),
(12, 'ACP-2021-000012', '2021-05-14', '448249', '1897811', '1336149', 1, '1974-04-23', 'DNI', '10155015', 'COLLANTES', 'CARRASCO', 'PEDRO', '2021-05-09', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '47', 1, 'PARTICULAR', 1, 1),
(13, 'ACP-2021-000013', '2021-05-14', '449214', '1898553', '1336428', 2, '1967-10-10', 'DNI', '09479847', 'GIRON', 'ARTEAGA', 'CESAR', '2021-05-13', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '54', 1, 'PARTICULAR', 1, 1),
(14, 'ACP-2021-000014', '2021-05-14', '447059', '1896394', '1335583', 2, '1959-07-07', 'DNI', '06054839', 'GIRALDO', 'ZANABRIA', 'MARIA', '2021-05-03', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'LIMA', '62', 2, 'PARTICULAR', 1, 1),
(15, 'ACP-2021-000015', '2021-05-15', '448809', '1898378', '1336372', 1, '1940-03-04', 'DNI', '06823126', 'CHUIMA', 'AYALA', 'SAUL', '2021-05-11', 'CORONAVIRUS - EMERGENCIA', '', 'CARABAYLLO', '81', 1, 'PARTICULAR', 1, 1),
(16, 'ACP-2021-000016', '2021-05-15', '447611', '1896821', '1335713', 3, '1956-11-29', 'DNI', '06712654', 'SANCHEZ', 'QUIROZ', 'CRISTOBAL', '2021-05-05', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL38', 'SAN MARTIN DE PORRES', '65', 1, 'PARTICULAR', 1, 1),
(17, 'ACP-2021-000017', '2021-05-15', '450791', '1894369', '1197765', 1, '1977-11-13', 'DNI', '03692991', 'COVEÑAS', 'NAMUCHE', 'JOSE', '2021-05-21', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL28', 'COMAS', '44', 1, 'PARTICULAR', 1, 1),
(18, 'ACP-2021-000018', '2021-05-15', '449037', '1898585', '1336442', 3, '1964-10-04', 'DNI', '09250003', 'SANDOVAL', 'JIMENEZ', 'JUAN', '2021-05-12', 'CORONAVIRUS - EMERGENCIA', 'ACE19 ', 'CARABAYLLO', '57', 1, 'PARTICULAR', 1, 1),
(19, 'ACP-2021-000019', '2021-05-15', '444273', '1894054', '1334569', 1, '1958-03-05', 'DNI', '10160446', 'HUAMAN', 'HILARIO', 'ROSARIO', '2021-04-19', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'SAN MARTIN DE PORRES', '63', 2, 'PARTICULAR', 1, 1),
(20, 'ACP-2021-000020', '2021-05-15', '448904', '1898404', '1336381', 1, '1957-01-12', 'DNI', '07815407', 'JINES', 'BRAVO', 'FRANCISCO', '2021-05-12', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL01', 'INDEPENDENCIA', '64', 1, 'PARTICULAR', 1, 1),
(21, 'ACP-2021-000021', '2021-05-15', '448248', '1897804', '1336147', 1, '1956-04-26', 'DNI', '06733983', 'DOLORES', 'AREVALO', 'JULIO', '2021-05-09', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL02', 'PUENTE PIEDRA', '65', 1, 'PARTICULAR', 1, 1),
(22, 'ACP-2021-000022', '2021-05-15', '446676', '1891455', '1333492', 2, '1964-12-12', 'DNI', '08750121', 'CUELLO', 'AGUILAR', 'INES', '2021-05-01', 'COVID LEGADO - HOSPITALIZACIÓN ', 'C004', 'COMAS', '57', 2, 'PARTICULAR', 1, 1),
(23, 'ACP-2021-000023', '2021-05-15', '448732', '1896555', '672407', 2, '1976-10-12', 'DNI', '10391720', 'GUERRERO', 'BELLO', 'PEDRO', '2021-05-11', 'COVID LEGADO - HOSPITALIZACIÓN ', 'C014', 'LINCE', '45', 1, 'PARTICULAR', 1, 1),
(24, 'ACP-2021-000024', '2021-05-15', '443872', '1893458', '657021', 2, '1958-11-03', 'DNI', '07059841', 'AGUIRRE', 'YATACO', 'ANDRES', '2021-04-17', 'COVID VI HOSPITALIZACION (PAB_PEDIATRIA) - HOSPITALIZACIÓN ', 'C010', 'COMAS', '63', 1, 'PARTICULAR', 1, 1),
(25, 'ACP-2021-000025', '2021-05-15', '450703', '1898377', '1062807', 1, '1948-10-16', 'DNI', '22977852', 'HUARANGA', 'CASTAÑEDA', 'FLORENTINO', '2021-05-20', 'MEDICINA - HOSPITALIZACIÓN ', 'MED29', 'COMAS', '73', 1, 'PARTICULAR', 1, 1),
(26, 'ACP-2021-000026', '2021-05-17', '449541', '1898950', '1336546', 1, '1953-10-24', 'DNI', '33255282', 'MORI', 'VEGA', 'RAFAEL', '2021-05-15', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL32', 'NUEVO CHIMBOTE', '68', 1, 'PARTICULAR', 1, 1),
(27, 'ACP-2021-000027', '2021-05-17', '450226', '1899297', '1336669', 1, '1967-12-08', 'DNI', '80187653', 'VILLANUEVA', 'MARTINEZ', 'DELIA', '2021-05-18', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL40', 'MIRAFLORES', '54', 2, 'PARTICULAR', 1, 1),
(28, 'ACP-2021-000028', '2021-05-17', '448148', '1897643', '1336098', 2, '1968-04-06', 'DNI', '09360790', 'CAPCHA', 'CAPCHA', 'FELIX', '2021-05-08', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL29', 'CARABAYLLO', '53', 1, 'CONVENIOS PÚBLICOS', 1, 1),
(29, 'ACP-2021-000029', '2021-05-17', '450224', '1899088', '1336590', 2, '1987-10-15', 'DNI', '48193253', 'PACHECO', 'GUTIERREZ', 'MILAGROS', '2021-05-18', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL27', 'PUENTE PIEDRA', '34', 2, 'SOAT', 1, 1),
(30, 'ACP-2021-000030', '2021-05-17', '450023', '1899263', '1336657', 1, '1964-05-07', 'DNI', '06892165', 'HUARANGA', 'ROJAS', 'FREDY', '2021-05-17', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL04', 'COMAS', '57', 1, 'PARTICULAR', 1, 1),
(31, 'ACP-2021-000031', '2021-05-17', '446864', '1896652', '607219', 1, '1973-06-28', 'DNI', '09978974', 'BAUTISTA', 'CUEVA', 'JUAN', '2021-05-02', 'CORONAVIRUS - EMERGENCIA', '', 'COMAS', '48', 1, 'PARTICULAR', 1, 1),
(32, 'ACP-2021-000032', '2021-05-17', '449689', '1898107', '1336251', 2, '1985-05-01', 'DNI', '44469369', 'ALVA', 'MARTINEZ', 'WILBER', '2021-05-15', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL16', 'PUENTE PIEDRA', '36', 1, 'PARTICULAR', 1, 1),
(33, 'ACP-2021-000033', '2021-05-17', '449692', '1898496', '1219409', 2, '1970-04-13', 'DNI', '07469035', 'JEANNEAU', 'CORNEJO', 'DENIS', '2021-05-15', 'COVID LEGADO - HOSPITALIZACIÓN ', ' CL48', 'CARABAYLLO', '51', 1, 'PARTICULAR', 1, 1),
(34, 'ACP-2021-000034', '2021-05-17', '438093', '1888321', '733889', 2, '1938-01-19', 'DNI', '06894119', 'HUERTA', 'GAMBOA', 'PLACIDO', '2021-03-21', 'COVID VI HOSPITALIZACION (PAB_PEDIATRIA) - HOSPITALIZACIÓN ', 'C017', 'COMAS', '83', 1, 'PARTICULAR', 1, 1),
(35, 'ACP-2021-000035', '2021-05-17', '448736', '1898115', '932359', 2, '1971-03-07', 'DNI', '10392437', 'PISCOYA', 'MALAVER', 'ELDER', '2021-05-11', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '50', 1, 'PARTICULAR', 1, 1),
(36, 'ACP-2021-000036', '2021-05-17', '445831', '1895506', '255336', 1, '1968-08-31', 'DNI', '09544910', 'SILVA', 'ALCA', 'ANGEL', '2021-04-27', 'CIRUGIA GENERAL - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '53', 1, 'PARTICULAR', 1, 1),
(37, 'ACP-2021-000037', '2021-05-18', '444537', '1894291', '262835', 2, '1959-05-20', 'DNI', '06902138', 'CASTRO', 'GUZMAN', 'VICTORIA', '2021-04-20', 'COVID VII - HOSPITALIZACIÓN ', 'C008', 'COMAS', '62', 2, 'PARTICULAR', 1, 1),
(38, 'ACP-2021-000038', '2021-05-18', '447606', '1893862', '250999', 1, '1965-09-22', 'DNI', '06878591', 'ESPINOZA', 'HUAMAN', 'NILA', '2021-05-05', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '56', 2, 'PARTICULAR', 1, 1),
(39, 'ACP-2021-000039', '2021-05-18', '447627', '1897081', '1335823', 1, '1935-10-02', 'DNI', '32889076', 'ESTRELLA', 'LLANOS', 'CUSTODIO', '2021-05-06', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL13', 'COMAS', '86', 1, 'PARTICULAR', 1, 1),
(40, 'ACP-2021-000040', '2021-05-18', '450221', '1899459', '1336714', 3, '1960-07-20', 'DNI', '08637118', 'ALVARADO', 'RODRIGUEZ', 'RAUL', '2021-05-18', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL37', 'PUENTE PIEDRA', '61', 1, 'PARTICULAR', 1, 1),
(41, 'ACP-2021-000041', '2021-05-18', '449696', '1898441', '1336395', 2, '1995-07-02', 'DNI', '60087845', 'ROQUE', 'JARAMILLO', 'CESAR', '2021-05-15', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL40', 'SAN MARTIN DE PORRES', '26', 1, 'PARTICULAR', 1, 1),
(42, 'ACP-2021-000042', '2021-05-18', '450223', '1899192', '1336633', 2, '1989-02-08', 'DNI', '45595288', 'CHAVEZ', 'CRISOSTOMO', 'GIANCARLO', '2021-05-18', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL25', 'CARABAYLLO', '32', 1, 'PARTICULAR', 1, 1),
(43, 'ACP-2021-000043', '2021-05-18', '449694', '1898420', '1336386', 2, '1951-03-17', 'DNI', '06850616', 'PALLIN', 'HUARCAYA', 'ALEJANDRO', '2021-05-15', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL45', 'COMAS', '70', 1, 'PARTICULAR', 1, 1),
(44, 'ACP-2021-000044', '2021-05-18', '447603', '1887281', '204522', 1, '1972-05-10', 'DNI', '10396972', 'CALDERON', 'ARGUME', 'ISAAC', '2021-05-05', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '49', 1, 'PARTICULAR', 1, 1),
(45, 'ACP-2021-000045', '2021-05-19', '0', '1898538', '634164', 2, '1965-06-23', 'DNI', '09113777', 'BUITRON', 'VEGA', 'TELMA', '2021-05-12', 'SALUD OCUPACIONAL - CONSULTORIOS EXTERNOS', '', 'COMAS', '56', 2, 'PARTICULAR', 1, 1),
(46, 'ACP-2021-000046', '2021-05-19', '0', '1904362', '221448', 2, '1959-10-02', 'DNI', '09193811', 'REINA', 'RODRIGUEZ', 'ADELAIDA', '2021-05-11', 'SALUD OCUPACIONAL - CONSULTORIOS EXTERNOS', NULL, 'COMAS', '62', 2, 'PARTICULAR', 1, 1),
(47, 'ACP-2021-000047', '2021-05-19', '0', '1897247', '846432', 2, '1984-07-02', 'DNI', '42510126', 'FLORES', 'HUETE', 'DIANA YOLANDA', '2021-05-05', 'SALUD OCUPACIONAL - CONSULTORIOS EXTERNOS', NULL, 'COMAS', '37', 2, 'PARTICULAR', 1, 1),
(48, 'ACP-2021-000048', '2021-05-19', '449224', '1898174', '1170373', 3, '1938-02-23', 'DNI', '06933881', 'YSUSQUIZA', 'ARIAS VDA DE FLORES', 'MARGARITA', '2021-05-13', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '83', 2, 'SOAT', 1, 1),
(49, 'ACP-2021-000049', '2021-05-19', '448436', '1897944', '1336193', 2, '1969-08-19', 'DNI', '09545466', 'RAMIREZ', 'LOZANO DE DELGADO', 'ANA', '2021-05-10', 'COVID LEGADO - HOSPITALIZACIÓN ', 'C009', 'COMAS', '52', 2, 'PARTICULAR', 1, 1),
(50, 'ACP-2021-000050', '2021-05-19', '443658', '1892871', '821090', 2, '1952-06-30', 'DNI', '06895144', 'CANALES', 'SUAREZ', 'JOSE', '2021-04-16', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '69', 1, 'PARTICULAR', 1, 1),
(51, 'ACP-2021-000051', '2021-05-19', '450400', '1899641', '833277', 1, '1955-12-25', 'DNI', '08740384', 'QUISPE', 'MALCA', 'JUANA', '2021-05-19', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL36', 'CARABAYLLO', '66', 2, 'PARTICULAR', 1, 1),
(52, 'ACP-2021-000052', '2021-05-19', '450228', '1899508', '1289162', 3, '1951-08-29', 'DNI', '32116792', 'VILLANUEVA', 'DE URQUIZA', 'MARIA', '2021-05-18', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL21', 'MAGDALENA DEL MAR', '70', 2, 'PARTICULAR', 1, 1),
(53, 'ACP-2021-000053', '2021-05-19', '448734', '1897459', '1336041', 2, '1952-11-19', 'DNI', '06209024', 'ZEVALLOS', 'RODRIGUEZ', 'LUIS', '2021-05-11', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL30', 'LOS OLIVOS', '69', 1, 'CONVENIOS PÚBLICOS', 1, 1),
(54, 'ACP-2021-000054', '2021-05-19', '449688', '1898638', '1336457', 2, '1986-09-29', 'DNI', '43827657', 'NUÑEZ', 'CHACHAPOYAS', 'DECIDERIO', '2021-05-15', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL05', 'COMAS', '35', 1, 'PARTICULAR', 1, 1),
(55, 'ACP-2021-000055', '2021-05-19', '450399', '1898813', '704771', 2, '1978-10-03', 'DNI', '42642702', 'PAREDES', 'ESPINOZA', 'JIMMY', '2021-05-19', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL06', 'COMAS', '43', 1, 'PARTICULAR', 1, 1),
(56, 'ACP-2021-000056', '2021-05-21', '450784', '1900161', '1336928', 3, '1954-03-28', 'DNI', '07171635', 'RODRIGUEZ', 'HURTADO', 'SANTOS', '2021-05-21', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL30', 'COMAS', '67', 2, 'PARTICULAR', 1, 1),
(57, 'ACP-2021-000057', '2021-05-21', '449225', '1898514', '1179507', 2, '1964-05-22', 'DNI', '06244998', 'RODRIGUEZ', 'CANICOBA', 'AMERICO', '2021-05-13', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '57', 1, 'PARTICULAR', 1, 1),
(58, 'ACP-2021-000058', '2021-05-21', '450831', '1900214', '169433', 1, '1960-02-29', 'DNI', '06829321', 'CRISOSTOMO', 'VASQUEZ', 'JUANA', '2021-05-21', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '61', 2, 'PARTICULAR', 1, 1),
(59, 'ACP-2021-000059', '2021-05-21', '450725', '1900029', '583956', 1, '1951-10-29', 'DNI', '08277253', 'CASTRO', 'GARRO', 'JULIAN', '2021-05-20', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL05', 'COMAS', '70', 1, 'PARTICULAR', 1, 1),
(60, 'ACP-2021-000060', '2021-05-21', '450748', '1900132', '1336918', 1, '1931-09-20', 'DNI', '33570439', 'GALVEZ', 'RODAS', 'CIRO', '2021-05-20', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL42', 'ANCON', '90', 1, 'PARTICULAR', 1, 1),
(61, 'ACP-2021-000061', '2021-05-21', '445813', '1895580', '1269227', 2, '1952-09-02', 'DNI', '22753645', 'NOLASCO', 'MIDOLO', 'ESTEBAN', '2021-04-27', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL04', 'COMAS', '69', 1, 'PARTICULAR', 1, 1),
(62, 'ACP-2021-000062', '2021-05-21', '450235', '1895256', '96012', 1, '1968-11-18', 'DNI', '09477022', 'ALLAUCA', 'SOTELO', 'LUCY', '2021-05-18', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL03', 'COMAS', '53', 2, 'PARTICULAR', 1, 1),
(63, 'ACP-2021-000063', '2021-05-21', '450237', '1899526', '1336727', 1, '1962-09-10', 'DNI', '10438710', 'CAMARENA', 'CABALLERO', 'WILVER', '2021-05-18', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL12', 'CARABAYLLO', '59', 1, 'PARTICULAR', 1, 1),
(64, 'ACP-2021-000064', '2021-05-21', '451679', '1898982', '1336560', 1, '1982-04-27', 'DNI', '42386539', 'DIESTRA', 'FLORES', 'MAURA', '2021-05-25', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL16', 'PUENTE PIEDRA', '39', 2, 'PARTICULAR', 1, 1),
(65, 'ACP-2021-000065', '2021-05-23', '450943', '1900348', '1087967', 3, '1956-07-09', 'DNI', '19546367', 'MARCELO', 'ESTEBAN', 'ANTONIA', '2021-05-21', 'CORONAVIRUS - EMERGENCIA', '', 'CARABAYLLO', '65', 2, 'PARTICULAR', 1, 1),
(66, 'ACP-2021-000066', '2021-05-23', '451680', '1900226', '1239824', 1, '1957-11-10', 'DNI', '06854425', 'ROMERO', 'ESPINOZA', 'JOYA', '2021-05-25', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '64', 2, 'PARTICULAR', 1, 1),
(67, 'ACP-2021-000067', '2021-05-23', '451683', '1898906', '1186051', 1, '1952-04-20', 'DNI', '01042552', 'SILVA', 'SANDOVAL', 'YOLANDA', '2021-05-25', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '69', 2, 'PARTICULAR', 1, 1),
(68, 'ACP-2021-000068', '2021-05-23', '451993', '1898978', '1336558', 1, '1988-02-07', 'DNI', '45855221', 'POCLIN', 'MENDOZA', 'WILBERT', '2021-05-26', 'COVID UCI - HOSPITALIZACIÓN ', '', 'COMAS', '33', 1, 'CONVENIOS PÚBLICOS', 1, 1),
(69, 'ACP-2021-000069', '2021-05-23', '450934', '1900336', '1132150', 3, '1972-07-03', 'DNI', '09971482', 'CARRILLO', 'QUIROGA', 'MARCO', '2021-05-21', 'CORONAVIRUS - EMERGENCIA', '', 'COMAS', '49', 1, 'PARTICULAR', 1, 1),
(70, 'ACP-2021-000070', '2021-05-23', '450932', '1900334', '1336965', 3, '1960-05-21', 'DNI', '08535587', 'LEON', 'ANTAYHUA', 'RAUL', '2021-05-21', 'CORONAVIRUS - EMERGENCIA', '', 'SAN MARTIN DE PORRES', '61', 1, 'PARTICULAR', 1, 1),
(71, 'ACP-2021-000071', '2021-05-23', '451875', '1900234', '1336940', 1, '1968-08-11', 'DNI', '09518612', 'DIAZ', 'BRIOS', 'ENRIQUE', '2021-05-26', 'COVID UCI - HOSPITALIZACIÓN ', '', 'INDEPENDENCIA', '53', 1, 'PARTICULAR', 1, 1),
(72, 'ACP-2021-000072', '2021-05-24', '451354', '1900642', '1154977', 1, '1972-05-09', 'DNI', '05349441', 'PINEDO', 'IZQUIERDO', 'OFELIA', '2021-05-23', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '49', 2, 'PARTICULAR', 1, 1),
(73, 'ACP-2021-000073', '2021-05-24', '451353', '1900634', '1337051', 1, '1952-02-21', 'DNI', '07155112', 'REATEGUI', 'GUERRA', 'MIRTHA', '2021-05-23', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'INDEPENDENCIA', '69', 2, 'PARTICULAR', 1, 1),
(74, 'ACP-2021-000074', '2021-05-24', '451686', '1900504', '1337007', 1, '1986-08-30', 'DNI', '43858360', 'AMADO', 'GUERRERO', 'ROSA', '2021-05-25', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'PUENTE PIEDRA', '35', 2, 'PARTICULAR', 1, 1),
(75, 'ACP-2021-000075', '2021-05-24', '445682', '1895119', '597057', 1, '1976-03-06', 'DNI', '80066220', 'NOLASCO', 'HILARIO', 'LUIS', '2021-04-26', 'COVID VI HOSPITALIZACION (PAB_PEDIATRIA) - HOSPITALIZACIÓN ', '', 'COMAS', '45', 1, 'PARTICULAR', 1, 1),
(76, 'ACP-2021-000076', '2021-05-24', '448433', '1897928', '1336188', 1, '1982-07-25', 'DNI', '46338604', 'HUAMANCCARI', 'AÑO', 'YANET', '2021-05-10', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '39', 2, 'CONVENIOS PÚBLICOS', 1, 1),
(77, 'ACP-2021-000077', '2021-05-24', '448439', '1896907', '1335749', 1, '1960-08-10', 'DNI', '06041838', 'INGAROCA', 'VARGAS', 'NERI', '2021-05-10', 'COVID UCI - HOSPITALIZACIÓN ', '', 'SAN MARTIN DE PORRES', '61', 1, 'SOAT', 1, 1),
(78, 'ACP-2021-000078', '2021-05-24', '440495', '1890628', '86365', 1, '1969-09-10', 'DNI', '09730060', 'FLORES', 'LAZARO', 'LUIS', '2021-04-01', 'COVID VII - HOSPITALIZACIÓN ', '', 'COMAS', '52', 1, 'PARTICULAR', 1, 1),
(79, 'ACP-2021-000079', '2021-05-24', '446672', '1896343', '1335549', 1, '1972-08-28', 'DIE', '11418077', 'VERDE', 'BENAVIDES', 'MIGUEL', '2021-05-01', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '49', 1, 'CONVENIOS PÚBLICOS', 1, 1),
(80, 'ACP-2021-000080', '2021-05-24', '450504', '1899322', '1336679', 3, '1949-02-21', 'DNI', '28306722', 'QUISPE', 'TORRES', 'MAXIMILIANA', '2021-05-19', 'COVID UCI - HOSPITALIZACIÓN ', '', 'LOS OLIVOS', '72', 2, 'SOAT', 1, 1),
(81, 'ACP-2021-000081', '2021-05-24', '446669', '1896280', '1335488', 3, '1984-06-17', 'DNI', '42828368', 'YCHPAS', 'VILCA', 'KARINA', '2021-05-01', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '37', 2, 'PARTICULAR', 1, 1),
(82, 'ACP-2021-000082', '2021-05-24', '445681', '1895363', '358404', 3, '1971-08-13', 'DNI', '10113788', 'CONDORI', 'ANGELINO', 'JOHNNY', '2021-04-26', 'COVID VI HOSPITALIZACION (PAB_PEDIATRIA) - HOSPITALIZACIÓN ', '', 'COMAS', '50', 1, 'PARTICULAR', 1, 1),
(83, 'ACP-2021-000083', '2021-05-24', '451894', '1900573', '1337032', 1, '1963-12-29', 'CE', '8732952', 'GONZALES', 'PAREDES', 'SOL', '2021-05-26', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '58', 2, 'CONVENIOS PÚBLICOS', 1, 1),
(84, 'ACP-2021-000084', '2021-05-24', '451148', '1900524', '1337015', 1, '1984-08-31', 'DNI', '45638538', 'CARHUAZ', 'VILLARREAL', 'IVAN', '2021-05-22', 'CORONAVIRUS - EMERGENCIA', '', 'JUNIN', '37', 1, 'PARTICULAR', 1, 1),
(85, 'ACP-2021-000085', '2021-05-24', '451626', '1900822', '1156002', 1, '1976-07-16', 'DNI', '10391887', 'PAMPAS', 'ROJAS', 'PERCY', '2021-05-25', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '45', 1, 'PARTICULAR', 1, 1),
(86, 'ACP-2021-000086', '2021-05-24', '451192', '1900562', '1337028', 3, '1984-03-08', 'DNI', '43478754', 'QUISPE', 'QUINTO', 'JUAN', '2021-05-22', 'CORONAVIRUS - EMERGENCIA', '', 'SAN JUAN DE LURIGANCHO', '37', 1, 'PARTICULAR', 1, 1),
(87, 'ACP-2021-000087', '2021-05-25', '449981', '1899423', '1094254', 1, '1974-09-19', 'DNI', '09980430', 'CONTRERAS', 'TICONA', 'EUCLIDES', '2021-05-17', 'CORONAVIRUS - EMERGENCIA', '', 'COMAS', '47', 1, 'PARTICULAR', 1, 1),
(88, 'ACP-2021-000088', '2021-05-25', '450995', '1900394', '1336983', 3, '1965-10-21', 'DNI', '07515245', 'MUÑOZ', 'RIOS', 'ROSSANA', '2021-05-21', 'CORONAVIRUS - EMERGENCIA', '', 'LA MOLINA', '56', 2, 'CONVENIOS PÚBLICOS', 1, 1),
(89, 'ACP-2021-000089', '2021-05-25', '448637', '1897876', '1336136', 1, '1955-11-05', 'DNI', '09019081', 'AGUILAR', 'GOMEZ', 'LEONCIO', '2021-05-10', 'MEDICINA - HOSPITALIZACIÓN ', '', 'COMAS', '66', 1, 'PARTICULAR', 1, 1),
(90, 'ACP-2021-000090', '2021-05-25', '451276', '1900644', '1236796', 1, '1931-02-12', 'DNI', '20548719', 'PAUCAR', 'AGUIRRE', 'FAUSTINA', '2021-05-23', 'CORONAVIRUS - EMERGENCIA', '', 'COMAS', '90', 2, 'PARTICULAR', 1, 1),
(91, 'ACP-2021-000091', '2021-05-25', '451492', '1900838', '1109647', 2, '1936-08-14', 'DNI', '06901199', 'PASTOR', 'RAZA', 'LOLA', '2021-05-24', 'CORONAVIRUS - EMERGENCIA', '', 'COMAS', '85', 2, 'CONVENIOS PÚBLICOS', 1, 1),
(92, 'ACP-2021-000092', '2021-05-25', '451895', '1900587', '1337036', 1, '1968-09-01', 'DNI', '44610904', 'GONZALES', 'ORBEGOZO', 'JOSE', '2021-05-26', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'SAN MARTIN DE PORRES', '53', 1, 'PARTICULAR', 1, 1),
(93, 'ACP-2021-000093', '2021-05-26', '1906862', '1900821', '1280076', 2, '1940-02-23', 'DNI', '09028181', 'QUISIYUPANQUI', 'TECSE', 'MACARIO', '2021-05-24', 'TRAUMASHOCK - EMERGENCIA', NULL, 'COMAS', '81', 1, 'PROGRAMA NACIONAL', 1, 1),
(94, 'ACP-2021-000094', '2021-05-26', '448707', '1892826', '437285', 1, '1950-10-02', 'DNI', '09017936', 'PAULINO', 'VELIZ', 'TEOFILO', '2021-05-11', 'COVID VI HOSPITALIZACION (PAB_PEDIATRIA) - HOSPITALIZACIÓN ', 'CL30', 'COMAS', '71', 1, 'PARTICULAR', 1, 1),
(95, 'ACP-2021-000095', '2021-05-26', '451030', '1900341', '1325123', 1, '1956-12-01', 'DNI', '16537352', 'LARA', 'CRUZADO', 'JORGE', '2021-05-22', 'CIRUGIA GENERAL - HOSPITALIZACIÓN ', '', 'CHICLAYO', '65', 1, 'PARTICULAR', 1, 1),
(96, 'ACP-2021-000096', '2021-05-26', '451810', '1901095', '1337179', 3, '1955-12-25', 'DNI', '08543036', 'JARA', 'CHACON', 'MANUEL', '2021-05-25', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'LOS OLIVOS', '66', 1, 'PARTICULAR', 1, 1),
(97, 'ACP-2021-000097', '2021-05-26', '451735', '1901040', '835802', 1, '1952-03-21', 'DNI', '06933227', 'CHAVEZ', 'CARPIO', 'JORGE', '2021-05-25', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '69', 1, 'SOAT', 1, 1),
(98, 'ACP-2021-000098', '2021-05-26', '451839', '1901138', '1337191', 3, '1966-10-09', 'DNI', '09173481', 'VILA', 'MENDOZA DE LIÑAN', 'EMILIA', '2021-05-26', 'CORONAVIRUS - EMERGENCIA', '', 'CARABAYLLO', '55', 2, 'PARTICULAR', 1, 1),
(99, 'ACP-2021-000099', '2021-05-26', '451754', '1901065', '169770', 1, '1980-08-26', 'DNI', '40609520', 'DURAND', 'SANCHEZ', 'MARIA', '2021-05-25', 'CORONAVIRUS - EMERGENCIA', '', 'COMAS', '41', 2, 'PARTICULAR', 1, 1),
(100, 'ACP-2021-000100', '2021-05-27', '451967', '1901270', '1337235', 3, '1961-07-29', 'DNI', '06891299', 'ARANDA', 'GARCIA', 'JORGE', '2021-05-26', 'CORONAVIRUS - EMERGENCIA', '', 'COMAS', '60', 1, 'PARTICULAR', 1, 1),
(101, 'ACP-2021-000101', '2021-05-27', '451980', '1901278', '1337238', 1, '1952-07-18', 'DNI', '06915010', 'CHAVEZ', 'MILLA', 'JULIO', '2021-05-26', 'CORONAVIRUS - EMERGENCIA', '', 'COMAS', '69', 1, 'SOAT', 1, 1),
(102, 'ACP-2021-000102', '2021-05-27', '452403', '1901266', '1299409', 3, '1980-06-11', 'DIE', '15034538', 'MACHADO', 'MEDINA', 'GLEIDYS', '2021-05-28', 'COVID UCI - HOSPITALIZACIÓN ', '', 'COMAS', '41', 2, 'CONVENIOS PÚBLICOS', 1, 1),
(103, 'ACP-2021-000103', '2021-05-27', '451985', '1901283', '1280961', 3, '1981-10-21', 'DNI', '42515485', 'ENRIQUEZ', 'ESPIRITU', 'YARI', '2021-05-26', 'CORONAVIRUS - EMERGENCIA', '', 'COMAS', '40', 2, 'PARTICULAR', 1, 1),
(104, 'ACP-2021-000104', '2021-05-27', '445258', '1895153', '235498', 1, '1944-01-04', 'DNI', '06863133', 'CUCCHE', 'PEREZ', 'IGNACIO', '2021-04-24', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '77', 1, 'PARTICULAR', 1, 1),
(105, 'ACP-2021-000105', '2021-05-28', '452208', '1901423', '427787', 2, '1988-07-26', 'DNI', '47008110', 'OLAYA', 'AGUILAR', 'VANESSA', '2021-05-27', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '33', 2, 'PARTICULAR', 1, 1),
(106, 'ACP-2021-000106', '2021-05-28', '452207', '1901441', '1337278', 2, '1955-08-14', 'DNI', '06565235', 'RIOS', 'CAMARENA', 'MARGARITA', '2021-05-27', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'SAN JUAN DE LURIGANCHO', '66', 2, 'PARTICULAR', 1, 1),
(107, 'ACP-2021-000107', '2021-05-28', '452170', '1901229', '1337220', 2, '1981-01-19', 'DNI', '41979207', 'TERRONES', 'QUISPE', 'EDGAR', '2021-05-27', 'COVID VI HOSPITALIZACION (PAB_PEDIATRIA) - HOSPITALIZACIÓN ', '', 'COMAS', '40', 1, 'PARTICULAR', 1, 1),
(108, 'ACP-2021-000108', '2021-05-28', '452356', '1901606', '1321508', 1, '1966-09-28', 'DNI', '06904754', 'JUAREZ', 'ESPINOZA', 'JAVIER', '2021-05-28', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '55', 1, 'PARTICULAR', 1, 1),
(109, 'ACP-2021-000109', '2021-05-28', '452334', '1901581', '1234651', 3, '1961-10-02', 'DNI', '16542300', 'OLIVA', 'VILLANUEVA', 'JOSE', '2021-05-28', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '60', 1, 'CONVENIOS PÚBLICOS', 1, 1),
(110, 'ACP-2021-000110', '2021-05-29', '452129', '1901419', '328847', 3, '1953-08-29', 'DNI', '08086781', 'FLORES', 'MALDONADO', 'GLORIA', '2021-05-27', 'CORONAVIRUS - EMERGENCIA', '', 'COMAS', '68', 2, 'PARTICULAR', 1, 1),
(111, 'ACP-2021-000111', '2021-05-31', '452289', '1901554', '581016', 2, '1987-12-24', 'DNI', '44834427', 'GOMEZ', 'ORELLANA', 'VANIA', '2021-05-28', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '34', 2, 'PARTICULAR', 1, 1),
(112, 'ACP-2021-000112', '2021-05-31', '452388', '1901633', '112293', 3, '1955-11-19', 'DNI', '06834044', 'PACHECO', 'CERRON', 'MARIA', '2021-05-28', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '66', 2, 'PARTICULAR', 1, 1),
(113, 'ACP-2021-000113', '2021-05-31', '452898', '1901816', '1215322', 1, '1994-06-07', 'DNI', '76046164', 'LIÑAN', 'CHAVEZ', 'ROBINSON', '2021-05-31', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '27', 1, 'PARTICULAR', 1, 1),
(114, 'ACP-2021-000114', '2021-05-31', '452834', '1902028', '267188', 3, '1957-05-02', 'DNI', '06829540', 'CAJALEON', 'GASPAR', 'ALEJANDRO', '2021-05-30', 'CORONAVIRUS - EMERGENCIA', '', 'CARABAYLLO', '64', 1, 'PARTICULAR', 1, 1),
(115, 'ACP-2021-000115', '2021-05-31', '452686', '1901908', '1337421', 3, '1959-11-15', 'DNI', '48965531', 'POMA', 'SALAZAR', 'FLORISA', '2021-05-29', 'CORONAVIRUS - EMERGENCIA', '', 'LA OROYA', '62', 2, 'PARTICULAR', 1, 1),
(116, 'ACP-2021-000116', '2021-05-31', '450481', '1899894', '1042814', 1, '1940-11-19', 'DNI', '06849292', 'MELGAREJO', 'MONTALVO DE BALMACEDA', 'BERTILA', '2021-05-19', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '81', 2, 'PARTICULAR', 1, 1),
(117, 'ACP-2021-000117', '2021-06-01', '452430', '1901680', '637665', 2, '1965-09-16', 'DNI', '80565221', 'GUEVARA', 'MALHABER', 'EDITHA', '2021-05-28', 'MEDICINA - EMERGENCIA', '', 'CARABAYLLO', '56', 2, 'PARTICULAR', 1, 1),
(118, 'ACP-2021-000118', '2021-06-01', '454160', '1902269', '1337528', 1, '1944-10-11', 'DNI', '31938623', 'SALINAS', 'ALVARADO', 'LUISA', '2021-06-05', 'MEDICINA - HOSPITALIZACIÓN ', '', 'OCROS', '77', 2, 'PARTICULAR', 1, 1),
(119, 'ACP-2021-000119', '2021-06-01', '453850', '1902194', '590725', 2, '1966-10-06', 'DNI', '07723192', 'DUFFAUT', 'GUEMBES', 'MARIA', '2021-06-04', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '55', 2, 'PARTICULAR', 1, 1),
(120, 'ACP-2021-000120', '2021-06-01', '453852', '1902192', '673537', 2, '1972-10-30', 'DNI', '09966862', 'CARRERA', 'MELENDEZ', 'JOSE', '2021-06-04', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '49', 1, 'PARTICULAR', 1, 1),
(121, 'ACP-2021-000121', '2021-06-01', '453084', '1902188', '1337509', 2, '2000-12-07', 'DNI', '70564669', 'VALLEJOS', 'CORRO', 'ALEXANDER', '2021-05-31', 'CIRUGIA GENERAL - HOSPITALIZACIÓN ', '', 'INDEPENDENCIA', '21', 1, 'PARTICULAR', 1, 1),
(122, 'ACP-2021-000122', '2021-06-01', '452817', '1902011', '1337463', 3, '1962-05-28', 'DNI', '09040826', 'ROMAÑA', 'SOLSOL', 'JOSE', '2021-05-30', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'INDEPENDENCIA', '59', 1, 'PARTICULAR', 1, 1),
(123, 'ACP-2021-000123', '2021-06-01', '450358', '1899707', '594234', 3, '1963-07-23', 'DNI', '06944579', 'ARAOZ', 'ZUÑIGA', 'JUSTO', '2021-05-18', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '58', 1, 'PARTICULAR', 1, 1),
(124, 'ACP-2021-000124', '2021-06-02', '448429', '1897871', '1336171', 2, '1955-08-19', 'DNI', '09002214', 'BALDEON', 'VALDEZ', 'ERNESTINA', '2021-05-10', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'VILLA MARIA DEL TRIUNFO', '66', 2, 'PARTICULAR', 1, 1),
(125, 'ACP-2021-000125', '2021-06-02', '453091', '1902250', '1337523', 1, '1977-02-11', 'DNI', '10776254', 'ROJAS', 'RODRIGUEZ', 'ELI', '2021-06-01', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'PUENTE PIEDRA', '44', 1, 'PARTICULAR', 1, 1),
(126, 'ACP-2021-000126', '2021-06-02', '453261', '1902401', '1337561', 1, '1953-12-13', 'DNI', '15287636', 'PALACIOS', 'BANDAN', 'PEPE', '2021-06-01', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '68', 1, 'PARTICULAR', 1, 1),
(127, 'ACP-2021-000127', '2021-06-02', '453301', '1902447', '1337571', 3, '1950-05-01', 'DNI', '07120806', 'PEREZ', 'SORIA', 'MAXIMO', '2021-06-01', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'INDEPENDENCIA', '71', 1, 'PARTICULAR', 1, 1),
(129, 'ACP-2021-000128', '2021-06-02', '0', '1827659', '1311129', 2, '1967-11-28', 'DNI', '09469023', 'CONTRERAS', 'GIBAJA', 'SATURNINA ELENA', '2021-05-20', 'COVID - HOSPITALIZACION', NULL, 'COMAS', '54', 2, 'PROGRAMA NACIONAL', 1, 1),
(130, 'ACP-2021-000129', '2021-06-02', '375451', '1827660', '1311130', 2, '1958-09-26', 'DNI', '07146387', 'ESTRADA', 'HUARANCCA', 'VIRGILIO', '2020-05-20', 'CORONAVIRUS - EMERGENCIA', 'H012', 'CARABAYLLO', '63', 1, 'CONVENIOS PÚBLICOS', 1, 1),
(131, 'ACP-2021-000130', '2021-06-02', '453455', '1902589', '221328', 2, '1960-07-16', 'DNI', '10388198', 'ALZAMORA', 'MEDINA', 'CARMELON', '2021-06-02', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '61', 1, 'PARTICULAR', 1, 1),
(132, 'ACP-2021-000131', '2021-06-02', '455842', '1902460', '80954', 1, '1968-11-19', 'DNI', '09733347', 'CHUMBES', 'ROJAS', 'RAFAEL', '2021-06-13', 'COVID LEGADO - HOSPITALIZACIÓN ', 'CL41', 'COMAS', '53', 1, 'PARTICULAR', 1, 1),
(133, 'ACP-2021-000132', '2021-06-03', '452816', '1902005', '37652', 3, '1971-04-14', 'DNI', '80145883', 'MOLERO', 'RAYMI', 'BEATRIZ', '2021-05-30', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '50', 2, 'PARTICULAR', 1, 1),
(134, 'ACP-2021-000133', '2021-06-03', '453380', '1902340', '113374', 2, '1973-10-03', 'DNI', '09971995', 'RAMOS', 'SAENZ', 'MARGARITA', '2021-06-02', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '48', 2, 'PARTICULAR', 1, 1),
(135, 'ACP-2021-000134', '2021-06-03', '454663', '1902613', '1156483', 2, '1987-08-24', 'DNI', '44499337', 'RODRIGUEZ', 'NAVEDA', 'JUAN', '2021-06-08', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '34', 1, 'PARTICULAR', 1, 1),
(136, 'ACP-2021-000135', '2021-06-04', '453519', '1902678', '616802', 3, '1967-04-26', 'DNI', '09466831', 'MENDOZA', 'REVILLA', 'ALFREDO', '2021-06-02', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '54', 1, 'PARTICULAR', 1, 1),
(137, 'ACP-2021-000136', '2021-06-04', '453499', '1902652', '1337636', 3, '1955-05-03', 'DNI', '08554136', 'GONZALES', 'EGUSQUIZA', 'BERTHA', '2021-06-02', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '66', 2, 'PARTICULAR', 1, 1),
(138, 'ACP-2021-000137', '2021-06-04', '453266', '1902356', '713937', 3, '1951-06-01', 'DNI', '06880338', 'DE LA CRUZ', 'AVILA', 'SEGUNDO', '2021-06-01', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '70', 1, 'PARTICULAR', 1, 1),
(139, 'ACP-2021-000138', '2021-06-04', '453717', '1902904', '1307788', 1, '1964-04-12', 'DNI', '00033764', 'CAPUENA', 'ASPAJO', 'MARIA', '2021-06-03', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '57', 2, 'SOAT', 1, 1),
(140, 'ACP-2021-000139', '2021-06-04', '453851', '1902876', '1337698', 2, '1961-09-23', 'DNI', '25459554', 'CORDOVA', 'ALONSO', 'CARLOS', '2021-06-04', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '60', 1, 'PARTICULAR', 1, 1),
(141, 'ACP-2021-000140', '2021-06-04', '453751', '1902920', '1337710', 2, '1991-10-27', 'DNI', '47597172', 'ALMANZA', 'CCAMA', 'ALEX', '2021-06-03', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '30', 1, 'PARTICULAR', 1, 1),
(142, 'ACP-2021-000141', '2021-06-04', '453761', '1902932', '987579', 2, '1976-09-26', 'DNI', '25836893', 'SANTOS', 'HOLGUIN', 'ROBERTO', '2021-06-03', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '45', 1, 'PARTICULAR', 1, 1),
(143, 'ACP-2021-000142', '2021-06-05', '455841', '1903260', '211403', 1, '1983-02-11', 'DNI', '41646789', 'FERNANDEZ', 'MENDIETA', 'LENNART', '2021-06-13', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '38', 1, 'PARTICULAR', 1, 1),
(144, 'ACP-2021-000143', '2021-06-05', '454755', '1903062', '548921', 1, '1963-08-09', 'DNI', '08381097', 'SALAS', 'GUZMAN', 'JAVIER', '2021-06-08', 'MEDICINA - HOSPITALIZACIÓN ', '', 'COMAS', '58', 1, 'PARTICULAR', 1, 1),
(145, 'ACP-2021-000144', '2021-06-05', '454780', '1903135', '473047', 1, '1960-10-11', 'DNI', '09232069', 'APOLAYA', 'ACOSTA', 'LUIS', '2021-06-08', 'MEDICINA - HOSPITALIZACIÓN ', '', 'COMAS', '61', 1, 'PARTICULAR', 1, 1),
(146, 'ACP-2021-000145', '2021-06-05', '454644', '1902396', '1337559', 1, '1985-08-10', 'DNI', '43093508', 'SHAPIAMA', 'VALLES', 'NELSON', '2021-06-08', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'SAN MARTIN DE PORRES', '36', 1, 'CONVENIOS PÚBLICOS', 1, 1),
(147, 'ACP-2021-000146', '2021-06-05', '453714', '1902873', '354867', 3, '1961-09-17', 'DNI', '06822868', 'LLAMOCCA', 'PRADO', 'JOSE', '2021-06-03', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '60', 1, 'PARTICULAR', 1, 1),
(148, 'ACP-2021-000147', '2021-06-07', '454328', '1903492', '1337887', 3, '1960-10-07', 'DNI', '06657692', 'RIVAS', 'SOLORZANO', 'VICTORIA', '2021-06-06', 'CORONAVIRUS - EMERGENCIA', '', 'COMAS', '61', 2, 'PARTICULAR', 1, 1),
(149, 'ACP-2021-000148', '2021-06-07', '454935', '1903322', '341444', 1, '1990-04-25', 'DNI', '46438277', 'ALZAMORA', 'MONDRAGON', 'JORGE', '2021-06-09', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '31', 1, 'PARTICULAR', 1, 1),
(150, 'ACP-2021-000149', '2021-06-07', '454180', '1903349', '326564', 1, '1968-01-31', 'DNI', '10392945', 'VELASQUEZ', 'AVALOS', 'OSCAR', '2021-06-05', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '53', 1, 'PARTICULAR', 1, 1),
(151, 'ACP-2021-000150', '2021-06-07', '453683', '1902820', '1337676', 2, '1984-12-18', 'DNI', '43327737', 'ALVA', 'CACHIQUE', 'DIANA', '2021-06-03', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'LOS OLIVOS', '37', 2, 'PARTICULAR', 1, 1),
(152, 'ACP-2021-000151', '2021-06-08', '453535', '1902296', '1015941', 1, '2009-04-23', 'DNI', '63570876', 'ONOFRE', 'NAZARIO', 'PATRICK', '2021-06-02', 'PEDIATRIA - HOSPITALIZACIÓN ', '', 'COMAS', '12', 1, 'PARTICULAR', 1, 1),
(153, 'ACP-2021-000152', '2021-06-08', '454872', '1903679', '1337950', 1, '1998-03-10', 'DNI', '60259728', 'LOPEZ', 'MATOS', 'GABINA', '2021-06-08', 'OBSTETRICIA - HOSPITALIZACIÓN ', '', 'PUENTE PIEDRA', '23', 2, 'PARTICULAR', 1, 1),
(154, 'ACP-2021-000153', '2021-06-08', '454933', '1903284', '440238', 1, '1966-04-20', 'DNI', '45099391', 'MALLQUI', 'LAURENCIO', 'QUEVEDO', '2021-06-09', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '55', 1, 'PARTICULAR', 1, 1),
(155, 'ACP-2021-000154', '2021-06-08', '454563', '1903710', '410452', 1, '1986-12-25', 'DNI', '44086759', 'ALZAMORA', 'MONDRAGON', 'MANUEL', '2021-06-07', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '35', 1, 'CONVENIOS PÚBLICOS', 1, 1),
(156, 'ACP-2021-000155', '2021-06-08', '453360', '1902481', '1337583', 2, '1967-12-30', 'DNI', '08680845', 'JAQUE', 'VERGARAY', 'HUGO', '2021-06-02', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'INDEPENDENCIA', '54', 1, 'SOAT', 1, 1),
(157, 'ACP-2021-000156', '2021-06-08', '454641', '1903756', '1337969', 3, '1951-04-23', 'DNI', '08711591', 'SILVA', 'VILCHEZ', 'CESAR', '2021-06-07', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CALLAO', '70', 1, 'SOAT', 1, 1),
(158, 'ACP-2021-000157', '2021-06-08', '454550', '1903691', '1337953', 1, '1943-10-05', 'DNI', '08466806', 'SANCHEZ', 'AGUILAR', 'FROILAN', '2021-06-07', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '78', 1, 'PARTICULAR', 1, 1),
(159, 'ACP-2021-000158', '2021-06-09', '450726', '1900102', '1298560', 1, '1941-05-03', 'DNI', '06921471', 'ONSEHUAY', 'OSORIO', 'MAURA', '2021-05-20', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '80', 2, 'PARTICULAR', 1, 1),
(160, 'ACP-2021-000159', '2021-06-09', '454788', '1903862', '1107097', 1, '1973-04-12', 'DNI', '07760458', 'VEGA', 'ALEJANDRO', 'JUAN', '2021-06-08', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '48', 1, 'PARTICULAR', 1, 1),
(161, 'ACP-2021-000160', '2021-06-10', '449693', '1898749', '200448', 2, '1959-06-21', 'DNI', '06940872', 'TAPULLIMA', 'SALDAÑA', 'MARINA', '2021-05-15', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '62', 2, 'PARTICULAR', 1, 1),
(162, 'ACP-2021-000161', '2021-06-10', '455095', '1904208', '43737', 1, '1970-01-19', 'DNI', '22516365', 'VASQUEZ', 'CONSA', 'JULIO', '2021-06-09', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '51', 1, 'SOAT', 1, 1),
(163, 'ACP-2021-000162', '2021-06-10', '448671', '1898217', '1336307', 2, '1940-07-09', 'DNI', '06858227', 'BRICEÑO', 'FARFAN', 'GONZALO', '2021-05-11', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '81', 1, 'SOAT', 1, 1),
(164, 'ACP-2021-000163', '2021-06-11', '454135', '1903318', '199768', 1, '1941-03-27', 'DNI', '10392739', 'ENCALADA', 'MORALES', 'MARIA', '2021-06-05', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '80', 2, 'PARTICULAR', 1, 1),
(165, 'ACP-2021-000164', '2021-06-11', '455695', '1904161', '194146', 1, '1966-05-25', 'DNI', '06827023', 'TORRES', 'LONGINOTE', 'CARLOS', '2021-06-12', 'MEDICINA - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '55', 1, 'PARTICULAR', 1, 1),
(166, 'ACP-2021-000165', '2021-06-11', '455350', '1904446', '1338140', 1, '1976-04-02', 'DNI', '08172543', 'CHAUCA', 'CALVO', 'RAFAEL', '2021-06-10', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '45', 1, 'PARTICULAR', 1, 1),
(167, 'ACP-2021-000166', '2021-06-11', '455349', '1904445', '1338139', 3, '1953-09-22', 'DNI', '00817725', 'APUELA', 'CONCHE', 'MARIA', '2021-06-10', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'LOS OLIVOS', '68', 2, 'PARTICULAR', 1, 1),
(168, 'ACP-2021-000167', '2021-06-11', '454842', '1903945', '1338008', 1, '1961-03-09', 'DNI', '07424994', 'CHUZON', 'ALABAN', 'RICARDO', '2021-06-08', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'CARABAYLLO', '60', 1, 'PARTICULAR', 1, 1),
(169, 'ACP-2021-000168', '2021-06-11', '455418', '1904537', '1338159', 1, '1954-06-07', 'DNI', '19810782', 'YAURI', 'RAMIREZ', 'DAVID', '2021-06-11', 'CORONAVIRUS - EMERGENCIA', '', 'PUENTE PIEDRA', '67', 1, 'PARTICULAR', 1, 1),
(170, 'ACP-2021-000169', '2021-06-12', '453264', '1902377', '1337554', 1, '1969-09-02', 'DNI', '09628403', 'PERALES', 'CABEZAS', 'PEDRO', '2021-06-01', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'LOS OLIVOS', '52', 1, 'PARTICULAR', 1, 1),
(171, 'ACP-2021-000170', '2021-06-12', '444847', '1894735', '980527', 2, '1980-02-27', 'DNI', '41951009', 'NOLASCO', 'HILARIO', 'JULIAN', '2021-04-22', 'COVID VII - HOSPITALIZACIÓN ', '', 'AMARILIS', '41', 1, 'PARTICULAR', 1, 1),
(172, 'ACP-2021-000171', '2021-06-12', '455263', '1904374', '1338122', 1, '1991-03-18', 'DNI', '46864205', 'LOPEZ', 'MONTALVO', 'RICHARD', '2021-06-10', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'SAN MARTIN DE PORRES', '30', 1, 'PARTICULAR', 1, 1),
(173, 'ACP-2021-000172', '2021-06-12', '455243', '1904329', '1148569', 3, '1965-09-18', 'DNI', '06902603', 'VERGARA', 'RODRIGUEZ', 'RODOLFO', '2021-06-10', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '56', 1, 'PARTICULAR', 1, 1),
(174, 'ACP-2021-000173', '2021-06-12', '455645', '1904761', '960050', 3, '1967-07-11', 'DNI', '09470765', 'FERNANDEZ', 'MONTENEGRO', 'CARLOS', '2021-06-12', 'CORONAVIRUS - EMERGENCIA', '', 'COMAS', '54', 1, 'PARTICULAR', 1, 1),
(175, 'ACP-2021-000174', '2021-06-12', '455843', '1904557', '217878', 1, '1942-12-06', 'DNI', '00032368', 'PEREZ', 'CORAL', 'MANUEL', '2021-06-13', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'HONORIA', '79', 1, 'PARTICULAR', 1, 1),
(176, 'ACP-2021-000175', '2021-06-14', '455681', '1904797', '427977', 1, '1969-03-31', 'DNI', '09607189', 'MENDOZA', 'TORIBIO', 'RAUL', '2021-06-12', 'CORONAVIRUS - EMERGENCIA', '', 'SAN MARTIN DE PORRES', '52', 1, 'PARTICULAR', 1, 1),
(177, 'ACP-2021-000176', '2021-06-14', '452643', '1901587', '1337319', 1, '1982-09-03', 'CE', '002965053', 'JIMENEZ', 'REQUENA', 'LUISCRI', '2021-05-29', 'COVID UCI - HOSPITALIZACIÓN ', '', 'COMAS', '39', 1, 'PARTICULAR', 1, 1),
(178, 'ACP-2021-000177', '2021-06-15', '455972', '1904998', '1338219', 1, '1965-06-30', 'DNI', '15655331', 'VASQUEZ', 'ESPINOZA', 'LUCILA', '2021-06-13', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '56', 2, 'PARTICULAR', 1, 1),
(179, 'ACP-2021-000178', '2021-06-15', '455808', '1904830', '1338253', 1, '1950-01-28', 'DNI', '15280950', 'OSCANOA', 'BARRETO', 'INES', '2021-06-12', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'LIMA', '71', 2, 'PARTICULAR', 1, 1),
(180, 'ACP-2021-000179', '2021-06-15', '447087', '1896483', '1335602', 2, '1961-03-13', 'DNI', '32601373', 'MIRANDA', 'VILLANUEVA', 'EPIFANIO', '2021-05-03', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '60', 1, 'SOAT', 1, 1),
(181, 'ACP-2021-000180', '2021-06-15', '455704', '1904805', '1338242', 1, '1987-09-09', 'PAS', '150269676', 'GRIMALDO', 'BARRERA', 'KEILE', '2021-06-12', 'COVID LEGADO - HOSPITALIZACIÓN ', '', 'COMAS', '34', 2, 'CONVENIOS PÚBLICOS', 1, 1),
(182, 'ACP-2021-000181', '2021-06-16', '455787', '1904876', '1282239', 3, '1950-11-12', 'DNI', '06233992', 'SANTI', 'RAMIREZ', 'MELANIO', '2021-06-13', 'CORONAVIRUS - EMERGENCIA', '', 'UPAHUACHO', '71', 1, 'PARTICULAR', 1, 1),
(183, 'ACP-2021-000182', '2021-06-16', '455749', '1904841', '63066', 1, '1957-10-17', 'DNI', '06830948', 'TEJADA', 'LLAUCE', 'HUGO', '2021-06-12', 'CORONAVIRUS - EMERGENCIA', '', 'CARABAYLLO', '64', 1, 'PARTICULAR', 1, 1);

--
-- Disparadores `acpsy_atencion`
--
DELIMITER $$
CREATE TRIGGER `GENERAR_CORRELATIVO_ATENCION` BEFORE INSERT ON `acpsy_atencion` FOR EACH ROW BEGIN
    DECLARE cont1 int default 0;
    DECLARE anio text;
    set anio = (SELECT YEAR(CURDATE()));
    SET cont1= (SELECT count(*) FROM acpsy_atencion WHERE year(fRegistroAtencion) = year(now()));
    IF (cont1 < 1) THEN
    SET NEW.correlativo_Atencion = CONCAT('ACP-',anio,'-', LPAD(cont1 + 1, 6, '0'));
    ELSE
    SET NEW.correlativo_Atencion = CONCAT('ACP-',anio,'-', LPAD(cont1 + 1, 6, '0'));
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_condicionprof`
--

CREATE TABLE `acpsy_condicionprof` (
  `idCondicion` int(11) NOT NULL,
  `detaCondicion` varchar(60) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_condicionprof`
--

INSERT INTO `acpsy_condicionprof` (`idCondicion`, `detaCondicion`) VALUES
(1, 'NOMBRADO'),
(2, 'CAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_diagnosticos`
--

CREATE TABLE `acpsy_diagnosticos` (
  `idDiagnostico` int(11) NOT NULL,
  `cieDiagnostico` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `detaDiagnostico` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_diagnosticos`
--

INSERT INTO `acpsy_diagnosticos` (`idDiagnostico`, `cieDiagnostico`, `detaDiagnostico`) VALUES
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
-- Estructura de tabla para la tabla `acpsy_estadoatencion`
--

CREATE TABLE `acpsy_estadoatencion` (
  `idEstadoAte` int(11) NOT NULL,
  `detaEstadoAte` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_estadoatencion`
--

INSERT INTO `acpsy_estadoatencion` (`idEstadoAte`, `detaEstadoAte`) VALUES
(1, 'REGISTRADA'),
(2, 'ANULADA'),
(3, 'FINALIZADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_estadopaciente`
--

CREATE TABLE `acpsy_estadopaciente` (
  `idEstadoPacAtencion` int(11) NOT NULL,
  `detaEstadoPacAtencion` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_estadopaciente`
--

INSERT INTO `acpsy_estadopaciente` (`idEstadoPacAtencion`, `detaEstadoPacAtencion`) VALUES
(1, 'HOSPITALIZADO'),
(2, 'ALTA'),
(3, 'FALLECIDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_estadoprof`
--

CREATE TABLE `acpsy_estadoprof` (
  `idEstadoProf` int(11) NOT NULL,
  `detaEstadoProf` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_estadoprof`
--

INSERT INTO `acpsy_estadoprof` (`idEstadoProf`, `detaEstadoProf`) VALUES
(1, 'ALTA'),
(2, 'BAJA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_estadosu`
--

CREATE TABLE `acpsy_estadosu` (
  `idEstado` int(11) NOT NULL,
  `detalleEstadoU` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_estadosu`
--

INSERT INTO `acpsy_estadosu` (`idEstado`, `detalleEstadoU`) VALUES
(1, 'HABILITADO'),
(2, 'INHABILITADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_estatusseguimiento`
--

CREATE TABLE `acpsy_estatusseguimiento` (
  `idStatusSeg` int(11) NOT NULL,
  `detaStatusSeg` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_estatusseguimiento`
--

INSERT INTO `acpsy_estatusseguimiento` (`idStatusSeg`, `detaStatusSeg`) VALUES
(1, 'REGISTRADO'),
(2, 'ANULADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_etapaseguimiento`
--

CREATE TABLE `acpsy_etapaseguimiento` (
  `idEtapSegui` int(11) NOT NULL,
  `detaEtapSegui` varchar(30) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_etapaseguimiento`
--

INSERT INTO `acpsy_etapaseguimiento` (`idEtapSegui`, `detaEtapSegui`) VALUES
(1, 'INICIADO'),
(2, 'EN PROCESO'),
(3, 'FINALIZADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_famatencion`
--

CREATE TABLE `acpsy_famatencion` (
  `idFamiliar` int(11) NOT NULL,
  `fechaRegistro` date DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idAtencion` int(11) DEFAULT NULL,
  `idParentesco` int(11) DEFAULT NULL,
  `idTipSexo` int(11) DEFAULT NULL,
  `tipdocFamiliar` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ndocFamiliar` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `nombApFamiliar` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `edadFamiliar` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `telcelFamiliar` varchar(12) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_famatencion`
--

INSERT INTO `acpsy_famatencion` (`idFamiliar`, `fechaRegistro`, `idUsuario`, `idAtencion`, `idParentesco`, `idTipSexo`, `tipdocFamiliar`, `ndocFamiliar`, `nombApFamiliar`, `edadFamiliar`, `telcelFamiliar`) VALUES
(1, '2021-06-18', 1, 1, 2, 2, 'DNI', '06901209', 'PILAR GARRAFA SANCHEZ DE RODRIGUEZ', '61', ''),
(2, '2021-06-18', 1, 1, 6, 1, 'DNI', '41100883', 'JOSLY MIGUEL JARA ALBARRACIN', '40', ''),
(3, '2021-06-18', 1, 2, 6, 2, 'DNI', '08131002', 'JOANA ELSA DEYRA GONZALES', '51', ''),
(4, '2021-06-18', 1, 3, 6, 2, 'DNI', '09521648', 'ROMILIA ELENA ATAUCUSI LUDIÑA', '49', ''),
(5, '2021-06-18', 1, 3, 8, 1, 'DNI', '74885034', 'DANIEL SMIT URRUTIA MEDINA', '28', ''),
(6, '2021-06-18', 1, 4, 3, 2, 'DNI', '72896185', 'PAMELA CRISTINA TARMEÑO RIVERA', '26', ''),
(7, '2021-06-18', 1, 5, 3, 2, 'DNI', '09472422', 'HILDA MARIA CORONADO HUAMAN', '53', ''),
(8, '2021-06-18', 1, 6, 6, 2, 'DNI', '80014709', 'MARIA MERCEDES BOCANEGRA RIVAS', '49', ''),
(9, '2021-06-18', 1, 7, 3, 2, 'DNI', '44739988', 'LISETT SOLEDAD MONGE SOTO', '33', ''),
(10, '2021-06-18', 1, 8, 6, 1, 'DNI', '44366004', 'LUIS ANGEL VIVANCO CUADROS', '35', ''),
(11, '2021-06-18', 1, 9, 9, 2, 'DNI', '40196938', 'EDITH CASTILLO GONZALES', '41', ''),
(12, '2021-06-18', 1, 10, 3, 2, 'DNI', '47221722', 'ZADITH CHAVEZ GIRALDO', '25', ''),
(13, '2021-06-18', 1, 11, 7, 2, 'DNI', '01552621', 'FLORA HANCCO APAZA', '43', ''),
(14, '2021-06-18', 1, 12, 9, 2, 'DNI', '27746345', 'ENMA FLOR GARCIA BERMEO', '50', ''),
(15, '2021-06-18', 1, 13, 9, 2, 'DNI', '09732019', 'HAYDEE FRANCISCA GERONIMO CARBAJAL', '50', ''),
(16, '2021-06-18', 1, 14, 3, 1, 'DNI', '44557018', 'CARLOS MARIO CHAVEZ GIRALDO', '33', ''),
(17, '2021-06-18', 1, 15, 3, 2, 'DNI', '09547020', 'CARMELA FIORELLA CHUIMA LARDIZABAL', '50', ''),
(18, '2021-06-18', 1, 16, 3, 2, 'DNI', '48417368', 'YARUXA YERLANDINE SANCHEZ RAMOS', '27', ''),
(19, '2021-06-18', 1, 17, 9, 2, 'DNI', '80372498', 'MARIA MARTHA IMAN FLORES', '42', ''),
(20, '2021-06-18', 1, 18, 3, 1, 'DNI', '43227196', 'ERICK SANDOVAL VARGAS', '35', ''),
(21, '2021-06-18', 1, 19, 3, 1, 'DNI', '44869333', 'BLAISE PASCAL BERRU HUAMAN', '33', ''),
(22, '2021-06-18', 1, 20, 8, 1, 'DNI', '40586292', 'CARLOS JAVIER MARROQUIN BUIZA', '42', ''),
(23, '2021-06-18', 1, 21, 6, 1, 'DNI', '06779591', 'MIRIAM SOLEDAD NINAHUANCA LAURA', '63', ''),
(24, '2021-06-18', 1, 22, 3, 2, 'DNI', '45103230', 'ANDREA NATHALY MOGOLLON CUELLO', '32', ''),
(25, '2021-06-18', 1, 23, 9, 2, 'DNI', '42368722', 'MARIA DEL PILAR CARHUAYAL SOTO', '38', ''),
(26, '2021-06-18', 1, 24, 3, 1, 'DNI', '41773512', 'CHRISTIAN ANDRES AGUIRRE SAAVEDRA', '38', ''),
(27, '2021-06-18', 1, 25, 3, 2, 'DNI', '40229921', 'RAQUEL CORINA HUARANGA CASTRO DE NAZAR', '42', ''),
(28, '2021-06-18', 1, 26, 3, 1, 'DNI', '45787628', 'NIVARDO RAFAEL MORI MORENO', '31', ''),
(29, '2021-06-18', 1, 27, 3, 1, 'DNI', '76187018', 'JUNIOR YAMPIER BARTOLO VILLANUEVA', '26', ''),
(30, '2021-06-18', 1, 28, 9, 2, 'DNI', '08158916', 'MARILUZ TAZA LOAYZA DE CAPCHA', '47', ''),
(31, '2021-06-18', 1, 29, 6, 2, 'DNI', '73442980', 'MELANNIE DEBBY PACHECO GUTIERREZ', '26', ''),
(32, '2021-06-18', 1, 30, 9, 2, 'DNI', '09745345', 'CARMEN ROSA CARDENAS MEJIA', '50', ''),
(33, '2021-06-18', 1, 31, 6, 1, 'DNI', '07739512', 'FIDEL ANTONIO BAUTISTA CUEVA', '56', ''),
(34, '2021-06-18', 1, 31, 8, 1, 'DNI', '09540751', 'RONNY WILLIAM GONZALES VILCHEZ', '49', ''),
(35, '2021-06-18', 1, 33, 3, 2, 'DNI', '72978357', 'MARIA CLAUDIA JEANNEAU ESPINOZA', '20', ''),
(36, '2021-06-18', 1, 34, 3, 2, 'DNI', '09737376', 'MARIA BEATRIZ HUERTA RODRIGUEZ', '50', ''),
(37, '2021-06-18', 1, 35, 9, 2, 'DNI', '09028968', 'CARMEN SOFIA MERINO ROJAS', '54', ''),
(38, '2021-06-18', 1, 35, 3, 2, 'DNI', '46123673', 'ELISA KATHERINE SAHUANGA PEÑA', '31', ''),
(39, '2021-06-18', 1, 37, 3, 2, 'DNI', '43733218', 'ALCIRA SANCHEZ CASTRO', '34', ''),
(40, '2021-06-18', 1, 38, 9, 1, 'DNI', '06845974', 'TEODORO JUAN DE DIOS CACERES', '60', ''),
(41, '2021-06-18', 1, 39, 8, 2, 'DNI', '40879094', 'MAGALY YEREN VARGAS', '40', ''),
(42, '2021-06-18', 1, 94, 3, 2, 'DNI', '10395972', 'ELIZABETH PAULINO VELIZ', '45', ''),
(43, '2021-06-18', 1, 41, 6, 1, 'DNI', '71648162', 'JHAN CARLOS ROQUE JARAMILLO', '23', ''),
(44, '2021-06-18', 1, 42, 2, 2, 'DNI', '06829321', 'JUANA ISABEL CRISOSTOMO VASQUEZ', '61', ''),
(45, '2021-06-18', 1, 36, 3, 2, 'DNI', '45530511', 'EVELYN DIANA SILVA CHAVEZ', '32', ''),
(46, '2021-06-18', 1, 48, 3, 1, 'DNI', '10744342', 'JOSE MAXIMO FLORES YSUSQUIZA', '43', ''),
(47, '2021-06-18', 1, 49, 3, 2, 'DNI', '46211854', 'SHEYLA ROSARIO DELGADO RAMIREZ', '31', ''),
(48, '2021-06-18', 1, 50, 3, 2, 'DNI', '41352894', 'JAQUELINE TERESA CANALES QUEZADA DE ARROYO', '39', ''),
(49, '2021-06-18', 1, 52, 5, 2, 'DNI', '70471656', 'SILVANA GERALDINE PALOMINO URQUIZA', '24', ''),
(50, '2021-06-18', 1, 53, 3, 2, 'DNI', '42527962', 'ROSSE MARY ZEVALLOS CONDOR DE ALARCON', '41', ''),
(51, '2021-06-18', 1, 54, 9, 2, 'DNI', '45871446', 'CARMEN MERINO QUISPE', '32', ''),
(52, '2021-06-18', 1, 55, 6, 2, 'DNI', '70295027', 'SHEYLA SAYURI CASTILLO ESPINOZA', '28', ''),
(53, '2021-06-18', 1, 44, 3, 1, 'DNI', '76567576', 'JIMMY ANDY CALDERON CACERES', '25', ''),
(54, '2021-06-18', 1, 56, 5, 1, 'DNI', '72804901', 'EDWAR ANDRES VERA COELLO', '20', ''),
(55, '2021-06-18', 1, 57, 6, 2, 'DNI', '09742681', 'MARISOL BENILDA RODRIGUEZ CANICOBA', '49', ''),
(56, '2021-06-18', 1, 59, 3, 2, 'DNI', '76865778', 'YESSLIN HERMOSILLA MAJINO', '25', ''),
(57, '2021-06-18', 1, 51, 8, 2, 'DNI', '47483337', 'MARIA ELBA SUAREZ FLORES', '29', ''),
(58, '2021-06-18', 1, 62, 3, 2, 'DNI', '70509987', 'LUCIA ESTHEFANI MORENO ALLAUCA', '24', ''),
(59, '2021-06-18', 1, 63, 3, 2, 'DNI', '20055260', 'ROSA GIOVANNA SUAREZ LEIVA', '47', ''),
(60, '2021-06-18', 1, 66, 3, 2, 'DNI', '45770089', 'YENIFER GISELA SEGUNDO ROMERO', '31', ''),
(61, '2021-06-18', 1, 58, 6, 1, 'DNI', '10213347', 'ARMANDO MARTIN CRISOSTOMO VASQUEZ', '36', ''),
(62, '2021-06-18', 1, 67, 3, 1, 'DNI', '41706736', 'FERNANDO CASTAÑEDA SILVA', '38', ''),
(63, '2021-06-18', 1, 68, 9, 2, 'DNI', '46801078', 'MEDALITH SUYON CHICANA', '29', ''),
(64, '2021-06-18', 1, 71, 8, 2, 'DNI', '71730262', 'IVETTE MIRELLA CRUZ DIAZ', '29', ''),
(65, '2021-06-18', 1, 72, 3, 2, 'DNI', '71126063', 'JAZMIN OFELIA SIMBALA PINEDO', '23', ''),
(66, '2021-06-18', 1, 75, 3, 2, 'DNI', '77468779', 'EVELYN GABRIELA NOLASCO ROJAS', '20', ''),
(67, '2021-06-18', 1, 76, 9, 1, 'DNI', '08578720', 'FELIX ARMANDO HUAMAN ANO', '56', ''),
(68, '2021-06-18', 1, 77, 3, 1, 'DNI', '46474432', 'ENRIQUE SIMEON INGAROCA QUISPE', '31', ''),
(69, '2021-06-18', 1, 78, 9, 2, 'DNI', '10396416', 'JUDITH MARLENE VALLE TELLO', '49', ''),
(70, '2021-06-18', 1, 79, 6, 2, 'CE', '11422160', 'ELIZABETH VERDE BENAVIDES', '47', ''),
(71, '2021-06-18', 1, 80, 3, 1, 'DNI', '41049738', 'LUIS DIAZ QUISPE', '39', ''),
(72, '2021-06-18', 1, 81, 8, 2, 'DNI', '74543242', 'ISABEL YADHIRA REYNA ZAPANA', '19', ''),
(73, '2021-06-18', 1, 82, 9, 2, 'DNI', '06784402', 'ROCIO ELIZABETH VALDIVIA MUÑANTE', '47', ''),
(74, '2021-06-18', 1, 84, 6, 1, 'DNI', '41343680', 'LUIS CARHUAZ VILLARREAL', '39', ''),
(75, '2021-06-18', 1, 84, 7, 2, 'DNI', '10385324', 'MADAI YENNY RIVERA CHULLUNCUY', '45', ''),
(76, '2021-06-18', 1, 87, 9, 2, 'DNI', '40129966', 'BERTILA VICTORIA MAJI VEGA', '42', ''),
(77, '2021-06-18', 1, 88, 9, 1, 'DNI', '07319523', 'LUIS MIGUEL MEJIA TERREROS', '54', ''),
(78, '2021-06-18', 1, 89, 8, 1, 'DNI', '07202889', 'MIGUEL ALFONSO ZEVALLOS CHAVEZ', '58', ''),
(79, '2021-06-18', 1, 90, 3, 1, 'DNI', '20543457', 'MAXIMO DE LA CRUZ PAUCAR', '58', ''),
(80, '2021-06-18', 1, 91, 3, 1, 'DNI', '06912579', 'EUGENIO EFRAIN MATOS PASTOR', '56', ''),
(81, '2021-06-18', 1, 92, 6, 1, 'DNI', '00374066', 'CARLOS HUMBERTO GONZALES ORBEGOZO', '55', ''),
(82, '2021-06-18', 1, 65, 3, 1, 'DNI', '76593720', 'FILIAM NATIVIDAD PAREDES MARCELO', '22', ''),
(83, '2021-06-18', 1, 70, 3, 2, 'DNI', '48448415', 'KARIN HAYDEE DÍAZ RIVERA', '29', ''),
(84, '2021-06-18', 1, 85, 3, 2, 'DNI', '40587006', 'ERIKA ROJAS PAMPAS', '40', ''),
(85, '2021-06-18', 1, 95, 3, 2, 'DNI', '41665589', 'ORFELINDA LARA LOZANO', '38', ''),
(86, '2021-06-18', 1, 100, 3, 2, 'DNI', '42044775', 'KARLA MARIZOL ARANDA GUTIERREZ', '38', ''),
(87, '2021-06-18', 1, 69, 6, 2, 'DNI', '09982585', 'LOURDES MAGALI CARRILLO QUIROGA', '47', ''),
(88, '2021-06-18', 1, 101, 3, 2, 'DNI', '41720798', 'JACKELINE MOLY CHAVEZ NUÑEZ', '38', ''),
(89, '2021-06-18', 1, 102, 9, 1, 'CE', '19737222', 'MIGUEL ANGEL PAEZ PAEZ', '37', ''),
(90, '2021-06-18', 1, 21, 6, 2, 'DNI', '06779501', 'RAQUEL FRANCISCA DOLORES AREVALO', '49', ''),
(91, '2021-06-18', 1, 104, 3, 2, 'DNI', '09986281', 'MADANY MARILU TASAYCO CUNYARACHE', '45', ''),
(92, '2021-06-18', 1, 74, 6, 1, 'DNI', '42945628', 'CARLOS ENRIQUE AMADO GUERRERO', '42', ''),
(93, '2021-06-18', 1, 105, 8, 2, 'DNI', '47817367', 'MARICRUZ CHARO MEDRANO ARIAS', '31', ''),
(94, '2021-06-18', 1, 109, 9, 2, 'DNI', '09026173', 'ANA MARIA DIAZ GASPAR', '54', ''),
(95, '2021-06-18', 1, 96, 8, 2, 'DNI', '10289008', 'KATTYA LORENA JARA SALAVERRY', '44', ''),
(96, '2021-06-18', 1, 110, 3, 1, 'DNI', '42825547', 'EDSON ALEXANDER CORDOVA FLORES', '37', ''),
(97, '2021-06-18', 1, 99, 3, 2, 'DNI', '43238311', 'GERALDINE VANESSA CURO SANCHEZ', '35', ''),
(98, '2021-06-18', 1, 99, 2, 2, 'DNI', '06926380', 'CELIA OLIMPIDA SANCHEZ SOTO', '59', ''),
(99, '2021-06-18', 1, 111, 7, 2, 'DNI', '06862275', 'HILDA HORTENCIA GOMEZ CARDENAS', '72', ''),
(100, '2021-06-18', 1, 108, 6, 1, 'DNI', '09971890', 'RAFAEL JUAREZ ESPINOZA', '48', ''),
(101, '2021-06-18', 1, 108, 6, 2, 'DNI', '10740514', 'ULIANA INES BORDA FRANCIA', '43', ''),
(102, '2021-06-18', 1, 64, 9, 1, 'DNI', '07121834', 'CIRIACO VEGA DIESTRA', '63', ''),
(103, '2021-06-18', 1, 116, 3, 2, 'DNI', '09747066', 'SELENE BEATRIZ BALMACEDA MELGAREJO', '49', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_motivoseguimiento`
--

CREATE TABLE `acpsy_motivoseguimiento` (
  `idMotSeguimiento` int(11) NOT NULL,
  `detaMotivoSef` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_motivoseguimiento`
--

INSERT INTO `acpsy_motivoseguimiento` (`idMotSeguimiento`, `detaMotivoSef`) VALUES
(1, 'INFORMACION'),
(2, 'ORIENTACION'),
(3, 'DESPEDIDA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_parentescofam`
--

CREATE TABLE `acpsy_parentescofam` (
  `idParentesco` int(11) NOT NULL,
  `detaParentesco` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_parentescofam`
--

INSERT INTO `acpsy_parentescofam` (`idParentesco`, `detaParentesco`) VALUES
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
-- Estructura de tabla para la tabla `acpsy_perfiles`
--

CREATE TABLE `acpsy_perfiles` (
  `idPerfil` int(11) NOT NULL,
  `detallePerfil` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_perfiles`
--

INSERT INTO `acpsy_perfiles` (`idPerfil`, `detallePerfil`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'JEFE'),
(3, 'PSICOLOGO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_profesionales`
--

CREATE TABLE `acpsy_profesionales` (
  `idProfesional` int(11) NOT NULL,
  `idEstado` int(11) DEFAULT '1',
  `idCondicion` int(11) DEFAULT NULL,
  `dniProfesional` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `cpspProfesional` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `apellidosProfesional` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `nombresProfesional` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_profesionales`
--

INSERT INTO `acpsy_profesionales` (`idProfesional`, `idEstado`, `idCondicion`, `dniProfesional`, `cpspProfesional`, `apellidosProfesional`, `nombresProfesional`) VALUES
(1, 1, 1, '06958470', '12936', 'CORDOVA CACHAY', 'MATILDE'),
(2, 1, 1, '09851044', '4398', 'FLORES CASTILLO', 'IRMA'),
(3, 1, 1, '09512967', '6287', 'MORI ZUBIATE', 'ZONIA EMPERATRIZ'),
(4, 1, 1, '09479664', '32629', 'PABLO JARAMILLO', 'NORMA BEATRIZ'),
(5, 1, 1, '10725238', '10444', 'RAPRI SOLANO', 'EDSON'),
(6, 1, 1, '06781469', '7045', 'SALDAÑA CHAVEZ', 'KELLY'),
(7, 1, 1, '06123251', '10097', 'SANCHEZ AQUINO', 'NORMA NELIDA'),
(8, 1, 2, '10288615', '25775', 'TRUJILLO CASTILLO', 'MIRIAM ROCIO'),
(9, 1, 1, '07178930', '34522', 'VELASQUEZ REYES', 'MARIA ANGELA'),
(10, 1, 2, '46624029', '21470', 'ZAVALETA LOPEZ', 'DARNELLY JAHAIRA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_seguimiento`
--

CREATE TABLE `acpsy_seguimiento` (
  `idSeguimiento` int(11) NOT NULL,
  `fRegistrSeg` date NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idAtencionPac` int(11) NOT NULL,
  `idProfesional` int(11) NOT NULL,
  `idTipoSeguimiento` int(11) NOT NULL,
  `idMotSeguimiento` int(11) NOT NULL,
  `idEtapSegui` int(11) NOT NULL,
  `idDiag1Seg` int(11) NOT NULL,
  `idDiag2Seg` int(11) NOT NULL DEFAULT '0',
  `comunFamSeg` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `idFamAtSeg` int(11) NOT NULL DEFAULT '0',
  `idDiag1SegFam` int(11) NOT NULL DEFAULT '0',
  `idDiag2SegFam` int(11) NOT NULL DEFAULT '0',
  `obsSeg` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `idStatusSeg` int(11) NOT NULL DEFAULT '1',
  `registroSistema` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_tiposeguimiento`
--

CREATE TABLE `acpsy_tiposeguimiento` (
  `idTipoSeguimiento` int(11) NOT NULL,
  `detaTipSeguimiento` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_tiposeguimiento`
--

INSERT INTO `acpsy_tiposeguimiento` (`idTipoSeguimiento`, `detaTipSeguimiento`) VALUES
(1, 'FAM. FALLECIDO'),
(2, 'HOSPITALIZADOS'),
(3, 'PAC. ALTA MEDICA'),
(4, 'PERSONAL DE SALUD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_tipsexo`
--

CREATE TABLE `acpsy_tipsexo` (
  `idTipSexo` int(11) NOT NULL,
  `detaTipSexo` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_tipsexo`
--

INSERT INTO `acpsy_tipsexo` (`idTipSexo`, `detaTipSexo`) VALUES
(1, 'MASCULINO'),
(2, 'FEMENINO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acpsy_usuarios`
--

CREATE TABLE `acpsy_usuarios` (
  `idUsuario` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  `idEstado` int(11) NOT NULL DEFAULT '2',
  `dniUsuario` varchar(20) COLLATE utf8_bin NOT NULL,
  `apellidosUsuario` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombresUsuario` varchar(50) COLLATE utf8_bin NOT NULL,
  `cuentaUsuario` varchar(50) COLLATE utf8_bin NOT NULL,
  `correoUsuario` varchar(50) COLLATE utf8_bin NOT NULL,
  `claveUsuario` varchar(100) COLLATE utf8_bin NOT NULL,
  `intentosUsuario` int(11) DEFAULT '0',
  `fechaAlta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `profileUsuario` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acpsy_usuarios`
--

INSERT INTO `acpsy_usuarios` (`idUsuario`, `idPerfil`, `idEstado`, `dniUsuario`, `apellidosUsuario`, `nombresUsuario`, `cuentaUsuario`, `correoUsuario`, `claveUsuario`, `intentosUsuario`, `fechaAlta`, `profileUsuario`) VALUES
(1, 1, 1, '77478995', 'CASTRO PALACIOS', 'OLGER IVAN', 'ocastrop', 'ocastrop@hnseb.gob.pe', '$2a$07$usesomesillystringforeVF6hLwtgsUBAmUN4cGEd8tYF74gSHRW', 0, '2021-06-01 15:34:46', ''),
(2, 1, 1, '40195996', 'ROSAS SANCHEZ', 'MONICA NOHEMI', 'rosasmn', 'rosasmn@hnseb.gob.pe', '$2a$07$usesomesillystringforeoRNSqF5ebwOJ.HFIcVhNJ65bww3hpNi', 0, '2021-06-01 17:24:22', NULL),
(3, 3, 1, '06958470', 'CORDOVA CACHAY', 'MATILDE', 'mcordovac', 'dpsicologia@hnseb.gob.pe', '$2a$07$usesomesillystringforehgypeI5DRix.IHkznBBhY252VmxlIWG', 0, '2021-06-01 17:24:53', NULL),
(4, 3, 1, '09851044', 'FLORES CASTILLO', 'IRMA', 'ifloresc', 'dpsicologia@hnseb.gob.pe', '$2a$07$usesomesillystringforeBMhRE0LIoruOmyFsWj3UQXjUsLK9jbW', 0, '2021-06-01 17:25:46', NULL),
(5, 2, 1, '09512967', 'MORI ZUBIATE', 'ZONIA EMPERATRIZ', 'zmoriz', 'dpsicologia@hnseb.gob.pe', '$2a$07$usesomesillystringfore5.XZEFBrtJ9.qXuqzFwfY43rZRYXidu', 0, '2021-06-01 17:26:04', NULL),
(6, 3, 1, '09479664', 'PABLO JARAMILLO', 'NORMA BEATRIZ', 'npabloj', 'dpsicologia@hnseb.gob.pe', '$2a$07$usesomesillystringforejafDnGpmQvC62Zn3P5JoKKyWKV4zarq', 0, '2021-06-01 17:26:33', NULL),
(7, 3, 1, '10725238', 'RAPRI SOLANO', 'EDSON', 'erapris', 'dpsicologia@hnseb.gob.pe', '$2a$07$usesomesillystringforelIPayZrI4jRNiLPXnEEGudMyDr2fDY2', 0, '2021-06-01 17:26:54', NULL),
(8, 3, 1, '06781469', 'SALDAÑA CHAVEZ', 'KELLY', 'ksaldañac', 'dpsicologia@hnseb.gob.pe', '$2a$07$usesomesillystringforeZpoQa.04HI7d0l.s3qvV9RXq.FhroYq', 0, '2021-06-01 17:27:17', NULL),
(9, 3, 1, '06123251', 'SANCHEZ AQUINO', 'NORMA NELIDA', 'nsancheza', 'dpsicologia@hnseb.gob.pe', '$2a$07$usesomesillystringforeYSJzm0jn4URCyGiJ4fg.5wGT.VCsJVa', 0, '2021-06-01 17:27:36', NULL),
(10, 3, 1, '10288615', 'TRUJILLO CASTILLO', 'MIRIAM ROCIO', 'mtrujilloc', 'dpsicologia@hnseb.gob.pe', '$2a$07$usesomesillystringforet.nDPdp7Y6XclmteD.MneoaNId0Wvje', 0, '2021-06-01 17:28:01', NULL),
(11, 3, 1, '07178930', 'VELASQUEZ REYES', 'MARIA ANGELA', 'mvelasquezr', 'dpsicologia@hnseb.gob.pe', '$2a$07$usesomesillystringforedE1OzELbl6PFujI.BSco1Er6IX.Uv6C', 0, '2021-06-01 17:28:22', NULL),
(12, 3, 1, '46624029', 'ZAVALETA LOPEZ', 'DARNELLY JAHAIRA', 'dzavaletal', 'dpsicologia@hnseb.gob.pe', '$2a$07$usesomesillystringforeBQPDD/GSseqnB6cro9X9nOHtqDKTXLS', 0, '2021-06-01 17:29:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zacpsy_aud_atenciones`
--

CREATE TABLE `zacpsy_aud_atenciones` (
  `idAuditAte` int(11) NOT NULL,
  `idAtencion` int(11) NOT NULL,
  `fechaRegAudi` date NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `AccRealizada` text COLLATE utf8_bin NOT NULL,
  `cuentaAnterior` text COLLATE utf8_bin,
  `EpisodioAnterior` text COLLATE utf8_bin,
  `cuentaNueva` text COLLATE utf8_bin,
  `EpisodioNuevo` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `zacpsy_aud_atenciones`
--

INSERT INTO `zacpsy_aud_atenciones` (`idAuditAte`, `idAtencion`, `fechaRegAudi`, `idUsuario`, `AccRealizada`, `cuentaAnterior`, `EpisodioAnterior`, `cuentaNueva`, `EpisodioNuevo`) VALUES
(1, 1, '2021-06-15', 1, 'MODIFICACIÓN', '1897886', '448978', '1897886', '448978'),
(2, 45, '2021-06-15', 1, 'MODIFICACIÓN', '1898538', '0', '1898538', '0'),
(3, 96, '2021-06-16', 1, 'MODIFICACIÓN', '1901095', '451810', '1901095', '451810'),
(4, 69, '2021-06-16', 1, 'MODIFICACIÓN', '1900336', '450934', '1900336', '450934'),
(5, 101, '2021-06-16', 1, 'MODIFICACIÓN', '1901278', '451980', '1901278', '451980'),
(6, 113, '2021-06-16', 1, 'MODIFICACIÓN', '1901816', '452898', '1901816', '452898');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zacpsy_aud_familiares`
--

CREATE TABLE `zacpsy_aud_familiares` (
  `idAudiFam` int(11) NOT NULL,
  `idFamiliar` int(11) NOT NULL,
  `fecRegAudi` date NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `AccRealizada` text COLLATE utf8_bin NOT NULL,
  `idAtencionAnt` int(11) NOT NULL,
  `ndocAnt` varchar(20) COLLATE utf8_bin NOT NULL,
  `idAtencionNueva` int(11) DEFAULT NULL,
  `ndocNuevo` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acpsy_atencion`
--
ALTER TABLE `acpsy_atencion`
  ADD PRIMARY KEY (`idAtencion`),
  ADD KEY `fk_estadoAte` (`idEstadoAte`),
  ADD KEY `fk_estadoPac` (`idEstadoPacAtencion`);

--
-- Indices de la tabla `acpsy_condicionprof`
--
ALTER TABLE `acpsy_condicionprof`
  ADD PRIMARY KEY (`idCondicion`);

--
-- Indices de la tabla `acpsy_diagnosticos`
--
ALTER TABLE `acpsy_diagnosticos`
  ADD PRIMARY KEY (`idDiagnostico`);

--
-- Indices de la tabla `acpsy_estadoatencion`
--
ALTER TABLE `acpsy_estadoatencion`
  ADD PRIMARY KEY (`idEstadoAte`);

--
-- Indices de la tabla `acpsy_estadopaciente`
--
ALTER TABLE `acpsy_estadopaciente`
  ADD PRIMARY KEY (`idEstadoPacAtencion`);

--
-- Indices de la tabla `acpsy_estadoprof`
--
ALTER TABLE `acpsy_estadoprof`
  ADD PRIMARY KEY (`idEstadoProf`);

--
-- Indices de la tabla `acpsy_estadosu`
--
ALTER TABLE `acpsy_estadosu`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `acpsy_estatusseguimiento`
--
ALTER TABLE `acpsy_estatusseguimiento`
  ADD PRIMARY KEY (`idStatusSeg`);

--
-- Indices de la tabla `acpsy_etapaseguimiento`
--
ALTER TABLE `acpsy_etapaseguimiento`
  ADD PRIMARY KEY (`idEtapSegui`);

--
-- Indices de la tabla `acpsy_famatencion`
--
ALTER TABLE `acpsy_famatencion`
  ADD PRIMARY KEY (`idFamiliar`),
  ADD KEY `fk_atencion` (`idAtencion`),
  ADD KEY `fk_parentesco` (`idParentesco`),
  ADD KEY `fk_sexo` (`idTipSexo`);

--
-- Indices de la tabla `acpsy_motivoseguimiento`
--
ALTER TABLE `acpsy_motivoseguimiento`
  ADD PRIMARY KEY (`idMotSeguimiento`);

--
-- Indices de la tabla `acpsy_parentescofam`
--
ALTER TABLE `acpsy_parentescofam`
  ADD PRIMARY KEY (`idParentesco`);

--
-- Indices de la tabla `acpsy_perfiles`
--
ALTER TABLE `acpsy_perfiles`
  ADD PRIMARY KEY (`idPerfil`);

--
-- Indices de la tabla `acpsy_profesionales`
--
ALTER TABLE `acpsy_profesionales`
  ADD PRIMARY KEY (`idProfesional`),
  ADD KEY `fk_condicion` (`idCondicion`),
  ADD KEY `fk_estadoProf` (`idEstado`);

--
-- Indices de la tabla `acpsy_seguimiento`
--
ALTER TABLE `acpsy_seguimiento`
  ADD PRIMARY KEY (`idSeguimiento`),
  ADD KEY `fk_atencionpac` (`idAtencionPac`),
  ADD KEY `fk_motivo` (`idMotSeguimiento`),
  ADD KEY `fk_etapa` (`idEtapSegui`),
  ADD KEY `fk_profesional` (`idProfesional`),
  ADD KEY `fk_estatus` (`idStatusSeg`),
  ADD KEY `fk_usuarioReg` (`idUsuario`),
  ADD KEY `fk_tipoSeg` (`idTipoSeguimiento`);

--
-- Indices de la tabla `acpsy_tiposeguimiento`
--
ALTER TABLE `acpsy_tiposeguimiento`
  ADD PRIMARY KEY (`idTipoSeguimiento`);

--
-- Indices de la tabla `acpsy_tipsexo`
--
ALTER TABLE `acpsy_tipsexo`
  ADD PRIMARY KEY (`idTipSexo`);

--
-- Indices de la tabla `acpsy_usuarios`
--
ALTER TABLE `acpsy_usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_perfil` (`idPerfil`),
  ADD KEY `fk_estadoUsuario` (`idEstado`);

--
-- Indices de la tabla `zacpsy_aud_atenciones`
--
ALTER TABLE `zacpsy_aud_atenciones`
  ADD PRIMARY KEY (`idAuditAte`);

--
-- Indices de la tabla `zacpsy_aud_familiares`
--
ALTER TABLE `zacpsy_aud_familiares`
  ADD PRIMARY KEY (`idAudiFam`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acpsy_atencion`
--
ALTER TABLE `acpsy_atencion`
  MODIFY `idAtencion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT de la tabla `acpsy_condicionprof`
--
ALTER TABLE `acpsy_condicionprof`
  MODIFY `idCondicion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `acpsy_diagnosticos`
--
ALTER TABLE `acpsy_diagnosticos`
  MODIFY `idDiagnostico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `acpsy_estadoatencion`
--
ALTER TABLE `acpsy_estadoatencion`
  MODIFY `idEstadoAte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `acpsy_estadopaciente`
--
ALTER TABLE `acpsy_estadopaciente`
  MODIFY `idEstadoPacAtencion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `acpsy_estadoprof`
--
ALTER TABLE `acpsy_estadoprof`
  MODIFY `idEstadoProf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `acpsy_estadosu`
--
ALTER TABLE `acpsy_estadosu`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `acpsy_estatusseguimiento`
--
ALTER TABLE `acpsy_estatusseguimiento`
  MODIFY `idStatusSeg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `acpsy_etapaseguimiento`
--
ALTER TABLE `acpsy_etapaseguimiento`
  MODIFY `idEtapSegui` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `acpsy_famatencion`
--
ALTER TABLE `acpsy_famatencion`
  MODIFY `idFamiliar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `acpsy_motivoseguimiento`
--
ALTER TABLE `acpsy_motivoseguimiento`
  MODIFY `idMotSeguimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `acpsy_parentescofam`
--
ALTER TABLE `acpsy_parentescofam`
  MODIFY `idParentesco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `acpsy_perfiles`
--
ALTER TABLE `acpsy_perfiles`
  MODIFY `idPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `acpsy_profesionales`
--
ALTER TABLE `acpsy_profesionales`
  MODIFY `idProfesional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `acpsy_seguimiento`
--
ALTER TABLE `acpsy_seguimiento`
  MODIFY `idSeguimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `acpsy_tiposeguimiento`
--
ALTER TABLE `acpsy_tiposeguimiento`
  MODIFY `idTipoSeguimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `acpsy_tipsexo`
--
ALTER TABLE `acpsy_tipsexo`
  MODIFY `idTipSexo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `acpsy_usuarios`
--
ALTER TABLE `acpsy_usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `zacpsy_aud_atenciones`
--
ALTER TABLE `zacpsy_aud_atenciones`
  MODIFY `idAuditAte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `zacpsy_aud_familiares`
--
ALTER TABLE `zacpsy_aud_familiares`
  MODIFY `idAudiFam` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acpsy_atencion`
--
ALTER TABLE `acpsy_atencion`
  ADD CONSTRAINT `fk_estadoAte` FOREIGN KEY (`idEstadoAte`) REFERENCES `acpsy_estadoatencion` (`idEstadoAte`),
  ADD CONSTRAINT `fk_estadoPac` FOREIGN KEY (`idEstadoPacAtencion`) REFERENCES `acpsy_estadopaciente` (`idEstadoPacAtencion`);

--
-- Filtros para la tabla `acpsy_famatencion`
--
ALTER TABLE `acpsy_famatencion`
  ADD CONSTRAINT `fk_atencion` FOREIGN KEY (`idAtencion`) REFERENCES `acpsy_atencion` (`idAtencion`),
  ADD CONSTRAINT `fk_parentesco` FOREIGN KEY (`idParentesco`) REFERENCES `acpsy_parentescofam` (`idParentesco`),
  ADD CONSTRAINT `fk_sexo` FOREIGN KEY (`idTipSexo`) REFERENCES `acpsy_tipsexo` (`idTipSexo`);

--
-- Filtros para la tabla `acpsy_profesionales`
--
ALTER TABLE `acpsy_profesionales`
  ADD CONSTRAINT `fk_condicion` FOREIGN KEY (`idCondicion`) REFERENCES `acpsy_condicionprof` (`idCondicion`),
  ADD CONSTRAINT `fk_estadoProf` FOREIGN KEY (`idEstado`) REFERENCES `acpsy_estadoprof` (`idEstadoProf`);

--
-- Filtros para la tabla `acpsy_seguimiento`
--
ALTER TABLE `acpsy_seguimiento`
  ADD CONSTRAINT `fk_atencionpac` FOREIGN KEY (`idAtencionPac`) REFERENCES `acpsy_atencion` (`idAtencion`),
  ADD CONSTRAINT `fk_estatus` FOREIGN KEY (`idStatusSeg`) REFERENCES `acpsy_estatusseguimiento` (`idStatusSeg`),
  ADD CONSTRAINT `fk_etapa` FOREIGN KEY (`idEtapSegui`) REFERENCES `acpsy_etapaseguimiento` (`idEtapSegui`),
  ADD CONSTRAINT `fk_motivo` FOREIGN KEY (`idMotSeguimiento`) REFERENCES `acpsy_motivoseguimiento` (`idMotSeguimiento`),
  ADD CONSTRAINT `fk_profesional` FOREIGN KEY (`idProfesional`) REFERENCES `acpsy_profesionales` (`idProfesional`),
  ADD CONSTRAINT `fk_tipoSeg` FOREIGN KEY (`idTipoSeguimiento`) REFERENCES `acpsy_tiposeguimiento` (`idTipoSeguimiento`),
  ADD CONSTRAINT `fk_usuarioReg` FOREIGN KEY (`idUsuario`) REFERENCES `acpsy_usuarios` (`idUsuario`);

--
-- Filtros para la tabla `acpsy_usuarios`
--
ALTER TABLE `acpsy_usuarios`
  ADD CONSTRAINT `fk_estadoUsuario` FOREIGN KEY (`idEstado`) REFERENCES `acpsy_estadosu` (`idEstado`),
  ADD CONSTRAINT `fk_perfil` FOREIGN KEY (`idPerfil`) REFERENCES `acpsy_perfiles` (`idPerfil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
