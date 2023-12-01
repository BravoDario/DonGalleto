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
        alert('Ambas imágenes están seleccionadas');
        selectedImages['panel1'].classList.remove('selected');
        selectedImages['panel2'].classList.remove('selected');
        selectedImages['panel1'] = null;
        selectedImages['panel2'] = null;
    }
}