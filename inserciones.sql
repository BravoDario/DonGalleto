use don_galleto;

-- INSERT para la tabla 'inventario'
INSERT INTO inventario (existencia) VALUES
(100), (150), (200), (50), (300), (120), (180), (90), (250), (80);

-- INSERT para la tabla 'detalle_venta'
INSERT INTO detalle_venta (cantidad, tipo_venta) VALUES
(5, 1), (10, 2), (8, 1), (15, 2), (12, 1), (6, 2), (9, 1), (7, 2), (11, 1), (14, 2);

-- INSERT para la tabla 'venta'
INSERT INTO venta (idDetalle_venta, fecha_venta, total_venta) VALUES
(1, '2023-01-01', 200), (2, '2023-01-02', 350), (3, '2023-01-03', 180),
(4, '2023-01-04', 420), (5, '2023-01-05', 300), (6, '2023-01-06', 240),
(7, '2023-01-07', 270), (8, '2023-01-08', 210), (9, '2023-01-09', 500),
(10, '2023-01-10', 160);

-- INSERT para la tabla 'galleta'
INSERT INTO galleta (idInventario, idDetalle_venta, nombre, precio) VALUES
(1, 1, 'Chocolate', '1.50'), (2, 2, 'vainilla', '2.00'), (3, 3, 'naranja', '1.20'),
(4, 4, 'Nuez', '2.80'), (5, 5, 'adornada', '2.00'), (6, 6, 'fresa', '1.60'),
(7, 7, 'almendra', '1.80'), (8, 8, 'coco', '1.40'), (9, 9, 'galleta sola', '3.00'),
(10, 10, 'azucarada', '0.90');

-- INSERT para la tabla 'receta'
INSERT INTO receta (idGalleta, cantidad) VALUES
(1, 50), (2, 75), (3, 60), (4, 90), (5, 80), (6, 40), (7, 55), (8, 45), (9, 100), (10, 30);

-- INSERT para la tabla 'reporte'
INSERT INTO reporte (idVenta, gasto) VALUES
(1, 20.5), (2, 30.0), (3, 15.5), (4, 35.5), (5, 25.0), (6, 20.0), (7, 22.5), (8, 18.0), (9, 42.0), (10, 12.5);

-- INSERT para la tabla 'material'
INSERT INTO material (idReporte, idInventario, ingrediente, cantidad, detalle_cantidad, costo_material) VALUES
(1, 1, 'Harina', 10, 'kg', 5.0), (2, 2, 'Azúcar', 8, 'kg', 3.0), (3, 3, 'Chocolate', 5, 'kg', 6.0),
(4, 4, 'Mantequilla', 12, 'kg', 8.0), (5, 5, 'Vainilla', 7, 'L', 4.0), (6, 6, 'Canela', 10, 'g', 2.0),
(7, 7, 'Levadura', 6, 'g', 2.5), (8, 8, 'Sal', 9, 'g', 1.5), (9, 9, 'Almendras', 15, 'kg', 10.0),
(10, 10, 'Esencia', 4, 'L', 0.8);

-- INSERT para la tabla 'material_has_receta'
INSERT INTO material_has_receta (idMaterial, idReceta) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

-- INSERT para la tabla 'merma'
INSERT INTO merma (idMaterial, idGalleta, cantidad) VALUES
(1, 1, 2), (2, 2, 3), (3, 3, 1), (4, 4, 4), (5, 5, 2), (6, 6, 1), (7, 7, 2), (8, 8, 1), (9, 9, 3), (10, 10, 1);
