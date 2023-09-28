<%-- 
    Document   : updateCustomerUserDetails
    Created on : 27-Aug-2023, 10:54:41 am
    Author     : LENOVO
--%>
<%@page import="com.gemtrack.dao.SignupDao" %>
<%@page import="com.gemtrack.entities.Signup"%>
<%@page import="java.sql.*" %>

<%--<%@page import="com.gemtrack.servlets.SignupServlet" %>--%> 
<%@page import="com.gemtrack.helper.ConnectionProvider" %>
<%@page import="com.gemtrack.entities.Signup"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <%  
            Connection con = ConnectionProvider.getConnection();
        %>
        <%
            int user_id = Integer.parseInt(request.getParameter("i"));
            
            try {
                Statement st = con.createStatement();
                String sql = "select * from signup where user_id = '"+user_id+"'";
                
                ResultSet rs = st.executeQuery(sql);
                
                while(rs.next()) {
                %>
                
                <h1><%= rs.getInt(1) %></h1>
                <h1><%= rs.getString(2) %></h1>
                <h1><%= rs.getString(3) %></h1>
                <h1><%= rs.getString(4) %></h1>
                <h1><%= rs.getString(5) %></h1>
                <h1><%= rs.getString(6) %></h1>
                <h1><%= rs.getString(7) %></h1>
                <h1><%= rs.getString(8) %></h1>
                <div class="mod-container">

                                        <!--<div id="profile-details">-->
                                        <center><img src="assets/images/Profile Pictures/profile.png" alt="profile picture" style="margin-top: 20px; margin-bottom: 20px;"/>
                                            <!--<h1>< // sign.getUser_name()%></h1>-->
                                        </center>

                                        <div id="container">
                                            <h1>Edit Profile Please Carefull</h1>
                                            <div class="underline">
                                            </div>
                                           
                                            <form action="../UpdateCustomerUserServlet" method="POST" id="contact_form">
                                                <input type="hidden" name="user_id" value="<%= rs.getInt(1) %>" />
                                                <div class="name">
                                                    <label for="name"></label>
                                                    <input type="text" placeholder="My name is" name="user_name" id="name_input" required>
                                                </div>
                                                <div class="email">
                                                    <label for="email"></label>
                                                    <input type="email" placeholder="My e-mail is" name="user_email" id="email_input" required>
                                                </div>

                                                <div class="name">
                                                    <label for="name"></label>
                                                    <input type="password" placeholder="My password is" name="user_password" id="name_input" required>
                                                </div>
                                                <div class="email">
                                                    <label for="email"></label>
                                                    <input type="tel" placeholder="My mobile is" name="user_mobile" id="email_input" required>
                                                </div>

                                                <div class="telephone">
                                                    <label for="name"></label>
                                                    <input type="date" name="user_bdate" id="telephone_input" required>
                                                </div>
                                                <div class="submit">
                                                    <input type="submit" value="Update Profile" id="form_button" />
                                                </div>
                                            </form> <!-- End form -->
                                        </div> 



                                    </div>
                
                <%
                    }
//                out.println("<h1>"+rs.getInt(1) +"</h1>");
//                out.println(rs.getString(2));
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
