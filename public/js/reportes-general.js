// Fechero
$("#deshacer-filtro-RG").on("click", function () {
    window.location = "reporte-general";
});

$("#rango-rg").daterangepicker({
    opens: "left",
    maxSpan: {
        days: 30,
    },
    startDate: moment(),
    endDate: moment(),
    locale: {
        format: "DD-MM-YYYY",
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
}
);
// $("#rango-rg").daterangepicker({

//     ranges: {
//         Hoy: [moment(), moment()],
//         Ayer: [moment().subtract(1, "days"), moment().subtract(1, "days")],
//         "Últimos 7 días": [moment().subtract(6, "days"), moment()],
//         "Últimos 30 días": [moment().subtract(29, "days"), moment()],
//         "Este mes": [moment().startOf("month"), moment().endOf("month")],
//         "Último mes": [
//             moment().subtract(1, "month").startOf("month"),
//             moment().subtract(1, "month").endOf("month"),
//         ],
//     },
//     startDate: moment(),
//     endDate: moment(),
//     maxSpan: {
//         days: 30,
//     },
//     opens: "left",
//     locale: {
//         format: "DD/MM/YYYY",
//         separator: " - ",
//         applyLabel: "APLICAR",
//         cancelLabel: "CANCELAR",
//         fromLabel: "Desde",
//         toLabel: "Hasta",
//         customRangeLabel: "Personalizar",
//         weekLabel: "W",
//         daysOfWeek: ["Do", "Lu", "Ma", "Mie", "Ju", "Vi", "Sa"],
//         monthNames: [
//             "Enero",
//             "Febrero",
//             "Marzo",
//             "Abril",
//             "Mayo",
//             "Junio",
//             "Julio",
//             "Agosto",
//             "Setiembre",
//             "Octubre",
//             "Noviembre",
//             "Diciembre",
//         ],
//         firstDay: 1,
//     },
// },
//     function (start, end) {
//         $("#daterange-btn span").html(
//             start.format("MMMM D, YYYY") + "-" + end.format("MMMM D, YYYY")
//         );
//         // var fechaInicialAte = start.format("YYYY-MM-DD");
//         // var fechaFinalAte = end.format("YYYY-MM-DD");

//         // var capRangoAte = $("#daterange-btn span").html();
//         // localStorage.setItem("capRangoAte", capRangoAte);
//         // window.location =
//         //     "index.php?ruta=atenciones&fechaInicialAte=" +
//         //     fechaInicialAte +
//         //     "&fechaFinalAte=" +
//         //     fechaFinalAte;
//         // let timerInterval;
//         // Swal.fire({
//         //     title: "Se está cargando la información",
//         //     html: "Espere por favor...",
//         //     timer: 7000,
//         //     timerProgressBar: true,
//         //     onBeforeOpen: () => {
//         //         Swal.showLoading();
//         //         timerInterval = setInterval(() => {
//         //             const content = Swal.getContent();
//         //             if (content) {
//         //                 const b = content.querySelector("b");
//         //                 if (b) {
//         //                     b.textContent = Swal.getTimerLeft();
//         //                 }
//         //             }
//         //         }, 100);
//         //     },
//         //     onClose: () => {
//         //         clearInterval(timerInterval);
//         //     },
//         // }).then((result) => {
//         //     if (result.dismiss === Swal.DismissReason.timer) {
//         //     }
//         // });
//     }
// );
// Fechero