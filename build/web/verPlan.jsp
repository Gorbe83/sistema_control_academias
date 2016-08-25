<%--
    Document   : verMensaje
    Created on : 25/10/2015, 11:47:59 AM
    Author     : Gerardo
--%>

<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="sistema.ConexionSQL" %>

<%
    if (request.getParameter("descargarArchivo") != null) {
        String rutaDescarga = "C:\\Users\\Gerardo\\Documents\\Facultad 5E\\Programación Distribuida\\Programas\\SistemaControl\\planes\\";
        
        
        response.setContentType("APPLICATION/OCTET-STREAM");   
        response.setHeader("Content-Disposition","attachment; filename=\"" + request.getParameter("descargarArchivo") + "\"");   

        File file = new File(rutaDescarga + request.getParameter("descargarArchivo"));
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
    String academia = (String)sesion.getAttribute("academia");
     
        
    String sql = "";
    if ("Secretario".equals(tipoUsuario) || "Presidente".equals(tipoUsuario)) {
            if (request.getParameter("enviar_revision") != null) {
                sql = "UPDATE planes SET estado=\"En revisión\" where id_plan="+request.getParameter("enviar_revision");

                ConexionSQL conexion = new ConexionSQL();
                conexion.conecta();
                conexion.ejecuta(sql);
                //Notificacion
                sql = "INSERT INTO notificaciones VALUES("+request.getParameter("enviar_revision")+", CURDATE(),\""+sesion.getAttribute("academia")+"\",\"planes\",\"Nuevo plan en revisión.\")";
                conexion.ejecuta(sql);
                
                conexion.cerrar();
                response.sendRedirect("listaPlanes.jsp");
            }

            else if (request.getParameter("no_aceptar") != null) {
                sql = "UPDATE planes SET estado=\"En edición\" where id_plan="+request.getParameter("no_aceptar");

                ConexionSQL conexion = new ConexionSQL();
                conexion.conecta();
                conexion.ejecuta(sql);
                conexion.cerrar();
                response.sendRedirect("listaPlanes.jsp");
            }

            else if (request.getParameter("retornar") != null) {
                sql = "UPDATE planes SET estado=\"En edición\" where id_plan="+request.getParameter("retornar");

                ConexionSQL conexion = new ConexionSQL();
                conexion.conecta();
                conexion.ejecuta(sql);
                conexion.cerrar();
                response.sendRedirect("listaPlanes.jsp");
            }

            else if (request.getParameter("aceptar") != null) {
                sql = "UPDATE planes SET estado=\"Aceptado\" where id_plan="+request.getParameter("aceptar");

                ConexionSQL conexion = new ConexionSQL();
                conexion.conecta();
                conexion.ejecuta(sql);
                
                //Notificacion
                sql = "INSERT INTO notificaciones VALUES("+request.getParameter("aceptar")+", CURDATE(),\""+sesion.getAttribute("academia")+"\",\"planes\",\"Un plan fue aceptado.\")";
                conexion.ejecuta(sql);
                
                conexion.cerrar();
                response.sendRedirect("listaPlanes.jsp");
            }
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

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  
  <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.css">

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
        .avatar_plan {
            width: 48px;
            height: 48px;
            border-radius: 24px;
        }
    </style>
    </head>
    <body>
        <div class="demo-blog demo-blog--blogpost demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header is-upgraded">
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
          <div class="demo-blog demo-blog__posts mdl-grid">
          <div class="demo-blog mdl-card mdl-shadow--4dp mdl-cell mdl-cell--10-col">
            <div class="demo-blog mdl-color-text--grey-700 mdl-card__supporting-text meta">
                <%
                        ConexionSQL conexion = new ConexionSQL();
                        String idPlan =request.getParameter("id_plan");
                        sql = null;
                        ResultSet result = null;
                        
                        if(conexion.conecta() != 0)
                        {
                            System.out.println("Error al contectar!");
                        }  else {
                            sql = "SELECT p.nombre,p.materia,p.comentarios,p.estado, concat(m.nombre, ' ',m.apellido_p, ' ',m.apellido_m) as autor from planes p,miembros m where m.id_miembro=p.id_autor and id_plan="+idPlan;
                        }
                        
                        result = conexion.consulta(sql);
                        String nombrePlan = "";
                        String materia = "";
                        String comentarios = "";
                        String estado = "";
                        String autor = "";
                        
                         if (result != null)
                         {
                             while(result.next()) {
                                 nombrePlan = result.getString("p.nombre");
                                 materia = result.getString("p.materia");
                                 comentarios = result.getString("p.comentarios");
                                 estado = result.getString("p.estado");
                                 autor = result.getString("autor");
                             }
                         }
                %>
              <div class="minilogo"><img src="images/avatar.jpg" class="avatar_plan"></div>
              <div>
                <strong><%=autor%></strong>
                <span>2 days ago</span>
              </div>
            </div>
            <div class="demo-blog mdl-color-text--grey-700  mdl-card__supporting-text">
                <h3><%=materia%></h3>
                <p>
                    <%
                        String comentarioConSalto= comentarios.replaceAll("\n", "<br/>"); 
                        out.print(comentarioConSalto);
                    %>
                </p>
                <p>
                    Descargar: <%=nombrePlan%>
                </p>
                    <form action="verPlan.jsp" method="get"><button type="submit"  name="descargarArchivo" value="<%=nombrePlan%>">Descargar</button></form>       
                <p>
                    <%
                    if("Secretario".equals(tipoUsuario) || "Presidente".equals(tipoUsuario)) {
                         if ("Pendiente".equals(estado)) {
                           %>
                          <br><br><form action="verPlan.jsp" method="get"><button type="submit"  class="btn btn-primary" name="enviar_revision" value="<%=idPlan%>">Enviar a revisión</button>
                          <button type="submit" class="btn btn-danger" name="no_aceptar" value="<%=idPlan%>">No aceptar</button></form>
                          <%
                         }
                         else if ("En revisión".equals(estado)) {
                             %>
                            <br><br><form action="verPlan.jsp" method="get"><button type="submit"  class="btn btn-primary" name="aceptar" value="<%=idPlan%>">Aceptar plan</button>
                            <button type="submit" class="btn btn-danger" name="retornar" value="<%=idPlan%>">Regresar plan</button></form>
                            <%
                         }

                     }
                     result.close();
                    %>
                </p>
            </div>
            <%
                     sql = "SELECT concat(m.nombre, ' ',m.apellido_p, ' ',m.apellido_m) as autor,c.comentario,c.fecha_creacion from miembros m, comentarios_planes c where m.id_miembro=c.id_autor and id_plan="+idPlan;
                        result = conexion.consulta(sql);
                        if(!"Aceptado".equals(estado) && !"Pendiente".equals(estado)) { 
                            %>
                            <div class="demo-blog mdl-color-text--primary-contrast mdl-card__supporting-text comments">
                                <form action="comentarPlan.jsp" method="post">
                                  <div class="demo-blog mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <textarea rows=1 class="demo-blog mdl-textfield__input" id="comentario" name="comentario" ></textarea>
                                    <label for="comment" class="demo-blog mdl-textfield__label">Escribe un comentario</label>
                                  </div>
                                  <button name="comentarPlan" type="submit" class="demo-blog mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" value="<%=idPlan %>">
                                    <i class="material-icons" role="presentation">check</i><span class="visuallyhidden">add comment</span>
                                  </button>
                                </form>
                            <%
                            
                            if (result.next())
                            {
                                result.beforeFirst();
                                while(result.next()) {
                                    %>
                                        <div class="demo-blog comment mdl-color-text--grey-700">
                                            <header class="demo-blog comment__header">
                                              <img src="images/avatar.jpg" class="comment__avatar">
                                              <div class="demo-blog comment__author">
                                                <strong><%=result.getString("autor")%></strong>
                                                <span>2 days ago</span>
                                              </div>
                                            </header>
                                            <div class="demo-blog comment__text">
                                                <%=result.getString("c.comentario")%>
                                            </div>
                                          </div>
                                            <br>
                                    <%
                                }
                            }
                            %>
                            </div>
                            <%
                        }
                        else {
                            %>
                                <div class="demo-blog mdl-color-text--primary-contrast mdl-card__supporting-text comments">
                            <%
                             if (result.next())
                            {
                                result.beforeFirst();
                                while(result.next()) {
                                    %>
                                        <div class="demo-blog comment mdl-color-text--grey-700">
                                            <header class="demo-blog comment__header">
                                              <img src="images/avatar.jpg" class="comment__avatar">
                                              <div class="demo-blog comment__author">
                                                <strong><%=result.getString("autor")%></strong>
                                                <span>2 days ago</span>
                                              </div>
                                            </header>
                                            <div class="demo-blog comment__text">
                                                <%=result.getString("c.comentario")%>
                                            </div>
                                          </div>
                                            <br>
                                    <%
                                }
                            }
                             %>
                                </div>
                             <%
                        }
                        result.close();
                        conexion.cerrar();
                %>
                       
          </div>
      </main>
      <div class="mdl-layout__obfuscator"></div>
    </div>
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
  </body>
</html>