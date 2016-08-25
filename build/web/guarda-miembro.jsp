<%-- 
    Document   : guarda-profesor
    Created on : 20/10/2015, 06:54:23 PM
    Author     : Gerardo
--%>

<%@page import="sistema.Miembro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="miembro" scope="session" class="sistema.Miembro" >
    <jsp:setProperty name="miembro" property="nombre" />
    <jsp:setProperty name="miembro" property="apellido_p" />
    <jsp:setProperty name="miembro" property="apellido_m" />
    <jsp:setProperty name="miembro" property="email" />
    <jsp:setProperty name="miembro" property="contrasenia" />
</jsp:useBean>

<% 
    String nombre = miembro.getNombre();
    String apellido_p = miembro.getApellido_p();
    String apellido_m = miembro.getApellido_m();
    String email = miembro.getEmail();
    String contrasenia = miembro.getContrasenia();
    
    miembro.agregarMiembro(nombre, apellido_p, apellido_m, email, contrasenia);
    if(miembro.resultado != null)
        response.sendRedirect("login.jsp?registro=true");
    else
        response.sendRedirect("login.jsp?registro=false");
%>

<!DOCTYPE html>

    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Alta de miembro</title>
        </head>
        <body>
            <h1><% out.print(miembro.resultado); %></h1>
        </body>
    </html>
