/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gemtrack.servlets;

import com.gemtrack.dao.AdminDao;
import com.gemtrack.dao.SignupDao;
import com.gemtrack.entities.AdminSignup;
import com.gemtrack.entities.Message;
import com.gemtrack.entities.Signup;
import com.gemtrack.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
public class AdminLoginServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminLoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            
            String admin_name = request.getParameter("admin_name");
            String admin_email = request.getParameter("admin_email");
            String admin_password = request.getParameter("admin_password");
            
            
            AdminDao admindao = new AdminDao(ConnectionProvider.getConnection());  

            AdminSignup adminsign = admindao.getAdmin(admin_name, admin_email, admin_password);
            
//                          System.out.println(adminsign);

            if (adminsign == null) {
                // error
//                System.out.println("second : "+admin_name);
                Message msg = new Message("Invalid Email and Password! Try again", "error", "alert-danger");
               
                HttpSession s= request.getSession();
                s.setAttribute("msg", msg);
                out.println("<script>alert('not success')</script>");
//                System.out.println(adminsign);
                response.sendRedirect("admin/adminLogin.jsp");
             
//                out.println("Invalid Details");
//                out.println("<script>alert('Invalid Email And Password Try Again')</script>");
            
                
//                response.sendRedirect("login.jsp");
            } else {
                // login success...
                
//                System.out.println("second : "+admin_name);
                
                HttpSession s = request.getSession();
                s.setAttribute("currentAdminUser", adminsign);
//                System.out.println(adminsign);
                response.sendRedirect("admin/index.jsp");
            }
            
            
            
            
            
            
//            out.println("<h1>Servlet AdminLoginServlet at " + request.getContextPath() + "</h1>");
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
