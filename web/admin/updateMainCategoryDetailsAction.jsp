<%-- 
    Document   : updateMainCategoryDetailsAction
    Created on : 31-Aug-2023, 12:57:37 pm
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
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <% 
        Connection con = ConnectionProvider.getConnection();
        %>
        <% 
            String old = request.getParameter("old");
            String new_cat = request.getParameter("main_cat_name");
            
           
        %>
        <%= old %> <br><br>
        <%= new_cat %>
        
        <%
            try {
            
            //String query = "UPDATE main_category SET main_cat_name='new_cat' WHERE main_cat_name='old'";
            
            String que = "UPDATE main_category SET  old_cat_name = '"+old+"' WHERE main_cat_name = '"+new_cat+"'";
            String que1 = "UPDATE sub_category SET old_main_cat_name='"+old+"' WHERE main_cat_name ='"+new_cat+"'";
           // String query = "UPDATE main_category SET main_cat_name";
            

            PreparedStatement ps = con.prepareStatement(que);
            PreparedStatement ps2 = con.prepareStatement(que1);
            
            ps.executeUpdate();
            ps2.executeUpdate();
            } catch(Exception e) {
            e.printStackTrace();
            }
        %>
        
        <% 
            try {
        //    Thread.sleep(5000);
//            Connection con = ConnectionProvider.getConnection();
            //String query = "UPDATE main_category SET main_cat_name='new_cat' WHERE main_cat_name='old'";
            
            String query1 = "UPDATE main_category SET old_cat_name = '"+new_cat+"' WHERE main_cat_name = '"+new_cat+"'";
            String query2 = "UPDATE sub_category SET old_main_cat_name ='"+new_cat+"' WHERE main_cat_name='"+new_cat+"'";
           // String query = "UPDATE main_category SET main_cat_name";
            

            PreparedStatement ps3 = con.prepareStatement(query1);
            PreparedStatement ps4 = con.prepareStatement(query2);
            
            ps3.executeUpdate();
            ps4.executeUpdate();
            } catch(Exception e) {
            e.printStackTrace();
            }
        %>
       
        <br><br>
    </body>
</html>
