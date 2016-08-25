package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("    <meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\">\n");
      out.write("    <meta content=\"initial-scale=1.0, width=device-width\" name=\"viewport\">\n");
      out.write("    <title>Login</title>\n");
      out.write("\n");
      out.write("    <!-- css -->\n");
      out.write("    <link href=\"css/base.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <!-- css for this project -->\n");
      out.write("    <link href=\"css/project.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css\" rel=\"stylesheet\">\n");
      out.write("    \n");
      out.write("     ");
 if("true".equals((String)request.getParameter("registro"))) { 
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            alert(\"Miembro agregado satisfactoriamente\");\n");
      out.write("        </script>\n");
      out.write("    ");
 }
    else if("false".equals((String)request.getParameter("registro"))) { 
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            alert(\"No se pudo agregar al miembro\");\n");
      out.write("        </script>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("    <!-- favicon -->\n");
      out.write("    <!-- ... -->\n");
      out.write("\n");
      out.write("    <!-- ie -->\n");
      out.write("            <!--[if lt IE 9]>\n");
      out.write("                    <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n");
      out.write("                    <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n");
      out.write("            <![endif]-->\n");
      out.write("</head>\n");
      out.write("<body class=\"avoid-fout page-brand\">\n");
      out.write("    <div class=\"avoid-fout-indicator avoid-fout-indicator-fixed\">\n");
      out.write("            <div class=\"progress-circular progress-circular-center\">\n");
      out.write("                    <div class=\"progress-circular-wrapper\">\n");
      out.write("                            <div class=\"progress-circular-inner\">\n");
      out.write("                                    <div class=\"progress-circular-left\">\n");
      out.write("                                            <div class=\"progress-circular-spinner\"></div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"progress-circular-gap\"></div>\n");
      out.write("                                    <div class=\"progress-circular-right\">\n");
      out.write("                                            <div class=\"progress-circular-spinner\"></div>\n");
      out.write("                                    </div>\n");
      out.write("                            </div>\n");
      out.write("                    </div>\n");
      out.write("            </div>\n");
      out.write("    </div>\n");
      out.write("    <header class=\"header header-brand\">\n");
      out.write("            <span class=\"header-logo\">SISCOAC</span>\n");
      out.write("    </header>\n");
      out.write("    <div class=\"content\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                            <div class=\"col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3\">\n");
      out.write("                                    <section class=\"content-inner\">\n");
      out.write("                                            <div class=\"card-wrap\">\n");
      out.write("                                                    <div class=\"card\">\n");
      out.write("                                                            <div class=\"card-main\">\n");
      out.write("                                                                    <div class=\"card-header\">\n");
      out.write("                                                                            <div class=\"card-inner\">\n");
      out.write("                                                                                    <h1 class=\"card-heading\">Inicio de Sesión</h1>\n");
      out.write("                                                                            </div>\n");
      out.write("                                                                    </div>\n");
      out.write("                                                                    <div class=\"card-inner\">\n");
      out.write("                                                                            <form class=\"form\" action=\"comprobarLogIn.jsp\" method=\"post\">\n");
      out.write("                                                                                    <div class=\"form-group form-group-label\">\n");
      out.write("                                                                                            <div class=\"row\">\n");
      out.write("                                                                                                    <div class=\"col-md-10 col-md-push-1\">\n");
      out.write("                                                                                                            <label class=\"floating-label\" for=\"login-username\">Correo electrónico</label>\n");
      out.write("                                                                                                            <input class=\"form-control\" id=\"login-username\" type=\"email\" name=\"email\" required>\n");
      out.write("                                                                                                    </div>\n");
      out.write("                                                                                            </div>\n");
      out.write("                                                                                    </div>\n");
      out.write("                                                                                    <div class=\"form-group form-group-label\">\n");
      out.write("                                                                                            <div class=\"row\">\n");
      out.write("                                                                                                    <div class=\"col-md-10 col-md-push-1\">\n");
      out.write("                                                                                                            <label class=\"floating-label\" for=\"login-password\">Contraseña</label>\n");
      out.write("                                                                                                            <input class=\"form-control\" id=\"login-password\" type=\"password\" name=\"password\" required>\n");
      out.write("                                                                                                    </div>\n");
      out.write("                                                                                            </div>\n");
      out.write("                                                                                    </div>\n");
      out.write("                                                                                    <div class=\"form-group\">\n");
      out.write("                                                                                            <div class=\"row\">\n");
      out.write("                                                                                                    <div class=\"col-md-10 col-md-push-1\">\n");
      out.write("                                                                                                            <button type=\"submit\" class=\"btn btn-block waves-attach waves-button\" onclick=\"this.form.password.value = MD5(this.form.password.value)\">Entrar</button>\n");
      out.write("                                                                                                    </div>\n");
      out.write("                                                                                            </div>\n");
      out.write("                                                                                    </div>\n");
      out.write("                                                                            </form>\n");
      out.write("                                                                    </div>\n");
      out.write("                                                            </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"clearfix\">\n");
      out.write("                                                    <p style=\"text-align: center;\" class=\"margin-no-top pull-none\"><a class=\"btn btn-flat btn-blue waves-attach\" data-toggle=\"modal\" href=\"#modal\">Crea una cuenta</a></p>\n");
      out.write("                                            </div>\n");
      out.write("                                    </section>\n");
      out.write("                            </div>\n");
      out.write("                    </div>\n");
      out.write("            </div>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <div aria-hidden=\"true\" class=\"modal fade\" id=\"modal\" role=\"dialog\" tabindex=\"-1\">\n");
      out.write("            <div class=\"modal-dialog modal-xs\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                            <div class=\"modal-heading\">\n");
      out.write("                                    <a class=\"modal-close\" data-dismiss=\"modal\">&times;</a>\n");
      out.write("                                    <h2 class=\"modal-title\">Crear cuenta</h2>\n");
      out.write("                            </div>\n");
      out.write("                            <form action=\"guarda-miembro.jsp\" method=\"POST\" class=\"form\">\n");
      out.write("                            <div class=\"modal-inner\">\n");
      out.write("                                            <div class=\"form-group form-group-label\">\n");
      out.write("                                                    <div class=\"row\">\n");
      out.write("                                                            <div class=\"col-lg-10 col-sm-12\">\n");
      out.write("                                                                    <label class=\"floating-label\" for=\"nombre\">Nombre</label>\n");
      out.write("                                                                    <input class=\"form-control\" id=\"nombre\" type=\"text\" name=\"nombre\" required>\n");
      out.write("                                                            </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group form-group-label\">\n");
      out.write("                                                    <div class=\"row\">\n");
      out.write("                                                            <div class=\"col-lg-10 col-sm-12\">\n");
      out.write("                                                                    <label class=\"floating-label\" for=\"apellido_p\">Apellido Paterno</label>\n");
      out.write("                                                                    <input class=\"form-control\" id=\"apellido_p\" type=\"text\" name=\"apellido_p\" required>\n");
      out.write("                                                            </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group form-group-label\">\n");
      out.write("                                                    <div class=\"row\">\n");
      out.write("                                                            <div class=\"col-lg-10 col-sm-12\">\n");
      out.write("                                                                    <label class=\"floating-label\" for=\"apellido_m\">Apellido Materno</label>\n");
      out.write("                                                                    <input class=\"form-control\" id=\"apellido_m\" type=\"text\" name=\"apellido_m\" required>\n");
      out.write("                                                            </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group form-group-label\">\n");
      out.write("                                                    <div class=\"row\">\n");
      out.write("                                                            <div class=\"col-lg-10 col-sm-12\">\n");
      out.write("                                                                    <label class=\"floating-label\" for=\"email\">Correo electrónico</label>\n");
      out.write("                                                                    <input class=\"form-control\" id=\"email\" type=\"email\" name=\"email\" required>\n");
      out.write("                                                            </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group form-group-label\">\n");
      out.write("                                                    <div class=\"row\">\n");
      out.write("                                                            <div class=\"col-lg-10 col-sm-12\">\n");
      out.write("                                                                    <label class=\"floating-label\" for=\"contrasenia\">Contraseña</label>\n");
      out.write("                                                                    <input class=\"form-control\" id=\"contrasenia\" type=\"password\" name=\"contrasenia\" required>\n");
      out.write("                                                            </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                            </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"modal-footer\">\n");
      out.write("                                        <p class=\"text-right\"><button class=\"btn btn-flat btn-brand waves-attach\" data-dismiss=\"modal\" type=\"button\">Cerrar</button><button type=\"submit\" class=\"btn btn-flat btn-brand waves-attach\" onclick=\"this.form.contrasenia.value = MD5(this.form.contrasenia.value)\">Crear cuenta</button></p>\n");
      out.write("                                </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("            </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- js -->\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>\n");
      out.write("    <script src=\"js/base.min.js\"></script>\n");
      out.write("    <script src=\"js/MD5.js\"></script>\n");
      out.write("    \n");
      out.write("    <!-- js for this project -->\n");
      out.write("    <script src=\"js/project.min.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
