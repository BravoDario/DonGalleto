export function inicializarInventario() {
    let url = "./api/inventario/getingredientes"
    let contentTable = "";
    fetch(url)
            .then(res => res.ok ? res.json() : Promise.reject(res))
            .then(data => {
                let ingredientes = data;
                ingredientes.map(Dingrediente => {
                    let {ingrediente, detalle_cantidad, inventario} = Dingrediente;
                    contentTable += `
                    <tr>
                        <td>${ingrediente}</td>
                        <td>${inventario.existencia} ${detalle_cantidad}</td>
                    </tr>`;
                })
                document.getElementById("tblbody").innerHTML = contentTable;
            });
}
//Falta tabla y método para cargar el inventario de galletas