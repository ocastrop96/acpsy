$(".datatableSeguimiento").DataTable({
    // ajax: "public/views/util/datatable-Usuarios.php",
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
                return "Ingrese 2 o más caracteres sea N° de cuenta o Nombres del paciente";
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