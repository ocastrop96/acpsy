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
// Validar Formularios de  Atención
$.validator.addMethod(
    "valueNotEquals",
    function (value, element, arg) {
        return arg !== value;
    },
    "Value must not equal arg."
);
$("#btnRegAte").on("click", function () {
    $("#formRegAte").validate({
        rules: {
            rgaNCuenta: {
                required: true,
            },
            rgaNHC: {
                required: true,
            },
            rgaFNac: {
                required: true,
            },
            rgaTdoc: {
                required: true,
            },
            rgaNDoc: {
                required: true,
            },
            rgaAPaterno: {
                required: true,
            },
            rgaAMaterno: {
                required: true,
            },
            rgaNombres: {
                required: true,
            },
            rgaEdad: {
                required: true,
            },
            rgaSexo: {
                valueNotEquals: "0",
                required: true,
            },
            rgaFinancia: {
                required: true,
            },
            rgaDistrito: {
                required: true,
            },
            rgaEstadoPac: {
                valueNotEquals: "0",
                required: true,
            },
            rgaFIngServicio: {
                required: true,
            },
            rgaServicio: {
                required: true,
            },
        },
        messages: {
            rgaNCuenta: {
                required: "Dato requerido",
            },
            rgaNHC: {
                required: "Dato requerido",
            },
            rgaFNac: {
                required: "Dato requerido",
            },
            rgaTdoc: {
                required: "Dato requerido",
            },
            rgaNDoc: {
                required: "Dato requerido",
            },
            rgaAPaterno: {
                required: "Dato requerido",
            },
            rgaAMaterno: {
                required: "Dato requerido",
            },
            rgaNombres: {
                required: "Dato requerido",
            },
            rgaEdad: {
                required: "Dato requerido",
            },
            rgaSexo: {
                valueNotEquals: "Seleccione sexo",
                required: "Seleccione sexo",
            },
            rgaFinancia: {
                required: "Dato requerido",
            },
            rgaDistrito: {
                required: "Dato requerido",
            },
            rgaEstadoPac: {
                valueNotEquals: "Seleccione Estado de Paciente",
                required: "Seleccine Estado de Paciente",
            },
            rgaFIngServicio: {
                required: "Dato requerido",
            },
            rgaServicio: {
                required: "Dato requerido",
            },
        },
        errorElement: "span",
        errorPlacement: function (error, element) {
            error.addClass("invalid-feedback");
            element.closest(".form-group").append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass("is-invalid");
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass("is-invalid");
        },
    });
});
// Validar Formularios de  Atención

$("#searchCuenta").keyup(function () {
    this.value = (this.value + "").replace(/[^0-9]/g, "");
});
$("#searchCuenta").keyup(function () {
    const Toast = Swal.mixin({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 1500,
    });
    var cuenta = $(this).val();

    var datos = new FormData();
    if (cuenta != "") {
        datos.append("cuentaAtencion", cuenta);
        $.ajax({
            url: "public/views/src/ajaxAtenciones.php",
            method: "POST",
            data: datos,
            cache: false,
            contentType: false,
            processData: false,
            dataType: "json",
            success: function (respuesta) {
                if (respuesta) {
                    Toast.fire({
                        icon: "error",
                        title: "La cuenta ingresada ya está registrada.",
                    });
                    $("#searchCuenta").val("");
                    $("#searchCuenta").focus();
                }
                else {
                    mostrarPaciente(cuenta);
                }
            },
        });
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
            $("#idEpisodio").val(respuesta["IdEpisodio"]);
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
    var datos = new FormData();
    datos.append("idAtencion", idAtencion);
    $.ajax({
        url: "public/views/src/ajaxAtenciones.php",
        method: "POST",
        data: datos,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function (respuesta) {
            $("#edtaCorrelativo").val(respuesta["correlativo_Atencion"]);
            $("#edtaNCuenta").val(respuesta["cuentaAtencion"]);
            $("#idAtencion").val(respuesta["idAtencion"]);
            $("#idEpisodioEdt").val(respuesta["idEpisodio"]);
            $("#edtaNHC").val(respuesta["historiaAtencion"]);
            $("#edtaFNac").val(respuesta["fechaPacNacimiento"]);
            $("#edtaTdoc").val(respuesta["tipdocAtencion"]);
            $("#edtaNDoc").val(respuesta["nrodocAtencion"]);
            $("#edtaAPaterno").val(respuesta["apPaternoAtencion"]);
            $("#edtaAMaterno").val(respuesta["apMaternoAtencion"]);
            $("#edtaNombres").val(respuesta["nombAtencion"]);
            $("#edtaEdad").val(respuesta["edadAtencion"]);
            $("#edtaFinancia").val(respuesta["financiaAtencion"]);
            $("#edtaDistrito").val(respuesta["distritoAtencion"]);
            $("#edtaCama").val(respuesta["camaAtencion"]);
            $("#edtaFIngServicio").val(respuesta["fIngresoAtencion"]);
            $("#edtaServicio").val(respuesta["servAtencion"]);
            $("#setSex2").val(respuesta["tipSexoAtencion"]);
            $("#setSex2").html(respuesta["detaTipSexo"]);
            $("#setEstado2").val(respuesta["idEstadoPacAtencion"]);
            $("#setEstado2").html(respuesta["detaEstadoPacAtencion"]);
        },
    });
});
// Editar Atención