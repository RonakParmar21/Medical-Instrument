<%-- 
    Document   : updateSubCategoryDetails
    Created on : 01-Sept-2023, 8:08:05 pm
    Author     : LENOVO
--%>
<%@page import="com.gemtrack.dao.SubCategoryDao" %>
<%@page import="com.gemtrack.entities.SubCategory"%>
<%@page import="java.sql.*" %>

<%--<%@page import="com.gemtrack.servlets.SignupServlet" %>--%> 
<%@page import="com.gemtrack.helper.ConnectionProvider" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>


            input[type=text], [type=number], [type=file], select, textarea {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type=submit], input[type=button] {
                width: 25%;
                background-color: #141d28;
                color: white;
                padding: 14px 20px;
                margin-top: 12px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #018c94;
            }

            input[type=button]:hover {
                background-color: #018c94;
            }

            div {
                margin: auto;
                width: 30%;
                border-radius: 5px;
                /*background-color: #ededed;*/
                /*padding: 20px;*/
                font-family: 'Work Sans', sans-serif;
            }

        </style>
<style>


            input[type=text], [type=number], [type=file], select, textarea {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type=submit], input[type=button] {
                width: 25%;
                background-color: #141d28;
                color: white;
                padding: 14px 20px;
                margin-top: 12px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #018c94;
            }
            
            input[type=button]:hover {
                background-color: #018c94;
            }

            div {
                margin: auto;
                width: 30%;
                border-radius: 5px;
                /*background-color: #ededed;*/
                /*padding: 20px;*/
                font-family: 'Work Sans', sans-serif;
            }

        </style>
    <body>
        <%@include file="navbar.jsp" %>
        <% 
            int sub_product_id = Integer.parseInt(request.getParameter("subpId"));
                    try {
                Connection con = ConnectionProvider.getConnection();
                String query = "select * from sub_product where sub_product_id='"+ sub_product_id +"'";
            
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
            %>
                     <div style="background-color: #ededed;padding: 20px;margin-top: 20px; width: 80%;"">
            <form action="../UpdateSubProductDetailsServlet" method="POST" enctype="multipart/form-data">
                <h1 style="text-align: center">Add Main Category</h1> <hr><br>
            
                <label>Category Name</label>
                <input type="hidden" name="sub_product_id" value="<%= rs.getInt(1) %>" />
                <input type="hidden" name="main_cat_id" value="<%= rs.getInt(2) %>"/>
                <input type="hidden" name="sub_cat_id" value="<%= rs.getInt(3) %>" />
                <input type="hidden" name="product_id" value="<%= rs.getInt(4) %>" />
                
                <label style="margin-top: 10px;">Model No.</label>
                <input type="text" name="model_no" value="<%= rs.getString(5) %>"  placeholder="Enter Main Category Name" required />
                
                <label style="margin-top: 10px;">Description</label>
                <textarea id="id" name="description" rows="5" cols="10"><%= rs.getString(6) %></textarea>
                
                <label style="margin-top: 10px;">Fetures</label>
                <textarea id="id" name="features" rows="5" cols="10"><%= rs.getString(7) %></textarea>
                
                <label style="margin-top: 10px;">Quantity</label>
                <input type="number" name="quantity" value="<%= rs.getInt(8) %>" />
                
                                <label style="margin-top: 10px;">Price</label>
                <input type="number" name="price" value="<%= rs.getInt(9) %>" />
                
                
                <label>Choose Image</label>
                <input type="file" name="sub_product_image" />


                <a href="#">
                    <!--<button id="button">Add</button>--> 
                    <input type="submit" value="Update" />
                </a>
<!--                <a href="addSubCategory.jsp">
                    <input type="button" value="Add Sub-Category" style="width: 46%;" />
                </a>
                <a href="index.jsp">
                    <input type="button" value="Cancel" />
                </a>-->
            </form>
        </div>
            <%
            }
                
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>    
        
        
        
    </body>
</html>
