/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gemtrack.servlets;

import com.gemtrack.dao.ContactDao;
import com.gemtrack.dao.InquiryDao;
import com.gemtrack.entities.Contact;
import com.gemtrack.entities.Inquiry;
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
public class InquiryServlet extends HttpServlet {

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
            out.println("<title>Servlet InquiryServlet</title>");
            out.println("</head>");
            out.println("<body>");

            String user_name = request.getParameter("user_name");
            String user_email = request.getParameter("user_email");
            String user_mobile = request.getParameter("user_mobile");
            int main_cat_id = Integer.parseInt(request.getParameter("main_cat_name"));
            int sub_cat_id = Integer.parseInt(request.getParameter("sub_cat"));
            int product_id = Integer.parseInt(request.getParameter("product"));
            int sub_product_id = Integer.parseInt(request.getParameter("sub-product"));
            String user_description = request.getParameter("user_description");

//            
//            out.println("<h1>");
//            out.println("Name is : "+user_name);
//            out.println("<br>");
//            out.println("Email is : "+user_email);
//            out.println("<br>");
//            out.println("Mobile no is : "+user_mobile);
//            out.println("<br>");
//            out.println("Main cat id : "+main_cat_id);
//            out.println("<br>");
//            out.println("Sub cat id : "+sub_cat_id);
//            out.println("<br>");
//            out.println("Product id : "+product_id);
//            out.println("<br>");
//            out.println("sub product : "+sub_product_id);
//            out.println("<br>");
//            out.println("description : "+user_description);
//            out.println("<br>");
//            out.println("</h1>");
//            Contact contact = new Contact(user_name, user_email, user_mobile, user_description);
            Inquiry inquiry = new Inquiry(user_name, user_email, user_mobile, main_cat_id, sub_cat_id, product_id, sub_product_id, user_description);

//            ContactDao contactdao = new ContactDao(ConnectionProvider.getConnection());
//InquiryDao inquirydao = new InquiryDao(ConnectionProvider.getConnection());
            InquiryDao inquirydao = new InquiryDao(ConnectionProvider.getConnection());
            if (inquirydao.saveInquiry(inquiry)) {

                out.println("<script>alert('we will cantact through email or mobile no');</script>");

                response.sendRedirect("index.jsp");

            } else {
                out.println("<script>alert('Not Success');</script>");
//                response.sendRedirect("contact.jsp");
            }

//            out.println("<h1>Servlet InquiryServlet at " + request.getContextPath() + "</h1>");
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
