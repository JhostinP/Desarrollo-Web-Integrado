package com.example.restapi.resources;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/items")
public class ItemResource {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getItems() {
        // Lógica para obtener los ítems
        return Response.ok("Lista de ítems").build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response createItem(String item) {
        // Lógica para crear un ítem
        return Response.status(Response.Status.CREATED).entity("Ítem creado").build();
    }

    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response updateItem(@PathParam("id") String id, String item) {
        // Lógica para actualizar un ítem
        return Response.ok("Ítem actualizado").build();
    }

    @DELETE
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response deleteItem(@PathParam("id") String id) {
        // Lógica para eliminar un ítem
        return Response.ok("Ítem eliminado").build();
    }
}