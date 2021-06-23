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
$("#btnEdtAte").on("click", function () {
    $("#formEdtAte").validate({
        rules: {
            edtaNCuenta: {
                required: true,
            },
            edtaNHC: {
                required: true,
            },
            edtaFNac: {
                required: true,
            },
            edtaTdoc: {
                required: true,
            },
            edtaNDoc: {
                required: true,
            },
            edtaAPaterno: {
                required: true,
            },
            edtaAMaterno: {
                required: true,
            },
            edtaNombres: {
                required: true,
            },
            edtaEdad: {
                required: true,
            },
            edtaSexo: {
                valueNotEquals: "0",
                required: true,
            },
            edtaFinancia: {
                required: true,
            },
            edtaDistrito: {
                required: true,
            },
            edtaEstadoPac: {
                valueNotEquals: "0",
                required: true,
            },
            edtaFIngServicio: {
                required: true,
            },
            edtaServicio: {
                required: true,
            },
        },
        messages: {
            edtaNCuenta: {
                required: "Dato requerido",
            },
            edtaNHC: {
                required: "Dato requerido",
            },
            edtaFNac: {
                required: "Dato requerido",
            },
            edtaTdoc: {
                required: "Dato requerido",
            },
            edtaNDoc: {
                required: "Dato requerido",
            },
            edtaAPaterno: {
                required: "Dato requerido",
            },
            edtaAMaterno: {
                required: "Dato requerido",
            },
            edtaNombres: {
                required: "Dato requerido",
            },
            edtaEdad: {
                required: "Dato requerido",
            },
            edtaSexo: {
                valueNotEquals: "Seleccione sexo",
                required: "Seleccione sexo",
            },
            edtaFinancia: {
                required: "Dato requerido",
            },
            edtaDistrito: {
                required: "Dato requerido",
            },
            edtaEstadoPac: {
                valueNotEquals: "Seleccione Estado de Paciente",
                required: "Seleccine Estado de Paciente",
            },
            edtaFIngServicio: {
                required: "Dato requerido",
            },
            edtaServicio: {
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
$("#searchCuenta2").keyup(function () {
    this.value = (this.value + "").replace(/[^0-9]/g, "");
});
$("#btnCuentaCarg1").click(function () {
    var dato = $("#searchCuenta").val();
    var filtro = $("#fCuenta").val();
    if (dato != '') {
        mostrarPaciente(dato, filtro);
    }
});

function mostrarPaciente(dato1, filtro1) {
    $.ajax({
        url: "public/views/src/ajaxCuentas.php",
        method: "POST",
        dataType: "html",
        data: { dato: dato1, filtro: filtro1 }
    }).done(function (respuesta) {
        $("#dataCuenta").html(respuesta);
    }).fail(function () {
        console.log("error");
    })
}
function ValidarCuentaExistente(cuenta) {
    var vcuenta = cuenta;
    var datos = new FormData();
    datos.append("cuentaAtencion", vcuenta);
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
                Swal.fire({
                    icon: "error",
                    title: "¡El N° de Cuenta de Atención Seleccionado ya está registrado, en la <br>Ficha N° " + respuesta["correlativo_Atencion"] + "!",
                    showConfirmButton: false,
                    timer: 1700
                });
                $("#dataCuenta").html("");
                $("#searchCuenta").val("");
                $("#searchCuenta").focus();
            }
            else {
                seleccionarAtencion(vcuenta);
            }
        },
    });
}
function seleccionarAtencion(cuenta) {
    var idCuenta = cuenta;
    var datosCarga = new FormData();
    datosCarga.append("idCuenta", idCuenta);
    $.ajax({
        url: "public/views/src/ajaxCuentas.php",
        method: "POST",
        data: datosCarga,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function (respuesta) {
            $("#idEpisodio").val(respuesta["IdAtencion"]);
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
            $("#rgaServicio").val(respuesta["Nombre"] + ' - ' + respuesta["TIPO_SERVICIO"]);
            $("#setSex").val(respuesta["IdTipoSexo"]);
            $("#setSex").html(respuesta["SEXO_PAC"]);
            if (respuesta["IdTipoServicio"] == 1) {
                $("#setEstado").val(2);
                $("#setEstado").html("ALTA");
            }
            else {
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
            }
            $("#modal-busqueda-cuenta").modal("hide");
            $("#searchCuenta").val("");
            $("#dataCuenta").html("");
        },
    });
}

$("#btnCuentaCarg2").click(function () {
    var dato2 = $("#searchCuenta2").val();
    var filtro2 = $("#fCuenta2").val();
    var cActual = $("#idCuentaAct").val();
    if (dato2 != '') {
        mostrarPaciente2(dato2, filtro2, cActual);
    }
});
function mostrarPaciente2(dato2, filtro2, cActual) {
    $.ajax({
        url: "public/views/src/ajaxCuentas.php",
        method: "POST",
        dataType: "html",
        data: { dato2: dato2, filtro2: filtro2, cActual: cActual }
    }).done(function (respuesta) {
        $("#dataCuenta2").html(respuesta);
    }).fail(function () {
        console.log("error");
    })
}

function ValidarCuentaExistente2(cuenta, cactual) {
    var vcuenta = cuenta;
    var vcactual = cactual;

    var datos = new FormData();

    if (vcuenta == vcactual) {
        seleccionarAtencion2(cuenta);
    }
    else if (vcactual != vcuenta && vcactual != "") {
        datos.append("cuentaAtencion", vcuenta);
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
                    Swal.fire({
                        icon: "error",
                        title: "¡El N° de Cuenta de Atención Seleccionado ya está registrado, en la <br>Ficha N° " + respuesta["correlativo_Atencion"] + "!",
                        showConfirmButton: false,
                        timer: 1700
                    });
                    $("#dataCuenta2").html("");
                    $("#searchCuenta2").val("");
                    $("#searchCuenta2").focus();
                }
                else {
                    seleccionarAtencion2(cuenta);
                }
            },
        });
    }
}
function seleccionarAtencion2(cuenta) {
    var idCuenta = cuenta;
    var datosCarga = new FormData();
    datosCarga.append("idCuenta", idCuenta);
    $.ajax({
        url: "public/views/src/ajaxCuentas.php",
        method: "POST",
        data: datosCarga,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function (respuesta) {
            $("#idEpisodioEdt").val(respuesta["IdAtencion"]);
            $("#edtaNCuenta").val(respuesta["IdCuentaAtencion"]);
            $("#edtaNHC").val(respuesta["NroHistoriaClinica"]);
            $("#edtaFNac").val(respuesta["FechaNacimiento"]);
            $("#edtaFIngServicio").val(respuesta["FechaIngreso"]);
            $("#edtaTdoc").val(respuesta["DescripcionAbrev"]);
            $("#edtaNDoc").val(respuesta["NroDocumento"]);
            $("#edtaAPaterno").val(respuesta["ApellidoPaterno"]);
            $("#edtaAMaterno").val(respuesta["ApellidoMaterno"]);
            $("#edtaNombres").val(respuesta["PrimerNombre"]);
            $("#edtaEdad").val(respuesta["EDAD_PAC"]);
            $("#edtaFinancia").val(respuesta["FUENTE_PAC"]);
            $("#edtaDistrito").val(respuesta["DISTRITO_PAC"]);
            $("#edtaServicio").val(respuesta["Nombre"] + ' - ' + respuesta["TIPO_SERVICIO"]);
            $("#setSex2").val(respuesta["IdTipoSexo"]);
            $("#setSex2").html(respuesta["SEXO_PAC"]);
            if (respuesta["IdCondicionAlta"] == 1 || respuesta["IdCondicionAlta"] == 2 || respuesta["IdCondicionAlta"] == 3) {
                $("#setEstado2").val(2);
                $("#setEstado2").html("ALTA");
            }
            else if (respuesta["IdCondicionAlta"] == 4) {
                $("#setEstado2").val(3);
                $("#setEstado2").html("FALLECIDO");
            }
            else {
                $("#setEstado2").val(1);
                $("#setEstado2").html("HOSPITALIZADO");
            }
            $("#modal-busqueda-cuenta-edt").modal("hide");
            $("#searchCuenta2").val("");
            $("#dataCuenta2").html("");
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
            $("#idCuentaAct").val(respuesta["cuentaAtencion"]);
            $("#idEpisodioEdtAct").val(respuesta["idEpisodio"]);
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
// Anula atención
$(".datatableAtenciones tbody").on("click", ".btnAnularAtencion", function () {
    var idAtencion = $(this).attr("idAtencion");
    var idCuenta = $(this).attr("idCuenta");
    var idEpisodio = $(this).attr("idEpisodio");
    var idUsuario = $("#idAtencionUsuario").val();

    Swal.fire({
        title: '¿Está seguro(a) de anular la atención?',
        text: "¡Si no lo está, puede cancelar la acción!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#343a40',
        cancelButtonText: 'Cancelar',
        cancelButtonColor: '#d33',
        confirmButtonText: '¡Sí, anular Atención!'
    }).then(function (result) {
        if (result.value) {
            window.location = "index.php?ruta=atenciones&idAtencion=" + idAtencion + "&idCuenta=" + idCuenta + "&idEpisodio=" + idEpisodio + "&idUsuario=" + idUsuario;
        }
    })
});