package com.eddit.dg.rest;

import com.eddit.dg.core.ControllerInventario;
import com.eddit.dg.core.ControllerMerma;
import com.eddit.dg.model.Galleta;
import com.eddit.dg.model.MermaGalleta;
import com.eddit.dg.model.MermaMaterial;
import com.google.gson.Gson;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Angel
 */
@Path("merma")
public class RESTMerma {

    @GET
    @Path("getMermaGalletas")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getGalletas() throws Exception, SQLException {
        ControllerMerma cm = new ControllerMerma();
        List<MermaGalleta> mermasGalleta = cm.getMermaGalleta();

        String out = new Gson().toJson(mermasGalleta);
        return Response.status(Response.Status.OK).entity(out).build();
    }
    
    @GET
    @Path("getMermaMaterial")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getMateriales() throws Exception, SQLException {
        ControllerMerma cm = new ControllerMerma();
        List<MermaMaterial> mermasMaterial = cm.getMermaMaterial();

        String out = new Gson().toJson(mermasMaterial);
        return Response.status(Response.Status.OK).entity(out).build();
    }
}
