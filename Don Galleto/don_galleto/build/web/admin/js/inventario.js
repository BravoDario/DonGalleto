export function inicializarInventario() {
    getInventarioMaterial();
    getInventarioGalleta();
}

function getInventarioMaterial() {
    let ingredientes = JSON.parse(window.localStorage.getItem("inventarioMaterial"));
    let contentTable = "";

    ingredientes.map(cIngrediente => {
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
}

export function verMaterialInventario() {
    document.getElementById("table-inventario-galleta").style.display = "none";
    document.getElementById("table-inventario-material").style.display = "block";
}