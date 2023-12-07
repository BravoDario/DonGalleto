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
    getMermaGalleta();
    getMermaMaterial();
    getGalletas()
    
}

function getGalletas(){
    let galletas = JSON.parse(window.localStorage.getItem("inventarioGalletas"));
    
    let slContenido = document.getElementById("slMermaGalleta").innerHTML;
    galletas.map(galleta=>{
        slContenido += `<option value="${galleta.idGalleta}">${galleta.nombre}</option>`
    })
    document.getElementById("slMermaGalleta").innerHTML = slContenido;
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


