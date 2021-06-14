$(".datatableFamiliares").DataTable({
    ajax: "public/views/util/datatable-Familiares.php",
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
$("#rgfAtencion").select2(
    {
        maximumInputLength: "10",
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
                return "Ingrese máximo 10 caracteres";
            }
        },
        scrollAfterSelect: true,
        placeholder: 'Ingrese N° de Cuenta o Nombres del Paciente',
        ajax: {
            url: "public/views/src/ajaxFamiliares.php",
            type: "post",
            dataType: "json",
            delay: 150,
            data: function (params) {
                return {
                    searchTerm: params.term,
                };
            },
            processResults: function (response) {
                console.log(response);
                $("#idAtencion").val(response[0]["id"]);
                return {
                    results: response,
                };
            },
            cache: true,
        },
    }
);
// Filtrado de campos
$("#rgfNdoc").attr("minlength", "8");
$("#rgfNdoc").attr("maxlength", "12");
$("#rgfTel").attr("minlength", "7");
$("#rgfTel").attr("maxlength", "9");
$("#rgfEdad").attr("minlength", "1");
$("#rgfEdad").attr("maxlength", "3");
$("#rgfNdoc").keyup(function () {
    this.value = (this.value + "").replace(/[^0-9]/g, "");
});
$("#rgfNomAp").keyup(function () {
    this.value = (this.value + "").replace(/[^a-zA-ZñÑáéíóúüÁÉÍÓÚÜ ]/g, "");
});
$("#rgfNomAp").keyup(function () {
    var u4 = $(this).val();
    var mu4 = u4.toUpperCase();
    $("#rgfNomAp").val(mu4);
});
$("#rgfEdad").keyup(function () {
    this.value = (this.value + "").replace(/[^0-9]/g, "");
});
$("#rgfTel").keyup(function () {
    this.value = (this.value + "").replace(/[^0-9]/g, "");
});
// Filtrado de campos
// Búsqueda de datos por DNI
$("#btnDNIFam").on("click", function () {
    var tipDoc = $("#rgfTdoc").val();
    var numDoc = $("#rgfNdoc").val();
    if (numDoc.length == 8 && tipDoc == "DNI") {
        $.ajax({
            type: "GET",
            url:
                "https://dniruc.apisperu.com/api/v1/dni/" +
                numDoc +
                "?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6Im9jYXN0cm9wLnRpQGdtYWlsLmNvbSJ9.XtrYx8wlARN2XZwOZo6FeLuYDFT6Ljovf7_X943QC_E",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                toastr.success("Datos cargados con éxito", "RENIEC");
                $("#rgfNomAp").val(data["nombres"] + " " + data["apellidoPaterno"] + " " + data["apellidoMaterno"]);
                $("#rgfSexo").focus();
                $("#rgfNomAp").prop("readonly", true);
                // $("#rgApellidos").prop("readonly", true);
            },
            failure: function (data) {
                toastr.info("No se pudo conectar los datos", "DNI");
            },
            error: function (data) {
                $("#rgfNomAp").prop("readonly", false);
                $("#rgDni").focus();
                $('#formRegFam').trigger("reset");
            },
        });
    }

});
$.validator.addMethod(
    "valueNotEquals",
    function (value, element, arg) {
        return arg !== value;
    },
    "Value must not equal arg."
);
$("#btnRegFam").on("click", function () {
    $("#formRegFam").validate({
        rules: {
            rgfAtencion: {
                valueNotEquals: "0",
                required: true,
            },
            rgfTdoc: {
                valueNotEquals: "0",
                required: true,
            },
            rgfNdoc: {
                required: true,
                maxlength: 12,
                minlength: 8,
            },
            rgfNomAp: {
                required: true,
            },
            rgfSexo: {
                valueNotEquals: "0",
                required: true,
            },
            rgfParent: {
                valueNotEquals: "0",
                required: true,
            },
            rgfEdad: {
                required: true,
                maxlength: 3,
                minlength: 1,
            },
            rgfTel: {
                required: true,
                maxlength: 9,
                minlength: 7,
            },
        },
        messages: {
            rgfAtencion: {
                valueNotEquals: "Seleccione Paciente atendido",
                required: "Seleccione Paciente atendido",
            },
            rgfTdoc: {
                valueNotEquals: "Selecciona Tipo Doc",
                required: "Selecciona Tipo Doc",
            },
            rgfNdoc: {
                required: "Ingrese N° Doc",
                maxlength: "12 caracteres si es CE o PASS",
                minlength: "8 caracteres si es DNI",
            },
            rgfNomAp: {
                required: "Ingrese nombre de Familiar",
            },
            rgfSexo: {
                valueNotEquals: "Seleccione Sexo",
                required: "Seleccione Sexo",
            },
            rgfParent: {
                valueNotEquals: "Seleccione parentesco",
                required: "Seleccione parentesco",
            },
            rgfEdad: {
                required: "Ingrese edad de familiar",
                maxlength: "Máximo 3 dígitos",
                minlength: "Mínimo 1 dígito",
            },
            rgfTel: {
                required: "Ingrese teléfono o celular",
                maxlength: "9 dígitos si es celular",
                minlength: "7 dígitos si es teléfono",
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