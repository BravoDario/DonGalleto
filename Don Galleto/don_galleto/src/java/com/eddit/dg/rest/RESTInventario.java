package com.eddit.dg.rest;

import com.eddit.dg.core.ControllerInventario;
import com.eddit.dg.model.Galleta;
import com.eddit.dg.model.Inventario;
import com.eddit.dg.model.Material;
import com.google.gson.Gson;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Angel
 */
@Path("/inventario/")
public class RESTInventario {

    @GET
    @Path("getgalletas")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getGalletas() throws Exception, SQLException {
        ControllerInventario ci = new ControllerInventario();
        List<Galleta> galletas = ci.getInventarioGalletas();

        String out = new Gson().toJson(galletas);
        return Response.status(Response.Status.OK).entity(out).build();
    }

    @GET
    @Path("getingredientes")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getIngredientes() throws Exception, SQLException {
        ControllerInventario ci = new ControllerInventario();
        List<Material> materiales = ci.getInventarioMaterial();

        String out = new Gson().toJson(materiales);
        return Response.status(Response.Status.OK).entity(out).build();
    }
}
