/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eddit.dg.model;

import java.util.List;

/**
 *
 * @author sergi
 */
public class VentaGalleta {
    private int idVenta_galleta;
    private int cantidad;
    private int tipo_venta;
    private Galleta galletas;

    public int getIdVenta_galleta() {
        return idVenta_galleta;
    }

    public void setIdVenta_galleta(int idVenta_galleta) {
        this.idVenta_galleta = idVenta_galleta;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getTipo_venta() {
        return tipo_venta;
    }

    public void setTipo_venta(int tipo_venta) {
        this.tipo_venta = tipo_venta;
    }

    public Galleta getGalletas() {
        return galletas;
    }

    public void setGalletas(Galleta galletas) {
        this.galletas = galletas;
    }
    
    
}
