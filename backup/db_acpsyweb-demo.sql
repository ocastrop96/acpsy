-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 19-07-2021 a las 20:08:59
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
-- Base de datos: `db_acpsyweb`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ANULAR_ATENCION` (IN `_idAtencion` INT(11))  UPDATE acpsy_atencion SET idEpisodio = "ANULADA", cuentaAtencion = "ANULADA", idEstadoAte = 2 WHERE idAtencion = _idAtencion$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ANULAR_SEGUIMIENTO` (IN `_idSeguimiento` INT(11))  UPDATE acpsy_seguimiento 
SET acpsy_seguimiento.idStatusSeg = 2
WHERE
	idSeguimiento = _idSeguimiento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_PACIENTE` (IN `_termino` TEXT)  SELECT
idAtencion,cuentaAtencion,tipdocAtencion,nrodocAtencion,CONCAT(nombAtencion,' ',apPaternoAtencion,' ',apMaternoAtencion) AS paciente,acpsy_estadopaciente.detaEstadoPacAtencion
FROM
	acpsy_atencion
INNER JOIN
	acpsy_estadopaciente
	ON 
		acpsy_atencion.idEstadoPacAtencion = acpsy_estadopaciente.idEstadoPacAtencion
WHERE (acpsy_atencion.nrodocAtencion LIKE CONCAT('%',_termino,'%') OR acpsy_atencion.apPaternoAtencion LIKE CONCAT('%',UPPER(_termino),'%') OR acpsy_atencion.apMaternoAtencion LIKE CONCAT('%',UPPER(_termino),'%') OR acpsy_atencion.nombAtencion LIKE CONCAT('%',UPPER(_termino),'%')) AND (acpsy_atencion.idEstadoAte != 2)$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `EDITAR_SEGUIMIENTO` (IN `_idSeguimiento` INT(11), IN `_fRegistrSeg` DATE, IN `_idAtencionPac` INT(11), IN `_idProfesional` INT(11), IN `_idTipoSeguimiento` INT(11), IN `_idMotSeguimiento` INT(11), IN `_idDiag1Seg` INT(11), IN `_idDiag2Seg` INT(11), IN `_comunFamSeg` VARCHAR(10), IN `_idFamAtSeg` INT(11), IN `_idDiag1SegFam` INT(11), IN `_idDiag2SegFam` INT(11), IN `_obsSeg` VARCHAR(200))  UPDATE acpsy_seguimiento 
SET fRegistrSeg = _fRegistrSeg,
idAtencionPac = _idAtencionPac,
idProfesional = _idProfesional,
idTipoSeguimiento = _idTipoSeguimiento,
idMotSeguimiento = _idMotSeguimiento,
idDiag1Seg = _idDiag1Seg,
idDiag2Seg = _idDiag2Seg,
comunFamSeg = _comunFamSeg,
idFamAtSeg = _idFamAtSeg,
idDiag1SegFam = _idDiag1SegFam,
idDiag2SegFam = _idDiag2SegFam,
obsSeg = _obsSeg 
WHERE
	idSeguimiento = _idSeguimiento$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `GRAFICO_DIAGNOSTICOS` ()  SELECT
	acpsy_diagnosticos.idDiagnostico as id, 
	acpsy_diagnosticos.cieDiagnostico as cie10, 
	acpsy_diagnosticos.detaDiagnostico as detalle, 
	COUNT(*) AS frecuencia
FROM
	acpsy_seguimiento
	INNER JOIN
	acpsy_diagnosticos
	ON 
		acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
GROUP BY
	acpsy_seguimiento.idDiag1Seg
ORDER BY frecuencia DESC
LIMIT 10$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GRAFICO_SEGUIMIENTO_MENSUAL` ()  SELECT
MONTH ( acpsy_seguimiento.fRegistrSeg ) AS NMES,
MES_SPANISH ( acpsy_seguimiento.fRegistrSeg, 'es_ES' ) AS MES,
COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTEO 
FROM
	acpsy_seguimiento 
WHERE
	idStatusSeg = 1 
	AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
	CURDATE()) 
GROUP BY
	NMES,MES
ORDER BY MONTH(acpsy_seguimiento.fRegistrSeg)$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_ATENCIONES_F` ()  SELECT
acpsy_atencion.idAtencion,
acpsy_atencion.correlativo_Atencion,
date_format( acpsy_atencion.fRegistroAtencion, '%d/%m/%Y' ) AS fRegistroAtencion,
acpsy_atencion.idEpisodio,
acpsy_atencion.cuentaAtencion,
acpsy_atencion.historiaAtencion,
acpsy_atencion.idEstadoPacAtencion,
acpsy_estadopaciente.detaEstadoPacAtencion,
date_format( acpsy_atencion.fechaPacNacimiento, '%d/%m/%Y' ) AS fechaPacNacimiento,
acpsy_atencion.tipdocAtencion,
acpsy_atencion.nrodocAtencion,
acpsy_atencion.apPaternoAtencion,
acpsy_atencion.apMaternoAtencion,
acpsy_atencion.nombAtencion,
date_format( acpsy_atencion.fIngresoAtencion, '%d/%m/%Y' ) AS fIngresoAtencion,
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
	INNER JOIN acpsy_estadoatencion ON acpsy_atencion.idEstadoAte = acpsy_estadoatencion.idEstadoAte
	INNER JOIN acpsy_estadopaciente ON acpsy_atencion.idEstadoPacAtencion = acpsy_estadopaciente.idEstadoPacAtencion
	INNER JOIN acpsy_tipsexo ON acpsy_atencion.tipSexoAtencion = acpsy_tipsexo.idTipSexo 
WHERE
	MONTH ( acpsy_atencion.fRegistroAtencion ) = MONTH (
	CURDATE()) 
	AND YEAR ( acpsy_atencion.fRegistroAtencion ) = YEAR (
	CURDATE()) 
ORDER BY
	acpsy_atencion.correlativo_Atencion DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_ATENCIONES_FECHAS` (IN `_fechaInicialAte` DATE, IN `_fechaFinalAte` DATE)  IF
	( _fechaInicialAte = _fechaFinalAte ) THEN
	SELECT
		acpsy_atencion.idAtencion,
		acpsy_atencion.correlativo_Atencion,
		date_format( acpsy_atencion.fRegistroAtencion, '%d/%m/%Y' ) AS fRegistroAtencion,
		acpsy_atencion.idEpisodio,
		acpsy_atencion.cuentaAtencion,
		acpsy_atencion.historiaAtencion,
		acpsy_atencion.idEstadoPacAtencion,
		acpsy_estadopaciente.detaEstadoPacAtencion,
		date_format( acpsy_atencion.fechaPacNacimiento, '%d/%m/%Y' ) AS fechaPacNacimiento,
		acpsy_atencion.tipdocAtencion,
		acpsy_atencion.nrodocAtencion,
		acpsy_atencion.apPaternoAtencion,
		acpsy_atencion.apMaternoAtencion,
		acpsy_atencion.nombAtencion,
		date_format( acpsy_atencion.fIngresoAtencion, '%d/%m/%Y' ) AS fIngresoAtencion,
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
		INNER JOIN acpsy_estadoatencion ON acpsy_atencion.idEstadoAte = acpsy_estadoatencion.idEstadoAte
		INNER JOIN acpsy_estadopaciente ON acpsy_atencion.idEstadoPacAtencion = acpsy_estadopaciente.idEstadoPacAtencion
		INNER JOIN acpsy_tipsexo ON acpsy_atencion.tipSexoAtencion = acpsy_tipsexo.idTipSexo 
	WHERE
		acpsy_atencion.fRegistroAtencion = _fechaFinalAte 
	ORDER BY
		acpsy_atencion.correlativo_Atencion DESC;
	ELSE SELECT
		acpsy_atencion.idAtencion,
		acpsy_atencion.correlativo_Atencion,
		date_format( acpsy_atencion.fRegistroAtencion, '%d/%m/%Y' ) AS fRegistroAtencion,
		acpsy_atencion.idEpisodio,
		acpsy_atencion.cuentaAtencion,
		acpsy_atencion.historiaAtencion,
		acpsy_atencion.idEstadoPacAtencion,
		acpsy_estadopaciente.detaEstadoPacAtencion,
		date_format( acpsy_atencion.fechaPacNacimiento, '%d/%m/%Y' ) AS fechaPacNacimiento,
		acpsy_atencion.tipdocAtencion,
		acpsy_atencion.nrodocAtencion,
		acpsy_atencion.apPaternoAtencion,
		acpsy_atencion.apMaternoAtencion,
		acpsy_atencion.nombAtencion,
		date_format( acpsy_atencion.fIngresoAtencion, '%d/%m/%Y' ) AS fIngresoAtencion,
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
		INNER JOIN acpsy_estadoatencion ON acpsy_atencion.idEstadoAte = acpsy_estadoatencion.idEstadoAte
		INNER JOIN acpsy_estadopaciente ON acpsy_atencion.idEstadoPacAtencion = acpsy_estadopaciente.idEstadoPacAtencion
		INNER JOIN acpsy_tipsexo ON acpsy_atencion.tipSexoAtencion = acpsy_tipsexo.idTipSexo 
	WHERE
	acpsy_atencion.fRegistroAtencion BETWEEN _fechaInicialAte 
	AND _fechaFinalAte
	ORDER BY
		acpsy_atencion.correlativo_Atencion DESC;

END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_CONDICIONES_PROF` ()  SELECT idCondicion,detaCondicion FROM acpsy_condicionprof$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_DIAGNOSTICOS` ()  SELECT
acpsy_diagnosticos.idDiagnostico,
acpsy_diagnosticos.cieDiagnostico,
UPPER(acpsy_diagnosticos.detaDiagnostico) AS detaDiagnostico
FROM
	acpsy_diagnosticos 
ORDER BY acpsy_diagnosticos.idDiagnostico ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_DIAGNOSTICO_NO_SELECCIONADO` (IN `_idDiagnostico` INT)  SELECT
acpsy_diagnosticos.idDiagnostico,
acpsy_diagnosticos.cieDiagnostico,
UPPER(acpsy_diagnosticos.detaDiagnostico) AS detaDiagnostico
FROM
	acpsy_diagnosticos 
WHERE acpsy_diagnosticos.idDiagnostico != _idDiagnostico
ORDER BY acpsy_diagnosticos.idDiagnostico ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_ESTADOS_PACIENTE` ()  SELECT
	acpsy_estadopaciente.idEstadoPacAtencion, 
	acpsy_estadopaciente.detaEstadoPacAtencion
FROM
	acpsy_estadopaciente$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_ETAPAS_SEGUIMIENTO` ()  SELECT
	acpsy_etapaseguimiento.idEtapSegui, 
	acpsy_etapaseguimiento.detaEtapSegui
FROM
	acpsy_etapaseguimiento$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_FAMILIARES_F` ()  SELECT
acpsy_famatencion.idFamiliar,
date_format( acpsy_famatencion.fechaRegistro, '%d/%m/%Y' ) AS fechaRegistro,
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
	INNER JOIN acpsy_atencion ON acpsy_famatencion.idAtencion = acpsy_atencion.idAtencion
	INNER JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
	INNER JOIN acpsy_tipsexo ON acpsy_famatencion.idTipSexo = acpsy_tipsexo.idTipSexo 
WHERE
	MONTH ( acpsy_famatencion.fechaRegistro ) = MONTH (
	CURDATE()) AND YEAR( acpsy_famatencion.fechaRegistro ) = YEAR(CURDATE())
ORDER BY
	acpsy_famatencion.fechaRegistro DESC,
	acpsy_famatencion.idFamiliar DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_FAMILIARES_FECHAS` (IN `_fechaInicialFam` DATE, IN `_fechaFinalFam` DATE)  IF
	( _fechaInicialFam = _fechaFinalFam ) THEN
	SELECT
		acpsy_famatencion.idFamiliar,
		date_format( acpsy_famatencion.fechaRegistro, '%d/%m/%Y' ) AS fechaRegistro,
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
		INNER JOIN acpsy_atencion ON acpsy_famatencion.idAtencion = acpsy_atencion.idAtencion
		INNER JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
		INNER JOIN acpsy_tipsexo ON acpsy_famatencion.idTipSexo = acpsy_tipsexo.idTipSexo 
	WHERE
		acpsy_famatencion.fechaRegistro = _fechaFinalFam 
	ORDER BY
		acpsy_famatencion.fechaRegistro DESC,
		acpsy_famatencion.idFamiliar DESC;
	ELSE SELECT
		acpsy_famatencion.idFamiliar,
		date_format( acpsy_famatencion.fechaRegistro, '%d/%m/%Y' ) AS fechaRegistro,
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
		INNER JOIN acpsy_atencion ON acpsy_famatencion.idAtencion = acpsy_atencion.idAtencion
		INNER JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
		INNER JOIN acpsy_tipsexo ON acpsy_famatencion.idTipSexo = acpsy_tipsexo.idTipSexo 
	WHERE
		acpsy_famatencion.fechaRegistro BETWEEN _fechaInicialFam 
		AND _fechaFinalFam 
	ORDER BY
		acpsy_famatencion.fechaRegistro DESC,
		acpsy_famatencion.idFamiliar DESC; 
	END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_FAMILIAR_PACIENTE` (IN `_idAtencion` INT(11))  SELECT
	acpsy_famatencion.idFamiliar,
	CONCAT( acpsy_famatencion.nombApFamiliar, ' - ', acpsy_parentescofam.detaParentesco, ' ', acpsy_famatencion.telcelFamiliar ) AS familiarPaciente 
FROM
	acpsy_famatencion
	INNER JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco 
WHERE
	acpsy_famatencion.idAtencion = _idAtencion ORDER BY acpsy_famatencion.nombApFamiliar ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_MOTIVOS_SEGUIMIENTO` ()  SELECT
	acpsy_motivoseguimiento.idMotSeguimiento, 
	acpsy_motivoseguimiento.detaMotivoSef
FROM
	acpsy_motivoseguimiento$$

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
		acpsy_profesionales.idCondicion = acpsy_condicionprof.idCondicion
	ORDER BY acpsy_profesionales.apellidosProfesional ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_SEGUIMIENTOS` ()  SELECT
	acpsy_seguimiento.idSeguimiento, 
		date_format(acpsy_seguimiento.fRegistrSeg,'%d/%m/%Y') as fRegistrSeg, 
	acpsy_seguimiento.idAtencionPac, 
	acpsy_atencion.cuentaAtencion, 
	acpsy_atencion.tipdocAtencion,
	acpsy_atencion.nrodocAtencion,
	acpsy_atencion.historiaAtencion, 
	acpsy_atencion.nombAtencion, 
	acpsy_atencion.apPaternoAtencion, 
	acpsy_atencion.apMaternoAtencion, 
	acpsy_seguimiento.idTipoSeguimiento, 
	acpsy_tiposeguimiento.detaTipSeguimiento, 
	acpsy_seguimiento.idMotSeguimiento, 
	acpsy_motivoseguimiento.detaMotivoSef, 
	acpsy_seguimiento.idProfesional, 
	acpsy_profesionales.nombresProfesional, 
	acpsy_profesionales.apellidosProfesional, 
	acpsy_seguimiento.comunFamSeg, 
	acpsy_seguimiento.idDiag1Seg, 
	acpsy_diagnosticos.cieDiagnostico as cieP1,
	acpsy_diagnosticos.detaDiagnostico as detaD1, 
	acpsy_seguimiento.idDiag2Seg,
	dp2.cieDiagnostico as cieP2,
	dp2.detaDiagnostico as detD2, 		
	acpsy_seguimiento.idFamAtSeg, 
	acpsy_famatencion.nombApFamiliar,
	acpsy_famatencion.telcelFamiliar,
	acpsy_parentescofam.detaParentesco,
	acpsy_seguimiento.idDiag1SegFam,
	df1.cieDiagnostico as cieDF1,
	df1.detaDiagnostico as detDF1,  
	acpsy_seguimiento.idDiag2SegFam,
	df2.cieDiagnostico as cieDF2,
	df2.detaDiagnostico as detDF2,   
	acpsy_seguimiento.obsSeg, 
	acpsy_seguimiento.idStatusSeg, 
	acpsy_estatusseguimiento.detaStatusSeg
FROM
	acpsy_seguimiento
	INNER JOIN
	acpsy_atencion
	ON 
		acpsy_seguimiento.idAtencionPac = acpsy_atencion.idAtencion
	INNER JOIN
	acpsy_profesionales
	ON 
		acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional
	INNER JOIN
	acpsy_tiposeguimiento
	ON 
		acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento
	INNER JOIN
	acpsy_motivoseguimiento
	ON 
		acpsy_seguimiento.idMotSeguimiento = acpsy_motivoseguimiento.idMotSeguimiento
	INNER JOIN
	acpsy_estatusseguimiento
	ON 
		acpsy_seguimiento.idStatusSeg = acpsy_estatusseguimiento.idStatusSeg
	LEFT JOIN
	acpsy_famatencion
	ON 
		acpsy_seguimiento.idFamAtSeg = acpsy_famatencion.idFamiliar
	INNER JOIN
	acpsy_diagnosticos
	ON 
		acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
	LEFT JOIN
	acpsy_diagnosticos as dp2
	ON 
	acpsy_seguimiento.idDiag2Seg = dp2.idDiagnostico
	LEFT JOIN
	acpsy_diagnosticos as df1
	ON 
	acpsy_seguimiento.idDiag1SegFam = df1.idDiagnostico
	LEFT JOIN
	acpsy_diagnosticos as df2
	ON 
	acpsy_seguimiento.idDiag2SegFam = df2.idDiagnostico
	LEFT JOIN
	acpsy_parentescofam
	ON
	acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
	WHERE acpsy_seguimiento.idStatusSeg != 2
ORDER BY acpsy_seguimiento.fRegistrSeg desc, acpsy_seguimiento.idSeguimiento desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_SEGUIMIENTOS_F` (IN `_idProfesional` INT(11))  SELECT
acpsy_seguimiento.idSeguimiento,
date_format( acpsy_seguimiento.fRegistrSeg, '%d/%m/%Y' ) AS fRegistrSeg,
acpsy_seguimiento.idAtencionPac,
acpsy_atencion.cuentaAtencion,
acpsy_atencion.tipdocAtencion,
acpsy_atencion.nrodocAtencion,
acpsy_atencion.historiaAtencion,
acpsy_atencion.nombAtencion,
acpsy_atencion.apPaternoAtencion,
acpsy_atencion.apMaternoAtencion,
acpsy_seguimiento.idTipoSeguimiento,
acpsy_tiposeguimiento.detaTipSeguimiento,
acpsy_seguimiento.idMotSeguimiento,
acpsy_motivoseguimiento.detaMotivoSef,
acpsy_seguimiento.idProfesional,
acpsy_profesionales.nombresProfesional,
acpsy_profesionales.apellidosProfesional,
acpsy_seguimiento.comunFamSeg,
acpsy_seguimiento.idDiag1Seg,
acpsy_diagnosticos.cieDiagnostico AS cieP1,
acpsy_diagnosticos.detaDiagnostico AS detaD1,
acpsy_seguimiento.idDiag2Seg,
dp2.cieDiagnostico AS cieP2,
dp2.detaDiagnostico AS detD2,
acpsy_seguimiento.idFamAtSeg,
acpsy_famatencion.nombApFamiliar,
acpsy_famatencion.telcelFamiliar,
acpsy_parentescofam.detaParentesco,
acpsy_seguimiento.idDiag1SegFam,
df1.cieDiagnostico AS cieDF1,
df1.detaDiagnostico AS detDF1,
acpsy_seguimiento.idDiag2SegFam,
df2.cieDiagnostico AS cieDF2,
df2.detaDiagnostico AS detDF2,
acpsy_seguimiento.obsSeg,
acpsy_seguimiento.idStatusSeg,
acpsy_estatusseguimiento.detaStatusSeg 
FROM
	acpsy_seguimiento
	INNER JOIN acpsy_atencion ON acpsy_seguimiento.idAtencionPac = acpsy_atencion.idAtencion
	INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional
	INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento
	INNER JOIN acpsy_motivoseguimiento ON acpsy_seguimiento.idMotSeguimiento = acpsy_motivoseguimiento.idMotSeguimiento
	INNER JOIN acpsy_estatusseguimiento ON acpsy_seguimiento.idStatusSeg = acpsy_estatusseguimiento.idStatusSeg
	LEFT JOIN acpsy_famatencion ON acpsy_seguimiento.idFamAtSeg = acpsy_famatencion.idFamiliar
	INNER JOIN acpsy_diagnosticos ON acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
	LEFT JOIN acpsy_diagnosticos AS dp2 ON acpsy_seguimiento.idDiag2Seg = dp2.idDiagnostico
	LEFT JOIN acpsy_diagnosticos AS df1 ON acpsy_seguimiento.idDiag1SegFam = df1.idDiagnostico
	LEFT JOIN acpsy_diagnosticos AS df2 ON acpsy_seguimiento.idDiag2SegFam = df2.idDiagnostico
	LEFT JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco 
WHERE
	MONTH ( acpsy_seguimiento.fRegistrSeg ) = MONTH (
	CURDATE()) AND YEAR( acpsy_seguimiento.fRegistrSeg ) = YEAR(CURDATE())
	AND acpsy_seguimiento.idStatusSeg != 2  AND acpsy_seguimiento.idProfesional = _idProfesional
ORDER BY
	acpsy_seguimiento.fRegistrSeg DESC,
	acpsy_seguimiento.idSeguimiento DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_SEGUIMIENTOS_FECHAS` (IN `_fechaInicialSeg` DATE, IN `_fechaFinalSeg` DATE, IN `_idProfesional` INT(11))  IF
	( _fechaInicialSeg = _fechaFinalSeg ) THEN
	SELECT
		acpsy_seguimiento.idSeguimiento,
		date_format( acpsy_seguimiento.fRegistrSeg, '%d/%m/%Y' ) AS fRegistrSeg,
		acpsy_seguimiento.idAtencionPac,
		acpsy_atencion.cuentaAtencion,
		acpsy_atencion.tipdocAtencion,
		acpsy_atencion.nrodocAtencion,
		acpsy_atencion.historiaAtencion,
		acpsy_atencion.nombAtencion,
		acpsy_atencion.apPaternoAtencion,
		acpsy_atencion.apMaternoAtencion,
		acpsy_seguimiento.idTipoSeguimiento,
		acpsy_tiposeguimiento.detaTipSeguimiento,
		acpsy_seguimiento.idMotSeguimiento,
		acpsy_motivoseguimiento.detaMotivoSef,
		acpsy_seguimiento.idProfesional,
		acpsy_profesionales.nombresProfesional,
		acpsy_profesionales.apellidosProfesional,
		acpsy_seguimiento.comunFamSeg,
		acpsy_seguimiento.idDiag1Seg,
		acpsy_diagnosticos.cieDiagnostico AS cieP1,
		acpsy_diagnosticos.detaDiagnostico AS detaD1,
		acpsy_seguimiento.idDiag2Seg,
		dp2.cieDiagnostico AS cieP2,
		dp2.detaDiagnostico AS detD2,
		acpsy_seguimiento.idFamAtSeg,
		acpsy_famatencion.nombApFamiliar,
		acpsy_famatencion.telcelFamiliar,
		acpsy_parentescofam.detaParentesco,
		acpsy_seguimiento.idDiag1SegFam,
		df1.cieDiagnostico AS cieDF1,
		df1.detaDiagnostico AS detDF1,
		acpsy_seguimiento.idDiag2SegFam,
		df2.cieDiagnostico AS cieDF2,
		df2.detaDiagnostico AS detDF2,
		acpsy_seguimiento.obsSeg,
		acpsy_seguimiento.idStatusSeg,
		acpsy_estatusseguimiento.detaStatusSeg 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_atencion ON acpsy_seguimiento.idAtencionPac = acpsy_atencion.idAtencion
		INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento
		INNER JOIN acpsy_motivoseguimiento ON acpsy_seguimiento.idMotSeguimiento = acpsy_motivoseguimiento.idMotSeguimiento
		INNER JOIN acpsy_estatusseguimiento ON acpsy_seguimiento.idStatusSeg = acpsy_estatusseguimiento.idStatusSeg
		LEFT JOIN acpsy_famatencion ON acpsy_seguimiento.idFamAtSeg = acpsy_famatencion.idFamiliar
		INNER JOIN acpsy_diagnosticos ON acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS dp2 ON acpsy_seguimiento.idDiag2Seg = dp2.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS df1 ON acpsy_seguimiento.idDiag1SegFam = df1.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS df2 ON acpsy_seguimiento.idDiag2SegFam = df2.idDiagnostico
		LEFT JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco 
	WHERE
		acpsy_seguimiento.idStatusSeg != 2 
		AND acpsy_seguimiento.fRegistrSeg = _fechaFinalSeg  AND acpsy.acpsy_seguimiento.idProfesional = _idProfesional
	ORDER BY
		acpsy_seguimiento.fRegistrSeg DESC,
		acpsy_seguimiento.idSeguimiento DESC;
	ELSE SELECT
		acpsy_seguimiento.idSeguimiento,
		date_format( acpsy_seguimiento.fRegistrSeg, '%d/%m/%Y' ) AS fRegistrSeg,
		acpsy_seguimiento.idAtencionPac,
		acpsy_atencion.cuentaAtencion,
		acpsy_atencion.tipdocAtencion,
		acpsy_atencion.nrodocAtencion,
		acpsy_atencion.historiaAtencion,
		acpsy_atencion.nombAtencion,
		acpsy_atencion.apPaternoAtencion,
		acpsy_atencion.apMaternoAtencion,
		acpsy_seguimiento.idTipoSeguimiento,
		acpsy_tiposeguimiento.detaTipSeguimiento,
		acpsy_seguimiento.idMotSeguimiento,
		acpsy_motivoseguimiento.detaMotivoSef,
		acpsy_seguimiento.idProfesional,
		acpsy_profesionales.nombresProfesional,
		acpsy_profesionales.apellidosProfesional,
		acpsy_seguimiento.comunFamSeg,
		acpsy_seguimiento.idDiag1Seg,
		acpsy_diagnosticos.cieDiagnostico AS cieP1,
		acpsy_diagnosticos.detaDiagnostico AS detaD1,
		acpsy_seguimiento.idDiag2Seg,
		dp2.cieDiagnostico AS cieP2,
		dp2.detaDiagnostico AS detD2,
		acpsy_seguimiento.idFamAtSeg,
		acpsy_famatencion.nombApFamiliar,
		acpsy_famatencion.telcelFamiliar,
		acpsy_parentescofam.detaParentesco,
		acpsy_seguimiento.idDiag1SegFam,
		df1.cieDiagnostico AS cieDF1,
		df1.detaDiagnostico AS detDF1,
		acpsy_seguimiento.idDiag2SegFam,
		df2.cieDiagnostico AS cieDF2,
		df2.detaDiagnostico AS detDF2,
		acpsy_seguimiento.obsSeg,
		acpsy_seguimiento.idStatusSeg,
		acpsy_estatusseguimiento.detaStatusSeg 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_atencion ON acpsy_seguimiento.idAtencionPac = acpsy_atencion.idAtencion
		INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento
		INNER JOIN acpsy_motivoseguimiento ON acpsy_seguimiento.idMotSeguimiento = acpsy_motivoseguimiento.idMotSeguimiento
		INNER JOIN acpsy_estatusseguimiento ON acpsy_seguimiento.idStatusSeg = acpsy_estatusseguimiento.idStatusSeg
		LEFT JOIN acpsy_famatencion ON acpsy_seguimiento.idFamAtSeg = acpsy_famatencion.idFamiliar
		INNER JOIN acpsy_diagnosticos ON acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS dp2 ON acpsy_seguimiento.idDiag2Seg = dp2.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS df1 ON acpsy_seguimiento.idDiag1SegFam = df1.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS df2 ON acpsy_seguimiento.idDiag2SegFam = df2.idDiagnostico
		LEFT JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco 
	WHERE
		acpsy_seguimiento.idStatusSeg != 2 
		AND 
		acpsy_seguimiento.fRegistrSeg BETWEEN _fechaInicialSeg AND _fechaFinalSeg AND acpsy.acpsy_seguimiento.idProfesional = _idProfesional
	ORDER BY
		acpsy_seguimiento.fRegistrSeg DESC,
	acpsy_seguimiento.idSeguimiento DESC ;
	END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_SEXO` ()  SELECT
	acpsy_tipsexo.idTipSexo, 
	acpsy_tipsexo.detaTipSexo
FROM
	acpsy_tipsexo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_TIPO_SEGUIMIENTO` ()  SELECT
	acpsy_tiposeguimiento.idTipoSeguimiento, 
	acpsy_tiposeguimiento.detaTipSeguimiento
FROM
	acpsy_tiposeguimiento$$

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
	acpsy_estadosu.detalleEstadoU,
	acpsy_profesionales.idProfesional, 
	acpsy_profesionales.nombresProfesional, 
	acpsy_profesionales.apellidosProfesional
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
	LEFT JOIN
	acpsy_profesionales
	ON 
		acpsy_usuarios.dniUsuario = acpsy_profesionales.dniProfesional 
	ORDER BY acpsy_usuarios.idPerfil ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_WIDGETS` ()  SELECT COUNT(*) as nseguimientos, (SELECT COUNT(*) from acpsy_atencion WHERE idEstadoAte != 3) as natenciones, (SELECT COUNT(*) from acpsy_famatencion) as nfamiliares, (SELECT COUNT(*) from acpsy_usuarios) as nusuarios,(SELECT COUNT(*) FROM acpsy_profesionales) as nprofesionales,(SELECT COUNT(*) FROM acpsy_diagnosticos) as ndiagnosticos from acpsy_seguimiento WHERE idStatusSeg != 2$$

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
	acpsy_estadosu.detalleEstadoU,
		acpsy_profesionales.idProfesional,
		CONCAT(acpsy_profesionales.nombresProfesional,' ',acpsy_profesionales.apellidosProfesional) AS profesional
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
	LEFT JOIN
	acpsy_profesionales
	ON 
		acpsy_usuarios.dniUsuario = acpsy_profesionales.dniProfesional 
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_SEGUIMIENTO` (IN `_fRegistrSeg` DATE, IN `_idUsuario` INT(11), IN `_idAtencionPac` INT(11), IN `_idProfesional` INT(11), IN `_idTipoSeguimiento` INT(11), IN `_idMotSeguimiento` INT(11), IN `_idDiag1Seg` INT(11), IN `_idDiag2Seg` INT(11), IN `_comunFamSeg` VARCHAR(10), IN `_idFamAtSeg` INT(11), IN `_idDiag1SegFam` INT(11), IN `_idDiag2SegFam` INT(11), IN `_obsSeg` VARCHAR(200))  INSERT INTO acpsy_seguimiento (
	fRegistrSeg,
	idUsuario,
	idAtencionPac,
	idProfesional,
	idTipoSeguimiento,
	idMotSeguimiento,
	idDiag1Seg,
	idDiag2Seg,
	comunFamSeg,
	idFamAtSeg,
	idDiag1SegFam,
	idDiag2SegFam,
	obsSeg 
)
VALUES
	(
		_fRegistrSeg,
		_idUsuario,
		_idAtencionPac,
		_idProfesional,
		_idTipoSeguimiento,
		_idMotSeguimiento,
		_idDiag1Seg,
		_idDiag2Seg,
		_comunFamSeg,
		_idFamAtSeg,
		_idDiag1SegFam,
	_idDiag2SegFam,
	_obsSeg)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_USUARIO` (IN `_idPerfil` INT(11), IN `_dniUsuario` VARCHAR(20), IN `_apellidosUsuario` VARCHAR(50), IN `_nombresUsuario` VARCHAR(50), IN `_cuentaUsuario` VARCHAR(50), IN `_correoUsuario` VARCHAR(50), IN `_claveUsuario` VARCHAR(100))  INSERT INTO acpsy_usuarios ( idPerfil, dniUsuario, apellidosUsuario, nombresUsuario, cuentaUsuario, correoUsuario, claveUsuario )
VALUES
	( _idPerfil, _dniUsuario, _apellidosUsuario, _nombresUsuario, _cuentaUsuario, _correoUsuario, _claveUsuario )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRO_INTENTOS` (IN `_idUsuario` INT(11))  BEGIN
UPDATE acpsy_usuarios SET intentosUsuario = intentosUsuario + 1 WHERE idUsuario = _idUsuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_ATEREGANU` (IN `_inicio` VARCHAR(10), IN `_fin` VARCHAR(10))  IF _inicio = "" THEN
	SELECT
	MONTH
	( acpsy_atencion.fRegistroAtencion ) AS NMES, 
	MES_SPANISH ( acpsy_atencion.fRegistroAtencion, 'es_ES' ) AS MES, 
	COUNT(
	IF
	(acpsy_estadoatencion.idEstadoAte = 1, 1, NULL )) AS REGISTRADAS,
	COUNT(
	IF
	( acpsy_estadoatencion.idEstadoAte = 2, 1, NULL )) AS ANULADAS
FROM
	acpsy_atencion
	INNER JOIN
	acpsy_estadoatencion
	ON 
		acpsy_atencion.idEstadoAte = acpsy_estadoatencion.idEstadoAte
WHERE
	YEAR ( acpsy_atencion.fRegistroAtencion ) = YEAR (
	CURDATE())
GROUP BY
	NMES, 
	MES
ORDER BY
	MONTH (
	acpsy_atencion.fRegistroAtencion);
	ELSE 
	SELECT MONTH
		( acpsy_atencion.fRegistroAtencion ) AS NMES,
		MES_SPANISH ( acpsy_atencion.fRegistroAtencion, 'es_ES' ) AS MES,
		COUNT(
	IF
	(acpsy_estadoatencion.idEstadoAte = 1, 1, NULL )) AS REGISTRADAS,
	COUNT(
	IF
	( acpsy_estadoatencion.idEstadoAte = 2, 1, NULL )) AS ANULADAS 
	FROM
		acpsy_atencion
		INNER JOIN acpsy_estadoatencion ON acpsy_atencion.idEstadoAte = acpsy_estadoatencion.idEstadoAte 
	WHERE
		acpsy_atencion.fRegistroAtencion BETWEEN _inicio 
		AND _fin 
	GROUP BY
		NMES,
		MES
	ORDER BY
	MONTH ( acpsy_atencion.fRegistroAtencion ); 
END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_AUDIATENCIONES` (IN `_inicio` VARCHAR(10), IN `_fin` VARCHAR(10))  IF
	_inicio = "" THEN
	SELECT
		zacpsy_aud_atenciones.idAuditAte,
		date_format( zacpsy_aud_atenciones.fechaRegAudi, '%d/%m/%Y' ) AS fechaRegistro,
		acpsy_atencion.tipdocAtencion,
		acpsy_atencion.nrodocAtencion,
		acpsy_atencion.nombAtencion,
		acpsy_atencion.apPaternoAtencion,
		acpsy_atencion.apMaternoAtencion,
		acpsy_usuarios.cuentaUsuario,
		zacpsy_aud_atenciones.AccRealizada,
		zacpsy_aud_atenciones.cuentaAnterior,
		zacpsy_aud_atenciones.EpisodioAnterior,
		zacpsy_aud_atenciones.cuentaNueva,
		zacpsy_aud_atenciones.EpisodioNuevo 
	FROM
		zacpsy_aud_atenciones
		INNER JOIN acpsy_atencion ON zacpsy_aud_atenciones.idAtencion = acpsy_atencion.idAtencion
		INNER JOIN acpsy_usuarios ON zacpsy_aud_atenciones.idUsuario = acpsy_usuarios.idUsuario 
	WHERE
		YEAR ( acpsy_atencion.fRegistroAtencion ) = YEAR (
		CURDATE()) ORDER BY fechaRegAudi;
		ELSE	
		SELECT
		zacpsy_aud_atenciones.idAuditAte,
		date_format( zacpsy_aud_atenciones.fechaRegAudi, '%d/%m/%Y' ) AS fechaRegistro,
		acpsy_atencion.tipdocAtencion,
		acpsy_atencion.nrodocAtencion,
		acpsy_atencion.nombAtencion,
		acpsy_atencion.apMaternoAtencion,
		acpsy_atencion.apPaternoAtencion,
		acpsy_usuarios.cuentaUsuario,
		zacpsy_aud_atenciones.AccRealizada,
		zacpsy_aud_atenciones.cuentaAnterior,
		zacpsy_aud_atenciones.EpisodioAnterior,
		zacpsy_aud_atenciones.cuentaNueva,
		zacpsy_aud_atenciones.EpisodioNuevo 
	FROM
		zacpsy_aud_atenciones
		INNER JOIN acpsy_atencion ON zacpsy_aud_atenciones.idAtencion = acpsy_atencion.idAtencion
		INNER JOIN acpsy_usuarios ON zacpsy_aud_atenciones.idUsuario = acpsy_usuarios.idUsuario 
	WHERE zacpsy_aud_atenciones.fechaRegAudi BETWEEN _inicio 
		AND _fin 
	ORDER BY fechaRegAudi; 
	END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_AUDIFAMILIARES` (IN `_inicio` VARCHAR(10), IN `_fin` VARCHAR(10))  IF _inicio = "" THEN
	SELECT
	zacpsy_aud_familiares.idAudiFam,
	date_format( zacpsy_aud_familiares.fecRegAudi, '%d/%m/%Y' ) AS fechaRegistro,
	acpsy_usuarios.cuentaUsuario,
	zacpsy_aud_familiares.AccRealizada,
	zacpsy_aud_familiares.idAtencionAnt,
	zacpsy_aud_familiares.ndocAnt,
	zacpsy_aud_familiares.idAtencionNueva,
	zacpsy_aud_familiares.ndocNuevo,
	acpsy_famatencion.tipdocFamiliar,
	acpsy_famatencion.ndocFamiliar,
	acpsy_famatencion.nombApFamiliar 
FROM
	zacpsy_aud_familiares
	INNER JOIN acpsy_famatencion ON zacpsy_aud_familiares.idFamiliar = acpsy_famatencion.idFamiliar
	INNER JOIN acpsy_usuarios ON zacpsy_aud_familiares.idUsuario = acpsy_usuarios.idUsuario 
WHERE
	YEAR ( zacpsy_aud_familiares.fecRegAudi ) = YEAR (
	CURDATE()) 
ORDER BY
	fecRegAudi;
ELSE
	SELECT
	zacpsy_aud_familiares.idAudiFam,
	zacpsy_aud_familiares.fecRegAudi,
	acpsy_usuarios.cuentaUsuario,
	zacpsy_aud_familiares.AccRealizada,
	zacpsy_aud_familiares.idAtencionAnt,
	zacpsy_aud_familiares.ndocAnt,
	zacpsy_aud_familiares.idAtencionNueva,
	zacpsy_aud_familiares.ndocNuevo,
	acpsy_famatencion.tipdocFamiliar,
	acpsy_famatencion.ndocFamiliar,
	acpsy_famatencion.nombApFamiliar 
FROM
	zacpsy_aud_familiares
	INNER JOIN acpsy_famatencion ON zacpsy_aud_familiares.idFamiliar = acpsy_famatencion.idFamiliar
	INNER JOIN acpsy_usuarios ON zacpsy_aud_familiares.idUsuario = acpsy_usuarios.idUsuario 
WHERE zacpsy_aud_familiares.fecRegAudi BETWEEN _inicio 
		AND _fin 
ORDER BY
	fecRegAudi;
END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_PARENTESCO` (IN `_INICIO` VARCHAR(10), IN `_FIN` VARCHAR(10))  IF _INICIO = "" THEN
	SELECT
	COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTEO,
	acpsy_parentescofam.detaParentesco AS PARENTESCO 
FROM
	acpsy_famatencion
	INNER JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
	INNER JOIN acpsy_seguimiento ON acpsy_seguimiento.idFamAtSeg = acpsy_famatencion.idFamiliar 
WHERE
	YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
	CURDATE()) 
GROUP BY
	PARENTESCO
ORDER BY CONTEO DESC;
ELSE
	SELECT
	COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTEO,
	acpsy_parentescofam.detaParentesco AS PARENTESCO 
FROM
	acpsy_famatencion
	INNER JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
	INNER JOIN acpsy_seguimiento ON acpsy_seguimiento.idFamAtSeg = acpsy_famatencion.idFamiliar 
WHERE
	acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN
GROUP BY
	PARENTESCO
ORDER BY CONTEO DESC;
END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_SEGMENSXPROFESIONAL` (IN `_INICIO` VARCHAR(10), IN `_FIN` VARCHAR(10), IN `_PROFESIONAL` INT(11))  IF _INICIO = "" THEN
	SELECT MONTH
		( acpsy_seguimiento.fRegistrSeg ) AS NMES,
		MES_SPANISH ( acpsy_seguimiento.fRegistrSeg, 'es_ES' ) AS MES,
		COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTADOR 
	FROM
		acpsy_seguimiento 
	WHERE
		acpsy_seguimiento.idStatusSeg = 1 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) AND acpsy_seguimiento.idProfesional = _PROFESIONAL
	GROUP BY
		NMES,
		MES 
	ORDER BY
		MONTH ( acpsy_seguimiento.fRegistrSeg );
ELSE
		SELECT MONTH
		( acpsy_seguimiento.fRegistrSeg ) AS NMES,
		MES_SPANISH ( acpsy_seguimiento.fRegistrSeg, 'es_ES' ) AS MES,
		COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTADOR 
	FROM
		acpsy_seguimiento 
	WHERE
		acpsy_seguimiento.idStatusSeg = 1 
		AND (acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN)  AND acpsy_seguimiento.idProfesional = _PROFESIONAL
	GROUP BY
		NMES,
		MES 
	ORDER BY
		MONTH ( acpsy_seguimiento.fRegistrSeg );
END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_SEGTIPOXPROFESIONAL` (IN `_INICIO` VARCHAR(10), IN `_FIN` VARCHAR(10), IN `_PROFESIONAL` INT(11))  IF _INICIO = "" THEN
	SELECT
		COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTADOR,
		acpsy_tiposeguimiento.detaTipSeguimiento AS TIPO 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento 
	WHERE
		idStatusSeg = 1 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE())  AND acpsy_seguimiento.idProfesional = _PROFESIONAL
	GROUP BY
		TIPO 
	ORDER BY
		CONTADOR DESC;
ELSE
SELECT
		COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTADOR,
		acpsy_tiposeguimiento.detaTipSeguimiento AS TIPO 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento 
	WHERE
		idStatusSeg = 1 AND (acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN)  AND acpsy_seguimiento.idProfesional = _PROFESIONAL
	GROUP BY
		TIPO 
	ORDER BY
		CONTADOR DESC;
END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_SEGUIMIENTOXDIAGFAM` (IN `_INICIO` VARCHAR(10), IN `_FIN` VARCHAR(10), IN `_PROFESIONAL` INT(11))  IF
	( _INICIO = "" AND _PROFESIONAL = 0 ) THEN
SELECT
	COUNT(acpsy_seguimiento.idSeguimiento) AS CONTADOR, 
	acpsy_diagnosticos.cieDiagnostico AS DIAGNOSTICO
FROM
	acpsy_seguimiento
	INNER JOIN
	acpsy_diagnosticos
	ON 
		acpsy_seguimiento.idDiag1SegFam = acpsy_diagnosticos.idDiagnostico
	WHERE
		idStatusSeg = 1 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
	GROUP BY
		DIAGNOSTICO
	ORDER BY
		CONTADOR DESC;
	
	ELSEIF ( _INICIO != _FIN AND _PROFESIONAL = 0 ) THEN
SELECT
	COUNT(acpsy_seguimiento.idSeguimiento) AS CONTADOR, 
	acpsy_diagnosticos.cieDiagnostico AS DIAGNOSTICO
FROM
	acpsy_seguimiento
	INNER JOIN
	acpsy_diagnosticos
	ON 
		acpsy_seguimiento.idDiag1SegFam = acpsy_diagnosticos.idDiagnostico
	WHERE
		idStatusSeg = 1 
		AND ( acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN ) 
	GROUP BY
		DIAGNOSTICO
	ORDER BY
		CONTADOR DESC;
	
	ELSEIF ( _INICIO = _FIN AND _PROFESIONAL = 0 ) THEN
SELECT
	COUNT(acpsy_seguimiento.idSeguimiento) AS CONTADOR, 
	acpsy_diagnosticos.cieDiagnostico AS DIAGNOSTICO
FROM
	acpsy_seguimiento
	INNER JOIN
	acpsy_diagnosticos
	ON 
		acpsy_seguimiento.idDiag1SegFam = acpsy_diagnosticos.idDiagnostico
	WHERE
		idStatusSeg = 1 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
	GROUP BY
		DIAGNOSTICO
	ORDER BY
		CONTADOR DESC;
	
	ELSEIF ( _INICIO = _FIN AND _PROFESIONAL != 0 ) THEN
SELECT
	COUNT(acpsy_seguimiento.idSeguimiento) AS CONTADOR, 
	acpsy_diagnosticos.cieDiagnostico AS DIAGNOSTICO
FROM
	acpsy_seguimiento
	INNER JOIN
	acpsy_diagnosticos
	ON 
		acpsy_seguimiento.idDiag1SegFam = acpsy_diagnosticos.idDiagnostico
	WHERE
		idStatusSeg = 1 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
		AND acpsy_seguimiento.idProfesional = _PROFESIONAL 
	GROUP BY
		DIAGNOSTICO
	ORDER BY
		CONTADOR DESC;
	
	ELSEIF ( _INICIO != _FIN AND _PROFESIONAL != 0 ) THEN
SELECT
	COUNT(acpsy_seguimiento.idSeguimiento) AS CONTADOR, 
	acpsy_diagnosticos.cieDiagnostico AS DIAGNOSTICO
FROM
	acpsy_seguimiento
	INNER JOIN
	acpsy_diagnosticos
	ON 
		acpsy_seguimiento.idDiag1SegFam = acpsy_diagnosticos.idDiagnostico
	WHERE
		idStatusSeg = 1 
		AND ( acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN ) 
		AND acpsy_seguimiento.idProfesional = _PROFESIONAL 
	GROUP BY
		DIAGNOSTICO
	ORDER BY
		CONTADOR DESC;
	END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_SEGUIMIENTOXDIAGPAC` (IN `_INICIO` VARCHAR(10), IN `_FIN` VARCHAR(10), IN `_PROFESIONAL` INT(11))  IF
	( _INICIO = "" AND _PROFESIONAL = 0 ) THEN
SELECT
	COUNT(acpsy_seguimiento.idSeguimiento) AS CONTADOR, 
	acpsy_diagnosticos.cieDiagnostico AS DIAGNOSTICO
FROM
	acpsy_seguimiento
	INNER JOIN
	acpsy_diagnosticos
	ON 
		acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
	WHERE
		idStatusSeg = 1 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
	GROUP BY
		DIAGNOSTICO
	ORDER BY
		CONTADOR DESC;
	
	ELSEIF ( _INICIO != _FIN AND _PROFESIONAL = 0 ) THEN
SELECT
	COUNT(acpsy_seguimiento.idSeguimiento) AS CONTADOR, 
	acpsy_diagnosticos.cieDiagnostico AS DIAGNOSTICO
FROM
	acpsy_seguimiento
	INNER JOIN
	acpsy_diagnosticos
	ON 
		acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
	WHERE
		idStatusSeg = 1 
		AND ( acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN ) 
	GROUP BY
		DIAGNOSTICO
	ORDER BY
		CONTADOR DESC;
	
	ELSEIF ( _INICIO = _FIN AND _PROFESIONAL = 0 ) THEN
SELECT
	COUNT(acpsy_seguimiento.idSeguimiento) AS CONTADOR, 
	acpsy_diagnosticos.cieDiagnostico AS DIAGNOSTICO
FROM
	acpsy_seguimiento
	INNER JOIN
	acpsy_diagnosticos
	ON 
		acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
	WHERE
		idStatusSeg = 1 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
	GROUP BY
		DIAGNOSTICO
	ORDER BY
		CONTADOR DESC;
	
	ELSEIF ( _INICIO = _FIN AND _PROFESIONAL != 0 ) THEN
SELECT
	COUNT(acpsy_seguimiento.idSeguimiento) AS CONTADOR, 
	acpsy_diagnosticos.cieDiagnostico AS DIAGNOSTICO
FROM
	acpsy_seguimiento
	INNER JOIN
	acpsy_diagnosticos
	ON 
		acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
	WHERE
		idStatusSeg = 1 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
		AND acpsy_seguimiento.idProfesional = _PROFESIONAL 
	GROUP BY
		DIAGNOSTICO
	ORDER BY
		CONTADOR DESC;
	
	ELSEIF ( _INICIO != _FIN AND _PROFESIONAL != 0 ) THEN
SELECT
	COUNT(acpsy_seguimiento.idSeguimiento) AS CONTADOR, 
	acpsy_diagnosticos.cieDiagnostico AS DIAGNOSTICO
FROM
	acpsy_seguimiento
	INNER JOIN
	acpsy_diagnosticos
	ON 
		acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
	WHERE
		idStatusSeg = 1 
		AND ( acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN ) 
		AND acpsy_seguimiento.idProfesional = _PROFESIONAL 
	GROUP BY
		DIAGNOSTICO
	ORDER BY
		CONTADOR DESC;
	END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_SEGUIMIENTOXPROFESIONAL` (IN `_INICIO` VARCHAR(10), IN `_FIN` VARCHAR(10), IN `_PROFESIONAL` INT(11))  IF
	( _INICIO = "" AND _PROFESIONAL = 0 ) THEN
	SELECT
		CONCAT( acpsy_profesionales.nombresProfesional, " ", acpsy_profesionales.apellidosProfesional ) AS PROFESIONAL,
		COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTADOR 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional 
	WHERE
		idStatusSeg = 1 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
	GROUP BY
		PROFESIONAL 
	ORDER BY
		CONTADOR DESC;
	
	ELSEIF ( _INICIO != _FIN AND _PROFESIONAL = 0 ) THEN
	SELECT
		CONCAT( acpsy_profesionales.nombresProfesional, " ", acpsy_profesionales.apellidosProfesional ) AS PROFESIONAL,
		COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTADOR 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional 
	WHERE
		idStatusSeg = 1 
		AND ( acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN ) 
	GROUP BY
		PROFESIONAL 
	ORDER BY
		CONTADOR DESC;
		ELSEIF ( _INICIO = _FIN AND _PROFESIONAL = 0 ) THEN
	SELECT
		CONCAT( acpsy_profesionales.nombresProfesional, " ", acpsy_profesionales.apellidosProfesional ) AS PROFESIONAL,
		COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTADOR 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional 
	WHERE
		idStatusSeg = 1 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
	GROUP BY
		PROFESIONAL 
	ORDER BY
		CONTADOR DESC;
	ELSEIF ( _INICIO = _FIN AND _PROFESIONAL != 0 ) THEN
	SELECT
		CONCAT( acpsy_profesionales.nombresProfesional, " ", acpsy_profesionales.apellidosProfesional ) AS PROFESIONAL,
		COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTADOR 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional 
	WHERE
		idStatusSeg = 1 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
		AND acpsy_seguimiento.idProfesional = _PROFESIONAL 
	GROUP BY
		PROFESIONAL 
	ORDER BY
		CONTADOR DESC;
	
	ELSEIF ( _INICIO != _FIN AND _PROFESIONAL != 0 ) THEN
	SELECT
		CONCAT( acpsy_profesionales.nombresProfesional, " ", acpsy_profesionales.apellidosProfesional ) AS PROFESIONAL,
		COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTADOR 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional 
	WHERE
		idStatusSeg = 1 
		AND ( acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN ) 
		AND acpsy_seguimiento.idProfesional = _PROFESIONAL 
	GROUP BY
		PROFESIONAL 
	ORDER BY
		CONTADOR DESC;
END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_SEGUIMIENTOXTIPO` (IN `_INICIO` VARCHAR(10), IN `_FIN` VARCHAR(10), IN `_PROFESIONAL` INT(11))  IF
	( _INICIO = "" AND _PROFESIONAL = 0 ) THEN
	SELECT
		COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTADOR,
		acpsy_tiposeguimiento.detaTipSeguimiento AS TIPO 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento 
	WHERE
		idStatusSeg = 1 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
	GROUP BY
		TIPO 
	ORDER BY
		CONTADOR DESC;
	
	ELSEIF ( _INICIO != _FIN AND _PROFESIONAL = 0 ) THEN
	SELECT
		COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTADOR,
		acpsy_tiposeguimiento.detaTipSeguimiento AS TIPO 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento 
	WHERE
		idStatusSeg = 1 
		AND ( acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN ) 
	GROUP BY
		TIPO 
	ORDER BY
		CONTADOR DESC;
	
	ELSEIF ( _INICIO = _FIN AND _PROFESIONAL = 0 ) THEN
	SELECT
		COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTADOR,
		acpsy_tiposeguimiento.detaTipSeguimiento AS TIPO 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento 
	WHERE
		idStatusSeg = 1 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
	GROUP BY
		TIPO 
	ORDER BY
		CONTADOR DESC;
	
	ELSEIF ( _INICIO = _FIN AND _PROFESIONAL != 0 ) THEN
	SELECT
		COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTADOR,
		acpsy_tiposeguimiento.detaTipSeguimiento AS TIPO 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento 
	WHERE
		idStatusSeg = 1 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
		AND acpsy_seguimiento.idProfesional = _PROFESIONAL 
	GROUP BY
		TIPO 
	ORDER BY
		CONTADOR DESC;
	
	ELSEIF ( _INICIO != _FIN AND _PROFESIONAL != 0 ) THEN
	SELECT
		COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTADOR,
		acpsy_tiposeguimiento.detaTipSeguimiento AS TIPO 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento 
	WHERE
		idStatusSeg = 1 
		AND ( acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN ) 
		AND acpsy_seguimiento.idProfesional = _PROFESIONAL 
	GROUP BY
		TIPO 
	ORDER BY
		CONTADOR DESC;
	END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_SEGUIMIENTO_JEFATURA` (IN `_INICIO` VARCHAR(10), IN `_FIN` VARCHAR(10), IN `_PROFESIONAL` INT(11))  IF
	( _INICIO = "" AND _PROFESIONAL = 0 ) THEN
	SELECT
		acpsy_seguimiento.idSeguimiento,
		date_format( acpsy_seguimiento.fRegistrSeg, '%d/%m/%Y' ) AS fecha,
		acpsy_tiposeguimiento.detaTipSeguimiento AS tipo,
		acpsy_motivoseguimiento.detaMotivoSef AS motivo,
		CONCAT( acpsy_atencion.tipdocAtencion, '-', acpsy_atencion.nrodocAtencion ) AS docpaciente,
		acpsy_atencion.historiaAtencion,
		CONCAT( acpsy_atencion.nombAtencion, " ", acpsy_atencion.apPaternoAtencion, " ", acpsy_atencion.apMaternoAtencion ) AS nombpaciente,
		acpsy_atencion.edadAtencion AS edadPaciente,
		acpsy_tipsexo.detaTipSexo AS sexoPac,
		acpsy_diagnosticos.cieDiagnostico AS diagPac,
		ACTPAC.cieDiagnostico AS actPac,
		acpsy_seguimiento.comunFamSeg AS comunicacion,
		CONCAT( acpsy_famatencion.tipdocFamiliar, "-", acpsy_famatencion.ndocFamiliar ) AS docfamiliar,
		acpsy_famatencion.nombApFamiliar,
		acpsy_parentescofam.detaParentesco AS parentesco,
		acpsy_famatencion.edadFamiliar,
		sexPaciente.detaTipSexo AS sexoFam,
		diagFam1.cieDiagnostico AS diagFam,
		ACTFAM.cieDiagnostico AS actFam,
		CONCAT( acpsy_profesionales.nombresProfesional, ' ', acpsy_profesionales.apellidosProfesional ) AS profesional 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_atencion ON acpsy_seguimiento.idAtencionPac = acpsy_atencion.idAtencion
		INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional
		INNER JOIN acpsy_tipsexo ON acpsy_atencion.tipSexoAtencion = acpsy_tipsexo.idTipSexo
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento
		INNER JOIN acpsy_motivoseguimiento ON acpsy_seguimiento.idMotSeguimiento = acpsy_motivoseguimiento.idMotSeguimiento
		INNER JOIN acpsy_diagnosticos ON acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS ACTPAC ON acpsy_seguimiento.idDiag2Seg = ACTPAC.idDiagnostico
		LEFT JOIN acpsy_famatencion ON acpsy_seguimiento.idFamAtSeg = acpsy_famatencion.idFamiliar
		LEFT JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
		LEFT JOIN acpsy_tipsexo AS sexPaciente ON acpsy_famatencion.idTipSexo = sexPaciente.idTipSexo
		LEFT JOIN acpsy_diagnosticos AS diagFam1 ON acpsy_seguimiento.idDiag1SegFam = diagFam1.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS ACTFAM ON acpsy_seguimiento.idDiag2SegFam = ACTFAM.idDiagnostico 
	WHERE
		acpsy_seguimiento.idStatusSeg = 1 
		AND MONTH ( acpsy_seguimiento.fRegistrSeg ) = MONTH (
		CURDATE()) 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
	ORDER BY
		fRegistrSeg DESC, idSeguimiento DESC;
	ELSEIF ( _INICIO != _FIN AND _PROFESIONAL = 0 ) THEN
	SELECT
		acpsy_seguimiento.idSeguimiento,
		date_format( acpsy_seguimiento.fRegistrSeg, '%d/%m/%Y' ) AS fecha,
		acpsy_tiposeguimiento.detaTipSeguimiento AS tipo,
		acpsy_motivoseguimiento.detaMotivoSef AS motivo,
		CONCAT( acpsy_atencion.tipdocAtencion, '-', acpsy_atencion.nrodocAtencion ) AS docpaciente,
		acpsy_atencion.historiaAtencion,
		CONCAT( acpsy_atencion.nombAtencion, " ", acpsy_atencion.apPaternoAtencion, " ", acpsy_atencion.apMaternoAtencion ) AS nombpaciente,
		acpsy_atencion.edadAtencion AS edadPaciente,
		acpsy_tipsexo.detaTipSexo AS sexoPac,
		acpsy_diagnosticos.cieDiagnostico AS diagPac,
		ACTPAC.cieDiagnostico AS actPac,
		acpsy_seguimiento.comunFamSeg AS comunicacion,
		CONCAT( acpsy_famatencion.tipdocFamiliar, "-", acpsy_famatencion.ndocFamiliar ) AS docfamiliar,
		acpsy_famatencion.nombApFamiliar,
		acpsy_parentescofam.detaParentesco AS parentesco,
		acpsy_famatencion.edadFamiliar,
		sexPaciente.detaTipSexo AS sexoFam,
		diagFam1.cieDiagnostico AS diagFam,
		ACTFAM.cieDiagnostico AS actFam,
		CONCAT( acpsy_profesionales.nombresProfesional, ' ', acpsy_profesionales.apellidosProfesional ) AS profesional 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_atencion ON acpsy_seguimiento.idAtencionPac = acpsy_atencion.idAtencion
		INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional
		INNER JOIN acpsy_tipsexo ON acpsy_atencion.tipSexoAtencion = acpsy_tipsexo.idTipSexo
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento
		INNER JOIN acpsy_motivoseguimiento ON acpsy_seguimiento.idMotSeguimiento = acpsy_motivoseguimiento.idMotSeguimiento
		INNER JOIN acpsy_diagnosticos ON acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS ACTPAC ON acpsy_seguimiento.idDiag2Seg = ACTPAC.idDiagnostico
		LEFT JOIN acpsy_famatencion ON acpsy_seguimiento.idFamAtSeg = acpsy_famatencion.idFamiliar
		LEFT JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
		LEFT JOIN acpsy_tipsexo AS sexPaciente ON acpsy_famatencion.idTipSexo = sexPaciente.idTipSexo
		LEFT JOIN acpsy_diagnosticos AS diagFam1 ON acpsy_seguimiento.idDiag1SegFam = diagFam1.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS ACTFAM ON acpsy_seguimiento.idDiag2SegFam = ACTFAM.idDiagnostico 
	WHERE
		acpsy_seguimiento.idStatusSeg = 1 
		AND ( acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN ) 
	ORDER BY
		idSeguimiento DESC,
		fRegistrSeg DESC;
	
	ELSEIF ( _INICIO = _FIN AND _PROFESIONAL = 0 ) THEN
	SELECT
		acpsy_seguimiento.idSeguimiento,
		date_format( acpsy_seguimiento.fRegistrSeg, '%d/%m/%Y' ) AS fecha,
		acpsy_tiposeguimiento.detaTipSeguimiento AS tipo,
		acpsy_motivoseguimiento.detaMotivoSef AS motivo,
		CONCAT( acpsy_atencion.tipdocAtencion, '-', acpsy_atencion.nrodocAtencion ) AS docpaciente,
		acpsy_atencion.historiaAtencion,
		CONCAT( acpsy_atencion.nombAtencion, " ", acpsy_atencion.apPaternoAtencion, " ", acpsy_atencion.apMaternoAtencion ) AS nombpaciente,
		acpsy_atencion.edadAtencion AS edadPaciente,
		acpsy_tipsexo.detaTipSexo AS sexoPac,
		acpsy_diagnosticos.cieDiagnostico AS diagPac,
		ACTPAC.cieDiagnostico AS actPac,
		acpsy_seguimiento.comunFamSeg AS comunicacion,
		CONCAT( acpsy_famatencion.tipdocFamiliar, "-", acpsy_famatencion.ndocFamiliar ) AS docfamiliar,
		acpsy_famatencion.nombApFamiliar,
		acpsy_parentescofam.detaParentesco AS parentesco,
		acpsy_famatencion.edadFamiliar,
		sexPaciente.detaTipSexo AS sexoFam,
		diagFam1.cieDiagnostico AS diagFam,
		ACTFAM.cieDiagnostico AS actFam,
		CONCAT( acpsy_profesionales.nombresProfesional, ' ', acpsy_profesionales.apellidosProfesional ) AS profesional 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_atencion ON acpsy_seguimiento.idAtencionPac = acpsy_atencion.idAtencion
		INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional
		INNER JOIN acpsy_tipsexo ON acpsy_atencion.tipSexoAtencion = acpsy_tipsexo.idTipSexo
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento
		INNER JOIN acpsy_motivoseguimiento ON acpsy_seguimiento.idMotSeguimiento = acpsy_motivoseguimiento.idMotSeguimiento
		INNER JOIN acpsy_diagnosticos ON acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS ACTPAC ON acpsy_seguimiento.idDiag2Seg = ACTPAC.idDiagnostico
		LEFT JOIN acpsy_famatencion ON acpsy_seguimiento.idFamAtSeg = acpsy_famatencion.idFamiliar
		LEFT JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
		LEFT JOIN acpsy_tipsexo AS sexPaciente ON acpsy_famatencion.idTipSexo = sexPaciente.idTipSexo
		LEFT JOIN acpsy_diagnosticos AS diagFam1 ON acpsy_seguimiento.idDiag1SegFam = diagFam1.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS ACTFAM ON acpsy_seguimiento.idDiag2SegFam = ACTFAM.idDiagnostico 
	WHERE
		acpsy_seguimiento.idStatusSeg = 1 
		AND MONTH ( acpsy_seguimiento.fRegistrSeg ) = MONTH (
		CURDATE()) 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
	ORDER BY
		idSeguimiento DESC,
		fRegistrSeg DESC;
	
	ELSEIF ( _INICIO = _FIN AND _PROFESIONAL != 0 ) THEN
	SELECT
		acpsy_seguimiento.idSeguimiento,
		date_format( acpsy_seguimiento.fRegistrSeg, '%d/%m/%Y' ) AS fecha,
		acpsy_tiposeguimiento.detaTipSeguimiento AS tipo,
		acpsy_motivoseguimiento.detaMotivoSef AS motivo,
		CONCAT( acpsy_atencion.tipdocAtencion, '-', acpsy_atencion.nrodocAtencion ) AS docpaciente,
		acpsy_atencion.historiaAtencion,
		CONCAT( acpsy_atencion.nombAtencion, " ", acpsy_atencion.apPaternoAtencion, " ", acpsy_atencion.apMaternoAtencion ) AS nombpaciente,
		acpsy_atencion.edadAtencion AS edadPaciente,
		acpsy_tipsexo.detaTipSexo AS sexoPac,
		acpsy_diagnosticos.cieDiagnostico AS diagPac,
		ACTPAC.cieDiagnostico AS actPac,
		acpsy_seguimiento.comunFamSeg AS comunicacion,
		CONCAT( acpsy_famatencion.tipdocFamiliar, "-", acpsy_famatencion.ndocFamiliar ) AS docfamiliar,
		acpsy_famatencion.nombApFamiliar,
		acpsy_parentescofam.detaParentesco AS parentesco,
		acpsy_famatencion.edadFamiliar,
		sexPaciente.detaTipSexo AS sexoFam,
		diagFam1.cieDiagnostico AS diagFam,
		ACTFAM.cieDiagnostico AS actFam,
		CONCAT( acpsy_profesionales.nombresProfesional, ' ', acpsy_profesionales.apellidosProfesional ) AS profesional 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_atencion ON acpsy_seguimiento.idAtencionPac = acpsy_atencion.idAtencion
		INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional
		INNER JOIN acpsy_tipsexo ON acpsy_atencion.tipSexoAtencion = acpsy_tipsexo.idTipSexo
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento
		INNER JOIN acpsy_motivoseguimiento ON acpsy_seguimiento.idMotSeguimiento = acpsy_motivoseguimiento.idMotSeguimiento
		INNER JOIN acpsy_diagnosticos ON acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS ACTPAC ON acpsy_seguimiento.idDiag2Seg = ACTPAC.idDiagnostico
		LEFT JOIN acpsy_famatencion ON acpsy_seguimiento.idFamAtSeg = acpsy_famatencion.idFamiliar
		LEFT JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
		LEFT JOIN acpsy_tipsexo AS sexPaciente ON acpsy_famatencion.idTipSexo = sexPaciente.idTipSexo
		LEFT JOIN acpsy_diagnosticos AS diagFam1 ON acpsy_seguimiento.idDiag1SegFam = diagFam1.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS ACTFAM ON acpsy_seguimiento.idDiag2SegFam = ACTFAM.idDiagnostico 
	WHERE
		acpsy_seguimiento.idStatusSeg = 1 
		AND MONTH ( acpsy_seguimiento.fRegistrSeg ) = MONTH (
		CURDATE()) 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
		AND acpsy_seguimiento.idProfesional = _PROFESIONAL 
	ORDER BY
		idSeguimiento DESC,
		fRegistrSeg DESC;
	
	ELSEIF ( _INICIO != _FIN AND _PROFESIONAL != 0 ) THEN
	SELECT
		acpsy_seguimiento.idSeguimiento,
		date_format( acpsy_seguimiento.fRegistrSeg, '%d/%m/%Y' ) AS fecha,
		acpsy_tiposeguimiento.detaTipSeguimiento AS tipo,
		acpsy_motivoseguimiento.detaMotivoSef AS motivo,
		CONCAT( acpsy_atencion.tipdocAtencion, '-', acpsy_atencion.nrodocAtencion ) AS docpaciente,
		acpsy_atencion.historiaAtencion,
		CONCAT( acpsy_atencion.nombAtencion, " ", acpsy_atencion.apPaternoAtencion, " ", acpsy_atencion.apMaternoAtencion ) AS nombpaciente,
		acpsy_atencion.edadAtencion AS edadPaciente,
		acpsy_tipsexo.detaTipSexo AS sexoPac,
		acpsy_diagnosticos.cieDiagnostico AS diagPac,
		ACTPAC.cieDiagnostico AS actPac,
		acpsy_seguimiento.comunFamSeg AS comunicacion,
		CONCAT( acpsy_famatencion.tipdocFamiliar, "-", acpsy_famatencion.ndocFamiliar ) AS docfamiliar,
		acpsy_famatencion.nombApFamiliar,
		acpsy_parentescofam.detaParentesco AS parentesco,
		acpsy_famatencion.edadFamiliar,
		sexPaciente.detaTipSexo AS sexoFam,
		diagFam1.cieDiagnostico AS diagFam,
		ACTFAM.cieDiagnostico AS actFam,
		CONCAT( acpsy_profesionales.nombresProfesional, ' ', acpsy_profesionales.apellidosProfesional ) AS profesional 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_atencion ON acpsy_seguimiento.idAtencionPac = acpsy_atencion.idAtencion
		INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional
		INNER JOIN acpsy_tipsexo ON acpsy_atencion.tipSexoAtencion = acpsy_tipsexo.idTipSexo
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento
		INNER JOIN acpsy_motivoseguimiento ON acpsy_seguimiento.idMotSeguimiento = acpsy_motivoseguimiento.idMotSeguimiento
		INNER JOIN acpsy_diagnosticos ON acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS ACTPAC ON acpsy_seguimiento.idDiag2Seg = ACTPAC.idDiagnostico
		LEFT JOIN acpsy_famatencion ON acpsy_seguimiento.idFamAtSeg = acpsy_famatencion.idFamiliar
		LEFT JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
		LEFT JOIN acpsy_tipsexo AS sexPaciente ON acpsy_famatencion.idTipSexo = sexPaciente.idTipSexo
		LEFT JOIN acpsy_diagnosticos AS diagFam1 ON acpsy_seguimiento.idDiag1SegFam = diagFam1.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS ACTFAM ON acpsy_seguimiento.idDiag2SegFam = ACTFAM.idDiagnostico 
	WHERE
		idStatusSeg = 1 
		AND ( acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN ) 
		AND acpsy_seguimiento.idProfesional = _PROFESIONAL
	ORDER BY
		idSeguimiento DESC,
		fRegistrSeg DESC;
END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_SEGUIMIENTO_PROFESIONAL` (IN `_INICIO` VARCHAR(10), IN `_FIN` VARCHAR(10), IN `_PROFESIONAL` INT(11))  IF
	( _INICIO = "" ) THEN
	SELECT
		acpsy_seguimiento.idSeguimiento,
		date_format( acpsy_seguimiento.fRegistrSeg, '%d/%m/%Y' ) AS fecha,
		acpsy_tiposeguimiento.detaTipSeguimiento AS tipo,
		acpsy_motivoseguimiento.detaMotivoSef AS motivo,
		CONCAT( acpsy_atencion.tipdocAtencion, '-', acpsy_atencion.nrodocAtencion ) AS docpaciente,
		acpsy_atencion.historiaAtencion,
		CONCAT( acpsy_atencion.nombAtencion, " ", acpsy_atencion.apPaternoAtencion, " ", acpsy_atencion.apMaternoAtencion ) AS nombpaciente,
		acpsy_atencion.edadAtencion AS edadPaciente,
		acpsy_tipsexo.detaTipSexo AS sexoPac,
		acpsy_diagnosticos.cieDiagnostico AS diagPac,
		ACTPAC.cieDiagnostico AS actPac,
		acpsy_seguimiento.comunFamSeg AS comunicacion,
		CONCAT( acpsy_famatencion.tipdocFamiliar, "-", acpsy_famatencion.ndocFamiliar ) AS docfamiliar,
		acpsy_famatencion.nombApFamiliar,
		acpsy_parentescofam.detaParentesco AS parentesco,
		acpsy_famatencion.edadFamiliar,
		sexPaciente.detaTipSexo AS sexoFam,
		diagFam1.cieDiagnostico AS diagFam,
		ACTFAM.cieDiagnostico AS actFam,
		CONCAT( acpsy_profesionales.nombresProfesional, ' ', acpsy_profesionales.apellidosProfesional ) AS profesional 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_atencion ON acpsy_seguimiento.idAtencionPac = acpsy_atencion.idAtencion
		INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional
		INNER JOIN acpsy_tipsexo ON acpsy_atencion.tipSexoAtencion = acpsy_tipsexo.idTipSexo
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento
		INNER JOIN acpsy_motivoseguimiento ON acpsy_seguimiento.idMotSeguimiento = acpsy_motivoseguimiento.idMotSeguimiento
		INNER JOIN acpsy_diagnosticos ON acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS ACTPAC ON acpsy_seguimiento.idDiag2Seg = ACTPAC.idDiagnostico
		LEFT JOIN acpsy_famatencion ON acpsy_seguimiento.idFamAtSeg = acpsy_famatencion.idFamiliar
		LEFT JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
		LEFT JOIN acpsy_tipsexo AS sexPaciente ON acpsy_famatencion.idTipSexo = sexPaciente.idTipSexo
		LEFT JOIN acpsy_diagnosticos AS diagFam1 ON acpsy_seguimiento.idDiag1SegFam = diagFam1.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS ACTFAM ON acpsy_seguimiento.idDiag2SegFam = ACTFAM.idDiagnostico 
	WHERE
		acpsy_seguimiento.idStatusSeg = 1 
		AND MONTH ( acpsy_seguimiento.fRegistrSeg ) = MONTH (
		CURDATE()) 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
		AND acpsy_seguimiento.idProfesional = _PROFESIONAL 
	ORDER BY
		fRegistrSeg DESC,
		idSeguimiento DESC;
	ELSE SELECT
		acpsy_seguimiento.idSeguimiento,
		date_format( acpsy_seguimiento.fRegistrSeg, '%d/%m/%Y' ) AS fecha,
		acpsy_tiposeguimiento.detaTipSeguimiento AS tipo,
		acpsy_motivoseguimiento.detaMotivoSef AS motivo,
		CONCAT( acpsy_atencion.tipdocAtencion, '-', acpsy_atencion.nrodocAtencion ) AS docpaciente,
		acpsy_atencion.historiaAtencion,
		CONCAT( acpsy_atencion.nombAtencion, " ", acpsy_atencion.apPaternoAtencion, " ", acpsy_atencion.apMaternoAtencion ) AS nombpaciente,
		acpsy_atencion.edadAtencion AS edadPaciente,
		acpsy_tipsexo.detaTipSexo AS sexoPac,
		acpsy_diagnosticos.cieDiagnostico AS diagPac,
		ACTPAC.cieDiagnostico AS actPac,
		acpsy_seguimiento.comunFamSeg AS comunicacion,
		CONCAT( acpsy_famatencion.tipdocFamiliar, "-", acpsy_famatencion.ndocFamiliar ) AS docfamiliar,
		acpsy_famatencion.nombApFamiliar,
		acpsy_parentescofam.detaParentesco AS parentesco,
		acpsy_famatencion.edadFamiliar,
		sexPaciente.detaTipSexo AS sexoFam,
		diagFam1.cieDiagnostico AS diagFam,
		ACTFAM.cieDiagnostico AS actFam,
		CONCAT( acpsy_profesionales.nombresProfesional, ' ', acpsy_profesionales.apellidosProfesional ) AS profesional 
	FROM
		acpsy_seguimiento
		INNER JOIN acpsy_atencion ON acpsy_seguimiento.idAtencionPac = acpsy_atencion.idAtencion
		INNER JOIN acpsy_profesionales ON acpsy_seguimiento.idProfesional = acpsy_profesionales.idProfesional
		INNER JOIN acpsy_tipsexo ON acpsy_atencion.tipSexoAtencion = acpsy_tipsexo.idTipSexo
		INNER JOIN acpsy_tiposeguimiento ON acpsy_seguimiento.idTipoSeguimiento = acpsy_tiposeguimiento.idTipoSeguimiento
		INNER JOIN acpsy_motivoseguimiento ON acpsy_seguimiento.idMotSeguimiento = acpsy_motivoseguimiento.idMotSeguimiento
		INNER JOIN acpsy_diagnosticos ON acpsy_seguimiento.idDiag1Seg = acpsy_diagnosticos.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS ACTPAC ON acpsy_seguimiento.idDiag2Seg = ACTPAC.idDiagnostico
		LEFT JOIN acpsy_famatencion ON acpsy_seguimiento.idFamAtSeg = acpsy_famatencion.idFamiliar
		LEFT JOIN acpsy_parentescofam ON acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
		LEFT JOIN acpsy_tipsexo AS sexPaciente ON acpsy_famatencion.idTipSexo = sexPaciente.idTipSexo
		LEFT JOIN acpsy_diagnosticos AS diagFam1 ON acpsy_seguimiento.idDiag1SegFam = diagFam1.idDiagnostico
		LEFT JOIN acpsy_diagnosticos AS ACTFAM ON acpsy_seguimiento.idDiag2SegFam = ACTFAM.idDiagnostico 
	WHERE
		acpsy_seguimiento.idStatusSeg = 1 
		AND ( acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN ) 
		AND acpsy_seguimiento.idProfesional = _PROFESIONAL 
	ORDER BY
		idSeguimiento DESC,
		fRegistrSeg DESC;
END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_SEGUIMREGS` (IN `_INICIO` VARCHAR(10), IN `_FIN` VARCHAR(10))  IF
	_INICIO = "" THEN
	SELECT MONTH
		( acpsy_seguimiento.fRegistrSeg ) AS NMES,
		MES_SPANISH ( acpsy_seguimiento.fRegistrSeg, 'es_ES' ) AS MES,
		COUNT( acpsy_seguimiento.idSeguimiento ) AS contador 
	FROM
		acpsy_seguimiento 
	WHERE
		acpsy_seguimiento.idStatusSeg != 2 
		AND YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
		CURDATE()) 
	GROUP BY
		NMES,
		MES 
	ORDER BY
		MONTH ( acpsy_seguimiento.fRegistrSeg ); 
		ELSE 
		SELECT MONTH
	( acpsy_seguimiento.fRegistrSeg ) AS NMES,
	MES_SPANISH ( acpsy_seguimiento.fRegistrSeg, 'es_ES' ) AS MES,
	COUNT( acpsy_seguimiento.idSeguimiento ) AS contador 
FROM
	acpsy_seguimiento 
WHERE
	acpsy_seguimiento.idStatusSeg != 2 
	AND acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN 
GROUP BY
	NMES,
	MES 
ORDER BY
	MONTH ( acpsy_seguimiento.fRegistrSeg );
	END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_SEXO` (IN `_INICIO` VARCHAR(10), IN `_FIN` VARCHAR(10))  IF _INICIO = "" THEN
	SELECT
	COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTEO,
	acpsy_tipsexo.detaTipSexo AS SEXO 
FROM
	acpsy_famatencion
	INNER JOIN acpsy_tipsexo ON acpsy_famatencion.idTipSexo = acpsy_tipsexo.idTipSexo
	INNER JOIN acpsy_seguimiento ON acpsy_famatencion.idFamiliar = acpsy_seguimiento.idFamAtSeg 
WHERE
	YEAR ( acpsy_seguimiento.fRegistrSeg ) = YEAR (
	CURDATE()) 
GROUP BY
	SEXO 
ORDER BY
	CONTEO DESC;
ELSE
	SELECT
	COUNT( acpsy_seguimiento.idSeguimiento ) AS CONTEO,
	acpsy_tipsexo.detaTipSexo AS SEXO 
FROM
	acpsy_famatencion
	INNER JOIN acpsy_tipsexo ON acpsy_famatencion.idTipSexo = acpsy_tipsexo.idTipSexo
	INNER JOIN acpsy_seguimiento ON acpsy_famatencion.idFamiliar = acpsy_seguimiento.idFamAtSeg 
WHERE
	acpsy_seguimiento.fRegistrSeg BETWEEN _INICIO AND _FIN
GROUP BY
	SEXO 
ORDER BY
	CONTEO DESC;
END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VALIDA_FAMILIAR` (IN `_idAtencion` INT(11), IN `_ndocFamiliar` VARCHAR(20))  SELECT
	acpsy_famatencion.idFamiliar, 
	acpsy_famatencion.idAtencion, 
	acpsy_famatencion.ndocFamiliar
FROM
	acpsy_famatencion
WHERE idAtencion = _idAtencion AND ndocFamiliar = _ndocFamiliar$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VERIFICA_ESTADO_LOG` (IN `_USUARIO` INT(11))  SELECT
	acpsy_usuarios.idUsuario, 
	acpsy_usuarios.idEstado
FROM
	acpsy_usuarios
WHERE idUsuario = _USUARIO$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `MES_SPANISH` (`_d` DATE, `_locale` VARCHAR(5)) RETURNS VARCHAR(22) CHARSET utf8 BEGIN
     SET @@lc_time_names = _locale;
     RETURN UPPER(DATE_FORMAT(_d, '%M'));
 END$$

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
  `nrodocAtencion` varchar(15) COLLATE utf8_bin DEFAULT NULL,
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
(1, 1, 1, '77478995', 'CASTRO PALACIOS', 'OLGER IVAN', 'ocastrop', 'ocastrop@hnseb.gob.pe', '$2a$07$usesomesillystringforeVF6hLwtgsUBAmUN4cGEd8tYF74gSHRW', 2, '2021-06-01 15:34:46', ''),
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
(12, 3, 1, '46624029', 'ZAVALETA LOPEZ', 'DARNELLY JAHAIRA', 'dzavaletal', 'dpsicologia@hnseb.gob.pe', '$2a$07$usesomesillystringforeBQPDD/GSseqnB6cro9X9nOHtqDKTXLS', 0, '2021-06-01 17:29:00', NULL),
(13, 1, 1, '09966920', 'SERNAQUE QUINTANA', 'JAVIER OCTAVIO', 'jsernaque', 'jsernaque@hnseb.gob.pe', '$2a$07$usesomesillystringforeAR0AYDLcMUwZJGc02Ta3T98Pn6LH7pi', 0, '2021-07-06 19:35:33', NULL);

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
  ADD KEY `fk_mot` (`idMotSeguimiento`),
  ADD KEY `fk_prof` (`idProfesional`),
  ADD KEY `fk_tipseg` (`idTipoSeguimiento`),
  ADD KEY `fk_user` (`idUsuario`),
  ADD KEY `fk_ate` (`idAtencionPac`);

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
  MODIFY `idAtencion` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `acpsy_famatencion`
--
ALTER TABLE `acpsy_famatencion`
  MODIFY `idFamiliar` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `zacpsy_aud_atenciones`
--
ALTER TABLE `zacpsy_aud_atenciones`
  MODIFY `idAuditAte` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `fk_ate` FOREIGN KEY (`idAtencionPac`) REFERENCES `acpsy_atencion` (`idAtencion`),
  ADD CONSTRAINT `fk_mot` FOREIGN KEY (`idMotSeguimiento`) REFERENCES `acpsy_motivoseguimiento` (`idMotSeguimiento`),
  ADD CONSTRAINT `fk_prof` FOREIGN KEY (`idProfesional`) REFERENCES `acpsy_profesionales` (`idProfesional`),
  ADD CONSTRAINT `fk_tipseg` FOREIGN KEY (`idTipoSeguimiento`) REFERENCES `acpsy_tiposeguimiento` (`idTipoSeguimiento`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`idUsuario`) REFERENCES `acpsy_usuarios` (`idUsuario`);

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
