/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eddit.dg.model;

/**
 *
 * @author adria
 */
public class Material {

    private int idMaterial;
    private String ingrediente;
    private int cantidad;
    private String detalle_cantidad;
    private double costo_material;
    private Inventario inventario;

    public Material() {
    }

    public Material(int idMaterial, String ingrediente, int cantidad, String detalle_cantidad, double costo_material, Inventario inventario) {
        this.idMaterial = idMaterial;
        this.ingrediente = ingrediente;
        this.cantidad = cantidad;
        this.detalle_cantidad = detalle_cantidad;
        this.costo_material = costo_material;
        this.inventario = inventario;
    }

    public Inventario getInventario() {
        return inventario;
    }

    public void setInventario(Inventario inventario) {
        this.inventario = inventario;
    }

    public int getIdMaterial() {
        return idMaterial;
    }

    public void setIdMaterial(int idMaterial) {
        this.idMaterial = idMaterial;
    }

    public String getIngrediente() {
        return ingrediente;
    }

    public void setIngrediente(String ingrediente) {
        this.ingrediente = ingrediente;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getDetalle_cantidad() {
        return detalle_cantidad;
    }

    public void setDetalle_cantidad(String detalle_cantidad) {
        this.detalle_cantidad = detalle_cantidad;
    }

    public double getCosto_material() {
        return costo_material;
    }

    public void setCosto_material(double costo_material) {
        this.costo_material = costo_material;
    }

}
