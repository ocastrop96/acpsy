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

// Validación de campos