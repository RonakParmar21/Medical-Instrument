<%-- 
    Document   : side
    Created on : 23-Aug-2023, 3:02:40 pm
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.gemtrack.helper.ConnectionProvider" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            :root {
                --button-bg: rgba(0, 0, 0, 0.4);
                --sidebar-bg: rgba(0, 0, 0, 0.8);
            }

            #side {
                /* padding: 5px; */
                position: fixed;
                background: var(--sidebar-bg);
                top: 0;
                width: 300px;
                left: -350px;
                transition: 0.7s;
                z-index: 100;
                box-shadow: 100vw 100vh 0px calc(max(100vh, 100vw) + 250px) #0000;
                color: white;
                overflow-y: scroll;
                font-size: 0.8rem;
                height:100vh;
                /*font: 500 15px/1.4 nunito, "Trebuchet MS", sans-serif;*/
            }
            #side::before {
                position: fixed;
                content: "→";
                background: var(--button-bg);
                top: 6rem;
                left: 0px;
                color: white;
                padding: 0;
                z-index: 0;
                transition: 0.2s;
                font-size: 40px;
                padding-right: 10px;
                border-radius: 0 1em 1em 0;
            }

            /*hovering over the arrow*/
            #side:active::before, #side:hover::before {
                opacity: 0;
            }

            /*making sure the sidebar stays open*/
            #side:active, #side:hover {
                left: 0px;
                box-shadow: 100vw 100vh 0px calc(max(100vh, 100vw) + 250px) #0006;
            }
        </style>
    </head>
    <body>
        <!--<div style="height: 10000px; border: 1px solid black;">-->
        <div>

        </div>
         <%       
            Connection con = ConnectionProvider.getConnection();
//            out.println("<h1>Connection is : " +con+"</h1>");
        %>
       
        <div class="container">
            <div id="side">
                <div>
                    <h1 style="text-align: center; font-size: 40px;color: #ffffff;"><u>Category</u></h1>
                </div>
                <%   
                String sql1 = "select * from main_category";
                
                PreparedStatement ps1 = con.prepareStatement(sql1);

                ResultSet rs1 = ps1.executeQuery(sql1);
                while (rs1.next()) {

//                    String fileName = rs1.getString("main_cat_image");
            %>  
                <div>
                    <a href="displaySubCategory.jsp?id=<%= rs1.getInt(1) %>" style="text-align: center; font-size: 30px; color: white"><%= rs1.getString(2)%></a>
                    
                    
<!--                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>
                    <h3 style="text-align: center; font-size: 30px;">one</h3>-->
                </div>
                <%
                }
%>       
            </div>
              
            <!--<h1>Hello World!</h1>-->
    </body>
</html>
