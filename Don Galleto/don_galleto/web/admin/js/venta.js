var datosDeGalletas;
var totalPrecio = 0;
let totalGalleta;
var i=0;
let val1;
let val2;

var selectedImages = {
    'panel1': null,
    'panel2': null
};

let galleta;
let ventaGalleta = [];
//CODIGO VENTANA MODAL
const modal = document.querySelector('.modal');
const closeModal = document.querySelector('.modal-close');
const acceptModal = document.querySelector('.modal-accept');

export function inicializarVenta() {
    i=0;
    ventaGalleta = [];
    fetch("../don_galleto/admin/json/galletas.json")
            .then(response => response.json())
            .then(data => datosDeGalletas = data);
}

export function selectImage(imageElement, panelId) {
    if (selectedImages[panelId]) {
        selectedImages[panelId].classList.remove('selected');
    }
    imageElement.classList.add('selected');
    selectedImages[panelId] = imageElement;

    if (selectedImages['panel1'] && selectedImages['panel2']) {
        val1 = selectedImages['panel1'].dataset.name;
        val2 = selectedImages['panel2'].dataset.name;
        galleta = datosDeGalletas.galletas.find(galleta => galleta.id === val1);
        let et = document.getElementById("txtmet");

        switch (val2) {
            case "A":
                et.textContent = "Pesos: ";

                break;
            case "B":
                et.textContent = "Gr: ";
                break;
            case "C":
                et.textContent = "Caja: ";
                break;
            case "D":
                et.textContent = "Pieza: ";
                break;
                // puedes agregar más casos aquí...
            default:
                break;
        }
        document.getElementById("modalText").innerHTML = galleta.nombre;
        document.getElementById("modalText2").innerHTML = "Precio: " + galleta.precio + " pesos / Peso: " + galleta.peso + " gramos";
        modal.classList.add('modal--show');

    }
}

export function cantidadGalleta() {
    let cant = document.getElementById("inpcant").value;
    let totgat = document.getElementById("inptotgal");
    switch (val2) {
        case "A":
            totalGalleta = Math.floor(cant / galleta.precio);
            break;
        case "B":
            totalGalleta = Math.floor(cant / galleta.peso);
            break;
        case "C":
            totalGalleta = cant * 12;
            break;
        case "D":
            totalGalleta = cant;

            break;
            // puedes agregar más casos aquí...
        default:
            break;
    }
    totgat.value = totalGalleta;
    totalPrecio = totalPrecio + totalGalleta * galleta.precio;
}

export function addToTable() {
    var table = document.getElementById('imageTable');
    var row = table.insertRow();
    var cell1 = row.insertCell();
    var cell2 = row.insertCell();
    var cell3 = row.insertCell();
    cell1.textContent = galleta.nombre;
    cell2.textContent = totalGalleta;
    cell3.textContent = totalGalleta * galleta.precio;

}


acceptModal.addEventListener('click', (e) => {
    
    e.preventDefault();
    modal.classList.remove('modal--show');
    addToTable();
    selectedImages['panel1'].classList.remove('selected');
    selectedImages['panel2'].classList.remove('selected');
    selectedImages['panel1'] = null;
    selectedImages['panel2'] = null;
    document.getElementById("inpcant").value = "";
    document.getElementById("inptotgal").value = "";
    document.getElementById("inptotalprecio").value = totalPrecio;
    let inventario = {idInventario: galleta.id, existencia: 0};
    let galletaData = {idGalleta: galleta.id, inventario: inventario, nombre: galleta.nombre, precio: galleta.precio};
    let ventaG = {cantidad: totalGalleta, tipo_venta: 0, galletas: galletaData};
    ventaGalleta[i] = ventaG;
    i++;
});

closeModal.addEventListener('click', (e) => {
    e.preventDefault();
    modal.classList.remove('modal--show');
    selectedImages['panel1'].classList.remove('selected');
    selectedImages['panel2'].classList.remove('selected');
    selectedImages['panel1'] = null;
    selectedImages['panel2'] = null;
    document.getElementById("inpcant").value = "";
    document.getElementById("inptotgal").value = "";
});

export function realizarVenta() {
    var fecha = new Date();
    var fechaFormateada = fecha.getFullYear() + '-' +
            ('0' + (fecha.getMonth() + 1)).slice(-2) + '-' +
            ('0' + fecha.getDate()).slice(-2);
    
    let venta = {
        fecha_venta: fechaFormateada,
        total_venta: totalPrecio
    };

    let dv = {
        venta: venta,
        vg: ventaGalleta
    };

    let datos = {
        datosVenta: JSON.stringify(dv)
    };
    
    
    let params = new URLSearchParams(datos);
    
    fetch("../don_galleto/api/venta/save",
            {
                method: "POST",
                headers: {'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'},
                body: params
            }).then(response => {
        return response.json();
    }).then(function (data) {

        if (data.exception != null) {
            Swal.fire('', 'Error interno del servidor', 'error');
            return;
        }

        if (data.error != null) {
            Swal.fire('', data.error, 'warning');
            return;
        }

        if (data.errorperm != null) {
            Swal.fire('', 'No tiene permiso para esta operación', 'warning');
            return;
        }

        Swal.fire('', 'Venta realizada exitosamente', 'success');
        
        limpiarPagina();
        
    });
}

function limpiarPagina(){
    limpiarTabla();
    i=0;
    ventaGalleta = [];
    document.getElementById("inptotalprecio").value = "";
    totalPrecio = 0;
}

export function limpiarTabla() {
    var table = document.getElementById('imageTable');
    while (table.rows.length > 1) {
        table.deleteRow(1);
    }
}
