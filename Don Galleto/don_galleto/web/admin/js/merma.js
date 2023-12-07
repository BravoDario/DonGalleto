var verMermaBtn = document.querySelector("#verMermaBtn");
var verMaterialBtn = document.querySelector("#verMaterialBtn");

export function verMerma() {
    document.getElementById("table-merma").style.display = "block";
    document.getElementById("table-material").style.display = "none";
}

export function verMaterial() {
    document.getElementById("table-merma").style.display = "none";
    document.getElementById("table-material").style.display = "block";
}

export function inicializarMerma() {
    verMermaBtn.classList.add('active-btn');
    getMermaGalleta();
    getMermaMaterial();
    getGalletas();
    getIngredientes();
}

function getGalletas() {
    let galletas = JSON.parse(window.localStorage.getItem("inventarioGalletas"));

    let slContenido = document.getElementById("slMermaGalleta").innerHTML;
    galletas.map(galleta => {
        slContenido += `<option value="${galleta.idGalleta}">${galleta.nombre}</option>`
    })
    document.getElementById("slMermaGalleta").innerHTML = slContenido;
    
    document.getElementById("slMermaGalleta").addEventListener("change", (event) => {
        document.getElementById("lblCantidadMermaGalleta").innerHTML += event.target.value;
        console.log(event.target.value);
    });
}

function getIngredientes() {
    let ingredientes = JSON.parse(window.localStorage.getItem("inventarioMaterial"));

    let slContenido = document.getElementById("slMermaMaterial").innerHTML;
    let unidades = [];
    ingredientes.map(cIngrediente => {
        slContenido += `<option value="${cIngrediente.idMaterial}">${cIngrediente.ingrediente}</option>`
        unidades.push(cIngrediente.detalle_cantidad)
    })
    console.log(unidades)
    document.getElementById("slMermaMaterial").innerHTML = slContenido;
    
    document.getElementById("slMermaMaterial").addEventListener("change", (event) => {
        
        document.getElementById("lblCantidadMermaMaterial").innerHTML += unidades[event.target.value-1];
        console.log(event.target.value);
    });
}


function getMermaGalleta() {
    let url = "./api/merma/getMermaGalletas"
    let contentTable = "";
    fetch(url)
            .then(res => res.ok ? res.json() : Promise.reject(res))
            .then(data => {
                let mermas = data;
                mermas.map(merma => {
                    let {cantidad, galleta} = merma;
                    contentTable += `
                    <tr>
                        <td>${galleta.nombre}</td>
                        <td>${cantidad}</td>
                    </tr>`;
                })
                document.getElementById("tblbodymermagalleta").innerHTML = contentTable;
            });
}

function getMermaMaterial() {
    let url = "./api/merma/getMermaMaterial"
    let contentTable = "";
    fetch(url)
            .then(res => res.ok ? res.json() : Promise.reject(res))
            .then(data => {
                let mermas = data;
                mermas.map(merma => {
                    let {cantidad, unidad, material} = merma;
                    contentTable += `
                    <tr>
                        <td>${material.ingrediente}</td>
                        <td>${cantidad} ${unidad}</td>
                    </tr>`;
                })
                document.getElementById("tblbodymermamaterial").innerHTML += contentTable;
            });
}
