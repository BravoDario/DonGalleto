package com.eddit.dg.model;

import java.util.List;

/**
 *
 * @author Angel
 */
public class DetalleVenta {

    private int idDetalle_venta;
    private int cantidad;
    private int tipo_venta;
    private List<Galleta> galletas;

    public DetalleVenta() {
    }

    public DetalleVenta(int idDetalle_venta, int cantidad, int tipo_venta, List<Galleta> galletas) {
        this.idDetalle_venta = idDetalle_venta;
        this.cantidad = cantidad;
        this.tipo_venta = tipo_venta;
        this.galletas = galletas;
    }

    public List<Galleta> getGalletas() {
        return galletas;
    }

    public void setGalletas(List<Galleta> galletas) {
        this.galletas = galletas;
    }

    public int getIdDetalle_venta() {
        return idDetalle_venta;
    }

    public void setIdDetalle_venta(int idDetalle_venta) {
        this.idDetalle_venta = idDetalle_venta;
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

}
