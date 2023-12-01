package com.eddit.dg.model;

/**
 *
 * @author Angel
 */
public class Reporte {

    private int idReporte;
    private double gasto;
    private Venta venta;

    public Reporte() {
    }

    public Reporte(int idReporte, double gasto, Venta venta) {
        this.idReporte = idReporte;
        this.gasto = gasto;
        this.venta = venta;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    public int getIdReporte() {
        return idReporte;
    }

    public void setIdReporte(int idReporte) {
        this.idReporte = idReporte;
    }

    public double getGasto() {
        return gasto;
    }

    public void setGasto(double gasto) {
        this.gasto = gasto;
    }

}
