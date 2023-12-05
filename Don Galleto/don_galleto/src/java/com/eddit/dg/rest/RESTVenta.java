package com.eddit.dg.rest;

import com.eddit.dg.core.ControllerVenta;
import com.eddit.dg.model.DetalleVenta;
import com.eddit.dg.model.Venta;
import com.google.gson.Gson;
import com.google.gson.JsonParseException;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*;
import java.sql.SQLException;

/**
 *
 * @author Angel
 */
@Path("venta")
public class RESTVenta {

    @Path("save")
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public Response save(@FormParam("datosVenta") @DefaultValue("") String datos) {
        String out = null;
        Gson gson = new Gson();
        DetalleVenta d = null;
        ControllerVenta cv = new ControllerVenta();
        
        try {

            d = gson.fromJson(datos, DetalleVenta.class);
            
            cv.generarVenta(d);

            out = gson.toJson(d);

        } catch (JsonParseException jpe) {

            jpe.printStackTrace();
            out = "{\"exeption\":\"Formato JSON de Datos Incorrecto\"}";

        } catch (Exception e) {

            e.printStackTrace();
            out = "{\"exeption\":\"%s\"}";
            
            out = String.format(out, e.toString());
        }
        return Response.status(Response.Status.OK).entity(out).build();
    }

}
