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
        buscarPaciente(cuenta)
    }
    else {
        alert("Ingrese número de cuenta a buscar")
    }
});

function buscarPaciente(cuenta) {
    $.ajax({
        url: "public/views/src/ajaxCuentas.php",
        type: "POST",
        dataType: "html",
        data: { cuenta: cuenta }
    }).done(function (respuesta) {
        console.log(respuesta);
        $("#dataCuenta").html(respuesta);
    }).fail(function () {
        console.log("error");
    })
}
