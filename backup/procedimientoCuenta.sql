ALTER PROCEDURE [dbo].[LISTAR_DATOS_CUENTA_PSICO]
  @IdCuentaAtencion INT
AS
BEGIN
	SELECT
	Atenciones.IdAtencion,
	EpisodioAtencion.NumEpisodio, 
	EpisodioAtencion.IdEpisodio,
	FORMAT(EpisodioAtencion.FechaIngreso,'dd/MM/yyyy') AS FechaIngreso, 
	Atenciones.IdCuentaAtencion, 
	Atenciones.IdPaciente, 
	Pacientes.NroHistoriaClinica, 
	EpisodioAtencion.IdCondicionAlta, 
	UPPER(TiposCondicionAlta.Descripcion) AS Descripcion, 
	Pacientes.IdDocIdentidad, 
	TiposDocIdentidad.DescripcionAbrev, 
	Pacientes.NroDocumento, 
	Pacientes.ApellidoPaterno, 
	Pacientes.ApellidoMaterno, 
	Pacientes.PrimerNombre,
	UPPER(Pacientes.SegundoNombre) AS SegundoNombre, 
	EpisodioAtencion.IdservicioIngreso, 
	Servicios.Nombre,
	EpisodioAtencion.IdTipoServicio,
	UPPER(TiposServicio.Descripcion) AS TIPO_SERVICIO, 
	Pacientes.IdDistritoDomicilio, 
	UPPER(Distritos.Nombre) AS DISTRITO_PAC,
	FORMAT(Pacientes.FechaNacimiento,'dd/MM/yyyy') AS FechaNacimiento, 
	DATEDIFF(YEAR, Pacientes.FechaNacimiento,GETDATE()) AS EDAD_PAC, 
	Pacientes.IdTipoSexo,
	UPPER(TiposSexo.Descripcion) AS SEXO_PAC, 
	Pacientes.IdTipoSeguro, 
	UPPER(FuentesFinanciamiento.Descripcion) AS FUENTE_PAC, 
	EpisodioAtencion.IdlugarDeceso
FROM
	dbo.Atenciones
	INNER JOIN
	dbo.EpisodioAtencion
	ON 
		Atenciones.IdAtencion = EpisodioAtencion.IdAtencion
	INNER JOIN
	dbo.Pacientes
	ON 
		Atenciones.IdPaciente = Pacientes.IdPaciente
	INNER JOIN
	dbo.TiposDocIdentidad
	ON 
		Pacientes.IdDocIdentidad = TiposDocIdentidad.IdDocIdentidad
	INNER JOIN
	dbo.TiposSexo
	ON 
		Pacientes.IdTipoSexo = TiposSexo.IdTipoSexo
	INNER JOIN
	dbo.Distritos
	ON 
		Pacientes.IdDistritoDomicilio = Distritos.IdDistrito
	INNER JOIN
	dbo.FuentesFinanciamiento
	ON 
		Pacientes.IdTipoSeguro = FuentesFinanciamiento.IdFuenteFinanciamiento
	LEFT JOIN
	dbo.TiposCondicionAlta
	ON 
		EpisodioAtencion.IdCondicionAlta = TiposCondicionAlta.IdCondicionAlta
	INNER JOIN
	dbo.Servicios
	ON 
		EpisodioAtencion.IdservicioIngreso = Servicios.IdServicio
	INNER JOIN
	dbo.TiposServicio
	ON
	EpisodioAtencion.IdTipoServicio = TiposServicio.IdTipoServicio
WHERE
	(YEAR(EpisodioAtencion.FechaIngreso) = '2020' OR YEAR(EpisodioAtencion.FechaIngreso) = YEAR(GETDATE())) AND Atenciones.IdCuentaAtencion = @IdCuentaAtencion
ORDER BY EpisodioAtencion.FechaIngreso DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY
END

-- CARGA
ALTER PROCEDURE [dbo].[LISTAR_DATOS_CUENTA_PSICO_FORM]
  @IdCuentaAtencion INT, @IdEpisodio INT
AS
BEGIN
	SELECT
	Atenciones.IdAtencion,
	EpisodioAtencion.NumEpisodio, 
	EpisodioAtencion.IdEpisodio,
	FORMAT(EpisodioAtencion.FechaIngreso,'dd/MM/yyyy') AS FechaIngreso, 
	Atenciones.IdCuentaAtencion, 
	Atenciones.IdPaciente, 
	Pacientes.NroHistoriaClinica, 
	EpisodioAtencion.IdCondicionAlta, 
	UPPER(TiposCondicionAlta.Descripcion) AS Descripcion, 
	Pacientes.IdDocIdentidad, 
	TiposDocIdentidad.DescripcionAbrev, 
	Pacientes.NroDocumento, 
	Pacientes.ApellidoPaterno, 
	Pacientes.ApellidoMaterno, 
	Pacientes.PrimerNombre,
	UPPER(Pacientes.SegundoNombre) AS SegundoNombre, 
	EpisodioAtencion.IdservicioIngreso, 
	Servicios.Nombre,
	EpisodioAtencion.IdTipoServicio,
	UPPER(TiposServicio.Descripcion) AS TIPO_SERVICIO, 
	Pacientes.IdDistritoDomicilio, 
	UPPER(Distritos.Nombre) AS DISTRITO_PAC,
	FORMAT(Pacientes.FechaNacimiento,'dd/MM/yyyy') AS FechaNacimiento, 
	DATEDIFF(YEAR, Pacientes.FechaNacimiento,GETDATE()) AS EDAD_PAC, 
	Pacientes.IdTipoSexo,
	UPPER(TiposSexo.Descripcion) AS SEXO_PAC, 
	Pacientes.IdTipoSeguro, 
	UPPER(FuentesFinanciamiento.Descripcion) AS FUENTE_PAC, 
	EpisodioAtencion.IdlugarDeceso
FROM
	dbo.Atenciones
	INNER JOIN
	dbo.EpisodioAtencion
	ON 
		Atenciones.IdAtencion = EpisodioAtencion.IdAtencion
	INNER JOIN
	dbo.Pacientes
	ON 
		Atenciones.IdPaciente = Pacientes.IdPaciente
	INNER JOIN
	dbo.TiposDocIdentidad
	ON 
		Pacientes.IdDocIdentidad = TiposDocIdentidad.IdDocIdentidad
	INNER JOIN
	dbo.TiposSexo
	ON 
		Pacientes.IdTipoSexo = TiposSexo.IdTipoSexo
	INNER JOIN
	dbo.Distritos
	ON 
		Pacientes.IdDistritoDomicilio = Distritos.IdDistrito
	INNER JOIN
	dbo.FuentesFinanciamiento
	ON 
		Pacientes.IdTipoSeguro = FuentesFinanciamiento.IdFuenteFinanciamiento
	LEFT JOIN
	dbo.TiposCondicionAlta
	ON 
		EpisodioAtencion.IdCondicionAlta = TiposCondicionAlta.IdCondicionAlta
	INNER JOIN
	dbo.Servicios
	ON 
		EpisodioAtencion.IdservicioIngreso = Servicios.IdServicio
	INNER JOIN
	dbo.TiposServicio
	ON
	EpisodioAtencion.IdTipoServicio = TiposServicio.IdTipoServicio
WHERE
	Atenciones.IdCuentaAtencion = @IdCuentaAtencion AND EpisodioAtencion.IdEpisodio = @IdEpisodio
END