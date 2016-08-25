<%--
    Document   : bandejaMensajes
    Created on : 25/10/2015, 11:10:36 AM
    Author     : Gerardo
--%>

<%@page import="sistema.ConexionSQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page session="true" %>

<% 
    HttpSession sesion=request.getSession(); 
    sesion.setAttribute("tipoUsuario", "");
    sesion.setAttribute("id_academia", "");
    sesion.setAttribute("academia", "");
    String usuario = (String)sesion.getAttribute("usuario"); 
    String id_miembro = (String)sesion.getAttribute("id_miembro");
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
          <div class="mdl-layout-spacer"></div>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">help_outline</i><span class="visuallyhidden">Help</span></a>
        </nav>
      </div>
      <main class="mdl-layout__content mdl-color--grey-100">
        <%
                    ConexionSQL conexion = new ConexionSQL();
                    String sql = null;

                    ResultSet result = null;
                
                     if(conexion.conecta() != 0)
                    {
                        System.out.println("Error al contectar!");    
                    }  else {
                         sql = "SELECT r.rol,a.id_academia,a.academia FROM roles_miembros r,academias a WHERE r.id_academia=a.id_academia AND r.id_miembro="+id_miembro+" ORDER BY a.academia";
                     } 

                    result = conexion.consulta(sql);
                    String academia = "";
                    String id_academia = "";
                    String tipoUsuario = "";
                    String aux = "";
                    if (result.next()) 
                    {
                        if ("Coordinador".equals(result.getString("r.rol")) || "Subdirector".equals(result.getString("r.rol"))) 
                        {
                            tipoUsuario = result.getString("r.rol");
                            result.close();
                            conexion.cerrar();
                            response.sendRedirect("index.jsp?tipoUsuario="+tipoUsuario);
                        }
                        else
                        {
                            result.beforeFirst();
                            int i = 0;
                            while(result.next()) {
                                academia = result.getString("a.academia");
                                id_academia = result.getString("a.id_academia");
                                tipoUsuario = result.getString("r.rol");

                                if (!aux.equals(academia)) 
                                {
                                    %>
                                    </br>
                                    <div class="mdl-card mdl-shadow--2dp demo-card-wide">
                                      <div class="mdl-card__title" style="background: url('img/<%out.print(academia);%>.jpg') center / cover;">
                                        <h2 class="mdl-card__title-text"><%out.print(academia);%></h2>
                                      </div>
                                      <div class="mdl-card__actions mdl-card--border">
                                          <form name="forma<%out.print(i);%>" action="index.jsp" method="get">
                                          <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%out.print(tipoUsuario + id_academia);%>">
                                              <input type="radio" id="<%out.print(tipoUsuario + id_academia);%>" class="mdl-radio__button"  required name="tipoUsuario" value="<%out.print(tipoUsuario);%>">
                                              <span class="mdl-radio__label"><%out.print(tipoUsuario);%></span>
                                          </label>
                                    <%
                                    
                                    aux = academia;
                                }

                                else
                                {
                                    %>
                                    &nbsp;&nbsp;
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="<%out.print(tipoUsuario + id_academia);%>">
                                            <input type="radio" id="<%out.print(tipoUsuario + id_academia);%>" class="mdl-radio__button"  required name="tipoUsuario" value="<%out.print(tipoUsuario);%>" >
                                              <span class="mdl-radio__label"><%out.print(tipoUsuario);%></span>
                                          </label>
                                    <%
                                }   
                                if(result.next()) 
                                {
                                    if(!aux.equals(result.getString("academia")))
                                    {
                                        %>
                                            <input type="hidden" id="id_academia" name="id_academia" value="<%out.print(id_academia);%>">
                                            <input type="hidden" id="academia" name="academia" value="<%out.print(aux);%>">
                                            <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="javascript:viod(0)" onclick="javascript:document.forms['forma<%out.print(i);%>'].submit();">
                                             Entrar
                                           </a>
                                         </form>
                                         </div>
                                       </div>
                                        <%
                                            
                                        i++;
                                    }
                                           result.previous();
                                }
                                else
                                {
                                     %>
                                            <input type="hidden" id="id_academia" name="id_academia" value="<%out.print(id_academia);%>">
                                            <input type="hidden" id="academia" name="academia" value="<%out.print(aux);%>">
                                            <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="javascript:viod(0)" onclick="javascript:document.forms['forma<%out.print(i);%>'].submit();">
                                             Entrar
                                           </a>
                                         </form>
                                         </div>
                                       </div>
                                        <%
                                        
                                        i++;
                                        result.last();
                                }
                            }
                        }
                        
                    }
                    else {
                        out.print("No est&aacute; inscrito a ninguna academia. Contacta con el coordinador de la p&aacute;gina para que te registre en una academia");
                    }
                    
                    result.close();
                    conexion.cerrar();
                %>
                </br>
      </main>
      <div class="mdl-layout__obfuscator"></div>
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
  </body>
</html>