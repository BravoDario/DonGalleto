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

export function inicializarMerma(){
    
}



