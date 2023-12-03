package com.eddit.dg.model;

import java.util.List;

/**
 *
 * @author Angel
 */
public class DetalleVenta {

    private Venta venta;
    private List<VentaGalleta> vg;

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    public List<VentaGalleta> getVg() {
        return vg;
    }

    public void setVg(List<VentaGalleta> vg) {
        this.vg = vg;
    }
    
}