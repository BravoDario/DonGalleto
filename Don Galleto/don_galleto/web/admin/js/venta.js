export function inicializarVenta() {

}

var selectedImages = {
    'panel1': null,
    'panel2': null
};

export function selectImage(imageElement, panelId) {
    if (selectedImages[panelId]) {
        selectedImages[panelId].classList.remove('selected');
    }
    imageElement.classList.add('selected');
    selectedImages[panelId] = imageElement;

    if (selectedImages['panel1'] && selectedImages['panel2']) {
        showModal('Las imágenes seleccionadas son ' + selectedImages['panel1'].dataset.name + ' y ' + selectedImages['panel2'].dataset.name);
    }
}

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
    cell1.textContent = selectedImages['panel1'].dataset.name;
    cell2.textContent = selectedImages['panel2'].dataset.name;
    closeModal();

}