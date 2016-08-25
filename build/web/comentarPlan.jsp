<%-- 
    Document   : mandarMensaje
    Created on : 28/10/2015, 10:47:59 PM
    Author     : Gerardo
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sistema.ConexionSQL" %>

<% 
    String usuario = ""; 
    String tipoUsuario = ""; 
    String id_miembro = "";
    HttpSession sesion=request.getSession();
    usuario = (String)sesion.getAttribute("usuario"); 
    tipoUsuario = (String)sesion.getAttribute("tipoUsuario"); 
    id_miembro = (String)sesion.getAttribute("id_miembro");
    
    
    if (request.getParameter("comentarPlan") != null) {
        String sql = "INSERT INTO comentarios_planes (id_plan,comentario,id_autor,fecha_creacion) VALUES ("+request.getParameter("comentarPlan")+",\""+request.getParameter("comentario")+"\",\""+id_miembro+"\",now())";
        
        ConexionSQL conexion = new ConexionSQL();
        conexion.conecta();
        conexion.ejecuta(sql);
        
        //Notificacion
        sql = "INSERT INTO notificaciones VALUES("+request.getParameter("comentarPlan")+", CURDATE(),\""+sesion.getAttribute("academia")+"\",\"comentarios_planes\",\"Han comentado un plan.\")";
        conexion.ejecuta(sql);
        
        conexion.cerrar();
        response.sendRedirect("verPlan.jsp?id_plan="+request.getParameter("comentarPlan"));
    }
%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        
    </head>
    <body>
        
    </body>
</html>

