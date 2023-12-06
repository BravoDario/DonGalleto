let reporte = [];
let myChart;

export function inicializarReporte() {
    inicializarGrafica();
}

function inicializarGrafica() {
    const ctx = document.getElementById('myChart');

    const data = {
        labels: [
            'Gastos',
            'Ganancias'
        ],
        datasets: [{
                label: 'My First Dataset',
                data: [300, 50],
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)'
                ],
                hoverOffset: 4
            }]
    };

    myChart = new Chart(ctx, {
        type: 'pie',
        data: data
    });
}

export function refreshTable(fecha1,fecha2, numero) {
    let url = "../don_galleto/api/reporte/getAll?fecha1="+fecha1+"&fecha2="+fecha2+"&numero="+numero+"";
    fetch(url)
            .then(response => {
                return response.json();
            })
            .then(function (data)

            {
                if (data.exception != null) {
                    Swal.fire('', 'Error interno del servidor, Intente de nuevo más tarde.', 'error');
                    return;
                }

                if (data.error != null) {
                    Swal.fire('', data.error, 'warning');
                }

                if (data.errorsec != null) {
                    Swal.fire('', data.errorsec, 'error');
                    window.location.replace('../index.html');
                    return;
                }

                fillTable(data);
            });
}
export function refreshGrafica(fecha1,fecha2, numero) {
    let url = "../don_galleto/api/reporte/getGrafica?fecha1="+fecha1+"&fecha2="+fecha2+"&numero="+numero+"";
    fetch(url)
            .then(response => {
                return response.json();
            })
            .then(function (data)

            {
                if (data.exception != null) {
                    Swal.fire('', 'Error interno del servidor, Intente de nuevo más tarde.', 'error');
                    return;
                }

                if (data.error != null) {
                    Swal.fire('', data.error, 'warning');
                }

                if (data.errorsec != null) {
                    Swal.fire('', data.errorsec, 'error');
                    window.location.replace('../index.html');
                    return;
                }
                fillGrafica(data);
            });
}
export function buscar() {
    let fecha1 = document.getElementById("fecha").value;
    let fecha2 = document.getElementById("fecha2").value;
    let numero = document.getElementById("ordenar-por").value;
    refreshTable(fecha1, fecha2, numero);
    refreshGrafica(fecha1, fecha2, numero);
}

export function fillTable(data) {
    //Declaramos una variable donde se guardara el contenido de la tabla:
    let contenido = '';
    contenido = "<tr>"+
                        "<th>Cantidad</th>"+
                        "<th>Fecha</th>"+
                        "<th>Ingreso</th>"+
                        "<th>Gastos</th>"+
                        "<th>Ganancia</th>"
                        +
                    "</tr>";
    reporte = data;
    //Recorrer el Arreglo
    for (let i = 0; i < data.length; i++) {
        let sum1 = data[i].gastos;
        let sum2 = data[i].ingresos;
        let sum3 = sum2-sum1;
        console.log(sum3);
         contenido +=
                    '<tr>' +
                    '<td>' + data[i].cantidad + '</td>' +
                    '<td>' + data[i].fecha_venta + '</td>' +
                    '<td>' + data[i].ingresos + '</td>' +
                    '<td>' + parseFloat(data[i].gastos).toFixed(2) + '</td>' +
                    '<td>' + parseFloat(sum3).toFixed(2)  + '</td>'+
                    '</tr>';
    }
    document.getElementById('tbodytablaReporte').innerHTML = contenido;
}

function fillGrafica(datos) {
    const ctx = document.getElementById('myChart');
    const data = {
        labels: [
            'Gastos',
            'Ganancias'
        ],
        datasets: [{
                label: 'Pesos: ',
                data: [datos[0].costo, datos[0].precio_total - datos[0].costo],
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)'
                ],
                hoverOffset: 4
            }]
    };
    if (myChart) {
        myChart.destroy();
    }
    myChart = new Chart(ctx, {
        type: 'pie',
        data: data
    });
}
