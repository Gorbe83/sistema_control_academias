<%--
    Document   : altaProfesores
    Created on : 28/10/2015, 10:20:17 PM
    Author     : Gerardo
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="sistema.Miembro"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
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
    <title>Registrar miembros</title>

    <link rel="shortcut icon" href="images/favicon.png">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->
    
    <% if((String)request.getParameter("registro") != null) { %>
        <script type="text/javascript">
            alert(<%=(String)request.getParameter("registro")%>);
        </script>
    <% } %>
    
    <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.css">
    
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="css/styles.css">
    
    <% 
    String id_academia = request.getParameter("id_academia");
    String academia = request.getParameter("academia");
    %>
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
          <a class="mdl-navigation__link" href="elegirAcademia.jsp"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">people</i>Registrar</a>
          <div class="mdl-layout-spacer"></div>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">help_outline</i><span class="visuallyhidden">Help</span></a>
        </nav>
      </div>
      <main class="mdl-layout__content mdl-color--grey-100">
           <h2 style="text-align:center;">Registrar miembros</h2>
           <form name="forma1" action="registro.jsp?id_academia=<%=id_academia%>" method="post">
          <br>
          <%
                    ConexionSQL conexion = new ConexionSQL();
                    String sql = null;
                    ResultSet result;

                    if(conexion.conecta() != 0)
                    {
                        System.out.println("Error al contectar!");
                    }  else {
                        sql = "SELECT m.id_miembro,m.nombre, m.apellido_p, m.apellido_m, r.rol FROM miembros m,roles_miembros r,academias a WHERE (m.id_miembro=r.id_miembro AND r.id_academia=a.id_academia AND a.id_academia="+id_academia+") ORDER BY FIELD (r.rol,\"Secretario\",\"Presidente\",\"Profesor\")"; 
                    }
                    
                    List<Miembro> miembros = new ArrayList<Miembro>();
                    String presidente = null;
                    int id_presidente = 0;
                    String secretario = null;
                    int id_secretario = 0;
                    int iPresidente = 0;
                    int iSecretario = 0;
                    Miembro miembro = null;
                    result = conexion.consulta(sql);
                     if (result.next())
                     {
                         result.beforeFirst();
                         while(result.next()) 
                         {
                             miembro = new Miembro(result.getString("m.nombre"),result.getString("m.apellido_p"),result.getString("m.apellido_m"),result.getString("r.rol"),result.getInt("m.id_miembro"));
                             miembros.add(miembro);
                         }
                         
                         if("Secretario".equals(miembros.get(0).getTipoUsuario()))
                         {
                             id_secretario = miembros.get(0).getId_miembro();
                             secretario = miembros.get(0).getNombre() + " " + miembros.get(0).getApellido_p() + " " +miembros.get(0).getApellido_m();
                             if(miembros.size() > 1)
                             {
                                if("Presidente".equals(miembros.get(1).getTipoUsuario()))
                                {
                                     id_presidente = miembros.get(1).getId_miembro();
                                     presidente = miembros.get(1).getNombre() + " " + miembros.get(1).getApellido_p() + " " +miembros.get(1).getApellido_m();
                                     iPresidente = 1;
                                }
                             }
                             iSecretario = 0;
                         }
                         else if("Presidente".equals(miembros.get(0).getTipoUsuario()))
                         {
                             id_presidente = miembros.get(0).getId_miembro();
                             presidente = miembros.get(0).getNombre() + " " + miembros.get(0).getApellido_p() + " " +miembros.get(0).getApellido_m();
                             iPresidente = 0;
                         }
                         
                     }
                     
             %>
                    <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--1-col">
                      <!-- add content here -->
                    </div>
                    <div class="mdl-cell mdl-cell--3-col">
                        <h3>Presidente</h3>
                        <%
                            if(presidente != null)
                            {
                                out.println("<p>"+presidente+"</p>");
                                miembros.remove(iPresidente);
                            }
                            else
                                out.println("<p>No hay un presidente registrado</p>");
                        %>
                    </div>
                    <div class="mdl-cell mdl-cell--3-col">
                        <h3>Secretario</h3>
                        <%
                            if(secretario != null)
                            {
                               out.println("<p>"+secretario+"</p>");
                               miembros.remove(iSecretario);
                            }
                           else
                               out.println("<p>No hay un secretario registrado</p>");
                        %>
                    </div>
                    <div class="mdl-cell mdl-cell--3-col">
                        <h3>Profesores</h3>
                        <%
                            if(!miembros.isEmpty())
                            {
                                int i = 0;
                                while(!miembros.isEmpty())
                                {
                                    out.println("<p>"+miembros.get(i).getNombre() 
                                            + " " + miembros.get(i).getApellido_p() 
                                            + " " +miembros.get(i).getApellido_m()
                                    +"</p>");
                                    miembros.remove(i);
                                }
                            }
                            else
                                out.println("<p>No hay profesores registrados</p>");

                            result.close();
                         %>
                    </div>
                    <div class="mdl-cell mdl-cell--2-col">
                        
                    </div>
                    
                    <div class="mdl-cell mdl-cell--12-col">
                        <h2 style="text-align:center;">Elegir miembros</h2>
                     </div>
                    
                    <%
                     List<Miembro> sinAcademia = new ArrayList<Miembro>();
                     
                     sql = "SELECT id_miembro,nombre, apellido_p, apellido_m FROM miembros WHERE id_miembro NOT IN(select distinct id_miembro from roles_miembros)";          
                     result = conexion.consulta(sql);
                     if (result.next())
                     {
                         result.beforeFirst();
                         while(result.next())
                         {
                             miembro = new Miembro(result.getString("nombre"),result.getString("apellido_p"),result.getString("apellido_m"),result.getInt("id_miembro"));
                             sinAcademia.add(miembro);
                         }
                     }
                     result.close();
                     
                     List<Miembro> conAcademia = new ArrayList<Miembro>();
                     sql = "SELECT distinct m.id_miembro,m.nombre, m.apellido_p, m.apellido_m FROM miembros m, roles_miembros r, academias a WHERE m.id_miembro = r.id_miembro AND r.id_academia=a.id_academia AND r.id_miembro NOT IN(SELECT id_miembro FROM roles_miembros WHERE id_academia IN ("+id_academia+",8))";
                     result = conexion.consulta(sql);
                     if (result.next())
                     {
                         result.beforeFirst();
                         while(result.next())
                         {
                             miembro = new Miembro(result.getString("m.nombre"),result.getString("m.apellido_p"),result.getString("m.apellido_m"),result.getInt("m.id_miembro"));
                             conAcademia.add(miembro);
                         }
                     }
                     result.close();
                     
                     List<Miembro> enAcademia = new ArrayList<Miembro>();
                     
                     sql = "SELECT m.id_miembro,m.nombre, m.apellido_p, m.apellido_m FROM miembros m,roles_miembros r,academias a WHERE m.id_miembro=r.id_miembro AND r.id_academia=a.id_academia AND r.rol=\"Profesor\" and a.id_academia="+id_academia;
                     result = conexion.consulta(sql);
                     if (result.next())
                     {
                         result.beforeFirst();
                         while(result.next())
                         {
                             miembro = new Miembro(result.getString("m.nombre"),result.getString("m.apellido_p"),result.getString("m.apellido_m"),result.getInt("m.id_miembro"));
                             enAcademia.add(miembro);
                         }
                     }
                     result.close();
                     conexion.cerrar();
                     
                     if(sinAcademia.isEmpty() && conAcademia.isEmpty() && enAcademia.isEmpty()) {
                         %>
                         <div class="mdl-cell mdl-cell--12-col">
                                <p style="text-align:center;">No hay miembros por registrar en esta academia</p>
                        </div>
                         <% }
                      else
                     {
                     
            %>
            <div class="mdl-cell mdl-cell--12-col">
                    
            </div>
            <%         
                     int i = 0;
                     int id = 0;
                     String nombreUsuario = null;
                     if((presidente == null) && (secretario == null))
                     {
                         %>
                            <div class="mdl-cell mdl-cell--3-col"></div>
                            <div class="mdl-cell mdl-cell--2-col"><h4>Elegir profesores</h4></div>
                            <div class="mdl-cell mdl-cell--2-col"><h4>Elegir presidente</h4></div>
                            <div class="mdl-cell mdl-cell--2-col"><h4>Elegir secretario</h4></div>
                            <div class="mdl-cell mdl-cell--3-col"></div>
                        <%
                            
                            while(!sinAcademia.isEmpty())
                            {
                                nombreUsuario = sinAcademia.get(i).getNombre() + " " + sinAcademia.get(i).getApellido_p() + " " + sinAcademia.get(i).getApellido_m();
                                %>
                                <div class="mdl-cell mdl-cell--3-col"></div>
                                <div class="mdl-cell mdl-cell--2-col">
                                    <label class="check-inline" for="profesor<%=sinAcademia.get(i).getId_miembro()%>">
                                          <input type="checkbox" class="mdl-checkbox__input" id="profesor<%=sinAcademia.get(i).getId_miembro()%>" name="profesor" value="<%=sinAcademia.get(i).getId_miembro()%>">
                                          <span><%=nombreUsuario%></span>
                                    </label>
                                </div>
                                    
                                <div class="mdl-cell mdl-cell--2-col">
                                    <label class="radio-inline" for="presidente<%=sinAcademia.get(i).getId_miembro()%>">
                                          <input type="radio" class="mdl-radio__button" id="presidente<%=sinAcademia.get(i).getId_miembro()%>" name="presidente" value="<%=sinAcademia.get(i).getId_miembro()%>" onclick="desactivarOpuesto('presidente','secretario<%=sinAcademia.get(i).getId_miembro()%>')">
                                          <span><%=nombreUsuario%></span>
                                    </label>
                                </div>
                               
                               <div class="mdl-cell mdl-cell--2-col">
                                    <label class="radio-inline" for="secretario<%=sinAcademia.get(i).getId_miembro()%>">
                                          <input type="radio" class="mdl-radio__button" id="secretario<%=sinAcademia.get(i).getId_miembro()%>" name="secretario" value="<%=sinAcademia.get(i).getId_miembro()%>" onclick="desactivarOpuesto('secretario','presidente<%=sinAcademia.get(i).getId_miembro()%>')">
                                          <span><%=nombreUsuario%></span>
                                    </label>
                                </div>
                                <div class="mdl-cell mdl-cell--3-col"></div>
                                <%
                                
                                sinAcademia.remove(i);
                                id++;
                            }
                            
                            while(!conAcademia.isEmpty())
                            {
                                nombreUsuario = conAcademia.get(i).getNombre() + " " + conAcademia.get(i).getApellido_p() + " " + conAcademia.get(i).getApellido_m();
                                %>
                                    <div class="mdl-cell mdl-cell--3-col"></div>
                                        <div class="mdl-cell mdl-cell--2-col">
                                            <label class="check-inline" for="profesor<%=conAcademia.get(i).getId_miembro()%>">
                                                  <input type="checkbox" class="mdl-checkbox__input" id="profesor<%=conAcademia.get(i).getId_miembro()%>" name="profesor" value="<%=conAcademia.get(i).getId_miembro()%>">
                                                  <span><%=nombreUsuario%></span>
                                            </label>
                                        </div>

                                        <div class="mdl-cell mdl-cell--2-col">
                                            <label class="radio-inline" for="presidente<%=conAcademia.get(i).getId_miembro()%>">
                                                  <input type="radio" class="mdl-radio__button" id="presidente<%=conAcademia.get(i).getId_miembro()%>" name="presidente" value="<%=conAcademia.get(i).getId_miembro()%>" onclick="desactivarOpuesto('presidente','secretario<%=conAcademia.get(i).getId_miembro()%>')">
                                                  <span><%=nombreUsuario%></span>
                                            </label>
                                        </div>

                                       <div class="mdl-cell mdl-cell--2-col">
                                            <label class="radio-inline" for="secretario<%=conAcademia.get(i).getId_miembro()%>">
                                                  <input type="radio" class="mdl-radio__button" id="secretario<%=conAcademia.get(i).getId_miembro()%>" name="secretario" value="<%=conAcademia.get(i).getId_miembro()%>" onclick="desactivarOpuesto('secretario','presidente<%=conAcademia.get(i).getId_miembro()%>')">
                                                  <span><%=nombreUsuario%></span>
                                            </label>
                                        </div>
                                        <div class="mdl-cell mdl-cell--3-col"></div>
                                <%
                                
                                conAcademia.remove(i);
                                id++;
                            }
                            
                            while(!enAcademia.isEmpty())
                            {
                                nombreUsuario = enAcademia.get(i).getNombre() + " " + enAcademia.get(i).getApellido_p() + " " + enAcademia.get(i).getApellido_m();
                                %>
                                    <div class="mdl-cell mdl-cell--3-col"></div>
                                    <div class="mdl-cell mdl-cell--2-col">
                                        <label class="check-inline" for="profesor<%=enAcademia.get(i).getId_miembro()%>">
                                              <input type="checkbox" class="mdl-checkbox__input" id="profesor<%=enAcademia.get(i).getId_miembro()%>" name="profesor" value="<%=enAcademia.get(i).getId_miembro()%>">
                                              <span><%=nombreUsuario%></span>
                                        </label>
                                    </div>

                                    <div class="mdl-cell mdl-cell--2-col">
                                        <label class="radio-inline" for="presidente<%=enAcademia.get(i).getId_miembro()%>">
                                              <input type="radio" class="mdl-radio__button" id="presidente<%=enAcademia.get(i).getId_miembro()%>" name="presidente" value="<%=enAcademia.get(i).getId_miembro()%>" onclick="desactivarOpuesto('presidente','secretario<%=enAcademia.get(i).getId_miembro()%>')">
                                              <span><%=nombreUsuario%></span>
                                        </label>
                                    </div>

                                   <div class="mdl-cell mdl-cell--2-col">
                                        <label class="radio-inline" for="secretario<%=enAcademia.get(i).getId_miembro()%>">
                                              <input type="radio" class="mdl-radio__button" id="secretario<%=enAcademia.get(i).getId_miembro()%>" name="secretario" value="<%=enAcademia.get(i).getId_miembro()%>" onclick="desactivarOpuesto('secretario','presidente<%=enAcademia.get(i).getId_miembro()%>')">
                                              <span><%=nombreUsuario%></span>
                                        </label>
                                    </div>
                                    <div class="mdl-cell mdl-cell--3-col"></div>
                                <%
                                
                                enAcademia.remove(i);
                                id++;
                            }
                     }
                     
                     else if((presidente != null) && (secretario == null))
                     {
                         %>
                            <div class="mdl-cell mdl-cell--2-col"></div>
                            <div class="mdl-cell mdl-cell--4-col"><h4>Elegir profesores</h4></div>
                            <div class="mdl-cell mdl-cell--4-col"><h4>Elegir secretario</h4></div>
                            <div class="mdl-cell mdl-cell--2-col"></div>
                        <%
                            
                            while(!sinAcademia.isEmpty())
                            {
                                nombreUsuario = sinAcademia.get(i).getNombre() + " " + sinAcademia.get(i).getApellido_p() + " " + sinAcademia.get(i).getApellido_m();
                                %>
                                    <div class="mdl-cell mdl-cell--2-col"></div>
                                    <div class="mdl-cell mdl-cell--4-col">
                                        <label class="check-inline" for="profesor<%=sinAcademia.get(i).getId_miembro()%>">
                                              <input type="checkbox" class="mdl-checkbox__input" id="profesor<%=sinAcademia.get(i).getId_miembro()%>" name="profesor" value="<%=sinAcademia.get(i).getId_miembro()%>">
                                              <span><%=nombreUsuario%></span>
                                        </label>
                                    </div>

                                   <div class="mdl-cell mdl-cell--4-col">
                                        <label class="radio-inline" for="secretario<%=sinAcademia.get(i).getId_miembro()%>">
                                              <input type="radio" class="mdl-radio__button" id="secretario<%=sinAcademia.get(i).getId_miembro()%>" name="secretario" value="<%=sinAcademia.get(i).getId_miembro()%>">
                                              <span><%=nombreUsuario%></span>
                                        </label>
                                    </div>
                                    <div class="mdl-cell mdl-cell--2-col"></div>
                                <%
                                
                                sinAcademia.remove(i);
                            }
                            
                            while(!conAcademia.isEmpty())
                            {
                                nombreUsuario = conAcademia.get(i).getNombre() + " " + conAcademia.get(i).getApellido_p() + " " + conAcademia.get(i).getApellido_m();
                                
                                %>
                                    <div class="mdl-cell mdl-cell--2-col"></div>
                                    <div class="mdl-cell mdl-cell--4-col">
                                        <label class="check-inline" for="profesor<%=conAcademia.get(i).getId_miembro()%>">
                                              <input type="checkbox" class="mdl-checkbox__input" id="profesor<%=conAcademia.get(i).getId_miembro()%>" name="profesor" value="<%=conAcademia.get(i).getId_miembro()%>">
                                              <span><%=nombreUsuario%></span>
                                        </label>
                                    </div>

                                   <div class="mdl-cell mdl-cell--4-col">
                                        <label class="radio-inline" for="secretario<%=conAcademia.get(i).getId_miembro()%>">
                                              <input type="radio" class="mdl-radio__button" id="secretario<%=conAcademia.get(i).getId_miembro()%>" name="secretario" value="<%=conAcademia.get(i).getId_miembro()%>">
                                              <span><%=nombreUsuario%></span>
                                        </label>
                                    </div>
                                    <div class="mdl-cell mdl-cell--2-col"></div>
                                <%
                                
                                conAcademia.remove(i);
                            }
                            
                            if(enAcademia.isEmpty())
                            {
                                
                                %>
                                    <div class="mdl-cell mdl-cell--2-col"></div>
                                    <div class="mdl-cell mdl-cell--4-col">
                                        <label class="check-inline" for="profesor<%=id_presidente%>">
                                              <input type="checkbox" class="mdl-checkbox__input" id="profesor<%=id_presidente%>" name="profesor" value="<%=id_presidente%>">
                                              <span><%=presidente%></span>
                                        </label>
                                    </div>
                                    <div class="mdl-cell mdl-cell--6-col"></div>
                                <%
                            }
                            else
                            {
                                while(!enAcademia.isEmpty())
                                {
                                    if(id_presidente != enAcademia.get(i).getId_miembro())
                                    {
                                        nombreUsuario = enAcademia.get(i).getNombre() + " " + enAcademia.get(i).getApellido_p() + " " + enAcademia.get(i).getApellido_m();
                                        
                                        %>
                                            <div class="mdl-cell mdl-cell--6-col"></div>
                                            <div class="mdl-cell mdl-cell--4-col">
                                                <label class="radio-inline" for="secretario<%=enAcademia.get(i).getId_miembro()%>">
                                                      <input type="radio" class="mdl-radio__button" id="secretario<%=enAcademia.get(i).getId_miembro()%>" name="secretario" value="<%=enAcademia.get(i).getId_miembro()%>">
                                                      <span><%=nombreUsuario%></span>
                                                </label>
                                            </div>
                                            <div class="mdl-cell mdl-cell--2-col"></div>
                                        <%
                                    }

                                    enAcademia.remove(i);
                                }
                            }
                     }
                     
                     else if((presidente == null) && (secretario != null))
                     {
                            %>
                                <div class="mdl-cell mdl-cell--2-col"></div>
                                <div class="mdl-cell mdl-cell--4-col"><h4>Elegir profesores</h4></div>
                                <div class="mdl-cell mdl-cell--4-col"><h4>Elegir presidente</h4></div>
                                <div class="mdl-cell mdl-cell--2-col"></div>
                            <%
                            
                            while(!sinAcademia.isEmpty())
                            {
                                nombreUsuario = sinAcademia.get(i).getNombre() + " " + sinAcademia.get(i).getApellido_p() + " " + sinAcademia.get(i).getApellido_m();
                               
                                %>
                                    <div class="mdl-cell mdl-cell--2-col"></div>
                                    <div class="mdl-cell mdl-cell--4-col">
                                        <label class="check-inline" for="profesor<%=sinAcademia.get(i).getId_miembro()%>">
                                              <input type="checkbox" class="mdl-checkbox__input" id="profesor<%=sinAcademia.get(i).getId_miembro()%>" name="profesor" value="<%=sinAcademia.get(i).getId_miembro()%>">
                                              <span><%=nombreUsuario%></span>
                                        </label>
                                    </div>

                                   <div class="mdl-cell mdl-cell--4-col">
                                        <label class="radio-inline" for="presidente<%=sinAcademia.get(i).getId_miembro()%>">
                                              <input type="radio" class="mdl-radio__button" id="presidente<%=sinAcademia.get(i).getId_miembro()%>" name="presidente" value="<%=sinAcademia.get(i).getId_miembro()%>">
                                              <span><%=nombreUsuario%></span>
                                        </label>
                                    </div>
                                    <div class="mdl-cell mdl-cell--2-col"></div>
                                <%
                                
                                sinAcademia.remove(i);
                            }
                            
                            while(!conAcademia.isEmpty())
                            {
                                nombreUsuario = conAcademia.get(i).getNombre() + " " + conAcademia.get(i).getApellido_p() + " " + conAcademia.get(i).getApellido_m();
                                
                                %>
                                    <div class="mdl-cell mdl-cell--2-col"></div>
                                    <div class="mdl-cell mdl-cell--4-col">
                                        <label class="check-inline" for="profesor<%=conAcademia.get(i).getId_miembro()%>">
                                              <input type="checkbox" class="mdl-checkbox__input" id="profesor<%=conAcademia.get(i).getId_miembro()%>" name="profesor" value="<%=sinAcademia.get(i).getId_miembro()%>">
                                              <span><%=nombreUsuario%></span>
                                        </label>
                                    </div>

                                   <div class="mdl-cell mdl-cell--4-col">
                                        <label class="radio-inline" for="presidente<%=conAcademia.get(i).getId_miembro()%>">
                                              <input type="radio" class="mdl-radio__button" id="presidente<%=conAcademia.get(i).getId_miembro()%>" name="presidente" value="<%=sinAcademia.get(i).getId_miembro()%>">
                                              <span><%=nombreUsuario%></span>
                                        </label>
                                    </div>
                                    <div class="mdl-cell mdl-cell--2-col"></div>
                                <%
                                
                                conAcademia.remove(i);
                            }
                            
                            if(enAcademia.isEmpty())
                            {
                                
                                %>
                                    <div class="mdl-cell mdl-cell--2-col"></div>
                                    <div class="mdl-cell mdl-cell--4-col">
                                        <label class="check-inline" for="profesor<%=id_secretario%>">
                                              <input type="checkbox" class="mdl-checkbox__input" id="profesor<%=id_secretario%>" name="profesor" value="<%=id_secretario%>">
                                              <span><%=secretario%></span>
                                        </label>
                                    </div>
                                    <div class="mdl-cell mdl-cell--6-col"></div>
                                <%
                            }
                            else
                            {
                                while(!enAcademia.isEmpty())
                                {
                                    if(id_secretario == enAcademia.get(i).getId_miembro())
                                    {
                                        nombreUsuario = enAcademia.get(i).getNombre() + " " + enAcademia.get(i).getApellido_p() + " " + enAcademia.get(i).getApellido_m();
                                        
                                        %>
                                            <div class="mdl-cell mdl-cell--6-col"></div>
                                            <div class="mdl-cell mdl-cell--4-col">
                                                <label class="radio-inline" for="presidente<%=enAcademia.get(i).getId_miembro()%>">
                                                      <input type="radio" class="mdl-radio__button" id="presidente<%=enAcademia.get(i).getId_miembro()%>" name="presidente" value="<%=enAcademia.get(i).getId_miembro()%>">
                                                      <span><%=nombreUsuario%></span>
                                                </label>
                                            </div>
                                            <div class="mdl-cell mdl-cell--2-col"></div>
                                        <%
                                    }

                                    enAcademia.remove(i);
                                }
                            }
                     }
                     
                     else if((presidente != null) && (secretario != null))
                     {
                            
                            %>
                                <div class="mdl-cell mdl-cell--3-col"></div>
                                <div class="mdl-cell mdl-cell--6-col"><h4>Elegir profesores</h4></div>
                                <div class="mdl-cell mdl-cell--3-col"></div>
                            <%
                            
                            while(!sinAcademia.isEmpty())
                            {
                                nombreUsuario = sinAcademia.get(i).getNombre() + " " + sinAcademia.get(i).getApellido_p() + " " + sinAcademia.get(i).getApellido_m();
                                
                                %>
                                    <div class="mdl-cell mdl-cell--3-col"></div>
                                    <div class="mdl-cell mdl-cell--6-col">
                                        <label class="check-inline" for="profesor<%=sinAcademia.get(i).getId_miembro()%>">
                                              <input type="checkbox" class="mdl-checkbox__input" id="profesor<%=sinAcademia.get(i).getId_miembro()%>" name="profesor" value="<%=sinAcademia.get(i).getId_miembro()%>">
                                              <span><%=nombreUsuario%></span>
                                        </label>
                                    </div>
                                    <div class="mdl-cell mdl-cell--3-col"></div>
                                <%
                                
                                sinAcademia.remove(i);
                            }
                            
                            while(!conAcademia.isEmpty())
                            {
                                nombreUsuario = conAcademia.get(i).getNombre() + " " + conAcademia.get(i).getApellido_p() + " " + conAcademia.get(i).getApellido_m();
                                
                                %>
                                    <div class="mdl-cell mdl-cell--3-col"></div>
                                    <div class="mdl-cell mdl-cell--6-col">
                                        <label class="check-inline" for="profesor<%=conAcademia.get(i).getId_miembro()%>">
                                              <input type="checkbox" class="mdl-checkbox__input" id="profesor<%=conAcademia.get(i).getId_miembro()%>" name="profesor" value="<%=conAcademia.get(i).getId_miembro()%>">
                                              <span><%=nombreUsuario%></span>
                                        </label>
                                    </div>
                                    <div class="mdl-cell mdl-cell--3-col"></div>
                                <%
                                
                                conAcademia.remove(i);
                            }
                            
                            boolean secretarioProfesor = false;
                            boolean presidenteProfesor = false;
                            boolean miembrosDisponibles = false;
                            
                            while(!enAcademia.isEmpty())
                            {
                                if(id_presidente == enAcademia.get(i).getId_miembro() || id_secretario == enAcademia.get(i).getId_miembro())
                                {
                                    if(id_presidente == enAcademia.get(i).getId_miembro())
                                        presidenteProfesor = true;
                                    else if(id_secretario == enAcademia.get(i).getId_miembro())
                                        secretarioProfesor = true;
                                    miembrosDisponibles = true;
                                }
                                
                                enAcademia.remove(i);
                            }
                            
                            if(!secretarioProfesor)
                            {
                                %>
                                    <div class="mdl-cell mdl-cell--3-col"></div>
                                    <div class="mdl-cell mdl-cell--6-col">
                                        <label class="check-inline" for="profesor<%=id_secretario%>">
                                              <input type="checkbox" class="mdl-checkbox__input" id="profesor<%=id_secretario%>" name="profesor" value="<%=id_secretario%>">
                                              <span><%=secretario%></span>
                                        </label>
                                    </div>
                                    <div class="mdl-cell mdl-cell--3-col"></div>
                                <%
                            }
                            
                            if(!presidenteProfesor)
                            {
                                %>
                                    <div class="mdl-cell mdl-cell--3-col"></div>
                                    <div class="mdl-cell mdl-cell--6-col">
                                        <label class="check-inline" for="profesor<%=id_presidente%>">
                                              <input type="checkbox" class="mdl-checkbox__input" id="profesor<%=id_presidente%>" name="profesor" value="<%=id_presidente%>">
                                              <span><%=presidente%></span>
                                        </label>
                                    </div>
                                    <div class="mdl-cell mdl-cell--3-col"></div>
                                <%
                            }
                            
                     }
            %>
                        <br>
                        <div class="mdl-cell mdl-cell--5-col"></div>
                        <div class="mdl-cell mdl-cell--2-col">
                            <button type="submit" class="btn btn-primary center-block">Registrar</button>
                        </div>
                        <div class="mdl-cell mdl-cell--5-col"></div>
                <% } %>
                 </div>
                 <input type="hidden" id="academia" name="academia" value="<%=URLEncoder.encode(request.getParameter("academia"),"UTF-8")%>">
                </form>
        </main>
     </div>
     <script>
        function desactivarOpuesto(tipoUsuario, id) {
            
            document.getElementById(id).checked = false;
        }
    </script>
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
  </body>
</html>