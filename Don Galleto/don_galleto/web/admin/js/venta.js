var datosDeGalletas;

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
        let val1 = selectedImages['panel1'].dataset.name;
        let val2 = selectedImages['panel2'].dataset.name;
        let galleta = datosDeGalletas.galletas.find(galleta => galleta.id === val1);
        console.log(galleta.precio);
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

/*showModal('Las imágenes seleccionadas son ' + selectedImages['panel1'].dataset.name + ' y ' + selectedImages['panel2'].dataset.name);*/

    }
}

        
/*
function showModal(text) {
    document.getElementById('modalText').textContent = text;
    document.getElementById('myModal').style.display = "block";
}

export function closeModal() {
    document.getElementById('myModal').style.display = "none";
    selectedImages['panel1'].classList.remove('selected');
    selectedImages['panel2'].classList.remove('selected');
    selectedImages['panel1'] = null;
    selectedImages['panel2'] = null;
}

export function addToTable() {
    var table = document.getElementById('imageTable');
    var row = table.insertRow();
    var cell1 = row.insertCell();
    var cell2 = row.insertCell();
    var cell3 = row.insertCell();
    cell1.textContent = selectedImages['panel1'].dataset.name;
    cell2.textContent = selectedImages['panel2'].dataset.name;
    closeModal();

}
*/


//CODIGO VENTANA MODAL
const openModal = document.querySelector('.guardar-button-venta');
const modal = document.querySelector('.modal');
const closeModal = document.querySelector('.modal-close');

openModal.addEventListener('click', (e)=>{
    e.preventDefault();
    modal.classList.add('modal--show');
});

closeModal.addEventListener('click', (e)=>{
    e.preventDefault();
    modal.classList.remove('modal--show');
});