/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eddit.dg.model;

/**
 *
 * @author adria
 */
public class Material_has_receta {

    private int idMateriales_recetas;
    private Material material;
    private Receta receta;

    public Material_has_receta() {
    }

    public Material_has_receta(int idMateriales_recetas, Material material, Receta receta) {
        this.idMateriales_recetas = idMateriales_recetas;
        this.material = material;
        this.receta = receta;
    }

    public Receta getReceta() {
        return receta;
    }

    public void setReceta(Receta receta) {
        this.receta = receta;
    }

    public int getIdMateriales_recetas() {
        return idMateriales_recetas;
    }

    public void setIdMateriales_recetas(int idMateriales_recetas) {
        this.idMateriales_recetas = idMateriales_recetas;
    }

    public Material getMaterial() {
        return material;
    }

    public void setMaterial(Material material) {
        this.material = material;
    }

}
