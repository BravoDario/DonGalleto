package com.eddit.dg.model;

/**
 *
 * @author Angel
 */
public class Reporte {

    private int idReporte;
    private int total_cantidad;
    private double precio;
    private double precio_total;
    private double costo;

    public int getIdReporte() {
        return idReporte;
    }

    public void setIdReporte(int idReporte) {
        this.idReporte = idReporte;
    }

    public int getTotal_cantidad() {
        return total_cantidad;
    }

    public void setTotal_cantidad(int total_cantidad) {
        this.total_cantidad = total_cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getPrecio_total() {
        return precio_total;
    }

    public void setPrecio_total(double precio_total) {
        this.precio_total = precio_total;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    

}
