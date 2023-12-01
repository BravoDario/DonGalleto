package com.eddit.dg.model;

import java.util.List;

/**
 *
 * @author Angel
 */
public class Venta {

    private int idVenta;
    private String fecha_venta;
    private int total_venta;
    private List<DetalleVenta> detallesVentas;

    public Venta() {
    }

    public Venta(int idVenta, String fecha_venta, int total_venta, List<DetalleVenta> detallesVentas) {
        this.idVenta = idVenta;
        this.fecha_venta = fecha_venta;
        this.total_venta = total_venta;
        this.detallesVentas = detallesVentas;
    }

    public List<DetalleVenta> getDetallesVentas() {
        return detallesVentas;
    }

    public void setDetallesVentas(List<DetalleVenta> detallesVentas) {
        this.detallesVentas = detallesVentas;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public String getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(String fecha_venta) {
        this.fecha_venta = fecha_venta;
    }

    public int getTotal_venta() {
        return total_venta;
    }

    public void setTotal_venta(int total_venta) {
        this.total_venta = total_venta;
    }

}
