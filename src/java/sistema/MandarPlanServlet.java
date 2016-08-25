/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistema;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Gerardo
 */
@WebServlet(urlPatterns = "/cargarPlan") 
@MultipartConfig 
public class MandarPlanServlet extends HttpServlet {

        public MandarPlanServlet() { 
           super(); 
        }

        @Override
        protected void doGet(HttpServletRequest request, 
            HttpServletResponse response) throws ServletException, IOException { 
            String archivo = null;

            for (Part part : request.getParts()) { 
              InputStream is = request.getPart(part.getName()).getInputStream(); 
              int i = is.available(); 
              byte[] b  = new byte[i]; 
              is.read(b); 
              String fileName = getFileName(part); 
              if (fileName != null) {
                FileOutputStream os = new FileOutputStream("C:\\Users\\Gerardo\\Documents\\Facultad 5E\\Programación Distribuida\\Programas\\SistemaControl\\planes\\" + fileName); 
                os.write(b); 
                archivo = fileName;
              }
              is.close(); 
            }

            HttpSession sesion=request.getSession();
            String  academia = (String) sesion.getAttribute("id_academia");
            String materia = request.getParameter("materia");
            String comentario = request.getParameter("comentario");
            String estado = "Pendiente";
            String autor = (String) sesion.getAttribute("id_miembro");

            Plan cargarPlan = new Plan(archivo,academia,materia,comentario,estado,autor);

            cargarPlan.nuevoPlan();
                
            request.setAttribute("message", cargarPlan.resultado);

        }

        private String getFileName(Part part) { 
          String partHeader = part.getHeader("content-disposition"); 
          for (String cd : part.getHeader("content-disposition").split(";")) { 
            if (cd.trim().startsWith("filename")) { 
              return cd.substring(cd.indexOf('=') + 1).trim() 
                  .replace("\"", ""); 
            } 
          } 
          return null;

        }

        @Override
        protected void doPost(HttpServletRequest request, 
            HttpServletResponse response) throws ServletException, IOException { 
          doGet(request, response);
          response.sendRedirect("listaPlanes.jsp?plan=true");
        }

}
