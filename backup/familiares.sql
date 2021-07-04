SELECT
	apsi_seguimiento.idSeguimiento, 
	apsi_seguimiento.fechaRegSeg, 
	apsi_tipseguimiento.descTipSeg, 
	apsi_profesionales.apellidos_nombres, 
	apsi_seguimiento.nroDocPac, 
	apsi_seguimiento.nroHisPac, 
	apsi_seguimiento.nombApPac, 
	apsi_diagnosticos.cie10 AS d1, 
	dpac2.cie10 AS d2, 
	apsi_seguimiento.comFamiliar, 
	apsi_parentesco.descParent, 
	apsi_seguimiento.edadFam, 
	apsi_seguimiento.nroDocFam, 
	apsi_seguimiento.nombApFam, 
	dfam1.cie10 AS df1, 
	dfam2.cie10 AS df3
FROM
	apsi_seguimiento
	INNER JOIN
	apsi_tipseguimiento
	ON 
		apsi_seguimiento.tipoSeguimiento = apsi_tipseguimiento.idTipSeg
	INNER JOIN
	apsi_profesionales
	ON 
		apsi_seguimiento.idprofesional = apsi_profesionales.idProfesional
	INNER JOIN
	apsi_diagnosticos
	ON 
		apsi_seguimiento.diag1Pac = apsi_diagnosticos.idDiagnostico
	LEFT JOIN
	apsi_diagnosticos AS dpac2
	ON 
		apsi_seguimiento.diag2Pac = dpac2.idDiagnostico
	LEFT JOIN
	apsi_diagnosticos AS dfam1
	ON 
		apsi_seguimiento.diag1Fam = dfam1.idDiagnostico
	LEFT JOIN
	apsi_diagnosticos AS dfam2
	ON 
		apsi_seguimiento.diag2Fam = dfam2.idDiagnostico
	INNER JOIN
	apsi_parentesco
	ON 
		apsi_seguimiento.parentFam = apsi_parentesco.idParentesco
WHERE
	idSeguimiento > 656