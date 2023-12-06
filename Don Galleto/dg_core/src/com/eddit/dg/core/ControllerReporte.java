package com.eddit.dg.core;

import com.eddit.dg.db.ConexionMySQL;
import com.eddit.dg.model.Reporte;
import com.eddit.dg.model.reporteTabla;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Angel
 */
public class ControllerReporte {

    public List<Reporte> getGrafica(String fecha1, String fecha2, String numero) throws Exception {
    //La consulta SQL a ejecutar:
    String sql;
    if (numero == null || numero.isEmpty()) {
        sql = "SELECT SUM(detalle_venta.cantidad) AS total_cantidad, SUM(detalle_venta.cantidad) * AVG(galleta.precio) AS precio_total, SUM(detalle_venta.cantidad) * AVG(galleta.precio) * 0.7 AS costo "
            + "FROM venta "
            + "JOIN detalle_venta ON venta.idVenta = detalle_venta.venta_idVenta "
            + "JOIN galleta ON detalle_venta.idGalleta = galleta.idGalleta "
            + "WHERE venta.fecha_venta BETWEEN ? AND ?";
    } else {
        sql = "SELECT SUM(detalle_venta.cantidad) AS total_cantidad, galleta.precio, SUM(detalle_venta.cantidad) * galleta.precio AS precio_total, (SUM(detalle_venta.cantidad) * galleta.precio) * 0.7 AS costo "
            + "FROM venta "
            + "JOIN detalle_venta ON venta.idVenta = detalle_venta.venta_idVenta "
            + "JOIN galleta ON detalle_venta.idGalleta = galleta.idGalleta "
            + "WHERE venta.fecha_venta BETWEEN ? AND ? "
            + "AND detalle_venta.idGalleta = ?";
    }

    //Con este objeto nos vamos a conectar a la Base de Datos:
    ConexionMySQL connMySQL = new ConexionMySQL();

    //Abrimos la conexión con la Base de Datos:
    Connection conn = connMySQL.open();

    //Con este objeto ejecutaremos la consulta:
    PreparedStatement pstmt = conn.prepareStatement(sql);

    pstmt.setString(1, fecha1);
    pstmt.setString(2, fecha2);
    if (numero != null && !numero.isEmpty()) {
        pstmt.setString(3, numero);
    }

    //Aquí guardaremos los resultados de la consulta:
    ResultSet rs = pstmt.executeQuery();

    List<Reporte> reportes = new ArrayList<>();

    while (rs.next()) {
        reportes.add(fill(rs));
    }

    rs.close();
    pstmt.close();
    connMySQL.close();

    return reportes;
}


    public List<reporteTabla> getAll(String fecha1, String fecha2, String numero) throws Exception {
        //La consulta SQL a ejecutar:
        String sql = "SELECT detalle_venta.idDetalle_venta, detalle_venta.cantidad, venta.fecha_venta, detalle_venta.cantidad * galleta.precio AS ingresos, (detalle_venta.cantidad * galleta.precio) * 0.7 AS gastos "
                + "FROM venta "
                + "JOIN detalle_venta ON venta.idVenta = detalle_venta.venta_idVenta "
                + "JOIN galleta ON detalle_venta.idGalleta = galleta.idGalleta "
                + "WHERE venta.fecha_venta BETWEEN ? AND ? ";

        if (numero != null && !numero.isEmpty()) {
        sql += "AND detalle_venta.idGalleta = ? ";
    }

        sql += "ORDER BY detalle_venta.idDetalle_venta";
        
        //Con este objeto nos vamos a conectar a la Base de Datos:
        ConexionMySQL connMySQL = new ConexionMySQL();

        //Abrimos la conexión con la Base de Datos:
        Connection conn = connMySQL.open();

        //Con este objeto ejecutaremos la consulta:
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, fecha1);
        pstmt.setString(2, fecha2);

        if (numero != null && !numero.isEmpty()) {
        pstmt.setString(3, numero);
    }

        //Aquí guardaremos los resultados de la consulta:
        ResultSet rs = pstmt.executeQuery();

        List<reporteTabla> reporteTablas = new ArrayList<>();

        while (rs.next()) {
            reporteTablas.add(filltabla(rs));
        }

        rs.close();
        pstmt.close();
        connMySQL.close();

        return reporteTablas;
    }

    private Reporte fill(ResultSet rs) throws Exception {
        Reporte r = new Reporte();

        r.setTotal_cantidad(rs.getInt("total_cantidad"));
        r.setPrecio_total(rs.getDouble("precio_total"));
        r.setCosto(rs.getDouble("costo"));

        return r;
    }

    private reporteTabla filltabla(ResultSet rs) throws Exception {
        reporteTabla rt = new reporteTabla();

        rt.setCantidad(rs.getInt("cantidad"));
        rt.setFecha_venta(rs.getString("fecha_venta"));
        rt.setIngresos(rs.getDouble("ingresos"));
        rt.setGastos(rs.getDouble("gastos"));

        return rt;
    }
}
