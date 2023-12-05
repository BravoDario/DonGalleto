var datosDeGalletas;
var totalPrecio = 0;
let totalGalleta;

let val1;
let val2;

var selectedImages = {
    'panel1': null,
    'panel2': null
};

let galleta;
//CODIGO VENTANA MODAL
const openModal = document.querySelector('.guardar-button-venta');
const modal = document.querySelector('.modal');
const closeModal = document.querySelector('.modal-close');
const acceptModal = document.querySelector('.modal-accept');

export function inicializarVenta() {
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
                et.textContent = "pesos";

                break;
            case "B":
                et.textContent = "gr";
                break;
            case "C":
                et.textContent = "caja";
                break;
            case "D":
                et.textContent = "pieza";
                break;
                // puedes agregar más casos aquí...
            default:
                break;
        }
        document.getElementById("modalText").innerHTML = galleta.nombre;
        document.getElementById("modalText2").innerHTML = "Precio: "+galleta.precio+" pesos / Peso: "+galleta.peso+" gramos";
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
    totalPrecio = totalPrecio + totalGalleta*galleta.precio;
}

export function addToTable() {
    var table = document.getElementById('imageTable');
    var row = table.insertRow();
    var cell1 = row.insertCell();
    var cell2 = row.insertCell();
    var cell3 = row.insertCell();
    cell1.textContent = galleta.nombre;
    cell2.textContent = totalGalleta;
    cell3.textContent = totalGalleta*galleta.precio;

}

openModal.addEventListener('click', (e) => {
    e.preventDefault();
    modal.classList.add('modal--show');
});

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