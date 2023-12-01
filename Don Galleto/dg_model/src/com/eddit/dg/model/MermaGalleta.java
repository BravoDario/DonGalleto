/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eddit.dg.model;

/**
 *
 * @author adria
 */
public class MermaGalleta {

    private int idMermaGalleta;
    private int cantidad;
    private Galleta galleta;

    public MermaGalleta() {
    }

    public MermaGalleta(int idMermaGalleta, int cantidad, Galleta galleta) {
        this.idMermaGalleta = idMermaGalleta;
        this.cantidad = cantidad;
        this.galleta = galleta;
    }

    public Galleta getGalleta() {
        return galleta;
    }

    public void setGalleta(Galleta galleta) {
        this.galleta = galleta;
    }

    public int getIdMermaGalleta() {
        return idMermaGalleta;
    }

    public void setIdMermaGalleta(int idMermaGalleta) {
        this.idMermaGalleta = idMermaGalleta;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

}
