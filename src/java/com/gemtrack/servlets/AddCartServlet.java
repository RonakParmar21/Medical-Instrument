/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gemtrack.servlets;

import com.gemtrack.dao.AddCartDao;
import com.gemtrack.dao.AdminDao;
import com.gemtrack.dao.SubProductDao;
import com.gemtrack.entities.AddCart;
import com.gemtrack.entities.AdminSignup;
import com.gemtrack.entities.SubProduct;
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
public class AddCartServlet extends HttpServlet {

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
            out.println("<title>Servlet AddCartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            
            int p_id = Integer.parseInt(request.getParameter("pid"));
            String p_name = request.getParameter("pnm");
            int price = Integer.parseInt(request.getParameter("p"));
            int quantity = Integer.parseInt(request.getParameter("f"));
            
            
            String user_name = request.getParameter("user");
            
            out.println("<h1>");
            out.println("User name is : "+user_name);
            out.println("<br><br><br>");
            out.println("Product id : "+p_id);
            out.println("<br><br><br>");
            out.println("Product name is : "+p_name);
            out.println("<br><br><br>");
            out.println("Price : "+price);
            out.println("<br><br><br>");
            out.println("Quantity : "+quantity);
            out.println("<br><br><br>");
            
            
            out.println("</h1>");
            
//            out.println("<h1>");
//            
//            out.println(s);
//            out.println("<br><br><br>");
//            out.println(pid);
//            out.println("<br><br><br>");
//            out.println(product);
//            out.println("<br><br><br>");
//            out.println(price);
//            out.println("<br><br><br>");
//            out.println(quantity);
//            out.println("<br><br><br>");
//            
//            out.println("</h1>");

AddCart addCart = new  AddCart(user_name, p_id, p_name, price, quantity);
AddCartDao addCartDao = new AddCartDao(ConnectionProvider.getConnection());

            SubProduct sproduct = new SubProduct(p_id, quantity);
            SubProductDao sproductdao = new SubProductDao(ConnectionProvider.getConnection());


if (addCartDao.saveCart(addCart) && sproductdao.updateQ(sproduct)) {
                out.println("<script>alert('success');</script>");
                response.sendRedirect("index.jsp");
}else {
    
                out.println("<script>alert('not success');</script>");
}
/*
//    AdminSignup adminsign = new AdminSignup(admin_name, admin_email, admin_password);
//            AddCartDao addCartDao = new AddCartDao(user_name, p_id, p_name, price, quantity);
//            AddCart addCart = new AddCart(user_name, p_id, p_name, price, quantity);
AddCart addCart = new AddCart(user_name, p_id, p_name, price, quantity);
//            AdminDao admindao = new AdminDao(ConnectionProvider.getConnection());
            AddCartDao addCartDao = new AddCartDao(ConnectionProvider.getConnection());

            if (addCartDao.saveCart(addCart)) {
                out.println("<script>alert('success');</script>");
//                response.sendRedirect("admin/index.jsp");

            } else {
                out.println("<script>alert('Not Success');</script>");
//                response.sendRedirect("admin/addAdmin.jsp");
            }


  */          
//            out.println("<h1>Servlet AddCartServlet at " + request.getContextPath() + "</h1>");
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
