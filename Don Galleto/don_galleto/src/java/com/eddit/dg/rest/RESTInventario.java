package com.eddit.dg.rest;

import com.google.gson.Gson;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*;

/**
 *
 * @author Angel
 */
@Path("/inventario/")
public class RESTInventario {

    @GET
    @Path("test")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAll(
            //@QueryParam("filtro") @DefaultValue("") String filtro" + filtro + "
    ) throws Exception {
        String out = null;
        String in = "\"saludo\":\"\"hola\"";
//        ControllerCliente cc = null;
  //      List<Cliente> clientes = null;
        try {
            //        cc = new ControllerCliente();
            //      clientes = cc.getAll(filtro);
                 out = new Gson().toJson(in);
        } catch (Exception e) {
            e.printStackTrace();
            out = "{\"exception\":\"Error interno del servidor.\"}";
        }
        return Response.status(Response.Status.OK).entity(in).build();
    }

}
