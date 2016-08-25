/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistema;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Gerardo
 */
@WebServlet(name = "CrearMinuta", urlPatterns = {"/CrearMinuta"})
public class CrearMinutaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            HttpSession sesion=request.getSession();

            int id_reunion = Integer.parseInt(request.getParameter("id_reunion"));
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            String asunto = request.getParameter("asunto");
            String lugar = request.getParameter("lugar");
            String presidente = request.getParameter("presidente");
            int id_presidente = Integer.parseInt(request.getParameter("id_presidente"));
            String secretario = (String)sesion.getAttribute(("usuario"));
            int id_secretario = Integer.parseInt((String)sesion.getAttribute(("id_miembro")));
            int id_academia = Integer.parseInt((String) sesion.getAttribute("id_academia"));
            String ordenDia = request.getParameter("ordenDia");
            String detalles = request.getParameter("detalles");
            String acuerdos = request.getParameter("acuerdos");        
            String[] totalAsistentes = request.getParameterValues("asistencias");

            Minuta minuta = new Minuta(id_reunion,fecha,hora,asunto,lugar,secretario,id_secretario,presidente,id_presidente,id_academia,ordenDia,detalles,acuerdos,totalAsistentes);
            minuta.guardarMinuta();
        
        }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.setAttribute("archivo", "Minuta_Reunion"+request.getParameter("id_reunion")+".pdf");
        request.getRequestDispatcher("consultarReuniones.jsp?minuta=true").forward(request,response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
