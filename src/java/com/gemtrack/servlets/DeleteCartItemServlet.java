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
public class DeleteCartItemServlet extends HttpServlet {

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
            out.println("<title>Servlet DeleteCartItemServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            // fetch Data 
            int id = Integer.parseInt(request.getParameter("id"));
            int p_id = Integer.parseInt(request.getParameter("p_id"));
            int qu = Integer.parseInt(request.getParameter("q"));
            
            //out.println("<h1>Id is : "+id+"<br><br>Product id : "+p_id+"<br><br>Quantity is : "+qu+"</h1><br>");
            
            AddCart addCart = new  AddCart(id);
            AddCartDao addCartDao = new AddCartDao(ConnectionProvider.getConnection());

            SubProduct sproduct = new SubProduct(p_id, qu);
            SubProductDao sproductdao = new SubProductDao(ConnectionProvider.getConnection());


if (addCartDao.deleteCart(addCart) && sproductdao.updateQuantity(sproduct)) {
                out.println("<script>alert('success');</script>");
                response.sendRedirect("index.jsp");
}else {
    
                out.println("<script>alert('not success');</script>");
}
            
            
            
//            out.println("<h1>Servlet DeleteCartItemServlet at " + request.getContextPath() + "</h1>");
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
