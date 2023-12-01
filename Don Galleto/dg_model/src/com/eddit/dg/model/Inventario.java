package com.eddit.dg.model;

/**
 *
 * @author Angel
 */
public class Inventario {

    private int idInventario;
    private int existencia;

    public Inventario() {
    }

    public Inventario(int idInventario, int existencia) {
        this.idInventario = idInventario;
        this.existencia = existencia;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public int getIdInventario() {
        return idInventario;
    }

    public void setIdInventario(int idInventario) {
        this.idInventario = idInventario;
    }

}
