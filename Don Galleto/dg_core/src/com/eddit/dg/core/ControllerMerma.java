package com.eddit.dg.core;

import com.eddit.dg.db.ConexionMySQL;
import com.eddit.dg.model.Galleta;
import com.eddit.dg.model.Inventario;
import com.eddit.dg.model.Material;
import com.eddit.dg.model.MermaGalleta;
import com.eddit.dg.model.MermaMaterial;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Angel
 */
public class ControllerMerma {

    public void checkMermaGalleta(MermaGalleta mermaGalleta) throws Exception {

        ConexionMySQL conn = new ConexionMySQL();
        Connection con = conn.open();
        String check = "SELECT * FROM mermagalleta WHERE idGalleta = " + mermaGalleta.getGalleta().getIdGalleta();
        PreparedStatement pstmt = con.prepareStatement(check);
        ResultSet rs = pstmt.executeQuery();
        String sql = "";

        if (rs.next()) { //Si existe la galleta en merma, se actualiza
            sql = "UPDATE mermagalleta SET cantidad = " + mermaGalleta.getCantidad()
                    + " WHERE idGalleta = " + mermaGalleta.getGalleta().getIdGalleta();
        } else { //Si no existe la galleta en merma, se agrega
            sql = "INSERT INTO mermagalleta VALUES (default, "
                    + mermaGalleta.getCantidad() + ", "
                    + mermaGalleta.getGalleta().getIdGalleta() + ")";
        }

        int i = setMermaGalleta(sql);
        System.out.println(i);

        rs.close();
        pstmt.close();
        con.close();
    }

    public int setMermaGalleta(String sql) throws Exception {

        ConexionMySQL conn = new ConexionMySQL();
        Connection con = conn.open();
        PreparedStatement pstmt = con.prepareCall(sql);

        int i = pstmt.executeUpdate();

        pstmt.close();
        con.close();

        return i;
    }

    public List<MermaGalleta> getMermaGalleta() throws Exception {
        List<MermaGalleta> mermasGalleta = new ArrayList<>();
        ConexionMySQL conn = new ConexionMySQL();
        Connection con = conn.open();
        String sql = "SELECT * FROM vistamermagalleta";
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            Inventario inventario = new Inventario(
                    rs.getInt("idInventario"),
                    rs.getInt("existencia")
            );
            Galleta galleta = new Galleta(
                    rs.getInt("idGalleta"),
                    inventario,
                    rs.getString("nombre"),
                    rs.getDouble("precio")
            );
            MermaGalleta mermaGalleta = new MermaGalleta(
                    rs.getInt("idMermaGalleta"),
                    rs.getInt("cantidad"),
                    galleta
            );

            mermasGalleta.add(mermaGalleta);
        }

        return mermasGalleta;
    }

    public List<MermaMaterial> getMermaMaterial() throws Exception {
        List<MermaMaterial> mermasMaterial = new ArrayList<>();
        ConexionMySQL conn = new ConexionMySQL();
        Connection con = conn.open();
        String sql = "SELECT * FROM vistamermamaterial";
        PreparedStatement pstmt = con.prepareStatement(sql);

        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            Inventario inventario = new Inventario(
                    rs.getInt("idInventario"),
                    rs.getInt("existencia")
            );
            Material material = new Material(
                    rs.getInt("idMaterial"),
                    rs.getString("ingrediente"),
                    rs.getInt("materialCantidad"),
                    rs.getString("detalle_cantidad"),
                    rs.getDouble("costo_material"),
                    inventario
            );
            MermaMaterial mermaMaterial = new MermaMaterial(
                    rs.getInt("idMermaMaterial"),
                    rs.getInt("cantidad"),
                    rs.getString("unidad"),
                    material
            );

            mermasMaterial.add(mermaMaterial);
        }

        return mermasMaterial;
    }
}
