package com.eddit.dg.model;

/**
 *
 * @author Angel
 */
public class Receta {

    private int idReceta;
    private int cantidad;
    private Galleta galleta;

    public Receta() {
    }

    public Receta(int idReceta, int cantidad, Galleta galleta) {
        this.idReceta = idReceta;
        this.cantidad = cantidad;
        this.galleta = galleta;
    }

    public Galleta getGalleta() {
        return galleta;
    }

    public void setGalleta(Galleta galleta) {
        this.galleta = galleta;
    }

    public int getIdReceta() {
        return idReceta;
    }

    public void setIdReceta(int idReceta) {
        this.idReceta = idReceta;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

}
