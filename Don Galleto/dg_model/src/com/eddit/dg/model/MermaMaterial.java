/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eddit.dg.model;

/**
 *
 * @author adria
 */
public class MermaMaterial {

    private int idMermaMaterial;
    private int cantidad;
    private String unidad;
    private Material material;

    public MermaMaterial() {
    }

    public MermaMaterial(int idMermaMaterial, int cantidad, String unidad, Material material) {
        this.idMermaMaterial = idMermaMaterial;
        this.cantidad = cantidad;
        this.unidad = unidad;
        this.material = material;
    }

    public Material getMaterial() {
        return material;
    }

    public void setMaterial(Material material) {
        this.material = material;
    }

    public int getIdMermaMaterial() {
        return idMermaMaterial;
    }

    public void setIdMermaMaterial(int idMermaMaterial) {
        this.idMermaMaterial = idMermaMaterial;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

}
