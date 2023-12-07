
function cargarModuloVenta() {
    //AJAX: Asynchronous
    fetch('admin/venta/venta.html')
            .then(respuesta => {
                //Devolvemos el contenido
                //de la respuesta en formato
                //texto:
                return respuesta.text();
            })
            .then(function (html)
            {

                //Insertamos el codigo HTML
                //dentro del contenedor principal
                document.getElementById('contenedor_principal').innerHTML = html;
                import('./venta.js').then(obj => {
                    cm = obj;
                    cm.inicializarVenta();
                });
            }
            );
}


function cargarModuloInventario() {
    //AJAX: Asynchronous
    fetch('admin/inventario/inventario.html')
            .then(respuesta => {
                //Devolvemos el contenido
                //de la respuesta en formato
                //texto:
                return respuesta.text();
            })
            .then(function (html)
            {

                //Insertamos el codigo HTML
                //dentro del contenedor principal
                document.getElementById('contenedor_principal').innerHTML = html;
                import('./inventario.js').then(obj => {
                    cm = obj;
                    cm.inicializarInventario();
                });
            }
            );
}


function cargarModuloReporte() {
    //AJAX: Asynchronous
    fetch('admin/reporte/reporte.html')
            .then(respuesta => {
                //Devolvemos el contenido
                //de la respuesta en formato
                //texto:
                return respuesta.text();
            })
            .then(function (html)
            {

                //Insertamos el codigo HTML
                //dentro del contenedor principal
                document.getElementById('contenedor_principal').innerHTML = html;
                import('./reporte.js').then(obj => {
                    cm = obj;
                    cm.inicializarReporte();
                });
            }
            );
}


function cargarModuloMerma() {
    //AJAX: Asynchronous
    fetch('admin/merma/merma.html')
            .then(respuesta => {
                //Devolvemos el contenido
                //de la respuesta en formato
                //texto:
                return respuesta.text();
            })
            .then(function (html)
            {

                //Insertamos el codigo HTML
                //dentro del contenedor principal
                document.getElementById('contenedor_principal').innerHTML = html;
                import('./merma.js').then(obj => {
                    cm = obj;
                    cm.inicializarMerma();
                });
            }
            );
}


function cargarModuloReceta() {
    //AJAX: Asynchronous
    fetch('admin/receta/receta.html')
            .then(respuesta => {
                //Devolvemos el contenido
                //de la respuesta en formato
                //texto:
                return respuesta.text();
            })
            .then(function (html)
            {

                //Insertamos el codigo HTML
                //dentro del contenedor principal
                document.getElementById('contenedor_principal').innerHTML = html;
                import('./receta.js').then(obj => {
                    cm = obj;
                    cm.inicializarReceta();
                });
            }
            );
}

function getInventarioMaterial() {
    let url = "./api/inventario/getingredientes"
    fetch(url)
            .then(res => res.ok ? res.json() : Promise.reject(res))
            .then(data => {
                window.localStorage.setItem("inventarioMaterial", JSON.stringify(data))
            });
}

function getInventarioGalleta() {
    let url = "./api/inventario/getgalletas"
    fetch(url)
            .then(res => res.ok ? res.json() : Promise.reject(res))
            .then(data => {
                window.localStorage.setItem("inventarioGalletas", JSON.stringify(data))
            });
}

getInventarioMaterial() 
getInventarioGalleta();