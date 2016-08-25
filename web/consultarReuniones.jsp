<%-- 
    Document   : consultarReuniones
    Created on : 29/10/2015, 01:07:42 AM
    Author     : Gerardo
--%>

<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="sistema.ConexionSQL" %>

<%
    if (request.getAttribute("archivo") != null) {
        String rutaDescarga = "C:\\Users\\Gerardo\\Documents\\Facultad 5E\\Programación Distribuida\\Programas\\SistemaControl\\minutas\\";
        
        
        response.setContentType("APPLICATION/OCTET-STREAM");   
        response.setHeader("Content-Disposition","attachment; filename=\"" + request.getAttribute("archivo") + "\"");   

        File file = new File(rutaDescarga + request.getAttribute("archivo"));
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
    
    HttpSession sesion=request.getSession();
    String usuario = (String)sesion.getAttribute("usuario"); 
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
    <title>Consultar reuniones</title>

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
    
    <% if("true".equals((String)request.getParameter("minuta"))) { %>
        <script type="text/javascript">
            alert("Minuta generada satisfactoriamente");
        </script>
    <% } %>
    
    <% if("true".equals(request.getAttribute("reunion"))) { %>
        <script type="text/javascript">
            alert("Reunión generada satisfactoriamente");
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
          <div class="mdl-grid">
              <div class="mdl-cell mdl-cell--1-col">
                <!-- add content here -->
              </div>
              <div class="mdl-card mdl-cell mdl-cell--10-col mdl-cell--4-col-tablet mdl-shadow--2dp">
                  <div class="mdl-card__title">
                    <h1 class="mdl-card__title-text">Próximas reuniones</h1>
                  </div>
                  <div class="mdl-card__supporting-text">
                      <%
                            ConexionSQL conexion = new ConexionSQL();
                            String sql = null;
                            ResultSet result = null;

                            if(conexion.conecta() != 0)
                            {
                                System.out.println("Error al contectar!");
                            }  else {
                                sql = "SELECT id_reunion,asunto,fecha,hora,lugar from reuniones where id_academia='"+id_academia+"'";
                            }
                        
                            result = conexion.consulta(sql);
                             if (result.next())
                             {
                                 result.beforeFirst();
                                 %>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                               <td>Asunto</td>
                                               <td>Fecha</td>
                                               <td>Hora</td>
                                               <td>Lugar</td>
                                                <%
                                                    if("Secretario".equals(tipoUsuario))
                                                    { %>
                                                    <td></td>
                                                    <% } %>
                                           </thead>
                                 <%
                                 if("Secretario".equals(tipoUsuario))
                                 {
                                    while(result.next()) {
                                    %>
                                        <tr >
                                            <td><%=result.getString("asunto")%></td>
                                            <td><%=result.getString("fecha")%></td>
                                            <td><%=result.getString("hora")%></td>
                                            <td><%=result.getString("lugar")%></td>
                                            <td><a href="generarMinuta.jsp?id_reunion=<%=result.getString("id_reunion")%>&fecha=<%=result.getString("fecha")%>&hora=<%=result.getString("hora")%>&lugar=<%=result.getString("lugar")%>">Generar minuta</a></td>
                                        </tr>
                                    <%
                                    }
                                 }
                                 else {
                                     while(result.next()) {
                                    %>
                                        <tr>
                                            <td><%=result.getString("asunto")%></td>
                                            <td><%=result.getString("fecha")%></td>
                                            <td><%=result.getString("hora")%></td>
                                            <td><%=result.getString("lugar")%></td>
                                        </tr>
                                    <%
                                    }
                                 }
                                 %> </table></div><%
                             }
                             else {
                                 %>
                                 <p style="text-align: center">No hay reuniones próximas</p> <%}
                            result.close();
                            conexion.cerrar();%>
                  </div>
                </div>
                  <div class="mdl-cell mdl-cell--1-col">
                <!-- add content here -->
              </div>
                  <div class="mdl-cell mdl-cell--9-col">
                <!-- add content here -->
              </div>
                  <% if("Presidente".equals(tipoUsuario)) {
                      %>
                        <div class="mdl-cell mdl-cell--2-col">
                              <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" data-toggle="modal" data-target="#nuevaReunion">Nueva Reunión</button>        
                        </div>
                <% } %>
          </div>
      </main>
           </div>
      <!-- Modal enviar Mensaje -->
      <% if("Presidente".equals(tipoUsuario)) {
          %>
                <div class="modal fade" id="nuevaReunion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Nueva reunión</h4>
                      </div>
                      <form action="guarda-reunion.jsp" method="post">
                      <div class="modal-body">
                            <div class="form-group">
                                <label for="asunto">Asunto</label>
                                <input type="text" class="form-control" id="asunto" placeholder="Asunto" name="asunto" required>
                            </div>
                            <div class="form-group">
                                <label for="descripcion">Descripción</label>
                                <textarea rows="4" cols="50" class="form-control" id="descripcion" placeholder="Descripción" name="descripcion" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="fecha">Fecha(AAAA-MM-DD)</label>
                                <input type="text" class="form-control" id="fecha" placeholder="Fecha(AAAA/MM/DD)" name="fecha" required>
                            </div>
                            <div class="form-group">
                                <label for="hora">Hora(HH:MM)</label>
                                <input type="text" class="form-control" id="hora" placeholder="Hora(HH/MM)" name="hora" required>
                            </div>
                            <div class="form-group">
                                <label for="lugar">Lugar</label>
                                <input type="text" class="form-control" id="lugar" placeholder="Lugar" name="lugar" required>
                            </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Crear reunión</button>
                      </div>
                        </form>
                    </div>
                  </div>
                </div>
            <% } %>
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
  </body>
</html>