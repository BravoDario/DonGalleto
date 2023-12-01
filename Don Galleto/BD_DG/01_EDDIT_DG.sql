-- ---------------------------------------------------------------- --
-- Archivo: 01_EDDIT_DG.sql                                       -- 
-- Version: 1.0                                                     --
-- Autor:   E-DDIT					   								--
-- Fecha de elaboracion: 21-11-2023                                 --
-- ---------------------------------------------------------------- --

DROP DATABASE IF EXISTS don_galleto;
CREATE DATABASE don_galleto;

-- ---------------------------------------------------------------- --
USE don_galleto;
-- ---------------------------------------------------------------- --


-- ------------- TABLA INVENTARIO -------------- --
CREATE TABLE inventario (
	idInventario		 	INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    existencia				INT NOT NULL
);



-- ------------- TABLA DETALLE-VENTA -------------- --
CREATE TABLE detalle_venta (
	idDetalle_venta     INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    cantidad			INT NOT NULL,
    tipo_venta			INT NOT NULL
);


-- ------------- TABLA VENTA -------------- --
CREATE TABLE venta (
	idVenta             INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    idDetalle_venta		INT NOT NULL,
    fecha_venta			DATE NOT NULL,
    total_venta			INT NOT NULL,
	CONSTRAINT fk_venta_detalle_venta FOREIGN KEY (idDetalle_venta) 
                REFERENCES detalle_venta(idDetalle_venta)
);


-- ------------- TABLA GALLETA -------------- --
CREATE TABLE galleta (
	idGalleta           INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    idInventario		INT NOT NULL,
    idDetalle_venta     INT NOT NULL,
    nombre              VARCHAR(129) UNIQUE NOT NULL,
    precio              VARCHAR(129) NOT NULL,
    CONSTRAINT fk_galleta_inventario FOREIGN KEY (idInventario) 
                REFERENCES inventario(idInventario),
	CONSTRAINT fk_galleta_detalle_venta FOREIGN KEY (idDetalle_venta) 
                REFERENCES detalle_venta(idDetalle_venta)
);


-- ------------- TABLA RECETA -------------- --
CREATE TABLE receta (
	idReceta            INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    idGalleta			INT NOT NULL,
    cantidad			INT NOT NULL,
	CONSTRAINT fk_receta_galleta FOREIGN KEY (idGalleta) 
                REFERENCES galleta(idGalleta)
);


-- ------------- TABLA REPORTE -------------- --
CREATE TABLE reporte (
	idReporte           INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    idVenta				INT NOT NULL,
    gasto				FLOAT NOT NULL,
	CONSTRAINT fk_reporte_venta FOREIGN KEY (idVenta) 
                REFERENCES venta(idVenta)
);


-- ------------- TABLA MATERIAL -------------- --
CREATE TABLE material (
	idMaterial          INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    idReporte			INT NOT NULL,
    idInventario		INT NOT NULL,
    ingrediente			VARCHAR(100) NOT NULL,
    cantidad			INT NOT NULL,
    detalle_cantidad	VARCHAR(50) NOT NULL,#UNIDAD
    costo_material		FLOAT NOT NULL,				
	CONSTRAINT fk_material_reporte FOREIGN KEY (idReporte) 
                REFERENCES reporte(idReporte),
	CONSTRAINT fk_material_inventario FOREIGN KEY (idInventario) 
                REFERENCES inventario(idInventario)
);

-- ------------- TABLA MATERIAL-HAS-RECETA -------------- --
CREATE TABLE material_has_receta (
	idMateriales_recetas 	INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    idMaterial				INT NOT NULL,
    idReceta				INT NOT NULL,
	CONSTRAINT fk_material_receta_material FOREIGN KEY (idMaterial) 
                REFERENCES material(idMaterial),
	CONSTRAINT fk_material_receta_receta FOREIGN KEY (idReceta) 
                REFERENCES receta(idReceta)
);

-- ------------- TABLA MERMA -------------- --
CREATE TABLE merma (
	idMerma				 	INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    idMaterial				INT NOT NULL,
    idGalleta				INT NOT NULL,
	cantidad				INT NOT NULL,
    CONSTRAINT fk_merma_material FOREIGN KEY (idMaterial) 
                REFERENCES material(idMaterial),
	CONSTRAINT fk_merma_galleta FOREIGN KEY (idGalleta) 
                REFERENCES galleta(idGalleta)
);