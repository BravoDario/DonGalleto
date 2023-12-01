DROP DATABASE IF EXISTS don_galleto;
CREATE DATABASE don_galleto;

-- Seleccionar la base de datos
USE don_galleto;

-- Crear la tabla Galleta
CREATE TABLE Galleta (
    idGalleta INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL
);
-- Crear la tabla DetalleVenta
CREATE TABLE DetalleVenta (
    idDetalleVenta INT AUTO_INCREMENT PRIMARY KEY,
    idGalleta INT,
    cantidad INT,
    tipoVenta INT,
    FOREIGN KEY (idGalleta) REFERENCES Galleta(idGalleta)
);

-- Crear la tabla Venta
CREATE TABLE Venta (
    idVenta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME,
    total FLOAT,
    idDetalleVenta INT,
    FOREIGN KEY (idDetalleVenta) REFERENCES DetalleVenta(idDetalleVenta)
);
create table Material(
	idMaterial int auto_increment primary key,
	ingrediente varchar(250) unique,
    cantidadIngrediente int, -- ejemplo 5 , 6
    detalleCantidadIngrediente int, -- aqui se pone como opciones de kg, litro 
    costoCompra float -- cuanto le cuesta a don galletro comprarla
    );
-- Crear la tabla Receta
CREATE TABLE Receta (
    idReceta INT AUTO_INCREMENT PRIMARY KEY,
    idMaterial int,
    cantidad int,
    idGalleta INT,
    FOREIGN KEY (idMaterial) REFERENCES Material(idMaterial),
    FOREIGN KEY (idGalleta) REFERENCES Galleta(idGalleta)
);

-- Crear la tabla Inventario
CREATE TABLE Inventario (
    idInventario INT AUTO_INCREMENT PRIMARY KEY,
    existencia INT,
    gasto FLOAT,
    idMaterial int,
    idGalleta int,
	FOREIGN KEY (idMaterial) REFERENCES Material(idMaterial),
	FOREIGN KEY (idGalleta) REFERENCES Galleta(idGalleta)
);

-- Crear la tabla Reportes
CREATE TABLE Reportes (
    idReportes INT AUTO_INCREMENT PRIMARY KEY,
    idVenta INT,
    gastos FLOAT,
    utilidad FLOAT,
    idMaterial int,
    FOREIGN KEY (idVenta) REFERENCES Venta(idVenta),
	FOREIGN KEY (idMaterial) REFERENCES Material(idMaterial)
);

-- Crear la tabla Merma
CREATE TABLE Merma (
    idMerma INT AUTO_INCREMENT PRIMARY KEY,
    cantidad INT,
    idGalleta int,
    idMateria int,
	FOREIGN KEY (idMaterial) REFERENCES Material(idMaterial),
	FOREIGN KEY (idGalleta) REFERENCES Galleta(idGalleta)

);
