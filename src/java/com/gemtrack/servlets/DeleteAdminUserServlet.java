/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gemtrack.servlets;

import com.gemtrack.entities.AdminSignup;
import com.gemtrack.dao.AdminDao;
import com.gemtrack.dao.SignupDao;
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
public class DeleteAdminUserServlet extends HttpServlet {

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
            out.println("<title>Servlet DeleteAdminUserServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            
            
            // fetch all data
            int user_id = Integer.parseInt(request.getParameter("id"));
            String user_name = request.getParameter("user_name");
            String user_email = request.getParameter("user_email");
            String user_password = request.getParameter("user_password");
            
            
            
//            System.out.println("Id from admin is : "+user_id);
            
            
            
            AdminSignup adminsignup = new AdminSignup(user_id);
            
            
            
            //AdminDao sd = new AdminDao(ConnectionProvider.getConnection());
            
            AdminDao sd = new AdminDao(ConnectionProvider.getConnection());
            
            if(sd.deleteAdminUser(adminsignup)) {
//                out.println("DONE");
//                out.println("<script>alert('Register Successfull')</script>");
out.println("<script>alert('success');</script>");

//                  out.println("");
                response.sendRedirect("admin/adminUserDetails.jsp");
               
            } else {
                out.println("<script>alert('Not success');</script>");
//                response.sendRedirect("login.jsp");
            }
            
            
            
            
//            out.println("<h1>Servlet DeleteAdminUserServlet at " + request.getContextPath() + "</h1>");
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
