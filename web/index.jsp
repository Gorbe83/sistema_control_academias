<%-- 
    Document   : index
    Created on : 26/10/2015, 09:20:27 PM
    Author     : Gerardo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="sistema.ConexionSQL"%>
<%@page import="java.util.*" %>

<% 
    HttpSession sesion=request.getSession();
    String usuario = (String)sesion.getAttribute("usuario"); 
    String tipoUsuario = (String)sesion.getAttribute("tipoUsuario"); 
    String id_academia = (String)sesion.getAttribute("id_academia");
    String academia = (String)sesion.getAttribute("academia");
    
    if (id_academia == "" && tipoUsuario == "")
    {
        tipoUsuario = request.getParameter("tipoUsuario"); 
        id_academia = request.getParameter("id_academia");
        academia = request.getParameter("academia");
        if ("Coordinador".equals(tipoUsuario) || "Subdirector".equals(tipoUsuario))
            academia = "Home";
        sesion.setAttribute("tipoUsuario", tipoUsuario);
        sesion.setAttribute("id_academia",id_academia);
        sesion.setAttribute("academia", academia);
    }
%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Index</title>

    <link rel="shortcut icon" href="images/favicon.png">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->

    <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/base.min.css">
    <link rel="stylesheet" href="css/project.min.css">
    <link rel="stylesheet" href="css/styles.css">
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
          <span class="mdl-layout-title">Academia de  <%=academia%></span>
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
          <%
                if("Profesor".equals(tipoUsuario) || "Secretario".equals(tipoUsuario) || "Presidente".equals(tipoUsuario)) {
                        
         %>           
                    <a class="mdl-navigation__link" href="bandejaMensajes.jsp"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">inbox</i>Mensajes</a> 
                    <a class="mdl-navigation__link" href="listaPlanes.jsp"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">description</i>Planes</a>
                    <a class="mdl-navigation__link" href="consultarReuniones.jsp"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">people</i>Reuniones</a>
                    <a class="mdl-navigation__link" href="elegirAcceso.jsp"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">domain</i>Elegir academia</a>
          <%}
                else if ("Coordinador".equals(tipoUsuario)) {%>
                    <a class="mdl-navigation__link" href="elegirAcademia.jsp"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">people</i>Registrar</a>
                <% } 
                else if ("Subdirector".equals(tipoUsuario)) {%>
                    <a class="mdl-navigation__link" href="elegirAcademia.jsp"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">description</i>Ver planes</a>
                <% } %>
          <div class="mdl-layout-spacer"></div>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">help_outline</i><span class="visuallyhidden">Help</span></a>
        </nav>
      </div>
      <main class="mdl-layout__content mdl-color--grey-100">
          <div class="container">
        <%
            /**
             * Aquí empieza mi código
             */
            ConexionSQL conexionNotificaciones = new ConexionSQL();
            String sqlNotificaciones = null;
            ResultSet resultNotificaciones = null;

            if(conexionNotificaciones.conecta() != 0)
            {
                System.out.println("Error al conectar!");
            }  else {
                sqlNotificaciones = "SELECT id,fecha,tabla_origen,informacion_notificacion from notificaciones where academia=\""+academia+"\" order by fecha desc limit 5";
            }
            resultNotificaciones = conexionNotificaciones.consulta(sqlNotificaciones);
            
        if (resultNotificaciones.next()){
                resultNotificaciones.beforeFirst();
                String referencia = "javascript:void(0)";
                while(resultNotificaciones.next()) {
                    if(resultNotificaciones.getString("tabla_origen").equals("planes"))
                        referencia = "listaPlanes.jsp";
                    else if (resultNotificaciones.getString("tabla_origen").equals("comentarios_planes"))
                        referencia = "verPlan.jsp?id_plan=" + resultNotificaciones.getString("id");
                    else if (resultNotificaciones.getString("tabla_origen").equals("reuniones"))
                        referencia = "consultarReuniones.jsp";                   
                    %>
                <div class="row">
                    <div class="col-lg-3 col-md-5 col-sm-6">
                        <div class="card">
                              <div class="card-main">
                                      <div class="card-inner">
                                              <p class="card-heading"><%out.print(resultNotificaciones.getString("informacion_notificacion"));%></p>
                                              <p>
                                                  <%out.print(resultNotificaciones.getString("fecha"));%>
                                              </p>
                                      </div>
                                      <div class="card-action">
                                              <div class="card-action-btn pull-left">
                                                  <a class="btn btn-flat waves-attach" href=<%=referencia%>><span class="icon">check</span>&nbsp;Ver notificación</a>
                                              </div>
                                      </div>
                              </div>
                          </div>
                    </div>
              </div>
                    <%
                }
                resultNotificaciones.close();
            } else{
                out.println("<p style=\"text-align:center;\">No tienes asuntos pendientes</p>");
            }
            /**
             * Aquí termina mi código
             */
            %>
          </div>
          
      </main>
      <div class="mdl-layout__obfuscator"></div>
    </div>
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
  </body>
</html>