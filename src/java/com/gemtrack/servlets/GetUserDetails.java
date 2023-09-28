/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gemtrack.servlets;

import com.gemtrack.dao.SignupDao;
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
public class GetUserDetails extends HttpServlet {

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
            out.println("<title>Servlet GetUserDetails</title>");            
            out.println("</head>");
            out.println("<body>");
            
            int user_id = Integer.parseInt(request.getParameter("user_id"));
            String user_name = request.getParameter("user_name");
            String user_email = request.getParameter("user_email");
            String user_mobile = request.getParameter("user_mobile");
            String user_bdate = request.getParameter("user_bdate");

            SignupDao signdao = new SignupDao(ConnectionProvider.getConnection());  

            Signup sign = signdao.getUsers(user_id, user_name, user_email, user_mobile, user_bdate);

            if (sign == null) {
                // error
                
                Message msg = new Message("Invalid Email and Password! Try again", "error", "alert-danger");
                
                
                HttpSession s= request.getSession();
                s.setAttribute("msg", msg);
                
                response.sendRedirect("login.jsp");
                
                
                
                
                
                
                
//                out.println("Invalid Details");
//                out.println("<script>alert('Invalid Email And Password Try Again')</script>");
            
                
//                response.sendRedirect("login.jsp");
            } else {
                // login success...
                
                HttpSession s = request.getSession();
                s.setAttribute("currentUser", sign);
                
                response.sendRedirect("index.jsp");
                    
                
                
            }
            
            
//            out.println("<h1>Servlet GetUserDetails at " + request.getContextPath() + "</h1>");
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
