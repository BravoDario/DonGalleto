package com.eddit.dg.rest;

import com.eddit.dg.core.ControllerReporte;
import com.eddit.dg.model.Reporte;
import com.eddit.dg.model.Venta;
import com.eddit.dg.model.reporteTabla;
import com.google.gson.Gson;
import com.google.gson.JsonParseException;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*;
import java.util.List;

@Path("reporte")
public class RESTReporte {
    @GET
    @Path("getGrafica")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getGrafica(@QueryParam("fecha1") @DefaultValue("") String fecha1, @QueryParam("fecha2") @DefaultValue("") String fecha2, @QueryParam("numero") @DefaultValue("") String numero) {
        String out = null;
        ControllerReporte cr = null;
        List<Reporte> reportes = null;

        try {
            cr = new ControllerReporte();
            reportes = cr.getGrafica(fecha1, fecha2, numero);
            out = new Gson().toJson(reportes);
        } catch (Exception e) {
            e.printStackTrace();
            out = "{\"exeption\":\"Error interno del servidor.\"}";
        }
        return Response.status(Response.Status.OK).entity(out).build();
    }
    
    @GET
    @Path("getAll")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAll(@QueryParam("fecha1") @DefaultValue("") String fecha1, @QueryParam("fecha2") @DefaultValue("") String fecha2, @QueryParam("numero") @DefaultValue("") String numero) {
        String out2 = null;
        ControllerReporte cr2 = null;
        List<reporteTabla> reportesTabla = null;

        try {
            cr2 = new ControllerReporte();
            reportesTabla = cr2.getAll(fecha1, fecha2, numero);
            out2 = new Gson().toJson(reportesTabla);
        } catch (Exception e) {
            e.printStackTrace();
            out2 = "{\"exeption\":\"Error interno del servidor.\"}";
        }
        return Response.status(Response.Status.OK).entity(out2).build();
    }
}