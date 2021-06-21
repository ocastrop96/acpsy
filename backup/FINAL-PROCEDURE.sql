USE [SIGH]
GO
/****** Object:  StoredProcedure [dbo].[CONSULTA_PSICOLOGIA]    Script Date: 21/06/2021 14:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CONSULTA_PSICOLOGIA] ( @IdCuentaAtencion INT ) AS BEGIN
	
	DECLARE @TIPOSERVICIO INT;
	DECLARE @IDEPISODIO INT;

	SET @TIPOSERVICIO = ( SELECT ATE.IdTipoServicio FROM Atenciones ATE  WHERE ATE.IdCuentaAtencion = @IdCuentaAtencion );
	SET @IDEPISODIO = ( SELECT EP.IdEpisodio FROM Atenciones A INNER JOIN EpisodioAtencion EP ON A.IdAtencion=EP.IdAtencion
	                     WHERE IdEpisodio IN
						 (SELECT MAX(E.IdEpisodio) FROM Atenciones A 
						   INNER JOIN EpisodioAtencion E ON A.IdAtencion=E.IdAtencion
						   WHERE A.IdCuentaAtencion=@IdCuentaAtencion) 
						   );

	IF
		@TIPOSERVICIO = 1 BEGIN
		SELECT 
			 Atenciones.IdAtencion,
			Atenciones.IdCuentaAtencion,
			FORMAT ( Atenciones.FechaIngreso, 'dd/MM/yyyy' ) AS FechaIngreso,
			Atenciones.IdPaciente,
			Pacientes.NroHistoriaClinica,
			FORMAT ( Pacientes.FechaNacimiento, 'dd/MM/yyyy' ) AS FechaNacimiento,
			DATEDIFF( YEAR, Pacientes.FechaNacimiento, GETDATE( ) ) AS EDAD_PAC,
			Pacientes.IdDocIdentidad,
			Pacientes.NroDocumento,
			TiposDocIdentidad.DescripcionAbrev,
			Pacientes.ApellidoPaterno,
			Pacientes.ApellidoMaterno,
			Pacientes.PrimerNombre,
			UPPER ( Pacientes.SegundoNombre ) AS SegundoNombre,
			Pacientes.IdTipoSexo,
			UPPER ( TiposSexo.Descripcion ) AS SEXO_PAC,
			Atenciones.idFuenteFinanciamiento,
			UPPER ( FuentesFinanciamiento.Descripcion ) AS FUENTE_PAC,
			Pacientes.IdDistritoDomicilio,
			UPPER ( Distritos.Nombre ) AS DISTRITO_PAC,
			Atenciones.IdCondicionAlta,
			UPPER ( TiposCondicionAlta.Descripcion ) AS Descripcion,
			Atenciones.IdServicioIngreso,
			UPPER(Servicios.Nombre) as Nombre ,
			UPPER ( TiposServicio.Descripcion ) AS TIPO_SERVICIO 
		FROM
			dbo.Atenciones
			INNER JOIN dbo.Pacientes ON Atenciones.IdPaciente = Pacientes.IdPaciente
			INNER JOIN dbo.TiposDocIdentidad ON Pacientes.IdDocIdentidad = TiposDocIdentidad.IdDocIdentidad
			INNER JOIN dbo.TiposSexo ON Pacientes.IdTipoSexo = TiposSexo.IdTipoSexo
			INNER JOIN dbo.FuentesFinanciamiento ON Atenciones.idFuenteFinanciamiento = FuentesFinanciamiento.IdFuenteFinanciamiento
			INNER JOIN dbo.Distritos ON Pacientes.IdDistritoDomicilio = Distritos.IdDistrito
			LEFT JOIN dbo.TiposCondicionAlta ON Atenciones.IdCondicionAlta = TiposCondicionAlta.IdCondicionAlta
			INNER JOIN dbo.Servicios ON Atenciones.IdServicioIngreso = Servicios.IdServicio
			INNER JOIN dbo.TiposServicio ON Atenciones.IdTipoServicio = TiposServicio.IdTipoServicio 
		WHERE
			( YEAR ( Atenciones.FechaIngreso ) BETWEEN '2020' AND YEAR ( GETDATE( ) ) ) 
			AND Atenciones.IdCuentaAtencion = @IdCuentaAtencion 
		ORDER BY
			Atenciones.FechaIngreso DESC 
		END 
		ELSE BEGIN
		SELECT  Atenciones.IdAtencion,
			EpisodioAtencion.IdEpisodio,
			FORMAT ( EpisodioAtencion.FechaIngreso, 'dd/MM/yyyy' ) AS FechaIngreso,
			Atenciones.IdCuentaAtencion,
			Atenciones.IdPaciente,
			Pacientes.NroHistoriaClinica,
			EpisodioAtencion.IdCondicionAlta,
			UPPER ( TiposCondicionAlta.Descripcion ) AS Descripcion,
			Pacientes.IdDocIdentidad,
			TiposDocIdentidad.DescripcionAbrev,
			Pacientes.NroDocumento,
			Pacientes.ApellidoPaterno,
			Pacientes.ApellidoMaterno,
			Pacientes.PrimerNombre,
			UPPER ( Pacientes.SegundoNombre ) AS SegundoNombre,
			EpisodioAtencion.IdservicioIngreso,
			UPPER(Servicios.Nombre) as Nombre ,
			EpisodioAtencion.IdTipoServicio,
			UPPER ( TiposServicio.Descripcion ) AS TIPO_SERVICIO,
			Pacientes.IdDistritoDomicilio,
			UPPER ( Distritos.Nombre ) AS DISTRITO_PAC,
			FORMAT ( Pacientes.FechaNacimiento, 'dd/MM/yyyy' ) AS FechaNacimiento,
			DATEDIFF( YEAR, Pacientes.FechaNacimiento, GETDATE( ) ) AS EDAD_PAC,
			Pacientes.IdTipoSexo,
			UPPER ( TiposSexo.Descripcion ) AS SEXO_PAC,
			Pacientes.IdTipoSeguro,
			UPPER ( FuentesFinanciamiento.Descripcion ) AS FUENTE_PAC
		FROM
			dbo.Atenciones
			INNER JOIN dbo.EpisodioAtencion ON Atenciones.IdAtencion = EpisodioAtencion.IdAtencion
			INNER JOIN dbo.Pacientes ON Atenciones.IdPaciente = Pacientes.IdPaciente
			INNER JOIN dbo.TiposDocIdentidad ON Pacientes.IdDocIdentidad = TiposDocIdentidad.IdDocIdentidad
			INNER JOIN dbo.TiposSexo ON Pacientes.IdTipoSexo = TiposSexo.IdTipoSexo
			INNER JOIN dbo.Distritos ON Pacientes.IdDistritoDomicilio = Distritos.IdDistrito
			INNER JOIN dbo.FuentesFinanciamiento ON Pacientes.IdTipoSeguro = FuentesFinanciamiento.IdFuenteFinanciamiento
			LEFT JOIN dbo.TiposCondicionAlta ON EpisodioAtencion.IdCondicionAlta = TiposCondicionAlta.IdCondicionAlta
			INNER JOIN dbo.Servicios ON EpisodioAtencion.IdservicioIngreso = Servicios.IdServicio
			INNER JOIN dbo.TiposServicio ON EpisodioAtencion.IdTipoServicio = TiposServicio.IdTipoServicio 
		WHERE
			( YEAR ( EpisodioAtencion.FechaIngreso ) IN ( '2020' , YEAR ( GETDATE( ) )) ) AND
			 Atenciones.IdCuentaAtencion = @IdCuentaAtencion AND dbo.EpisodioAtencion.IdEpisodio=@IDEPISODIO
		ORDER BY
			EpisodioAtencion.FechaIngreso DESC 
	END 
END