/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gemtrack.servlets;

import com.gemtrack.dao.SignupDao;
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
public class UpdateUserServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateUserServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            // fetch data
            String user_id = request.getParameter("id");
            String user_name = request.getParameter("user_name");
            String user_email = request.getParameter("user_email");
            String user_password = request.getParameter("user_password");
            String user_cpassword = request.getParameter("user_password");
            String user_mobile = request.getParameter("user_mobile");
            String user_bdate = request.getParameter("user_bdate");
            
            
            // get data from session
            HttpSession s = request.getSession();
            Signup sign = (Signup)s.getAttribute("currentUser");
            
//            System.out.println(sign);
            
            
            sign.setUser_name(user_name);
            sign.setUser_email(user_email);
            sign.setUser_password(user_password);
            sign.setUser_cpassword(user_cpassword);
            sign.setUser_mobile(user_mobile);
            sign.setUser_bdate(user_bdate);
            
            // update database
//            SignupDao sdao = new SignupDao(ConnectionProvider.getConnection());
                SignupDao sdao = new SignupDao(ConnectionProvider.getConnection());

//            System.out.println("SDao is : "+sdao);
            
            boolean ans = sdao.updateUser(sign);
            
            boolean ans1 = sdao.updateUser(sign);
            
//            System.out.println("Answer is : "+ans);
            
            if(ans) {
//                out.println(user_name);
//                out.println(user_email);
//                out.println(user_mobile);
//                out.println(user_bdate);
//                out.println("<script>alert('Update Success')</script>");
//                out.println("update");
                response.sendRedirect("index.jsp");
            } else {
                out.println("<script>alert('Update is not Success')</script>");
                response.sendRedirect("index.jsp");
            }
            
            if(ans) {
                out.println("<script>alert('Update Success')</script>");
//                System.out.println("user_id");
            } else {
                out.println("<script>alert('Update NOT Success')</script>");
            }
            
            
            
            
            
            
            
            
            
            
            
//            out.println("<h1>Servlet UpdateUserServlet at " + request.getContextPath() + "</h1>");
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
