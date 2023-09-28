/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gemtrack.servlets;

import com.gemtrack.dao.MainCategoryDao;
import com.gemtrack.dao.SubCategoryDao;
import com.gemtrack.entities.MainCategory;
import com.gemtrack.entities.SubCategory;
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
public class DeleteSubCatServlet extends HttpServlet {

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
            out.println("<title>Servlet DeleteSubCatServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
//            int sub_cat_id = Integer.parseInt(request.getParameter("id"));
//            String main_cat_name = request.getParameter("main_cat_name");
//            String sub_cat_name = request.getParameter("sub_cat_name");
//            String sub_cat_image = request.getParameter("sub_cat_image");
//            
//
//
//            SubCategory sc = new SubCategory(sub_cat_id);
//            SubCategoryDao scd = new SubCategoryDao(ConnectionProvider.getConnection());
//            
//            if(scd.deleteSubCategory(sc)) {
////                out.println("DONE");
////                out.println("<script>alert('Register Successfull')</script>");
//out.println("<script>alert('success');</script>");
//
////                  out.println("");
//                response.sendRedirect("admin/subCategoryDetails.jsp");
//               
//            } else {
//                out.println("<script>alert('Not success');</script>");
////                response.sendRedirect("login.jsp");
//            }
//            
            
//            int sub_cat_id = Integer.parseInt(request.getParameter("id"));
//            String main_cat_name = request.getParameter("main_cat_name");
//            String sub_cat_name = request.getParameter("sub_cat_name");
//            String sub_cat_image = request.getParameter("sub_cat_image");
//            int sub_cat_id = Integer.parseInt(request.getParameter("id"));
//            String main_cat_name = request.getParameter("main_cat_name");
//            String sub_cat_name = request.getParameter("sub_cat_name");
//            String sub_cat_image = request.getParameter("sub_cat_image");
//            
////            out.println("<h1>sub_cat_id is : "+sub_cat_id+"</h1>");
////            SubCategory sc = new SubCategory(sub_cat_id);
////            SubCategoryDao scd = new SubCategoryDao(ConnectionProvider.getConnection());
//            SubCategory sc = new SubCategory(sub_cat_id);
//            SubCategoryDao scd = new SubCategoryDao(ConnectionProvider.getConnection());
//            
//            if(scd.deleteSubCategory(sc)) {
//                out.println("<script>alert('success');</script>");
//                response.sendRedirect("admin/mainCategoryDetials.jsp");
//            } else {
//                out.println("<script>alert('Not Success');</script>");
//            }

            
//            if(scd.deleteSubCategory(sc)) {
//                out.println("DONE");
//                out.println("<script>alert('Register Successfull')</script>");
//out.println("<script>alert('success');</script>");

//                  out.println("");
//                response.sendRedirect("admin/mainCategoryDetails.jsp");
//               
//            } else {
//                out.println("<script>alert('Not success');</script>");
////                response.sendRedirect("login.jsp");
//            }
            
//            out.println("<h1>Servlet DeleteSubCatServlet at " + request.getContextPath() + "</h1>");
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
