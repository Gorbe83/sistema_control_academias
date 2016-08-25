<%-- 
    Document   : bandejaMensajes
    Created on : 25/10/2015, 11:10:36 AM
    Author     : Gerardo
--%>

<%@page import="sistema.ConexionSQL"%>
<%@page import="java.sql.ResultSet"%>

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
    <title>Planes</title>

    <link rel="shortcut icon" href="images/favicon.png">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->
    
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  
  <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.css">

    <link rel="stylesheet" href="css/styles.css">
    <% if("true".equals((String)request.getParameter("plan"))) { %>
        <script type="text/javascript">
            alert("Plan cargado satisfactoriamente");
        </script>
    <% } %>
    
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
        tr:hover {
          background-color: #D8D8D8;
        }
        @-moz-document url-prefix() {
            fieldset { display: table-cell; }
          }
    </style>
    </head>
    <body>
        <div class=" demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header mdl-layout--fixed-tabs">
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
        <div class="mdl-layout__tab-bar mdl-js-ripple-effect mdl-color--green-600 mdl-color-text--white-400">
          <%  if ("Presidente".equals(tipoUsuario) || "Secretario".equals(tipoUsuario)) {  %>
                <a href="#fixed-tab-1" class="mdl-layout__tab is-active">Planes Aceptados</a>
              <a href="#fixed-tab-2" class="mdl-layout__tab">Planes En revisión</a>
              <a href="#fixed-tab-3" class="mdl-layout__tab">Planes Pendientes</a>
      <% } else  { %>
      <a href="#fixed-tab-1" class="mdl-layout__tab is-active">Mis planes</a>
      <a href="#fixed-tab-2" class="mdl-layout__tab">Planes Aceptados</a>
      <a href="#fixed-tab-3" class="mdl-layout__tab">Planes En revisión</a><% } %>
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
          <%
                ConexionSQL conexion = new ConexionSQL();
                String sql = null;
                ResultSet result = null;
                int i = 1;
                if(tipoUsuario.equals("Profesor"))
                {
                %>
          <section class="mdl-layout__tab-panel is-active" id="fixed-tab-<%=i%>">
            <div class="page-content">
          <div class="mdl-grid">
              <div class="mdl-cell mdl-cell--1-col">
                <!-- add content here -->
              </div>
                    <div class="mdl-card mdl-cell mdl-cell--10-col mdl-cell--4-col-tablet mdl-shadow--2dp">
                    <div class="mdl-card__title">
                      <h1 class="mdl-card__title-text">Mis planes</h1>
                    </div>
                    <div class="mdl-card__supporting-text"> 
                    <%
                            
                            if(conexion.conecta() != 0)
                            {
                                System.out.println("Error al contectar!");
                            }  else {
                                    sql = "SELECT id_plan, nombre, materia, estado from planes where (id_autor='"+id_miembro+"' AND id_academia='"+id_academia+"')"; 
                            }
                            
                            result = conexion.consulta(sql);
                                    if (result.next())
                                    {
                                        result.beforeFirst();
                                        %>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                               <td>Nombre</td>
                                               <td>Materia</td>
                                               <td>Estado</td>
                                               <td></td>
                                           </thead>
                                 <%
                                 
                                 while(result.next()) {
                                     %>
                                        <tr>
                                            <td><%out.print(result.getString("nombre"));%></td>
                                            <td><%out.print(result.getString("materia"));%></td>
                                            <td><%out.print(result.getString("estado"));%></td>
                                            <td><a href="verPlan.jsp?id_plan=<%out.print(result.getString("id_plan"));%>">Ver plan</a></td>
                                        </tr>
                                     <%
                                 }
                                 result.close();
                                 %> </table></div><%
                             }
                             else {
                                 %>
                                 <p style="text-align: center">No hay planes</p> <%
                                    conexion.cerrar();
                                    } %>
                    </div>
                 </div> 
                <div class="mdl-cell mdl-cell--1-col">
                <!-- add content here -->
              </div>
                  <div class="mdl-cell mdl-cell--9-col">
                <!-- add content here -->
              </div>
                  <div class="mdl-cell mdl-cell--2-col">
                        <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" data-toggle="modal" data-target="#enviarPlan">Nuevo Plan</button>
                  </div>
          </div>
                    
          </section>
              <%i++;  } %>
              <section class="mdl-layout__tab-panel <% if(i == 1) out.print("is-active"); %>" id="fixed-tab-<%=i%>">
            <div class="page-content">
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
                      if(conexion.conecta() != 0)
                            {
                                System.out.println("Error al contectar!");
                            }  else {
                            sql = "SELECT p.id_plan, p.nombre, p.materia, p.estado, concat(m.nombre, ' ',m.apellido_p, ' ',m.apellido_m) as autor from planes p,miembros m where (p.id_autor=m.id_miembro and estado='Aceptado' AND p.id_academia="+id_academia+")"; 
                      }
                            
                             result = conexion.consulta(sql);
                             if (result.next())
                             {
                                 result.beforeFirst();
                                 
                                 %>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                               <td>Nombre</td>
                                               <td>Materia</td>
                                               <td>Autor</td>
                                               <td></td>
                                           </thead>
                                 <%
                                 
                                 while(result.next()) {
                                     %>
                                        <tr>
                                            <td><%out.print(result.getString("nombre"));%></td>
                                            <td><%out.print(result.getString("materia"));%></td>
                                            <td><%out.print(result.getString("autor"));%></td>
                                            <td><a href="verPlan.jsp?id_plan=<%out.print(result.getString("id_plan"));%>">Ver plan</a></td>
                                        </tr>
                                     <%
                                 }
                                 result.close();
                                 %> </table></div><%
                             }
                             else {
                                 %>
                                 <p style="text-align: center">No hay planes aceptados</p> <%} i++;%>
                  </div>
                </div>
          
                 <div class="mdl-cell mdl-cell--1-col">
                <!-- add content here -->
                 </div>
                    
          </div>
            </div>
          </section>
                  <section class="mdl-layout__tab-panel" id="fixed-tab-<%=i%>">
            <div class="page-content">
          <div class="mdl-grid">
                  <div class="mdl-cell mdl-cell--1-col">
                <!-- add content here -->
                </div>
                <div class="mdl-card mdl-cell mdl-cell--10-col mdl-cell--4-col-tablet mdl-shadow--2dp">
                    <div class="mdl-card__title">
                      <h1 class="mdl-card__title-text">Planes pendientes de revisión</h1>
                    </div>
                    <div class="mdl-card__supporting-text">            
                           <%   
                            sql = "SELECT p.id_plan, p.nombre, p.materia, p.estado, concat(m.nombre, ' ',m.apellido_p, ' ',m.apellido_m) as autor from planes p,miembros m where (p.id_autor=m.id_miembro and estado='En revisión' AND p.id_academia="+id_academia+")";                              
                            result = conexion.consulta(sql);
                            
                             if (result.next())
                             {
                                 result.beforeFirst();
                                 %>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                               <td>Nombre</td>
                                               <td>Materia</td>
                                               <td>Autor</td>
                                               <td></td>
                                           </thead>
                                 <%
                                 
                                 while(result.next()) {
                                     %>
                                        <tr>
                                            <td><%out.print(result.getString("p.nombre"));%></td>
                                            <td><%out.print(result.getString("p.materia"));%></td>
                                            <td><%out.print(result.getString("autor"));%></td>
                                            <td><a href="verPlan.jsp?id_plan=<%out.print(result.getString("id_plan"));%>">Ver plan</a></td>
                                        </tr>
                                     <%
                                 }
                                 result.close();
                                 %> </table></div><%
                             }
                             else {
                                 %>
                                 <p style="text-align: center">No hay planes por revisar</p> <%
                              } i++;%>
                  </div>
                </div>
                 <div class="mdl-cell mdl-cell--1-col">
                <!-- add content here -->
                </div>
          </div>
            </div>
                  </section>
                  <%
                     if ("Presidente".equals(tipoUsuario) || "Secretario".equals(tipoUsuario)) {
                         
                  %>
                  
                  <section class="mdl-layout__tab-panel" id="fixed-tab-<%=i%>">
            <div class="page-content">
          <div class="mdl-grid">
                        <div class="mdl-cell mdl-cell--1-col">
                        <!-- add content here -->
                        </div>
                        <div class="mdl-card mdl-cell mdl-cell--10-col mdl-cell--4-col-tablet mdl-shadow--2dp">
                        <div class="mdl-card__title">
                          <h1 class="mdl-card__title-text">Planes pendientes</h1>
                        </div>
                        <div class="mdl-card__supporting-text">     
                        <%
                                    sql = "SELECT p.id_plan, p.nombre, p.materia, p.estado, concat(m.nombre, ' ',m.apellido_p, ' ',m.apellido_m) as autor from planes p, miembros m where (p.id_autor=m.id_miembro and estado='Pendiente' AND p.id_academia="+id_academia+")"; 
                                    result = conexion.consulta(sql);
                                    if (result.next())
                                    {
                                        result.beforeFirst();
                                 %>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                               <td>Nombre</td>
                                               <td>Materia</td>
                                               <td>Autor</td>
                                               <td></td>
                                           </thead>
                                 <%
                                 
                                 while(result.next()) {
                                     %>
                                        <tr>
                                            <td><%out.print(result.getString("p.nombre"));%></td>
                                            <td><%out.print(result.getString("p.materia"));%></td>
                                            <td><%out.print(result.getString("autor"));%></td>
                                            <td><a href="verPlan.jsp?id_plan=<%out.print(result.getString("id_plan"));%>">Ver plan</a></td>
                                        </tr>
                                     <%
                                 }
                                 result.close();
                                 %> </table></div><%
                             }
                             else {
                                 %>
                                 <p style="text-align: center">No hay pendientes</p> <%
                                    conexion.cerrar();}%>
                  </div>
                </div>
                 <div class="mdl-cell mdl-cell--1-col">
                <!-- add content here -->
                </div>
                   </div>
            </div>
                  </section>
         <% } %>
      </main>
      <div class="mdl-layout__obfuscator"></div>
    </div>
         <!-- Modal enviar Mensaje -->
            <div class="modal fade" id="enviarPlan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Mandar plan</h4>
                  </div>
                  <form action="cargarPlan" method="post" enctype="multipart/form-data">
                  <div class="modal-body">
                      <div class="form-group">
                        <label for="archivo">Archivo</label>
                        <input type="file" id="archivo" name="archivo" required>
                        </div>
                        <div class="form-group">
                            <label for="materia">Materia</label>
                            <input type="text" class="form-control" id="materia" placeholder="Materia" name="materia" required>
                        </div>
                        <div class="form-group">
                            <label for="comentario">Comentarios</label>
                            <textarea class="form-control" rows="6" id="comentario" placeholder="Comentario" name="comentario"></textarea>
                        </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary">Mandar plan</button>
                  </div>
                    </form>
                </div>
              </div>
            </div>
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
  </body>
</html>
