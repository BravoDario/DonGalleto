const modal = document.querySelector('.modal');
const closeModal = document.querySelector('.modal-close');
const acceptModal = document.querySelector('.modal-accept');

var selectedImages = {
    'panel1': null,
    'panel2': null
};

let val1;
let val2;

closeModal.addEventListener('click', (e) => {
    e.preventDefault();

    modal.classList.remove('modal--show');
});

acceptModal.addEventListener('click', (e) => {
    e.preventDefault();

    let ingrediente = document.getElementById("txtMaterial").value;
    let cantidad = document.getElementById("txtCantidad").value;
    let detalle_cantidad = document.getElementById("slUnidad").value;
    let costo_material = document.getElementById("txtCosto").value;

    let ingredientes = JSON.parse(window.localStorage.getItem("inventarioMaterial"));

    let setIngrediente = {
        idMaterial: 0,
        ingrediente,
        cantidad,
        costo_material,
        detalle_cantidad,
        inventario: {
            idInventario: 0,
            existencia: cantidad
        }
    }
    ingredientes.push(setIngrediente)
    let i = ingredientes.length;
    console.log(ingredientes[i - 1])

    window.localStorage.removeItem("inventarioMaterial")
    window.localStorage.setItem("inventarioMaterial", JSON.stringify(ingredientes))

    getInventarioMaterial();

    document.getElementById("txtMaterial").value = "";
    document.getElementById("txtCantidad").value = "";
    document.getElementById("slUnidad").selected = true;
    document.getElementById("txtCosto").value = "";

    modal.classList.remove('modal--show');
});

export function inicializarInventario() {
    getInventarioMaterial();
    getInventarioGalleta();
    verMaterialInventarioBtn.classList.add('active-btn');
    enableButtonSave();
}

function enableButtonSave() {
    document.getElementById("txtMaterial").addEventListener("input", (event) => {

        let i = event.target.value;

        document.getElementById("slUnidad").disabled = false;
        document.getElementById("btnSave").disabled = false;
        document.querySelector("#btnSave").classList.remove("btn-disabled");

        if (i === "") {
            document.getElementById("slUnidad").disabled = true
            document.getElementById("btnSave").disabled = true
            document.querySelector("#btnSave").classList.toggle("btn-disabled");
        }
    })

    document.getElementById("txtNombre").addEventListener("input", (event) => {

        let i = event.target.value;

        document.getElementById("btnSaveG").disabled = false;
        document.querySelector("#btnSaveG").classList.remove("btn-disabled");

        if (i === "") {
            document.getElementById("btnSaveG").disabled = true
            document.querySelector("#btnSaveG").classList.toggle("btn-disabled");
        }
    })
}

function getInventarioMaterial() {
    let ingredientes = JSON.parse(window.localStorage.getItem("inventarioMaterial"));

    const reversed = ingredientes.reverse();
    let contentTable = "";

    reversed.map(cIngrediente => {
        let {ingrediente, detalle_cantidad, inventario} = cIngrediente;
        contentTable += `
                    <tr>
                        <td>${ingrediente}</td>
                        <td>${inventario.existencia} ${detalle_cantidad}</td>
                    </tr>`;
    })
    document.getElementById("tblbodymaterial").innerHTML = contentTable;
}

function getInventarioGalleta() {
    let galletas = JSON.parse(window.localStorage.getItem("inventarioGalletas"));
    let contentTable = "";

    galletas.map(galleta => {
        let {nombre, precio, inventario} = galleta;
        contentTable += `
                    <tr>
                        <td>${nombre}</td>
                        <td>${inventario.existencia}</td>
                        <td>$ ${precio}</td>
                    </tr>`;
    })
    document.getElementById("tblbodygalleta").innerHTML = contentTable;
}

var verMaterialInventarioBtn = document.querySelector("#verMaterialBtnI");
var verGalletaInventarioBtn = document.querySelector("#verGalletaBtn");

export function verGalletaInventario() {
    document.getElementById("table-inventario-galleta").style.display = "block";
    document.getElementById("table-inventario-material").style.display = "none";
    verGalletaBtn.classList.toggle('active-btn');
    verMaterialBtnI.classList.remove('active-btn');
}

export function verMaterialInventario() {
    document.getElementById("table-inventario-galleta").style.display = "none";
    document.getElementById("table-inventario-material").style.display = "block";
    verMaterialBtnI.classList.toggle('active-btn');
    verGalletaBtn.classList.remove('active-btn');
}

export function saveInventario() {
    let ingrediente = document.getElementById("txtMaterial").value;
    let cantidad = document.getElementById("txtCantidad").value;
    let detalle_cantidad = document.getElementById("slUnidad").value;

    let text = "¿Desea guardar " + cantidad + " " + detalle_cantidad + " de " + ingrediente + "?";
    document.getElementById("modalText").innerHTML = text;

    const thed = document.querySelector(".tblhead");
    thed.style = "z-index: 0;";

    modal.classList.add('modal--show');
}

export function saveGalleta() {
    let nombre = document.getElementById("txtNombre").value;
    let cantidad = document.getElementById("txtCantidad").value;
    let precio = document.getElementById("txtPrecio").value;

    let text = "¿Desea guardar " + cantidad + " galletas de " + nombre + " a $" + precio + "?";
    document.getElementById("modalText").innerHTML = text;

    const thed = document.querySelector(".tblhead");
    thed.style = "z-index: 0;";
    const thedG = document.querySelector(".tblheadG");
    thedG.style = "z-index: 0;";

    modal.classList.add('modal--show');
}