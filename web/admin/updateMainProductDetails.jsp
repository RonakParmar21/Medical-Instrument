<%-- 
    Document   : updateMainProductDetails
    Created on : 02-Sept-2023, 7:55:50 pm
    Author     : LENOVO
--%>
<%@page import="com.gemtrack.dao.MainCategoryDao" %>
<%@page import="com.gemtrack.entities.MainCategory"%>
<%@page import="java.sql.*" %>

<%--<%@page import="com.gemtrack.servlets.SignupServlet" %>--%> 
<%@page import="com.gemtrack.helper.ConnectionProvider" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<!--        <style>


            input[type=text] {
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

        </style>-->
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
    </head>
    <body>
        <%@include file="navbar.jsp" %> 
        <%
            int product_id = Integer.parseInt(request.getParameter("productId"));
            
//            out.println(main_cat_id);

            try {
                Connection con = ConnectionProvider.getConnection();
                String query = "select * from product where product_id='"+product_id+"'";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
            %>
            <div style="background-color: #ededed;padding: 20px;margin-top: 20px; width: 50%;">
            <form action="../UpdateMainProductDetailsServlet" method="POST" enctype="multipart/form-data">
                <h1 style="text-align: center" >Add Main Product</h1> <hr><br>
<!--
                <label>Choose Main Category</label>
                <select onchange="return loadDoc(this.value)" name="main_cat_name">
                    <option>Select Main Category</option>
                    <%  
                        /*String sql = "select * from main_category";
                        ps = con.prepareStatement(sql);
                        rs = ps.executeQuery();
                        while (rs.next()) {*/
                    %>  
                    <option value="<= rs.getString("main_cat_id") %>">
                        <= rs.getString("main_cat_name")%>
                    </option>
                    <%
//                        }
                    %>  
                </select>
                                <select id="mainCategory">
                                    
                                    String sql = "SELECT * FROM main_category";
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                
                            while (rs.next()) {
                                 str += "<option value='" + rs.getString("main_cat_id") + "'>" + rs.getString("main_cat_name") + "</option>";
                            }
                                   %>
                                </select>

                <label style="margin-top: 10px;">Choose Sub Category</label>
                <p id="demo"></p>
                <select id="demo" name="sub_cat_name">
                    <option>Select Sub Category</option>
                </select> -->
                <input type="hidden" name="product_id" value="<%= rs.getInt(1) %>"/>    
                <input type="hidden" name="main_cat_id" value="<%= rs.getInt(2) %>"/>
                <input type="hidden" name="sub_cat_id" value="<%= rs.getInt(3) %>"/>
                <label style="margin-top: 10px;">Product Name</label>
                <input type="text" name="product_name" value="<%= rs.getString(4) %>" placeholder="Enter Product Name" required />

<!--                <label style="margin-top: 10px;">Model No.</label>
                <input type="number" name="productModelNumber" placeholder="Enter Product Model Number" />-->

<!--                <label style="margin-top: 10px;">Description</label>
                <textarea rows="5"></textarea>
                <input type="number" name="productModelNumber" placeholder="Enter Product Model Number" />-->

                <label>Choose Image</label>
                <input type="file" name="product_image" required />


                <a href="#">
                    <!--<button id="button">Add</button>--> 
                    <input type="submit" value="Add" />
                </a>
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
