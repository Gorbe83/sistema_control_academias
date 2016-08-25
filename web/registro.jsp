<%-- 
    Document   : registro
    Created on : 22/11/2015, 05:33:48 PM
    Author     : Gerardo
--%>

<%@page import="sistema.Miembro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    HttpSession sesion=request.getSession(); 
    String usuario = (String)sesion.getAttribute("usuario"); 
    String tipoUsuario = (String)sesion.getAttribute("tipoUsuario"); 
    
    String[] profesores = request.getParameterValues("profesor");
    String secretario = request.getParameter("secretario");
    String presidente = request.getParameter("presidente");
    String id_academia = request.getParameter("id_academia");
    String academia = request.getParameter("academia");
    
    Miembro miembro = new Miembro();
    if(profesores != null) {
        for(int i = 0; i < profesores.length; i++) {
            miembro.inscribirAcademia(profesores[i], "Profesor", id_academia);
        }
    }
    
    if(secretario != null) {
        miembro.inscribirAcademia(secretario, "Secretario", id_academia);
    }
    
    if(presidente != null) {
        miembro.inscribirAcademia(presidente, "Presidente", id_academia);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%  response.sendRedirect("registrarMiembro.jsp?academia="+academia+"&id_academia="+id_academia+"&registro="+miembro.resultado); %>
    </h1>
    </body>
</html>
