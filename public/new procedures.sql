CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_SEGUIMIENTOS_MONITOREO`()
SELECT
	acpsy_seguimiento.idSeguimiento, 
	date_format( acpsy_seguimiento.fRegistrSeg, '%d/%m/%Y' ) AS fRegistrSeg, 
	acpsy_seguimiento.idAtencionPac, 
	acpsy_estadopaciente.detaEstadoPacAtencion, 
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
	acpsy_estatusseguimiento.detaStatusSeg, 
	acpsy_atencion.idEstadoPacAtencion
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
	acpsy_diagnosticos AS dp2
	ON 
		acpsy_seguimiento.idDiag2Seg = dp2.idDiagnostico
	LEFT JOIN
	acpsy_diagnosticos AS df1
	ON 
		acpsy_seguimiento.idDiag1SegFam = df1.idDiagnostico
	LEFT JOIN
	acpsy_diagnosticos AS df2
	ON 
		acpsy_seguimiento.idDiag2SegFam = df2.idDiagnostico
	LEFT JOIN
	acpsy_parentescofam
	ON 
		acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
	INNER JOIN
	acpsy_estadopaciente
	ON 
		acpsy_atencion.idEstadoPacAtencion = acpsy_estadopaciente.idEstadoPacAtencion
WHERE
	MONTH ( acpsy_seguimiento.fRegistrSeg ) = MONTH (
	CURDATE()) AND
	YEAR( acpsy_seguimiento.fRegistrSeg ) = YEAR(CURDATE()) AND
	acpsy_seguimiento.idStatusSeg != 2
ORDER BY
	acpsy_seguimiento.fRegistrSeg DESC, 
	acpsy_seguimiento.idSeguimiento DESC


CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_SEGUIMIENTOS_MONITOREO_FECHAS`(IN `_fechaInicialSeg` DATE, IN `_fechaFinalSeg` DATE)
SELECT
	acpsy_seguimiento.idSeguimiento, 
	date_format( acpsy_seguimiento.fRegistrSeg, '%d/%m/%Y' ) AS fRegistrSeg, 
	acpsy_seguimiento.idAtencionPac, 
	acpsy_estadopaciente.detaEstadoPacAtencion, 
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
	acpsy_estatusseguimiento.detaStatusSeg, 
	acpsy_atencion.idEstadoPacAtencion
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
	acpsy_diagnosticos AS dp2
	ON 
		acpsy_seguimiento.idDiag2Seg = dp2.idDiagnostico
	LEFT JOIN
	acpsy_diagnosticos AS df1
	ON 
		acpsy_seguimiento.idDiag1SegFam = df1.idDiagnostico
	LEFT JOIN
	acpsy_diagnosticos AS df2
	ON 
		acpsy_seguimiento.idDiag2SegFam = df2.idDiagnostico
	LEFT JOIN
	acpsy_parentescofam
	ON 
		acpsy_famatencion.idParentesco = acpsy_parentescofam.idParentesco
	INNER JOIN
	acpsy_estadopaciente
	ON 
		acpsy_atencion.idEstadoPacAtencion = acpsy_estadopaciente.idEstadoPacAtencion
WHERE
	acpsy_seguimiento.idStatusSeg != 2 AND acpsy_seguimiento.fRegistrSeg BETWEEN _fechaInicialSeg AND _fechaFinalSeg
ORDER BY
	acpsy_seguimiento.fRegistrSeg DESC, 
	acpsy_seguimiento.idSeguimiento DESC

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_HISTORIAL_PACIENTE`(IN _idPaciente INT(11))
SELECT
acpsy_seguimiento.idAtencionPac,
date_format( acpsy_seguimiento.fRegistrSeg, '%d/%m/%Y' ) AS fRegistrSeg,
acpsy_tiposeguimiento.detaTipSeguimiento,
acpsy_motivoseguimiento.detaMotivoSef,
CONCAT(acpsy_profesionales.nombresProfesional," ",acpsy_profesionales.apellidosProfesional) as profesional,
acpsy_seguimiento.comunFamSeg,
acpsy_diagnosticos.cieDiagnostico AS cieP1,
acpsy_diagnosticos.detaDiagnostico AS detaD1,
dp2.cieDiagnostico AS cieP2,
dp2.detaDiagnostico AS detD2,
acpsy_famatencion.nombApFamiliar,
acpsy_parentescofam.detaParentesco,
df1.cieDiagnostico AS cieDF1,
df1.detaDiagnostico AS detDF1,
df2.cieDiagnostico AS cieDF2,
df2.detaDiagnostico AS detDF2,
acpsy_seguimiento.obsSeg
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
 acpsy_seguimiento.idAtencionPac = _idPaciente AND acpsy_seguimiento.idStatusSeg != 2
ORDER BY
	acpsy_seguimiento.fRegistrSeg ASC,
	acpsy_seguimiento.idSeguimiento ASC

	

-- MODIFICAR
CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_PACIENTE`(IN `_termino` TEXT)
SELECT
idAtencion,date_format(acpsy_atencion.fIngresoAtencion,'%d/%m/%Y') AS fIngresoAtencion,cuentaAtencion,tipdocAtencion,nrodocAtencion,CONCAT(nombAtencion,' ',apPaternoAtencion,' ',apMaternoAtencion) AS paciente,acpsy_estadopaciente.detaEstadoPacAtencion
FROM
	acpsy_atencion
INNER JOIN
	acpsy_estadopaciente
	ON 
		acpsy_atencion.idEstadoPacAtencion = acpsy_estadopaciente.idEstadoPacAtencion
WHERE (acpsy_atencion.nrodocAtencion LIKE CONCAT('%',_termino,'%') OR acpsy_atencion.apPaternoAtencion LIKE CONCAT('%',UPPER(_termino),'%') OR acpsy_atencion.apMaternoAtencion LIKE CONCAT('%',UPPER(_termino),'%') OR acpsy_atencion.nombAtencion LIKE CONCAT('%',UPPER(_termino),'%')) AND (acpsy_atencion.idEstadoAte != 2)
