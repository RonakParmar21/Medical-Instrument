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

/**
 *
 * @author LENOVO
 */
public class Verify extends HttpServlet {

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
            out.println("<title>Servlet Verify</title>");
            out.println("</head>");
            out.println("<body>");

            String uvc = request.getParameter("uvc");
            String uvc1 = request.getParameter("uvc1");

            String user_id = request.getParameter("user_id");
            String user_name = request.getParameter("user_name");
            String user_email = request.getParameter("user_email");
            String user_password = request.getParameter("user_password");
            String user_cpassword = request.getParameter("user_cpassword");
            String user_mobile = request.getParameter("user_mobile");
            String user_bdate = request.getParameter("user_bdate");
            String user_registration = request.getParameter("user_registration");

//            out.println("<h1>Uvc = "+uvc+"<br>Uvc1 = "+uvc1+"</h1>");
//            try {
            int intValueUvc = Integer.parseInt(uvc);
            int intValueUvc1 = Integer.parseInt(uvc1);

            if (intValueUvc == intValueUvc1) {
                Signup sign = new Signup(user_name, user_email, user_password, user_cpassword, user_mobile, user_bdate, uvc);
                SignupDao sd = new SignupDao(ConnectionProvider.getConnection());

                if (sd.saveUser(sign)) {
                    response.sendRedirect("login.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }

//            String uvc = request.getParameter("uvc");
//            int uvc = Integer.parseInt(request.getParameter("uvc"));
//            String userNumberString = request.getParameter("uvc1");
//            int userverification = Integer.parseInt(request.getParameter("uvc1"));
//            try {
//                int uvc1 = Integer.parseInt(userNumberString);
////                String uvc11 = Integer.toString(uvc1);
//                String result = Integer.toString(uvc1);
//                
//                if(uvc == uvc1){
//                    response.sendRedirect("login.jsp");
//                } else {
//                    out.println("<script>Not Success</script>");
//                }
//                if(uvc == uvc1) {
//                response.sendRedirect("login.jsp");
//            } else {
//                response.sendRedirect("login1.jsp");
//            }
//            } catch(Exception e){
//                e.printStackTrace();
//            }
//            out.println("<h1> UVC = "+uvc);\
//            out.println("Uvc 1  = "+uvc1+"</h1>");
//            out.println("<h1>Servlet Verify at " + request.getContextPath() + "</h1>");
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
