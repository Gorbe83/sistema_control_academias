<%-- 
    Document   : comprobarLogIn
    Created on : 26/10/2015, 08:45:26 PM
    Author     : Gerardo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sistema.ConexionSQL" %>

<%
        ConexionSQL conexion = new ConexionSQL();
        String sql = null;
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        ResultSet result = null;

        if(conexion.conecta() != 0)
        {
            System.out.println("Error al contectar!");    
        }  else {
             sql = "SELECT id_miembro,nombre,apellido_p,apellido_m,email FROM miembros WHERE (email=\""+email+"\" and contrasenia=\""+password+"\")";
         } 

        result = conexion.consulta(sql);
        if (result != null)
        {
            HttpSession sesion=request.getSession();
            while(result.next()) {
                sesion.setAttribute("id_miembro", result.getString("id_miembro"));
                sesion.setAttribute("usuario", result.getString("nombre")+" "+result.getString("apellido_p")+" "+result.getString("apellido_m"));
                sesion.setAttribute("email", result.getString("email"));
                
                sesion.setAttribute("tipoUsuario", "");
                sesion.setAttribute("academia", "");
                sesion.setAttribute("id_academia", "");
            }
            result.close();
            conexion.cerrar();

            response.sendRedirect("elegirAcceso.jsp");
        }
        else {
            out.println("Usuario no encontrado");
            out.println(email);
            conexion.cerrar();
        }
        
 %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    </body>
</html>
