seguimientosXProfesional("", "", 0);
$("#deshacer-filtro-RJ").on("click", function () {
    window.location = "reporte-jefatura";
});
$("input[name='rango-rj']").daterangepicker({
    opens: 'left',
    maxSpan: {
        days: 30,
    },
    startDate: moment(),
    endDate: moment(),
    locale: {
        format: "DD/MM/YYYY",
        separator: " hasta ",
        applyLabel: "Aplicar",
        cancelLabel: "Cancelar",
        fromLabel: "Desde",
        toLabel: "Hasta",
        customRangeLabel: "Personalizar",
        weekLabel: "W",
        daysOfWeek: ["Do", "Lu", "Ma", "Mie", "Ju", "Vi", "Sa"],
        monthNames: [
            "Enero",
            "Febrero",
            "Marzo",
            "Abril",
            "Mayo",
            "Junio",
            "Julio",
            "Agosto",
            "Setiembre",
            "Octubre",
            "Noviembre",
            "Diciembre",
        ],
        firstDay: 1,
    },
}, function (start, end) {
    let inicio = start.format('YYYY-MM-DD');
    let fin = end.format('YYYY-MM-DD');
    let profesional = $("#rjProfesional").val();

    $('#rango-rj').attr('inicio', inicio);
    $('#rango-rj').attr('fin', fin);
    $(".rseg1").attr("href", "public/views/docs/rp-seguimientos-jefatura.php?reporte=reporte&inicio=" + inicio + "&fin=" + fin + "&profesional=" + profesional);
    seguimientosXProfesional(inicio, fin, profesional);
});

$("#rjProfesional").on("change", function () {
    let profesional = $(this).val();
    let inicio = $("#rango-rj").attr("inicio");
    let fin = $("#rango-rj").attr("fin");
    alert(profesional + " " + inicio + " " + fin);
});

function seguimientosXProfesional(inicior, finr, profesionalr) {
    alert("F.Inicio" + inicior + "F.Fin " + finr + "Profesional" + profesionalr)
}