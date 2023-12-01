package com.eddit.dg.model;

/**
 *
 * @author Angel
 */
public class Galleta {

    private int idGalleta;
    private Inventario inventario;
    private String nombre;
    private Double precio;

    public Galleta() {
    }

    public Galleta(int idGalleta, Inventario inventario, String nombre, Double precio) {
        this.idGalleta = idGalleta;
        this.inventario = inventario;
        this.nombre = nombre;
        this.precio = precio;
    }

    public int getIdGalleta() {
        return idGalleta;
    }

    public void setIdGalleta(int idGalleta) {
        this.idGalleta = idGalleta;
    }

    public Inventario getInventario() {
        return inventario;
    }

    public void setInventario(Inventario inventario) {
        this.inventario = inventario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

}
