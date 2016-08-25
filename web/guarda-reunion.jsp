<%-- 
    Document   : guarda-reunion
    Created on : 29/10/2015, 12:30:37 AM
    Author     : Alf
--%>

<%@page import="sistema.ConexionSQL"%>
<%@page import="sistema.Reunion" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="reunion" scope="session" class="sistema.Reunion" >
    <jsp:setProperty name="reunion" property="id_academia" />
    <jsp:setProperty name="reunion" property="asunto" />
    <jsp:setProperty name="reunion" property="descripcion" />
    <jsp:setProperty name="reunion" property="fecha" />
    <jsp:setProperty name="reunion" property="hora" />
    <jsp:setProperty name="reunion" property="lugar" />
</jsp:useBean>

<% 
    HttpSession sesion=request.getSession(); 
    
    String id_academia = (String)sesion.getAttribute("id_academia");
    String asunto = reunion.getAsunto();
    String descripcion = reunion.getDescripcion();
    String fecha = reunion.getFecha();
    String hora = reunion.getHora();
    String lugar = reunion.getLugar();
    
    reunion.agregarReunion(id_academia, asunto, descripcion, fecha, hora, lugar);
    
    //Notificacion
    ConexionSQL conexion = new ConexionSQL();
    String sql;
    sql = "INSERT INTO notificaciones VALUES((SELECT max(id_reunion) from reuniones), CURDATE(),\""+sesion.getAttribute("academia")+"\",\"reuniones\",\"Tienes una nueva reunion pendiente.\")";
    conexion.conecta();
    conexion.ejecuta(sql);
    conexion.cerrar();
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%  request.setAttribute("reunion", "true");
        request.getRequestDispatcher("consultarReuniones.jsp").forward(request,response); %></h1>
    </body>
</html>
