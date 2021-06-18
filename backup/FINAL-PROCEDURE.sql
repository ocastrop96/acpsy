USE [SIGH]
GO
/****** Object:  StoredProcedure [dbo].[DATOS_ACOMPANAMIENTO_PSICO]    Script Date: 18/06/2021 02:47:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE DATOS_ACOMPANAMIENTO_PSICO (@IdCuentaAtencion INT,@IdEpisodio INT = 0,@opcion INT,@accion INT)
AS
BEGIN
DECLARE @parametro INT;
DECLARE @action INT;


SET @parametro = @opcion
SET @action = @accion

DECLARE @iDTIPOSER  INT
 SET @iDTIPOSER=(SELECT a.IdTipoServicio FROM Atenciones a WHERE a.IdCuentaAtencion=@IdCuentaAtencion) 

 IF @iDTIPOSER=1 
 BEGIN
    
 END
 ELSE
 BEGIN
    
 END



/* CONDICIONAL PARA ACCION */
	IF @action = 1
		IF @parametro = 1
		BEGIN
		SELECT
			Atenciones.IdAtencion,
			EpisodioAtencion.NumEpisodio,
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
			Servicios.Nombre,
			EpisodioAtencion.IdTipoServicio,
			UPPER ( TiposServicio.Descripcion ) AS TIPO_SERVICIO,
			Pacientes.IdDistritoDomicilio,
			UPPER ( Distritos.Nombre ) AS DISTRITO_PAC,
			FORMAT ( Pacientes.FechaNacimiento, 'dd/MM/yyyy' ) AS FechaNacimiento,
			DATEDIFF( YEAR, Pacientes.FechaNacimiento, GETDATE( ) ) AS EDAD_PAC,
			Pacientes.IdTipoSexo,
			UPPER ( TiposSexo.Descripcion ) AS SEXO_PAC,
			Pacientes.IdTipoSeguro,
			UPPER ( FuentesFinanciamiento.Descripcion ) AS FUENTE_PAC,
			EpisodioAtencion.IdlugarDeceso 
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
			(YEAR(EpisodioAtencion.FechaIngreso) BETWEEN '2020'AND YEAR(GETDATE())) AND Atenciones.IdCuentaAtencion = @IdCuentaAtencion 
			AND Atenciones.IdCuentaAtencion = @IdCuentaAtencion 
		ORDER BY
			EpisodioAtencion.FechaIngreso DESC OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY
		END
		ELSE
		BEGIN
		SELECT
			Atenciones.IdAtencion,
			Atenciones.IdCuentaAtencion,
			FORMAT ( Atenciones.FechaIngreso, 'dd/MM/yyyy' ) AS FechaIngreso,
			Atenciones.IdPaciente,
			Pacientes.NroHistoriaClinica,
			FORMAT ( Pacientes.FechaNacimiento, 'dd/MM/yyyy' ) AS FechaNacimiento,
			DATEDIFF( YEAR, Pacientes.FechaNacimiento, GETDATE( ) ) AS EDAD_PAC,
			Pacientes.IdDocIdentidad,
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
			Servicios.Nombre,
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
			( YEAR ( Atenciones.FechaIngreso )  BETWEEN '2020' AND YEAR ( GETDATE( ) ) ) 
			AND Atenciones.IdCuentaAtencion = @IdCuentaAtencion 
		ORDER BY
			Atenciones.FechaIngreso DESC OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY 
		END
	ELSE
		IF @parametro = 1
			BEGIN
			SELECT
			Atenciones.IdAtencion,
			EpisodioAtencion.NumEpisodio,
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
			Servicios.Nombre,
			EpisodioAtencion.IdTipoServicio,
			UPPER ( TiposServicio.Descripcion ) AS TIPO_SERVICIO,
			Pacientes.IdDistritoDomicilio,
			UPPER ( Distritos.Nombre ) AS DISTRITO_PAC,
			FORMAT ( Pacientes.FechaNacimiento, 'dd/MM/yyyy' ) AS FechaNacimiento,
			DATEDIFF( YEAR, Pacientes.FechaNacimiento, GETDATE( ) ) AS EDAD_PAC,
			Pacientes.IdTipoSexo,
			UPPER ( TiposSexo.Descripcion ) AS SEXO_PAC,
			Pacientes.IdTipoSeguro,
			UPPER ( FuentesFinanciamiento.Descripcion ) AS FUENTE_PAC,
			EpisodioAtencion.IdlugarDeceso 
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
			Atenciones.IdCuentaAtencion = @IdCuentaAtencion 
			AND EpisodioAtencion.IdEpisodio = @IdEpisodio
			END
		ELSE
			BEGIN
			SELECT
				Atenciones.IdAtencion,
				Atenciones.IdCuentaAtencion,
				FORMAT ( Atenciones.FechaIngreso, 'dd/MM/yyyy' ) AS FechaIngreso,
				Atenciones.IdPaciente,
				Pacientes.NroHistoriaClinica,
				FORMAT ( Pacientes.FechaNacimiento, 'dd/MM/yyyy' ) AS FechaNacimiento,
				DATEDIFF( YEAR, Pacientes.FechaNacimiento, GETDATE( ) ) AS EDAD_PAC,
				Pacientes.IdDocIdentidad,
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
				Servicios.Nombre,
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
				Atenciones.IdCuentaAtencion = @IdCuentaAtencion 
				AND IdAtencion = @IdEpisodio
			END
/* CONDICIONAL PARA ACCION */
END