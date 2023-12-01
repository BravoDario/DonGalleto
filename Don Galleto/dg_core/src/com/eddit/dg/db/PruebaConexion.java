
package com.eddit.dg.db;

import com.eddit.dg.core.ControllerInventario;

/**
 *
 * @author Angel
 */
public class PruebaConexion {

    public static void main(String[] args) {
        ConexionMySQL connMySQL = new ConexionMySQL();
        try {
            ControllerInventario ci = new ControllerInventario();
            
            ci.getInventarioGalletas();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
