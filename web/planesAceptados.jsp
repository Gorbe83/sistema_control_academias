<%--
    Document   : bandejaMensajes
    Created on : 25/10/2015, 11:10:36 AM
    Author     : Gerardo
--%>

<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="sistema.ConexionSQL"%>
<%@page import="java.sql.ResultSet"%>

<%
    
    ConexionSQL conexion = new ConexionSQL();
    String sql = null;
    ResultSet result = null;
    
      if(conexion.conecta() != 0)
      {
                System.out.println("Error al contectar!");
      }  else {

            if (request.getParameter("id_plan") != null) {

                 sql = "SELECT nombre FROM planes WHERE estado=\"Aceptado\" AND id_plan="+request.getParameter("id_plan"); 

                result = conexion.consulta(sql);
                String archivo = "";
                if (result.next())
                {
                    result.beforeFirst();
                    result.next();
                    archivo = result.getString("nombre");
                    String rutaDescarga = "C:\\Users\\Gerardo\\Documents\\Facultad 5E\\Programación Distribuida\\Programas\\SistemaControl\\planes\\";


                   response.setContentType("APPLICATION/OCTET-STREAM");   
                   response.setHeader("Content-Disposition","attachment; filename=\"" + archivo + "\"");   

                   File file = new File(rutaDescarga + archivo);
                   FileInputStream fileIn = new FileInputStream(file);
                   ServletOutputStream outPut = response.getOutputStream();

                   byte[] outputByte = new byte[4096];
                   //copy binary contect to output stream
                   while(fileIn.read(outputByte, 0, 4096) != -1)
                   {
                           outPut.write(outputByte, 0, 4096);
                   }
                   outPut.flush();
                   outPut.close();
                   fileIn.close();
             }
            result.close();
        }
    }

    HttpSession sesion=request.getSession(); 
    String usuario = (String)sesion.getAttribute("usuario"); 
    String tipoUsuario = (String)sesion.getAttribute("tipoUsuario"); 
    String id_academia = request.getParameter("id_academia");
    String academia = request.getParameter("academia");
%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Planes aceptados</title>

    <link rel="shortcut icon" href="images/favicon.png">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->

    <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/cartasAcademias.css">
    <style>
        #view-source {
          position: fixed;
          display: block;
          right: 0;
          bottom: 0;
          margin-right: 40px;
          margin-bottom: 40px;
          z-index: 900;
        }
    </style>
    </head>
    <body>
        <div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
      <header class="demo-header mdl-layout__header mdl-color--green-600 mdl-color-text--white-400">
        <div class="mdl-layout__header-row">
            <span class="mdl-layout-title">Academia de <%= URLDecoder.decode(academia,"UTF-8") %></span>
          <div class="mdl-layout-spacer"></div>
          <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
            <label class="mdl-button mdl-js-button mdl-button--icon" for="search">
              <i class="material-icons">search</i>
            </label>
            <div class="mdl-textfield__expandable-holder">
              <input class="mdl-textfield__input" type="text" id="search">
              <label class="mdl-textfield__label" for="search">Enter your query...</label>
            </div>
          </div>
          <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
            <i class="material-icons">more_vert</i>
          </button>
          <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
            <li class="mdl-menu__item">About</li>
            <li class="mdl-menu__item">Contact</li>
            <li class="mdl-menu__item">Legal information</li>
          </ul>
        </div>
      </header>
      <div class="demo-drawer mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
        <header class="demo-drawer-header">
          <img src="images/avatar.jpg" class="demo-avatar">
          <div class="demo-avatar-dropdown">
            <span><%=usuario%></span>
            <div class="mdl-layout-spacer"></div>
            <button id="accbtn" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
              <i class="material-icons" role="presentation">arrow_drop_down</i>
              <span class="visuallyhidden">Accounts</span>
            </button>
            <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="accbtn">
                <a class="mdl-navigation__link" href=""><li class="mdl-menu__item">Mi cuenta</li></a>
                <a class="mdl-navigation__link" href=""><li class="mdl-menu__item">Configuración</li></a>
                <a class="mdl-navigation__link" href="cerrarSesion.jsp"><li class="mdl-menu__item">Cerrar sesión</li></a>
            </ul>
          </div>
        </header>
        <nav class="demo-navigation mdl-navigation mdl-color--blue-grey-800">
           <a class="mdl-navigation__link" href="index.jsp"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">home</i>Inicio</a>
          <a class="mdl-navigation__link" href="elegirAcademia.jsp"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">description</i>Ver planes</a>
          <div class="mdl-layout-spacer"></div>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">help_outline</i><span class="visuallyhidden">Help</span></a>
        </nav>
      </div>
      <main class="mdl-layout__content mdl-color--grey-100">
          <br>
          <div class="mdl-grid">
              <div class="mdl-cell mdl-cell--1-col">
                <!-- add content here -->
              </div>
              <div class="mdl-card mdl-cell mdl-cell--10-col mdl-cell--4-col-tablet mdl-shadow--2dp">
                  <div class="mdl-card__title">
                    <h1 class="mdl-card__title-text">Planes aceptados</h1>
                  </div>
                  <div class="mdl-card__supporting-text">
                    <%
                        
                        sql = "SELECT id_plan, nombre, materia FROM planes WHERE estado=\"Aceptado\" AND id_academia="+id_academia; 
                     
                            
                             result = conexion.consulta(sql);
                             if (result.next())
                             {
                                 result.beforeFirst();
                                 
                                 %>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                               <td>Id</td>
                                               <td>Nombre</td>
                                               <td>Materia</td>
                                               <td></td>
                                           </thead>
                                 <%
                                 
                                 while(result.next()) {
                                     %>
                                        <tr>
                                            <td><%out.print(result.getString("id_plan"));%></td>
                                            <td><%out.print(result.getString("nombre"));%></td>
                                            <td><%out.print(result.getString("materia"));%></td>
                                            <td><a href="planesAceptados.jsp?id_plan=<%out.print(result.getString("id_plan"));%>">Descargar plan</a></td>
                                        </tr>
                                     <%
                                 }
                                 result.close();
                                 %> </table></div><%
                             }
                             else {
                                 %>
                                 <p style="text-align: center">No hay planes aceptados</p> 
                          <% } 
                                 conexion.cerrar();
                            %>
                  </div>
                </div>
                 <div class="mdl-cell mdl-cell--1-col">
                <!-- add content here -->
                 </div>
          </div>
      </main>
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
  </body>
</html>