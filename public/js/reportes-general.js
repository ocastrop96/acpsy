// Fechero
$("#deshacer-filtro-RG").on("click", function () {
    window.location = "reporte-general";
});

$("input[name='rango-rg']").daterangepicker({
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
    let fin = end.format('YYYY-MM-DD')

    $(".rg1").attr("href", "public/views/docs/rp-audfamiliares.php?reporte=reporte&inicio=" + inicio + "&fin=" + fin);
    $(".rg2").attr("href", "public/views/docs/rp-audatenciones.php?reporte=reporte&inicio=" + inicio + "&fin=" + fin);
});


cargarAteRegAnu();

function cargarAteRegAnu() {
    var ticksStyle = {
        fontColor: '#495057',
        fontStyle: 'bold'
    }
    var mode = 'index'
    var intersect = true

    var $salesChart = $('#sales-chart')
    // eslint-disable-next-line no-unused-vars
    var salesChart = new Chart($salesChart, {
        type: 'bar',
        data: {
            labels: ['JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'],
            datasets: [
                {
                    backgroundColor: '#007bff',
                    borderColor: '#007bff',
                    data: [1000, 2000, 3000, 2500, 2700, 2500, 3000]
                },
                {
                    backgroundColor: '#ced4da',
                    borderColor: '#ced4da',
                    data: [700, 1700, 2700, 2000, 1800, 1500, 2000]
                }
            ]
        },
        options: {
            maintainAspectRatio: false,
            tooltips: {
                mode: mode,
                intersect: intersect
            },
            hover: {
                mode: mode,
                intersect: intersect
            },
            legend: {
                display: false
            },
            scales: {
                yAxes: [{
                    // display: false,
                    gridLines: {
                        display: true,
                        lineWidth: '4px',
                        color: 'rgba(0, 0, 0, .2)',
                        zeroLineColor: 'transparent'
                    },
                    ticks: $.extend({
                        beginAtZero: true,
                    }, ticksStyle)
                }],
                xAxes: [{
                    display: true,
                    gridLines: {
                        display: false
                    },
                    ticks: ticksStyle
                }]
            }
        }
    })

    var $visitorsChart = $('#visitors-chart')
    // eslint-disable-next-line no-unused-vars
    var visitorsChart = new Chart($visitorsChart, {
        data: {
            labels: ['18th', '20th', '22nd', '24th', '26th', '28th', '30th'],
            datasets: [{
                type: 'line',
                data: [100, 120, 170, 167, 180, 177, 160],
                backgroundColor: 'transparent',
                borderColor: '#007bff',
                pointBorderColor: '#007bff',
                pointBackgroundColor: '#007bff',
                fill: false,
                pointHoverBackgroundColor: '#007bff',
                pointHoverBorderColor: '#007bff'
            },
            {
                type: 'line',
                data: [60, 80, 70, 67, 80, 77, 100],
                backgroundColor: 'tansparent',
                borderColor: '#ced4da',
                pointBorderColor: '#ced4da',
                pointBackgroundColor: '#ced4da',
                fill: false,
                pointHoverBackgroundColor: '#ced4da',
                pointHoverBorderColor: '#ced4da'
            }]
        },
        options: {
            maintainAspectRatio: false,
            tooltips: {
                mode: mode,
                intersect: intersect
            },
            hover: {
                mode: mode,
                intersect: intersect
            },
            legend: {
                display: false
            },
            scales: {
                yAxes: [{
                    // display: false,
                    gridLines: {
                        display: true,
                        lineWidth: '4px',
                        color: 'rgba(0, 0, 0, .2)',
                        zeroLineColor: 'transparent'
                    },
                    ticks: $.extend({
                        beginAtZero: true,
                        suggestedMax: 200
                    }, ticksStyle)
                }],
                xAxes: [{
                    display: true,
                    gridLines: {
                        display: false
                    },
                    ticks: ticksStyle
                }]
            }
        }
    })
}
// Evento captura rango
// Evento captura rango
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