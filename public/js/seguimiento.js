$(".datatableSeguimiento").DataTable({
    ajax: "public/views/util/datatable-Seguimientos.php",
    deferRender: true,
    retrieve: true,
    processing: true,
    paging: true,
    lengthChange: true,
    searching: true,
    ordering: false,
    info: true,
    autoWidth: false,
    language: {
        url: "public/views/resources/js/dataTables.spanish.lang",
    },
});
$("#rgSegPac").select2(
    {
        maximumInputLength: "12",
        minimumInputLength: "2",
        language: {

            noResults: function () {

                return "No hay resultado";
            },
            searching: function () {

                return "Buscando..";
            },
            inputTooShort: function () {
                return "Ingrese 2 o más caracteres";
            },
            inputTooLong: function () {
                return "Ingrese máximo 12 caracteres";
            }
        },
        scrollAfterSelect: true,
        placeholder: 'Ingrese N° de DNI,CE,PASS o Nombres del Paciente',
        ajax: {
            url: "public/views/src/ajaxFamiliares.php",
            type: "post",
            dataType: "json",
            delay: 200,
            data: function (params) {
                return {
                    searchTerm2: params.term,
                };
            },
            processResults: function (response) {
                return {
                    results: response,
                };
            },
            cache: true,
        },
    }
);
$("#edtSegPac").select2(
    {
        maximumInputLength: "12",
        minimumInputLength: "2",
        language: {

            noResults: function () {

                return "No hay resultado";
            },
            searching: function () {

                return "Buscando..";
            },
            inputTooShort: function () {
                return "Ingrese 2 o más caracteres";
            },
            inputTooLong: function () {
                return "Ingrese máximo 12 caracteres";
            }
        },
        scrollAfterSelect: true,
        placeholder: 'Ingrese N° de DNI,CE,PASS o Nombres del Paciente',
        ajax: {
            url: "public/views/src/ajaxFamiliares.php",
            type: "post",
            dataType: "json",
            delay: 200,
            data: function (params) {
                return {
                    searchTerm2: params.term,
                };
            },
            processResults: function (response) {
                $("#seleccionActual2").remove();
                $("#seleccionActual21").remove();
                $("#seleccionActual3").remove();
                $("#seleccionActual31").remove();
                return {
                    results: response,
                };
            },
            cache: true,
        },
    }
);
$("#rgSegFec").inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' });
$('#rgSegFec').datepicker({
    'format': 'dd/mm/yyyy',
    'autoclose': true,
    'language': 'es',
    'endDate': new Date(),
});
$("#edtSegFec").inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' });
$('#edtSegFec').datepicker({
    'format': 'dd/mm/yyyy',
    'autoclose': true,
    'language': 'es',
    'endDate': new Date(),
});
// Condicionales para mostrar bloques
$("#rgSegTip").on("change", function () {
    // $("#tipSeg").prop("disabled", true);
    let comboTipSeg = $(this).val();
    if (comboTipSeg > 0) {
        if (comboTipSeg == 1 || comboTipSeg == 2) {
            $("#bloqueComFam").removeClass("d-none");
            $("#comSi").prop("checked", true);
            $("#comFami").val("SI");
        }
        else {
            $("#bloqueComFam").addClass("d-none");
            $("#comNo").prop("checked", true);
            $("#comFami").val("NO");
        }
    }
    else {
        $("#comNo").prop("checked", true);
        $("#comFami").val("NO");
        $("#bloqueComFam").addClass("d-none");
    }
});
$("#edtSegTip").on("change", function () {
    // $("#tipSeg").prop("disabled", true);
    let comboTipSeg = $(this).val();
    if (comboTipSeg > 0) {
        if (comboTipSeg == 1 || comboTipSeg == 2) {
            $("#bloqueComFam1").removeClass("d-none");
            $("#comSi1").prop("checked", true);
            $("#comFami1").val("SI");
        }
        else {
            $("#bloqueComFam1").addClass("d-none");
            $("#comNo1").prop("checked", true);
            $("#comFami1").val("NO");
        }
    }
    else {
        $("#comNo1").prop("checked", true);
        $("#comFami1").val("NO");
        $("#bloqueComFam1").addClass("d-none");
    }
});
// Condicionales para mostrar bloques
// COMUNICA FAMILIAR
$("#comSi").click(function () {
    if ($("#comSi").is(":checked")) {
        $("#comFami").val("SI");
        $("#block1").removeClass("d-none");
        $("#rgSegFam")[0].selectedIndex = 0;
        $("#rgSegDf1")[0].selectedIndex = 0;
        $("#rgSegDf2")[0].selectedIndex = 0;
    } else {
        $("#comFami").val("NO");
    }
});
$("#comNo").click(function () {
    if ($("#comNo").is(":checked")) {
        $("#comFami").val("NO");
        $("#block1").addClass("d-none");
        $("#rgSegFam")[0].selectedIndex = 0;
        $("#rgSegDf1")[0].selectedIndex = 0;
        $("#rgSegDf2")[0].selectedIndex = 0;
    } else {
        $("#comFami").val("SI");
    }
});
// COMUNICA FAMILIAR
$("#comSi1").click(function () {
    if ($("#comSi1").is(":checked")) {
        $("#comFami1").val("SI");
        $("#block11").removeClass("d-none");
        $("#edtSegFam")[0].selectedIndex = 0;
        $("#edtSegDf1")[0].selectedIndex = 0;
        $("#edtSegDf2")[0].selectedIndex = 0;
    } else {
        $("#comFami1").val("NO");
    }
});
$("#comNo1").click(function () {
    if ($("#comNo1").is(":checked")) {
        $("#comFami1").val("NO");
        $("#block11").addClass("d-none");
        $("#edtSegFam")[0].selectedIndex = 0;
        $("#edtSegDf1")[0].selectedIndex = 0;
        $("#edtSegDf2")[0].selectedIndex = 0;
    } else {
        $("#comFami").val("SI");
    }
});
// COMUNICA FAMILIAR
// DIAGNOSTICOS Y ACTIVIDADES
$("#rgSegDp1").on("change", function () {
    var existe = $(this).val();
    $("#rgSegDp2")[0].selectedIndex = 0;
    if (existe > 0) {
        $.ajax({
            url: "public/views/src/ajaxDiagnosticos.php",
            method: "POST",
            dataType: "html",
            data: { existe: existe }
        }).done(function (respuesta) {
            $("#rgSegDp2").html(respuesta);
        }).fail(function () {
            console.log("error");
        });
    }
    else {
        var errorhtml = "<option value='0'>No hay actividades existentes</option>";
        $("#rgSegDp2").html(errorhtml);
    }
});

$("#rgSegDf1").on("change", function () {
    var existe2 = $(this).val();
    $("#rgSegDf2")[0].selectedIndex = 0;
    if (existe2 > 0) {
        $.ajax({
            url: "public/views/src/ajaxDiagnosticos.php",
            method: "POST",
            dataType: "html",
            data: { existe: existe2 }
        }).done(function (respuesta) {
            $("#rgSegDf2").html(respuesta);
        }).fail(function () {
            console.log("error");
        });
    }
    else {
        var errorhtml = "<option value='0'>No hay actividades existentes</option>";
        $("#rgSegDf2").html(errorhtml);
    }
});
// DIAGNOSTICOS Y ACTIVIDADES
// Listar Familiares
$("#rgSegPac").on("change", function () {
    var atencion = $(this).val();
    $("#rgSegFam")[0].selectedIndex = 0;
    if (atencion > 0) {
        $.ajax({
            url: "public/views/src/ajaxFamiliares.php",
            method: "POST",
            dataType: "html",
            data: { atencion: atencion }
        }).done(function (respuesta) {
            $("#rgSegFam").html(respuesta);
        }).fail(function () {
            console.log("error");
        });
    }
});
// Listar Familiares
// Validación de campos
$("#btnRegSeg").on("click", function () {
    var tipoS = $("#rgSegTip").val();

    if (tipoS == 1) {
        $("#formRegSeg").validate({
            rules: {
                rgSegFec: {
                    required: true,
                },
                rgSegTip: {
                    valueNotEquals: "0",
                },
                rgSegProf: {
                    valueNotEquals: "0",
                },
                rgSegMot: {
                    valueNotEquals: "0",
                },
                rgSegPac: {
                    valueNotEquals: "0",
                    required: true,
                },
                rgSegDp1: {
                    valueNotEquals: "0",
                },
                rgSegFam: {
                    valueNotEquals: "0",
                },
                rgSegDf1: {
                    valueNotEquals: "0",
                },
            },
            messages: {

                rgSegFec: {
                    required: "Ingrese Fecha de Seguimiento",
                },
                rgSegTip: {
                    valueNotEquals: "Seleccione Tipo de Seguimiento",
                },
                rgSegProf: {
                    valueNotEquals: "Seleccione Profesional",
                },
                rgSegMot: {
                    valueNotEquals: "Seleccione Motivo",
                },
                rgSegPac: {
                    valueNotEquals: "Seleccione Paciente",
                    required: "Seleccione Paciente atendido",
                },
                rgSegDp1: {
                    valueNotEquals: "Seleccione al menos un diagnóstico",
                },
                rgSegFam: {
                    valueNotEquals: "Seleccione Familiar",
                },
                rgSegDf1: {
                    valueNotEquals: "Seleccione al menos un diagnóstico",
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
    }
    if ($("#comSi").is(":checked")) {
        $("#formRegSeg").validate({
            rules: {
                rgSegFec: {
                    required: true,
                },
                rgSegTip: {
                    valueNotEquals: "0",
                },
                rgSegProf: {
                    valueNotEquals: "0",
                },
                rgSegMot: {
                    valueNotEquals: "0",
                },
                rgSegPac: {
                    valueNotEquals: "0",
                    required: true,
                },
                rgSegDp1: {
                    valueNotEquals: "0",
                },
            },
            messages: {
                rgSegFec: {
                    required: "Ingrese Fecha de Seguimiento",
                },
                rgSegTip: {
                    valueNotEquals: "Seleccione Tipo de Seguimiento",
                },
                rgSegProf: {
                    valueNotEquals: "Seleccione Profesional",
                },
                rgSegMot: {
                    valueNotEquals: "Seleccione Motivo",
                },
                rgSegPac: {
                    valueNotEquals: "Seleccione Paciente",
                    required: "Seleccione Paciente atendido",
                },
                rgSegDp1: {
                    valueNotEquals: "Seleccione al menos un diagnóstico",
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
    }
    else if (tipoS == 2) {
        $("#formRegSeg").validate({
            rules: {
                rgSegFec: {
                    required: true,
                },
                rgSegTip: {
                    valueNotEquals: "0",
                    required: true,
                },
                rgSegProf: {
                    valueNotEquals: "0",
                    required: true,
                },
                rgSegMot: {
                    valueNotEquals: "0",
                    required: true,
                },
                rgSegPac: {
                    valueNotEquals: "0",
                    required: true,
                },
                rgSegDp1: {
                    valueNotEquals: "0",
                    required: true,
                },
                rgSegFam: {
                    valueNotEquals: "0",
                    required: true,
                },
                rgSegDf1: {
                    valueNotEquals: "0",
                    required: true,
                },
            },
            messages: {
                rgSegFec: {
                    required: "Ingrese Fecha de Seguimiento",
                },
                rgSegTip: {
                    valueNotEquals: "Seleccione Tipo de Seguimiento",
                    required: "Seleccione una opción",
                },
                rgSegProf: {
                    valueNotEquals: "Seleccione Profesional",
                },
                rgSegMot: {
                    valueNotEquals: "Seleccione Motivo",
                    required: "Seleccione una opción",
                },
                rgSegPac: {
                    valueNotEquals: "Seleccione Paciente",
                    required: "Seleccione Paciente atendido",
                },
                rgSegDp1: {
                    valueNotEquals: "Seleccione al menos un diagnóstico",
                    required: "Seleccione una opción",
                },
                rgSegFam: {
                    valueNotEquals: "Seleccione Familiar",
                    required: "Seleccione una opción",
                },
                rgSegDf1: {
                    valueNotEquals: "Seleccione al menos un diagnóstico",
                    required: "Seleccione una opción",
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
    }
    else {
        $("#formRegSeg").validate({
            rules: {
                rgSegFec: {
                    required: true,
                },
                rgSegTip: {
                    valueNotEquals: "0",
                },
                rgSegProf: {
                    valueNotEquals: "0",
                },
                rgSegMot: {
                    valueNotEquals: "0",
                },
                rgSegPac: {
                    valueNotEquals: "0",
                    required: true,
                },
                rgSegDp1: {
                    valueNotEquals: "0",
                },
            },
            messages: {
                rgSegFec: {
                    required: "Ingrese Fecha de Seguimiento",
                },
                rgSegTip: {
                    valueNotEquals: "Seleccione Tipo de Seguimiento",
                },
                rgSegProf: {
                    valueNotEquals: "Seleccione Profesional",
                },
                rgSegMot: {
                    valueNotEquals: "Seleccione Motivo",
                },
                rgSegPac: {
                    valueNotEquals: "Seleccione Paciente",
                    required: "Seleccione Paciente atendido",
                },
                rgSegDp1: {
                    valueNotEquals: "Seleccione al menos un diagnóstico",
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
    }
});
// Validación de campos
// Editar Seguimiento
$(".datatableSeguimiento tbody").on("click", ".btnEditarSeguimiento", function () {
    var idSeguimiento = $(this).attr("idSeguimiento");
    var datos = new FormData();
    datos.append("idSeguimiento", idSeguimiento);
    $.ajax({
        url: "public/views/src/ajaxSeguimientos.php",
        method: "POST",
        data: datos,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function (respuesta) {
            $("#idSeguimiento").val(respuesta["idSeguimiento"]);
            $("#edtSegObs").val(respuesta["obsSeg"]);
            $("#edtSegFec").val(respuesta["fRegistrSeg"]);
            $("#edtSegProf").val(respuesta["idProfesional"]);
            $("#s2").val(respuesta["nombresProfesional"] + " " + respuesta["apellidosProfesional"]);
            $("#edtSegTip1").val(respuesta["idTipoSeguimiento"]);
            $("#edtSegTip1").html(respuesta["detaTipSeguimiento"]);
            $("#edtSegMot1").val(respuesta["idMotSeguimiento"]);
            $("#edtSegMot1").html(respuesta["detaMotivoSef"]);
            $("#seleccionActual21").html(respuesta["cuentaAtencion"] + " || " + respuesta["tipdocAtencion"] + "-" + respuesta["nrodocAtencion"] + " - " + respuesta["nombAtencion"] + " " + respuesta["apPaternoAtencion"] + " " + respuesta["apMaternoAtencion"]);
            $("#edtSegPac1").val(respuesta["idAtencionPac"]);
            $("#edtSegPac1").html(respuesta["cuentaAtencion"] + " || " + respuesta["tipdocAtencion"] + "-" + respuesta["nrodocAtencion"] + " - " + respuesta["nombAtencion"] + " " + respuesta["apPaternoAtencion"] + " " + respuesta["apMaternoAtencion"]);
            // Condicionales en caso del tipo de tipSeguimiento
            var tipSeguimiento = respuesta["idTipoSeguimiento"];
            if (tipSeguimiento == 1 || tipSeguimiento == 2) {
                $("#bloqueComFam1").removeClass("d-none");
            }
            else {
                $("#bloqueComFam1").addClass("d-none");
            }
            if (respuesta["comunFamSeg"] == "SI") {
                $("#block11").removeClass("d-none");
                $("#comSi1").prop("checked", true);
                $("#comFami1").val("SI");
            }
            else {
                $("#block11").addClass("d-none");
                $("#comNo1").prop("checked", true);
                $("#comFami1").val("NO");
            }
            // Condicionales en caso del tipo de tipSeguimiento
            // Condiciones para diagnosticos
            if (respuesta["idDiag1Seg"] != 0) {
                $("#edtSegDp11").val(respuesta["idDiag1Seg"]);
                $("#edtSegDp11").html(respuesta["cieP1"] + " - " + respuesta["detaD1"]);
            }
            if (respuesta["idDiag2Seg"] != 0) {
                $("#edtSegDp21").val(respuesta["idDiag2Seg"]);
                $("#edtSegDp21").html(respuesta["cieP2"] + " - " + respuesta["detD2"]);
            }
            else {
                if (respuesta["idDiag1Seg"] != 0) {
                    var existe = respuesta["idDiag1Seg"];
                    $("#edtSegDp2")[0].selectedIndex = 0;
                    if (existe > 0) {
                        $.ajax({
                            url: "public/views/src/ajaxDiagnosticos.php",
                            method: "POST",
                            dataType: "html",
                            data: { existe: existe }
                        }).done(function (respuesta) {
                            $("#edtSegDp2").html(respuesta);
                        }).fail(function () {
                            console.log("error");
                        });
                    }
                    else {
                        var errorhtml = "<option value='0'>No hay actividades existentes</option>";
                        $("#edtSegDp2").html(errorhtml);
                    }
                }
                else {
                    $("#edtSegDp21").val("0");
                    $("#edtSegDp21").html("Seleccione Actividad (Opcional)");
                }
            }

            if (respuesta["idDiag1SegFam"] != 0) {
                $("#edtSegDf11").val(respuesta["idDiag1SegFam"]);
                $("#edtSegDf11").html(respuesta["cieDF1"] + " - " + respuesta["detDF1"]);
            }
            else {
                $("#edtSegDf11").val("0");
                $("#edtSegDf11").html("Seleccione Diagnóstico");
            }
            if (respuesta["idDiag2SegFam"] != 0) {
                $("#edtSegDf21").val(respuesta["idDiag2SegFam"]);
                $("#edtSegDf21").html(respuesta["cieDF2"] + " - " + respuesta["detDF2"]);
            }
            else {
                if (respuesta["idDiag1SegFam"] != 0) {
                    var existe = respuesta["idDiag1SegFam"];
                    $("#edtSegDf2")[0].selectedIndex = 0;
                    if (existe > 0) {
                        $.ajax({
                            url: "public/views/src/ajaxDiagnosticos.php",
                            method: "POST",
                            dataType: "html",
                            data: { existe: existe }
                        }).done(function (respuesta) {
                            $("#edtSegDf2").html(respuesta);
                        }).fail(function () {
                            console.log("error");
                        });
                    }
                    else {
                        var errorhtml = "<option value='0'>No hay actividades existentes</option>";
                        $("#edtSegDf2").html(errorhtml);
                    }
                }
                else {
                    $("#edtSegDf21").val("0");
                    $("#edtSegDf21").html("Seleccione Actividad (Opcional)");
                }
            }
            // Condiciones para diagnosticos
            $("#idFamAnt").val(respuesta["idFamAtSeg"]);
            if (respuesta["idFamAtSeg"] != 0) {
                $("#seleccionActual31").html(respuesta["nombApFamiliar"] + " - " + respuesta["detaParentesco"] + "  " + respuesta["telcelFamiliar"]);
            }
            else {
                $("#seleccionActual31").html("");
            }
            var atencion = respuesta["idAtencionPac"];
            $("#edtSegFam")[0].selectedIndex = 0;
            $.ajax({
                url: "public/views/src/ajaxFamiliares.php",
                method: "POST",
                dataType: "html",
                data: { atencion: atencion }
            }).done(function (respuesta) {
                $("#edtSegFam").html(respuesta);
            }).fail(function () {
                console.log("error");
            });
        },
    });
});
$("#edtSegPac").on("change", function () {
    var atencion = $(this).val();
    $("#edtSegFam")[0].selectedIndex = 0;
    if (atencion > 0) {
        $.ajax({
            url: "public/views/src/ajaxFamiliares.php",
            method: "POST",
            dataType: "html",
            data: { atencion: atencion }
        }).done(function (respuesta) {
            $("#edtSegFam").html(respuesta);
        }).fail(function () {
            console.log("error");
        });
    }
});
$("#edtSegDp1").on("change", function () {
    var existe = $(this).val();
    $("#edtSegDp2")[0].selectedIndex = 0;
    if (existe > 0) {
        $.ajax({
            url: "public/views/src/ajaxDiagnosticos.php",
            method: "POST",
            dataType: "html",
            data: { existe: existe }
        }).done(function (respuesta) {
            $("#edtSegDp2").html(respuesta);
        }).fail(function () {
            console.log("error");
        });
    }
    else {
        var errorhtml = "<option value='0'>No hay actividades existentes</option>";
        $("#edtSegDp2").html(errorhtml);
    }
});

$("#edtSegDf1").on("change", function () {
    var existe2 = $(this).val();
    $("#edtSegDf2")[0].selectedIndex = 0;
    if (existe2 > 0) {
        $.ajax({
            url: "public/views/src/ajaxDiagnosticos.php",
            method: "POST",
            dataType: "html",
            data: { existe: existe2 }
        }).done(function (respuesta) {
            $("#edtSegDf2").html(respuesta);
        }).fail(function () {
            console.log("error");
        });
    }
    else {
        var errorhtml = "<option value='0'>No hay actividades existentes</option>";
        $("#edtSegDf2").html(errorhtml);
    }
});
$("#edtSegFam").on("change", function () {
    $("#seleccionActual3").remove();
    $("#seleccionActual31").remove();
});
// Editar Seguimiento
// Validación de campos
// $("#btnEdtSeg").on("click", function () {
//     var tipoS = $("#edtSegTip").val();

//     if (tipoS == 1) {
//         $("#formEdtSeg").validate({
//             rules: {
//                 edtSegFec: {
//                     required: true,
//                 },
//                 edtSegTip: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegProf: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegMot: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegPac: {
//                     valueNotEquals: "0",
//                     required: true,
//                 },
//                 edtSegDp1: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegFam: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegDf1: {
//                     valueNotEquals: "0",
//                 },
//             },
//             messages: {

//                 edtSegFec: {
//                     required: "Ingrese Fecha de Seguimiento",
//                 },
//                 edtSegTip: {
//                     valueNotEquals: "Seleccione Tipo de Seguimiento",
//                 },
//                 edtSegProf: {
//                     valueNotEquals: "Seleccione Profesional",
//                 },
//                 edtSegMot: {
//                     valueNotEquals: "Seleccione Motivo",
//                 },
//                 edtSegPac: {
//                     valueNotEquals: "Seleccione Paciente",
//                     required: "Seleccione Paciente atendido",
//                 },
//                 edtSegDp1: {
//                     valueNotEquals: "Seleccione al menos un diagnóstico",
//                 },
//                 edtSegFam: {
//                     valueNotEquals: "Seleccione Familiar",
//                 },
//                 edtSegDf1: {
//                     valueNotEquals: "Seleccione al menos un diagnóstico",
//                 },
//             },
//             errorElement: "span",
//             errorPlacement: function (error, element) {
//                 error.addClass("invalid-feedback");
//                 element.closest(".form-group").append(error);
//             },
//             highlight: function (element, errorClass, validClass) {
//                 $(element).addClass("is-invalid");
//             },
//             unhighlight: function (element, errorClass, validClass) {
//                 $(element).removeClass("is-invalid");
//             },
//         });
//     }
//     if ($("#comSi1").is(":checked")) {
//         $("#formEdtSeg").validate({
//             rules: {
//                 edtSegFec: {
//                     required: true,
//                 },
//                 edtSegTip: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegProf: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegMot: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegPac: {
//                     valueNotEquals: "0",
//                     required: true,
//                 },
//                 edtSegDp1: {
//                     valueNotEquals: "0",
//                 },
//             },
//             messages: {
//                 edtSegFec: {
//                     required: "Ingrese Fecha de Seguimiento",
//                 },
//                 edtSegTip: {
//                     valueNotEquals: "Seleccione Tipo de Seguimiento",
//                 },
//                 edtSegProf: {
//                     valueNotEquals: "Seleccione Profesional",
//                 },
//                 edtSegMot: {
//                     valueNotEquals: "Seleccione Motivo",
//                 },
//                 rgSegPac: {
//                     valueNotEquals: "Seleccione Paciente",
//                     required: "Seleccione Paciente atendido",
//                 },
//                 edtSegDp1: {
//                     valueNotEquals: "Seleccione al menos un diagnóstico",
//                 },
//             },
//             errorElement: "span",
//             errorPlacement: function (error, element) {
//                 error.addClass("invalid-feedback");
//                 element.closest(".form-group").append(error);
//             },
//             highlight: function (element, errorClass, validClass) {
//                 $(element).addClass("is-invalid");
//             },
//             unhighlight: function (element, errorClass, validClass) {
//                 $(element).removeClass("is-invalid");
//             },
//         });
//     }
//     else if (tipoS == 2) {
//         $("#formEdtSeg").validate({
//             rules: {
//                 edtSegFec: {
//                     required: true,
//                 },
//                 edtSegTip: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegProf: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegMot: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegPac: {
//                     valueNotEquals: "0",
//                     required: true,
//                 },
//                 edtSegDp1: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegFam: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegDf1: {
//                     valueNotEquals: "0",
//                 },
//             },
//             messages: {
//                 edtSegFec: {
//                     required: "Ingrese Fecha de Seguimiento",
//                 },
//                 edtSegTip: {
//                     valueNotEquals: "Seleccione Tipo de Seguimiento",
//                 },
//                 edtSegProf: {
//                     valueNotEquals: "Seleccione Profesional",
//                 },
//                 edtSegMot: {
//                     valueNotEquals: "Seleccione Motivo",
//                 },
//                 edtSegPac: {
//                     valueNotEquals: "Seleccione Paciente",
//                     required: "Seleccione Paciente atendido",
//                 },
//                 edtSegDp1: {
//                     valueNotEquals: "Seleccione al menos un diagnóstico",
//                 },
//                 edtSegFam: {
//                     valueNotEquals: "Seleccione Familiar",
//                 },
//                 edtSegDf1: {
//                     valueNotEquals: "Seleccione al menos un diagnóstico",
//                 },
//             },
//             errorElement: "span",
//             errorPlacement: function (error, element) {
//                 error.addClass("invalid-feedback");
//                 element.closest(".form-group").append(error);
//             },
//             highlight: function (element, errorClass, validClass) {
//                 $(element).addClass("is-invalid");
//             },
//             unhighlight: function (element, errorClass, validClass) {
//                 $(element).removeClass("is-invalid");
//             },
//         });
//     }
//     else {
//         $("#formEdtSeg").validate({
//             rules: {
//                 edtSegFec: {
//                     required: true,
//                 },
//                 edtSegTip: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegProf: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegMot: {
//                     valueNotEquals: "0",
//                 },
//                 edtSegPac: {
//                     valueNotEquals: "0",
//                     required: true,
//                 },
//                 edtSegDp1: {
//                     valueNotEquals: "0",
//                 },
//             },
//             messages: {
//                 edtSegFec: {
//                     required: "Ingrese Fecha de Seguimiento",
//                 },
//                 edtSegTip: {
//                     valueNotEquals: "Seleccione Tipo de Seguimiento",
//                 },
//                 edtSegProf: {
//                     valueNotEquals: "Seleccione Profesional",
//                 },
//                 edtSegMot: {
//                     valueNotEquals: "Seleccione Motivo",
//                 },
//                 edtSegPac: {
//                     valueNotEquals: "Seleccione Paciente",
//                     required: "Seleccione Paciente atendido",
//                 },
//                 edtSegDp1: {
//                     valueNotEquals: "Seleccione al menos un diagnóstico",
//                 },
//             },
//             errorElement: "span",
//             errorPlacement: function (error, element) {
//                 error.addClass("invalid-feedback");
//                 element.closest(".form-group").append(error);
//             },
//             highlight: function (element, errorClass, validClass) {
//                 $(element).addClass("is-invalid");
//             },
//             unhighlight: function (element, errorClass, validClass) {
//                 $(element).removeClass("is-invalid");
//             },
//         });
//     }
// });