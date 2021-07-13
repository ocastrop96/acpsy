cargarAteRegAnu("", "");
cargarSexoAte("", "");
cargarTipParen("", "");
cargarSegRegs("", "");
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

    cargarAteRegAnu(inicio, fin);
    cargarTipParen(inicio, fin);
    cargarSexoAte(inicio, fin);


});


function cargarAteRegAnu(inicior, finr) {
    var param4 = 4;
    var inicio = inicior;
    var fin = finr;

    var datos = new FormData();
    datos.append("param4", param4);
    datos.append("inicio", inicio);
    datos.append("fin", fin);
    $.ajax({
        url: "public/views/src/ajaxGraficos.php",
        method: "POST",
        cache: false,
        data: datos,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function (respuesta) {
            var mes = [];
            var conteo = [];
            var conteo2 = [];
            for (var i = 0; i < respuesta.length; i++) {
                mes.push(respuesta[i][1]);
                conteo.push(respuesta[i][2]);
                conteo2.push(respuesta[i][3]);
            }
            var mode = 'index'
            var intersect = true

            var $salesChart = $('#sales-chart')
            // eslint-disable-next-line no-unused-vars
            var salesChart = new Chart($salesChart, {
                type: 'bar',
                data: {
                    labels: mes,
                    datasets: [
                        {
                            label: 'Registradas',
                            backgroundColor: '#007bff',
                            borderColor: '#007bff',
                            data: conteo
                        },
                        {
                            label: 'Anuladas',
                            backgroundColor: '#ced4da',
                            borderColor: '#ced4da',
                            data: conteo2
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
                        xAxes: [{
                            ticks: {
                                fontColor: '#3D3838'
                            },
                            gridLines: {
                                display: false,
                                color: '#F1740C',
                                drawBorder: false
                            }
                        }],
                        yAxes: [{
                            ticks: {
                                fontColor: '#3D3838'
                            },
                            gridLines: {
                                display: true,
                                color: '#3D3838',
                                drawBorder: false
                            }
                        }]
                    }
                }
            })
        },
    });
}

function cargarTipParen(inicior, finr) {
    var param5 = 5;
    var inicio = inicior;
    var fin = finr;

    var datos = new FormData();
    datos.append("param5", param5);
    datos.append("inicio", inicio);
    datos.append("fin", fin);
    $.ajax({
        url: "public/views/src/ajaxGraficos.php",
        method: "POST",
        cache: false,
        data: datos,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function (respuesta) {
            if (respuesta.length > 0) {
                var parentesco = [];
                var contador = [];
                var colores = [];
                for (var i = 0; i < respuesta.length; i++) {
                    parentesco.push(respuesta[i][1]);
                    contador.push(respuesta[i][0]);
                    colores.push(colorRGB());
                }
                var donutChartCanvas = $('#rggTParen').get(0).getContext('2d')
                var donutData = {
                    labels: parentesco,
                    datasets: [
                        {
                            label: '# de Frecuencia',
                            data: contador,
                            backgroundColor: colores,
                            borderColor: colores
                        }
                    ]
                }
                var donutOptions = {
                    maintainAspectRatio: false,
                    responsive: true,
                    legend: {
                        position: 'left',
                    }
                }
                new Chart(donutChartCanvas, {
                    type: 'doughnut',
                    data: donutData,
                    options: donutOptions
                })
            }
        },
    });
}

function cargarSexoAte(inicior, finr) {
    var param6 = 6;
    var inicio = inicior;
    var fin = finr;

    var datos = new FormData();
    datos.append("param6", param6);
    datos.append("inicio", inicio);
    datos.append("fin", fin);

    $.ajax({
        url: "public/views/src/ajaxGraficos.php",
        method: "POST",
        cache: false,
        data: datos,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function (respuesta) {
            if (respuesta.length > 0) {
                var sexo = [];
                var contador = [];
                var colores = [];
                for (var i = 0; i < respuesta.length; i++) {
                    sexo.push(respuesta[i][1]);
                    contador.push(respuesta[i][0]);
                    colores.push(colorRGB());
                }

                var pieChartCanvas = $('#rggTSexParen').get(0).getContext('2d');
                var donutData = {
                    labels: sexo,
                    datasets: [
                        {
                            label: '# de Seguimientos',
                            data: contador,
                            backgroundColor: colores,
                        }
                    ]
                }
                var pieData = donutData;
                var pieOptions = {
                    maintainAspectRatio: false,
                    responsive: true,
                }
                new Chart(pieChartCanvas, {
                    type: 'pie',
                    data: pieData,
                    options: pieOptions
                })
            }
        },
    });
}

function cargarSegRegs() {
    
}
// Evento captura rango
function generarNumero(numero) {
    return (Math.random() * numero).toFixed(0);
}

function colorRGB() {
    var coolor = "(" + generarNumero(255) + "," + generarNumero(255) + "," + generarNumero(255) + ")";
    return "rgb" + coolor;
}
