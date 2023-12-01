package com.eddit.dg.core;

import com.eddit.dg.db.ConexionMySQL;
import com.eddit.dg.model.Galleta;
import com.eddit.dg.model.Inventario;
import com.eddit.dg.model.Material;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author adria
 */
public class ControllerInventario {

    public List<Galleta> getInventarioGalletas() throws SQLException {
        ConexionMySQL conn = new ConexionMySQL();
        Connection con = conn.open();
        String sql = "select * from inventariogalletas";
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        List<Galleta> galletas = new ArrayList<Galleta>();

        while (rs.next()) {
            Inventario inventario = new Inventario(
                    rs.getInt("idInventario"),
                    rs.getInt("existencia")
            );

            Galleta galleta = new Galleta(
                    rs.getInt("idGalleta"),
                    inventario,
                    rs.getString("nombreGalleta"),
                    rs.getDouble("Precio")
            );
            galletas.add(galleta);
        }

        rs.close();
        pstmt.close();
        con.close();

        return galletas;
    }

    public List<Material> getInventarioMaterial() throws Exception {
        ConexionMySQL conn = new ConexionMySQL();
        Connection con = conn.open();
        String sql = "select * from inventariomaterial";
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        List<Material> materiales = new ArrayList<Material>();

        while (rs.next()) {
            Inventario inventario = new Inventario(
                    rs.getInt("idInventario"),
                    rs.getInt("existencia")
            );

            Material material = new Material(
                    rs.getInt("idMaterial"),
                    rs.getString("ingrediente"),
                    rs.getInt("cantidad"),
                    rs.getString("detalle_cantidad"),
                    rs.getDouble("costo_material"),
                    inventario
            );
            materiales.add(material);
        }

        rs.close();
        pstmt.close();
        con.close();

        return materiales;
    }
    //procedures         CallableStatement cstmt = conn.prepareCall(sql);
}
