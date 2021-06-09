$(".datatableAtenciones").DataTable({
    ajax: "public/views/util/datatable-Atenciones.php",
    deferRender: true,
    retrieve: true,
    processing: true,
    paging: true,
    lengthChange: true,
    searching: true,
    ordering: true,
    order: [
        [1, "desc"]
    ],
    info: true,
    autoWidth: false,
    language: {
        url: "public/views/resources/js/dataTables.spanish.lang",
    },
});
$("#searchCuenta").keyup(function () {
    var cuenta = $(this).val();
    if (cuenta != "") {
        mostrarPaciente(cuenta);
    }
});

function mostrarPaciente(cuenta) {
    $.ajax({
        url: "public/views/src/ajaxCuentas.php",
        method: "POST",
        dataType: "html",
        data: { cuenta: cuenta }
    }).done(function (respuesta) {
        $("#dataCuenta").html(respuesta);
    }).fail(function () {
        console.log("error");
    })
}
function seleccionarAtencion(cuenta, episodio) {
    var idCuenta = cuenta;
    var idEpisodio = episodio;
    var datosCarga = new FormData();
    datosCarga.append("idCuenta", idCuenta);
    datosCarga.append("idEpisodio", idEpisodio);
    $.ajax({
        url: "public/views/src/ajaxCuentas.php",
        method: "POST",
        data: datosCarga,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function (respuesta) {
            $("#rgaNCuenta").val(respuesta["IdCuentaAtencion"]);
            $("#rgaNHC").val(respuesta["NroHistoriaClinica"]);
            $("#rgaFNac").val(respuesta["FechaNacimiento"]);
            $("#rgaFIngServicio").val(respuesta["FechaIngreso"]);
            $("#rgaTdoc").val(respuesta["DescripcionAbrev"]);
            $("#rgaNDoc").val(respuesta["NroDocumento"]);
            $("#rgaAPaterno").val(respuesta["ApellidoPaterno"]);
            $("#rgaAMaterno").val(respuesta["ApellidoMaterno"]);
            $("#rgaNombres").val(respuesta["PrimerNombre"]);
            $("#rgaEdad").val(respuesta["EDAD_PAC"]);
            $("#rgaFinancia").val(respuesta["FUENTE_PAC"]);
            $("#rgaDistrito").val(respuesta["DISTRITO_PAC"]);
            $("#rgaServicio").val(respuesta["Nombre"]);
            $("#setSex").val(respuesta["IdTipoSexo"]);
            $("#setSex").html(respuesta["SEXO_PAC"]);
            if (respuesta["IdCondicionAlta"] == 1 || respuesta["IdCondicionAlta"] == 2 || respuesta["IdCondicionAlta"] == 3) {
                $("#setEstado").val(2);
                $("#setEstado").html("ALTA");
            }
            else if (respuesta["IdCondicionAlta"] == 4) {
                $("#setEstado").val(3);
                $("#setEstado").html("FALLECIDO");
            }
            else {
                $("#setEstado").val(1);
                $("#setEstado").html("HOSPITALIZADO");
            }
            $("#modal-busqueda-cuenta").modal("hide");
            $("#searchCuenta").val("");
            $("#dataCuenta").html("");
        },
    });
}

// Editar Atención
$(".datatableAtenciones tbody").on("click", ".btnEditarAtencion", function () {
    var idAtencion = $(this).attr("idAtencion");
    alert(idAtencion)
});
// Editar Atención