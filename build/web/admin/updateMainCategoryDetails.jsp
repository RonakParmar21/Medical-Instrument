<%-- 
    Document   : updateMainCategoryDetails
    Created on : 30-Aug-2023, 11:40:36 am
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
             <style>


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

        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%
            int main_cat_id = Integer.parseInt(request.getParameter("mainId"));
            
//            out.println(main_cat_id);

            try {
                Connection con = ConnectionProvider.getConnection();
                String query = "select * from main_category where main_cat_id='"+main_cat_id+"'";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
            %>
                     <div style="background-color: #ededed;padding: 20px;margin-top: 20px;">
            <form action="../UpdateMainCategoryDetailsServlet" method="POST" enctype="multipart/form-data">
                <h1 style="text-align: center">Add Main Category</h1> <hr><br>
            
                <label>Category Name</label>
                <input type="hidden" name="main_cat_id" value="<%= rs.getInt(1) %>"/>
                <input type="text" name="main_cat_name" value="<%= rs.getString(2) %>"  placeholder="Enter Main Category Name" required />
                <label>Choose Image</label>
                <input type="file" name="main_cat_image" />


                <a href="#">
                    <!--<button id="button">Add</button>--> 
                    <input type="submit" value="Add" />
                </a>
                <a href="addSubCategory.jsp">
                    <input type="button" value="Add Sub-Category" style="width: 46%;" />
                </a>
                <a href="index.jsp">
                    <input type="button" value="Cancel" />
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
