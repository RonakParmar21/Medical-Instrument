/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gemtrack.servlets;

import com.gemtrack.dao.MainCategoryDao;
import com.gemtrack.entities.MainCategory;
import com.gemtrack.helper.ConnectionProvider;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class UpdateMainCategoryDetailsServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateMainCategoryDetailsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            
            // fetch all data 
            int main_cat_id = Integer.parseInt(request.getParameter("main_cat_id"));
            String main_cat_name = request.getParameter("main_cat_name");
            
            Part mainImage = request.getPart("main_cat_image");
            
            String mainImageName = mainImage.getSubmittedFileName();
            
            String UploadMainImage = "F:\\Gemtrack\\web\\assets\\images\\Main_Categories\\"+mainImageName;
            
            
            try {
                FileOutputStream fos = new FileOutputStream(UploadMainImage);
                InputStream is = mainImage.getInputStream();
                
                byte[] data = new byte[is.available()];            
                
                is.read(data);
                fos.write(data);
                fos.close();
            } catch(Exception e) {
                e.printStackTrace();
            }
            
            
//            MainCategory mcat = new MainCategory(main_cat_name, main_cat_image);
            MainCategory mcat = new MainCategory(main_cat_id, main_cat_name, mainImageName);
            
            MainCategoryDao mcatdao = new MainCategoryDao(ConnectionProvider.getConnection());
            
            if(mcatdao.updateMainCategory(mcat)) {
//                out.println("<script>alert('success');</script>");
//                out.println("Success");
                out.println("<script>alert('Main Product Added Successfull');</script>");
                response.sendRedirect("admin/addMainCategory.jsp");
               
            } else {
                out.println("<script>alert('NOT Success');</script>");
            }
            
            
            // fetch all data
//            int main_cat_id = Integer.parseInt(request.getParameter("main_cat_name"));
//            String main_cat_name = request.getParameter("main_cat_name");
//            
//            Part mainImage = request.getPart("main_cat_image");
//            
//            String mainImageName = mainImage.getSubmittedFileName();
//            
//            String UploadMainImage = "F:\\Gemtrack\\web\\assets\\images\\Main_Categories\\"+mainImageName;
//            
//            
//            try {
//                FileOutputStream fos = new FileOutputStream(UploadMainImage);
//                InputStream is = mainImage.getInputStream();
//                
//                byte[] data = new byte[is.available()];            
//                
//                is.read(data);
//                fos.write(data);
//                fos.close();
//            } catch(Exception e) {
//                e.printStackTrace();
//            }
//            
//            
////            MainCategory mcat = new MainCategory(main_cat_name, main_cat_image);
//            MainCategory mcat = new MainCategory(main_cat_name, mainImageName);
//            
//            MainCategoryDao mcatdao = new MainCategoryDao(ConnectionProvider.getConnection());
//            
//            if(mcatdao.updateMainCategory(mcat)) {
////                out.println("<script>alert('success');</script>");
////                out.println("Success");
//                out.println("<script>alert('Main Product Update Successfull');</script>");
//                response.sendRedirect("admin/addMainCategory.jsp");
//               
//            } else {
//                out.println("<script>alert('NOT Success');</script>");
//            }
            
            
            
//            out.println("<h1>Servlet UpdateMainCategoryDetailsServlet at " + request.getContextPath() + "</h1>");
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
