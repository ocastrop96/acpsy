$(".datatableSeguimiento").DataTable({
    ajax: "public/views/util/datatable-Seguimientos.php",
    deferRender: true,
    retrieve: true,
    processing: true,
    paging: true,
    lengthChange: true,
    searching: true,
    ordering: true,
    info: true,
    autoWidth: false,
    language: {
        url: "public/views/resources/js/dataTables.spanish.lang",
    },
});
$.datepicker.regional['es'] = {
    closeText: 'Cerrar',
    prevText: '< Ant',
    nextText: 'Sig >',
    currentText: 'Hoy',
    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
    dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
    dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
    dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
    weekHeader: 'Sm',
    dateFormat: 'dd/mm/yy',
    firstDay: 1,
    isRTL: false,
    showMonthAfterYear: false,
    yearSuffix: ''
};
$.datepicker.setDefaults($.datepicker.regional['es']);
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
$("#rgSegFec").datepicker({
    dateFormat: 'dd/mm/yy',
    showOtherMonths: true,
    selectOtherMonths: false,
    yearRange: ("-0:+0")
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
                rgSegTip: {
                    valueNotEquals: "0",
                },
                rgSegProf: {
                    valueNotEquals: "0",
                },
                rgSegEta: {
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
                rgSegTip: {
                    valueNotEquals: "Seleccione Tipo de Seguimiento",
                },
                rgSegProf: {
                    valueNotEquals: "Seleccione Profesional",
                },
                rgSegEta: {
                    valueNotEquals: "Seleccione Etapa",
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
                rgSegTip: {
                    valueNotEquals: "0",
                },
                rgSegProf: {
                    valueNotEquals: "0",
                },
                rgSegEta: {
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
                rgSegTip: {
                    valueNotEquals: "Seleccione Tipo de Seguimiento",
                },
                rgSegProf: {
                    valueNotEquals: "Seleccione Profesional",
                },
                rgSegEta: {
                    valueNotEquals: "Seleccione Etapa",
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
                rgSegTip: {
                    valueNotEquals: "0",
                },
                rgSegProf: {
                    valueNotEquals: "0",
                },
                rgSegEta: {
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
                rgSegTip: {
                    valueNotEquals: "Seleccione Tipo de Seguimiento",
                },
                rgSegProf: {
                    valueNotEquals: "Seleccione Profesional",
                },
                rgSegEta: {
                    valueNotEquals: "Seleccione Etapa",
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
    else {
        $("#formRegSeg").validate({
            rules: {
                rgSegTip: {
                    valueNotEquals: "0",
                },
                rgSegProf: {
                    valueNotEquals: "0",
                },
                rgSegEta: {
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
                rgSegTip: {
                    valueNotEquals: "Seleccione Tipo de Seguimiento",
                },
                rgSegProf: {
                    valueNotEquals: "Seleccione Profesional",
                },
                rgSegEta: {
                    valueNotEquals: "Seleccione Etapa",
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