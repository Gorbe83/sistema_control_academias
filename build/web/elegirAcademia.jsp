<%-- 
    Document   : altaProfesores
    Created on : 28/10/2015, 10:20:17 PM
    Author     : Gerardo
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sistema.ConexionSQL" %>

<% 
    HttpSession sesion=request.getSession(); 
    String usuario = (String)sesion.getAttribute("usuario"); 
    String tipoUsuario = (String)sesion.getAttribute("tipoUsuario"); 
%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Elegir academia</title>

    <link rel="shortcut icon" href="images/favicon.png">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->

    <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.css">
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
          <span class="mdl-layout-title">Home</span>
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
          <%if ("Coordinador".equals(tipoUsuario)) {%>
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
                <br>
                <div class="mdl-card mdl-shadow--2dp demo-card-wide">
                  <div class="mdl-card__title" style="background: url('img/Ciencias Básicas.jpg') center / cover;">
                    <h2 class="mdl-card__title-text">Ciencias Básicas</h2>
                  </div>
                  <div class="mdl-card__actions mdl-card--border">
                  <% if("Coordinador".equals(tipoUsuario)) { %>
                      <form name="forma1" action="registrarMiembro.jsp" method="get">
                  <% } else if("Subdirector".equals(tipoUsuario)) { %>
                      <form name="forma1" action="planesAceptados.jsp" method="get">
                   <% } %>
                         <input type="hidden" id="academia" name="academia" value="<%=URLEncoder.encode("Ciencias Básicas","UTF-8")%>">
                         <input type="hidden" id="id_academia" name="id_academia" value="1">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="javascript:viod(0)" onclick="javascript:document.forms['forma1'].submit();">
                         Entrar
                       </a>
                     </form>
                  </div>
               </div>
                
                <br>
                <div class="mdl-card mdl-shadow--2dp demo-card-wide">
                  <div class="mdl-card__title" style="background: url('img/Redes y Telecomunicaciones.jpg') center / cover;">
                    <h2 class="mdl-card__title-text">Redes y Telecomunicacioness</h2>
                  </div>
                  <div class="mdl-card__actions mdl-card--border">
                      <% if("Coordinador".equals(tipoUsuario)) { %>
                      <form name="forma2" action="registrarMiembro.jsp" method="get">
                  <% } else if("Subdirector".equals(tipoUsuario)) { %>
                      <form name="forma2" action="planesAceptados.jsp" method="get">
                   <% } %>
                         <input type="hidden" id="academia" name="academia" value="Redes y Telecomunicaciones">
                         <input type="hidden" id="id_academia" name="id_academia" value="2">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="javascript:viod(0)" onclick="javascript:document.forms['forma2'].submit();">
                         Entrar
                       </a>
                     </form>
                  </div>
               </div>
                
                <br>
                <div class="mdl-card mdl-shadow--2dp demo-card-wide">
                  <div class="mdl-card__title" style="background: url('img/Arquitectura de Computadoras.jpg') center / cover;">
                    <h2 class="mdl-card__title-text">Arquitectura de Computadoras</h2>
                  </div>
                  <div class="mdl-card__actions mdl-card--border">
                     <% if("Coordinador".equals(tipoUsuario)) { %>
                      <form name="forma3" action="registrarMiembro.jsp" method="get">
                  <% } else if("Subdirector".equals(tipoUsuario)) { %>
                      <form name="forma3" action="planesAceptados.jsp" method="get">
                   <% } %>
                        <input type="hidden" id="academia" name="academia" value="Arquitectura de Computadoras">
                        <input type="hidden" id="id_academia" name="id_academia" value="3">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="javascript:viod(0)" onclick="javascript:document.forms['forma3'].submit();">
                         Entrar
                       </a>
                     </form>
                  </div>
               </div>
                
                <br>
                <div class="mdl-card mdl-shadow--2dp demo-card-wide">
                  <div class="mdl-card__title" style="background: url('img/Software.jpg') center / cover;">
                    <h2 class="mdl-card__title-text">Software</h2>
                  </div>
                  <div class="mdl-card__actions mdl-card--border">
                      <% if("Coordinador".equals(tipoUsuario)) { %>
                      <form name="forma4" action="registrarMiembro.jsp" method="get">
                  <% } else if("Subdirector".equals(tipoUsuario)) { %>
                      <form name="forma4" action="planesAceptados.jsp" method="get">
                   <% } %>
                        <input type="hidden" id="academia" name="academia" value="Software">
                        <input type="hidden" id="id_academia" name="id_academia" value="4">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="javascript:viod(0)" onclick="javascript:document.forms['forma4'].submit();">
                         Entrar
                       </a>
                     </form>
                  </div>
               </div>
                
                <br>
                <div class="mdl-card mdl-shadow--2dp demo-card-wide">
                  <div class="mdl-card__title" style="background: url('img/Entorno Social.jpg') center / cover;">
                    <h2 class="mdl-card__title-text">Ciencias Básicas</h2>
                  </div>
                  <div class="mdl-card__actions mdl-card--border">
                      <% if("Coordinador".equals(tipoUsuario)) { %>
                      <form name="forma5" action="registrarMiembro.jsp" method="get">
                  <% } else if("Subdirector".equals(tipoUsuario)) { %>
                      <form name="forma5" action="planesAceptados.jsp" method="get">
                   <% } %>
                        <input type="hidden" id="academia" name="academia" value="Entorno Social">
                        <input type="hidden" id="id_academia" name="id_academia" value="5">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="javascript:viod(0)" onclick="javascript:document.forms['forma5'].submit();">
                         Entrar
                       </a>
                     </form>
                  </div>
               </div>
                
                <br>
                <div class="mdl-card mdl-shadow--2dp demo-card-wide">
                  <div class="mdl-card__title" style="background: url('img/Introducción a la Investigación.jpg') center / cover;">
                    <h2 class="mdl-card__title-text">Introducción a la Investigación</h2>
                  </div>
                  <div class="mdl-card__actions mdl-card--border">
                      <% if("Coordinador".equals(tipoUsuario)) { %>
                      <form name="forma6" action="registrarMiembro.jsp" method="get">
                  <% } else if("Subdirector".equals(tipoUsuario)) { %>
                      <form name="forma6" action="planesAceptados.jsp" method="get">
                   <% } %>
                         <input type="hidden" id="academia" name="academia" value="<%=URLEncoder.encode("Introducción a la Investigación","UTF-8")%>">
                         <input type="hidden" id="id_academia" name="id_academia" value="6">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="javascript:viod(0)" onclick="javascript:document.forms['forma6'].submit();">
                         Entrar
                       </a>
                     </form>
                  </div>
               </div>
                
                <br>
                <div class="mdl-card mdl-shadow--2dp demo-card-wide">
                  <div class="mdl-card__title" style="background: url('img/Lengua Inglesa.jpg') center / cover;">
                    <h2 class="mdl-card__title-text">Lengua Inglesa</h2>
                  </div>
                  <div class="mdl-card__actions mdl-card--border">
                      <% if("Coordinador".equals(tipoUsuario)) { %>
                      <form name="forma7" action="registrarMiembro.jsp" method="get">
                  <% } else if("Subdirector".equals(tipoUsuario)) { %>
                      <form name="forma7" action="planesAceptados.jsp" method="get">
                   <% } %>
                      <input type="hidden" id="academia" name="academia" value="Lengua Inglesa">
                      <input type="hidden" id="id_academia" name="id_academia" value="7">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="javascript:viod(0)" onclick="javascript:document.forms['forma7'].submit();">
                         Entrar
                       </a>
                     </form>
                  </div>
               </div>
      </main>
      <div class="mdl-layout__obfuscator"></div>
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
  </body>
</html>