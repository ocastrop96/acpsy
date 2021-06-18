$(".datatableFamiliares").DataTable({
    ajax: "public/views/util/datatable-Familiares.php",
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
$("#edtfAtencion1").select2(
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
                $("#seleccionActual1").remove();
                $("#seleccionActual").remove();
                return {
                    results: response,
                };
            },
            cache: true,
        },
    }
);
$("#edtfNdoc").attr("minlength", "8");
$("#edtfNdoc").attr("maxlength", "12");
$("#edtfTel").attr("minlength", "7");
$("#edtfTel").attr("maxlength", "9");
$("#edtfEdad").attr("minlength", "1");
$("#edtfEdad").attr("maxlength", "3");
$("#edtfNdoc").keyup(function () {
    this.value = (this.value + "").replace(/[^0-9]/g, "");
});
$("#edtfNomAp").keyup(function () {
    this.value = (this.value + "").replace(/[^a-zA-ZñÑáéíóúüÁÉÍÓÚÜ ]/g, "");
});
$("#edtfNomAp").keyup(function () {
    var u4 = $(this).val();
    var mu4 = u4.toUpperCase();
    $("#edtfNomAp").val(mu4);
});
$("#edtfEdad").keyup(function () {
    this.value = (this.value + "").replace(/[^0-9]/g, "");
});
$("#edtfTel").keyup(function () {
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
                required: false,
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
$(".datatableFamiliares tbody").on("click", ".btnEditarFamiliar", function () {
    var idFamiliar = $(this).attr("idFamiliar");
    var datos = new FormData();
    datos.append("idFamiliar", idFamiliar);
    $.ajax({
        url: "public/views/src/ajaxFamiliares.php",
        method: "POST",
        data: datos,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function (respuesta) {
            $("#idAteAct").val(respuesta["idAtencion"]);
            $("#idDniAct").val(respuesta["ndocFamiliar"]);
            $("#seleccionActual").html(respuesta["cuentaAtencion"] + " || " + respuesta["tipdocFamiliar"] + "-" + respuesta["ndocFamiliar"] + " - " + respuesta["nombAtencion"] + " " + respuesta["apPaternoAtencion"] + " " + respuesta["apMaternoAtencion"]);
            $("#edtfAtencion").val(respuesta["idAtencion"]);
            $("#edtfAtencion").html(respuesta["cuentaAtencion"] + " || " + respuesta["tipdocFamiliar"] + "-" + respuesta["ndocFamiliar"] + " - " + respuesta["nombAtencion"] + " " + respuesta["apPaternoAtencion"] + " " + respuesta["apMaternoAtencion"]);
            $("#idFamiliar").val(respuesta["idFamiliar"]);
            $("#edtfNdoc").val(respuesta["ndocFamiliar"]);
            $("#edtfTdoc").val(respuesta["tipdocFamiliar"]);
            $("#edtfTdoc").html(respuesta["tipdocFamiliar"]);
            $("#edtfSexo").val(respuesta["idTipSexo"]);
            $("#edtfSexo").html(respuesta["detaTipSexo"]);
            $("#edtfParent").val(respuesta["idParentesco"]);
            $("#edtfParent").html(respuesta["detaParentesco"]);
            $("#edtfEdad").val(respuesta["edadFamiliar"]);
            $("#edtfTel").val(respuesta["telcelFamiliar"]);
            $("#edtfNomAp").val(respuesta["nombApFamiliar"]);
        },
    });
});
$("#btnEdtDNIFam").on("click", function () {
    var tipDoc = $("#edtfTdoc1").val();
    var numDoc = $("#edtfNdoc").val();
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
                $("#edtfNomAp").val(data["nombres"] + " " + data["apellidoPaterno"] + " " + data["apellidoMaterno"]);
                $("#edtfSexo1").focus();
                $("#edtfNomAp").prop("readonly", true);
                // $("#rgApellidos").prop("readonly", true);
            },
            failure: function (data) {
                toastr.info("No se pudo conectar los datos", "DNI");
            },
            error: function (data) {
                $("#edtfNomAp").prop("readonly", false);
                $("#edtDni").focus();
            },
        });
    }

});
$("#btnEdtFam").on("click", function () {
    $("#formEdtFam").validate({
        rules: {
            edtfAtencion: {
                valueNotEquals: "0",
                required: true,
            },
            edtfTdoc: {
                valueNotEquals: "0",
                required: true,
            },
            edtfNdoc: {
                required: true,
                maxlength: 12,
                minlength: 8,
            },
            edtfNomAp: {
                required: true,
            },
            edtfSexo: {
                valueNotEquals: "0",
                required: true,
            },
            edtfParent: {
                valueNotEquals: "0",
                required: true,
            },
            edtfEdad: {
                required: true,
                maxlength: 3,
                minlength: 1,
            },
            edtfTel: {
                required: false,
                maxlength: 9,
                minlength: 7,
            },
        },
        messages: {
            edtfAtencion: {
                valueNotEquals: "Seleccione Paciente atendido",
                required: "Seleccione Paciente atendido",
            },
            edtfTdoc: {
                valueNotEquals: "Selecciona Tipo Doc",
                required: "Selecciona Tipo Doc",
            },
            edtfNdoc: {
                required: "Ingrese N° Doc",
                maxlength: "12 caracteres si es CE o PASS",
                minlength: "8 caracteres si es DNI",
            },
            edtfNomAp: {
                required: "Ingrese nombre de Familiar",
            },
            edtfSexo: {
                valueNotEquals: "Seleccione Sexo",
                required: "Seleccione Sexo",
            },
            rgfParent: {
                valueNotEquals: "Seleccione parentesco",
                required: "Seleccione parentesco",
            },
            edtfEdad: {
                required: "Ingrese edad de familiar",
                maxlength: "Máximo 3 dígitos",
                minlength: "Mínimo 1 dígito",
            },
            edtfTel: {
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
// Validar Familiar existente para Paciente
$("#rgfNdoc").on("change", function () {
    const Toast = Swal.mixin({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 1500,
    });
    var ndoc = $(this).val();
    var nate = $("#rgfAtencion").val();
    var datos = new FormData();
    if (ndoc.length >= 8 && nate > 0) {
        datos.append("Paciente", nate);
        datos.append("dniFamiliar", ndoc);
        $.ajax({
            url: "public/views/src/ajaxFamiliares.php",
            method: "POST",
            data: datos,
            cache: false,
            contentType: false,
            processData: false,
            dataType: "json",
            success: function (respuesta) {
                console.log(respuesta);
                if (respuesta) {
                    Toast.fire({
                        icon: "error",
                        title: "El familiar ingresado, ya existe para el paciente seleccionado",
                    });
                    $("#rgfNdoc").val("");
                    $("#rgfNdoc").focus();
                    $("#rgfNomAp").val("");
                }
                else {
                    $("#btnDNIFam").focus();
                }
            },
        });
    }
})
$("#edtfNdoc").on("change", function () {
    const Toast = Swal.mixin({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 1500,
    });
    var ndoc = $(this).val();
    var nate = $("#edtfAtencion1").val();

    var ateAct = $("#idAteAct").val();
    var dniAct = $("#idDniAct").val();
    var datos = new FormData();
    if (ndoc.length >= 8 && nate > 0) {
        if (nate == ateAct && ndoc != dniAct) {
            datos.append("Paciente", nate);
            datos.append("dniFamiliar", ndoc);
            $.ajax({
                url: "public/views/src/ajaxFamiliares.php",
                method: "POST",
                data: datos,
                cache: false,
                contentType: false,
                processData: false,
                dataType: "json",
                success: function (respuesta) {
                    console.log(respuesta);
                    if (respuesta) {
                        Toast.fire({
                            icon: "error",
                            title: "El familiar ingresado, ya existe para el paciente seleccionado",
                        });
                        $("#edtfNdoc").val("");
                        $("#edtfNdoc").focus();
                    }
                    else {
                        $("#btnEdtDNIFam").focus();
                    }
                },
            });
        }
        else if (nate != ateAct && ndoc != dniAct) {
            datos.append("Paciente", nate);
            datos.append("dniFamiliar", ndoc);
            $.ajax({
                url: "public/views/src/ajaxFamiliares.php",
                method: "POST",
                data: datos,
                cache: false,
                contentType: false,
                processData: false,
                dataType: "json",
                success: function (respuesta) {
                    console.log(respuesta);
                    if (respuesta) {
                        Toast.fire({
                            icon: "error",
                            title: "El familiar ingresado, ya existe para el paciente seleccionado",
                        });
                        $("#edtfNdoc").val("");
                        $("#edtfNdoc").focus();
                    }
                    else {
                        $("#btnEdtDNIFam").focus();
                    }
                },
            });
        }
    }
})
// Validar Familiar existente para Paciente
// Eliminar Paciente
$(".datatableFamiliares tbody").on("click", ".btnEliminarFamiliar", function () {
    var idFamiliar = $(this).attr("idFamiliar");
    var idAtencion = $(this).attr("idAtencion");
    var idUsuario = $("#idUsFamOcu").val();
    var idNDoc = $(this).attr("idNDoc");

    Swal.fire({
        title: '¿Está seguro de eliminar el familiar?',
        text: "¡Si no lo está, puede cancelar la acción!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#343a40',
        cancelButtonText: 'No, cancelar',
        cancelButtonColor: '#d33',
        confirmButtonText: '¡Sí, eliminar familiar!'
    }).then(function (result) {
        if (result.value) {
            window.location = "index.php?ruta=familiares&idFamiliar=" + idFamiliar + "&idAtencion=" + idAtencion + "&idNDoc=" + idNDoc + "&idUsuario=" + idUsuario;
        }
    })
});
// Eliminar Paciente