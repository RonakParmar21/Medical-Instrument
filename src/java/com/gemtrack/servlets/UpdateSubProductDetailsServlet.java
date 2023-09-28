/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gemtrack.servlets;

import com.gemtrack.dao.SubProductDao;
import com.gemtrack.entities.SubProduct;
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
public class UpdateSubProductDetailsServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateSubProductDetailsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            int sub_product_id = Integer.parseInt(request.getParameter("sub_product_id"));
            int main_cat_id = Integer.parseInt(request.getParameter("main_cat_id"));
                    int sub_cat_id = Integer.parseInt(request.getParameter("sub_cat_id"));
                            int product_id = Integer.parseInt(request.getParameter("product_id"));
                            
                            
                            String model_no = request.getParameter("model_no");
                            
                            String description = request.getParameter("description");
                            String features = request.getParameter("features");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int price = Integer.parseInt(request.getParameter("price"));
                            
                            
                            
//                            out.println("<h1>"+
//                                    sub_product_id+"<br>"+
//                                    main_cat_id +"<br>"+
//                                    sub_cat_id + "<br>"+
//                                    product_id+"<br>"+
//                                    model_no+"<br>"+
//                                    description+"<br>"+
//                                    features+"<br>"+
//                                    quantity+"<br>"+
//                                    price+"<br>"
//                                    +"</h1>");
            

            Part subProductImage = request.getPart("sub_product_image");
            
            
            
            String subPorductImageName = subProductImage.getSubmittedFileName();
            
            String UploadSubImage = "F:\\Gemtrack\\web\\assets\\images\\Sub_Product\\"+subPorductImageName;
            
            try {
                FileOutputStream fos = new FileOutputStream(UploadSubImage);
                InputStream is = subProductImage.getInputStream();
                
                byte[] data = new byte[is.available()];            
                
                is.read(data);
                fos.write(data);
                fos.close();
            } catch(Exception e) {
                e.printStackTrace();
            }
            
//            SubProductCategory spcat = new SubProductCategory(main_cat_id, sub_cat_id, product_id, model_no, description, fetures, quantity, price, subPorductImageName);

SubProduct sp = new SubProduct(sub_product_id, main_cat_id, sub_cat_id, product_id, model_no, description, features, quantity, price, subPorductImageName, subPorductImageName);
            
//            SubCategoryDao scatdao = new SubCategoryDao(ConnectionProvider.getConnection());
//SubProductDao spdao = new SubProductDao(ConnectionProvider.getConnection());
SubProductDao spdao = new SubProductDao(ConnectionProvider.getConnection());

            
            if(spdao.updateSubProduct(sp)) {
//                out.println("<script>alert('success');</script>");
//                out.println("Success");
                out.println("<script>alert('Main Product updated Successfull');</script>");
                response.sendRedirect("admin/addSubProduct.jsp");
               
            } else {
                out.println("<script>alert('NOT Success');</script>");
            }
            
//            out.println("<h1>Servlet UpdateSubProductDetailsServlet at " + request.getContextPath() + "</h1>");
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
