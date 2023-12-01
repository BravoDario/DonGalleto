CREATE VIEW ticket AS
SELECT
    v.idVenta,
    v.fecha_venta,
    v.total_venta,
    dv.cantidad,
    dv.tipo_venta,
    g.nombre AS nombre_galleta,
    g.precio AS precio_galleta
FROM
    venta v
JOIN detalle_venta dv ON v.idDetalle_venta = dv.idDetalle_venta
JOIN galleta g ON dv.idDetalle_venta = g.idDetalle_venta;


CREATE VIEW contenidoMerma AS
SELECT
    m.idMerma,
    m.cantidad AS cantidadMerma,
    ma.ingrediente,
    ma.detalle_cantidad,
    ma.costo_material,
    g.nombre AS nombreGalleta
FROM
    merma m
JOIN material ma ON m.idMaterial = ma.idMaterial
JOIN galleta g ON m.idGalleta = g.idGalleta;




CREATE VIEW inventarioMaterial AS
SELECT
    i.idInventario,
    i.existencia,
    ma.idMaterial,
    ma.ingrediente,
    ma.cantidad AS cantidadMaterial,
    ma.detalle_cantidad,
    ma.costo_material
FROM
    inventario i
JOIN material ma ON i.idInventario = ma.idInventario;


CREATE VIEW inventarioGalletas AS
SELECT
    i.idInventario,
    i.existencia,
    g.idGalleta,
    g.nombre AS nombreGalleta,
    g.precio
FROM
    inventario i
JOIN galleta g ON i.idInventario = g.idInventario;



CREATE VIEW reporteVenta AS
SELECT
    r.idReporte,
    r.idVenta,
    v.fecha_venta,
    v.total_venta,
    v.idDetalle_venta,
    dv.cantidad,
    dv.tipo_venta,
    g.nombre AS nombre_galleta,
    g.precio AS precio_galleta,
    r.gasto
FROM
    reporte r
JOIN venta v ON r.idVenta = v.idVenta
JOIN detalle_venta dv ON v.idDetalle_venta = dv.idDetalle_venta
JOIN galleta g ON v.idDetalle_venta = g.idDetalle_venta;
