<%-- 
    Document   : generarMinuta
    Created on : 28/10/2015, 05:46:59 PM
    Author     : Gerardo
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sistema.ConexionSQL" %>

<% 
    HttpSession sesion=request.getSession(); 
    String usuario = (String)sesion.getAttribute("usuario"); 
    String id_miembro = (String)sesion.getAttribute("id_miembro"); 
    String tipoUsuario = (String)sesion.getAttribute("tipoUsuario");
    String id_academia = (String)sesion.getAttribute("id_academia");
    String academia = (String)sesion.getAttribute("academia");
    
%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Generar minuta</title>

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
    <% 
    String idMensaje = (String)request.getParameter("id_mensaje");
    if(idMensaje != null)
    { %>    
        <script type="text/javascript">
            $(window).load(function(){
                $('#verMensaje').modal('show');
            });
        </script>
<% } %>
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
        
        @-moz-document url-prefix() {
            fieldset { display: table-cell; }
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
          <%}%>
          <div class="mdl-layout-spacer"></div>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">help_outline</i><span class="visuallyhidden">Help</span></a>
        </nav>
      </div>
      <main class="mdl-layout__content mdl-color--grey-100">
          <br>
          <form action="CrearMinuta" method="POST" role="form">
                <h2 style="text-align:center;">Minuta de la reunión</h2>
            <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--3-col">
                      <!-- add content here -->
                    </div>
                    <div class="mdl-cell mdl-cell--2-col">
                            <div class="form-group">
                                <label for="fecha">Fecha</label>
                                <input type="text" class="form-control" id="fecha" value="<%=(String)request.getParameter("fecha")%>" name="fecha" readonly>
                            </div>
                    </div>
                    <div class="mdl-cell mdl-cell--2-col">
                            <div class="form-group">
                                <label for="hora">Hora</label>
                                <input type="text" class="form-control" id="hora" value="<%=(String)request.getParameter("hora")%>" name="hora" readonly>
                            </div>
                    </div>
                    <div class="mdl-cell mdl-cell--2-col">
                            <div class="form-group">
                                <label for="lugar">Lugar</label>
                                <input type="text" class="form-control" id="lugar" value="<%=(String)request.getParameter("lugar")%>" name="lugar" readonly>
                            </div>
                    </div>
                     <div class="mdl-cell mdl-cell--3-col">
                         
                     </div>
                                <%
                                     ConexionSQL conexion = new ConexionSQL();
                                        String sql = null;
                                        ResultSet result = null;

                                        if(conexion.conecta() != 0)
                                        {
                                            System.out.println("Error al contectar!");
                                        }  else {
                                            sql = "SELECT m.id_miembro, concat(m.nombre, ' ',m.apellido_p, ' ',m.apellido_m) as miembro from miembros m, roles_miembros r where m.id_miembro=r.id_miembro and r.rol=\"Presidente\" and r.id_academia="+id_academia;
                                            
                                        }
                                        
                                        String id_presidente = "";
                                        String presidente = "";
                                        result = conexion.consulta(sql);
                                        if (result != null)
                                         {
                                             while(result.next()) {
                                                 id_presidente = result.getString("m.id_miembro");
                                                 presidente = result.getString("miembro");
                                             }
                                         }
                                        
                                        
                                        
                                        result.close();
                                %>
                    
                                <input type="hidden" class="form-control" id="id_presidente" value="<%=id_presidente%>" name="id_presidente"> 
                                <input type="hidden" class="form-control" id="presidente" value="<%=presidente%>" name="presidente"> 
                                <input type="hidden" class="form-control" id="id_reunion" value="<%=(String)request.getParameter("id_reunion")%>" name="id_reunion"> 
                            
                                
                    <div class="mdl-cell mdl-cell--4-col">
                        
                     </div>
                     <div class="mdl-cell mdl-cell--4-col">
                            <div class="table-responsive">
                                    <table class="table">
                                        <caption>Asistencias</caption>
                                            <thead>
                                                <th>Miembro</th>
                                                <th>Asistencia</th>
                                            </thead>
                                    <%
                                       
                                            sql = "SELECT distinct concat(m.nombre, ' ',m.apellido_p, ' ',m.apellido_m) as miembro from miembros m, roles_miembros r where m.id_miembro=r.id_miembro and r.id_academia="+id_academia;

                                            result = conexion.consulta(sql);
                                            int no_miembro = 1;
                                             if (result != null)
                                             {
                                                 while(result.next()) {
                                                     %>
                                                        <tr>
                                                            <td><%=result.getString("miembro")%></td>
                                                            <td style="vertical-align:middle; text-align: center;">
                                                                <input type="checkbox" name="asistencias" value="<%=result.getString("miembro")%>">
                                                            </td>
                                                        </tr>
                                                     <%
                                                 }
                                                 result.close();
                                                 conexion.cerrar();
                                             }
                                        %>
                                    </table>
                            </div>
                         </div>
                     <div class="mdl-cell mdl-cell--4-col">
                        
                     </div>
                                    
                    <div class="mdl-cell mdl-cell--2-col">
                        
                     </div>
                     <div class="mdl-cell mdl-cell--8-col">
                        <div class="form-group">
                            <label for="ordenDia">Orden del d&iacute;a</label>
                            <textarea class="form-control" rows="6"class="form-control" id="ordenDia" placeholder="Orden del d&iacute;a" name="ordenDia"></textarea>
                        </div>
                    </div>
                    <div class="mdl-cell mdl-cell--2-col">

                   </div>
                   <div class="mdl-cell mdl-cell--2-col">

                   </div>
                   <div class="mdl-cell mdl-cell--8-col">
                        <div class="form-group">
                            <label for="detalles">Detalles de la reuni&oacute;n</label>
                            <textarea class="form-control" rows="6"class="form-control" id="detalles" placeholder="Detalles de la reuni&oacute;n" name="detalles"></textarea>
                        </div>
                    </div>
                    <div class="mdl-cell mdl-cell--2-col">
                        
                    </div>
                    <div class="mdl-cell mdl-cell--2-col">

                   </div>
                    <div class="mdl-cell mdl-cell--8-col">
                        <div class="form-group">
                            <label for="acuerdos">Acuerdos</label>
                            <textarea class="form-control" rows="6"class="form-control" id="acuerdos" placeholder="Acuerdos" name="acuerdos"></textarea>
                        </div> 
                    </div>
                     <div class="mdl-cell mdl-cell--2-col">

                     </div>
                     <div class="mdl-cell mdl-cell--5-col">

                     </div>      
                     <div class="mdl-cell mdl-cell--2-col">
                        <button type="submit" class="btn btn-primary">Generar minuta</button>
                     </div>       
                    <div class="mdl-cell mdl-cell--5-col">

                     </div>   
                 </div>
          </form>
        </main>
     </div>
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
  </body>
</html>