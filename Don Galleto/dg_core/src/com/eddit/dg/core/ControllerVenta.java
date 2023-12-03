package com.eddit.dg.core;

import com.eddit.dg.db.ConexionMySQL;
import com.eddit.dg.model.DetalleVenta;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Angel
 */
public class ControllerVenta {

    public boolean generarVenta(DetalleVenta dv) {

        boolean r = false;
        ConexionMySQL conMysql = new ConexionMySQL();
        Connection conn = conMysql.open();
        Statement stmt = null;
        ResultSet rs = null;

        try {

            conn.setAutoCommit(false);
            String query1 = "INSERT INTO venta (fecha_venta,total_venta) VALUE (" + dv.getVenta().getFecha_venta() + ",'" + dv.getVenta().getTotal_venta()+ "');";
            stmt = conn.createStatement();
            stmt.execute(query1);
            rs = stmt.executeQuery("SELECT LAST_INSERT_ID();");

            if (rs.next()) {
               dv.getVenta().setIdVenta(rs.getInt(1));
            }

            for (int i = 0; i < dv.getVg().size(); i++) {
                
                String query2 = "INSERT INTO detalle_venta VALUES("  
                        + dv.getVg().get(i).getCantidad() + ","
                        + dv.getVg().get(i).getTipo_venta() + ","
                        + dv.getVg().get(i).getGalletas().getIdGalleta()
                        + dv.getVenta().getIdVenta() +");";
                
                String query3 = "UPDATE inventario SET existencia = existencia - "+dv.getVg().get(i).getCantidad()+" where idInventario = "+dv.getVg().get(i).getGalletas().getInventario().getIdInventario();
                stmt.execute(query2);
                stmt.execute(query3);
            }

            conn.commit();
            conn.setAutoCommit(true);
            rs.close();
            stmt.close();
            conn.close();
            conMysql.close();
            r = true;

        } catch (SQLException ex) {
            Logger.getLogger(ControllerVenta.class.getName()).log(Level.SEVERE, null, ex);

            try {
                conn.rollback();
                conn.setAutoCommit(true);
                conn.close();
                conMysql.close();

                r = false;

            } catch (SQLException ex1) {
                Logger.getLogger(ControllerVenta.class.getName()).log(Level.SEVERE, null, ex1);
            }
            r = false;
        }

        return r;
    }
}
