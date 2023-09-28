/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gemtrack.servlets;

import com.gemtrack.dao.AdminDao;
import com.gemtrack.entities.AdminSignup;
import com.gemtrack.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
public class AdminSignupServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminSignupServlet</title>");
            out.println("</head>");
            out.println("<body>");

            // fetch all data
//            String user_id = request.getParameter("user_id");
            String admin_name = request.getParameter("admin_name");
            String admin_email = request.getParameter("admin_email");
            String admin_password = request.getParameter("admin_password");

//            System.out.println(admin_name);
//            System.out.println(admin_email);
//            System.out.println(admin_password);
//            String user_bdate = request.getParameter("user_bdate");
//            String user_registration = request.getParameter("user_registration");
//            Date user_bdate = request.getParameter("user_bdate");
            AdminSignup adminsign = new AdminSignup(admin_name, admin_email, admin_password);

            AdminDao admindao = new AdminDao(ConnectionProvider.getConnection());

            if (admindao.saveAdmin(adminsign)) {
                out.println("<script>alert('success');</script>");
                response.sendRedirect("admin/index.jsp");

            } else {
                out.println("<script>alert('Not Success');</script>");
                response.sendRedirect("admin/addAdmin.jsp");
            }

//            out.println("<h1>Servlet AdminSignupServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
