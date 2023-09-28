<%-- 
    Document   : customerUserDetails
    Created on : 05-Aug-2023, 2:52:54 pm
    Author     : LENOVO
--%>
<%@page import="com.gemtrack.dao.ContactDao" %>
<%@page import="com.gemtrack.entities.Contact"%>
<%@page import="java.sql.*" %>

<%--<%@page import="com.gemtrack.servlets.SignupServlet" %>--%> 
<%@page import="com.gemtrack.helper.ConnectionProvider" %>

<%
//    Signup sign = new Signup();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            html {
                line-height: 1;
            }
            body {
                background-color: #fff;
                color: #333;
                font: 16px arial, sans-serif;
            }
            * {
                margin: 0;
                padding: 0;
            }
            *,
            *:after,
            *:before {
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            .container {
                margin: 0 auto;
                max-width: 1024px;
                padding: 0 20px;
                overflow: auto;
            }
            .container table {
                margin: 15px 0 0;
            }
            table {
                color: #4a4a4d;
                font: 15px/1.4 "Helvetica Neue", Helvetica, Arial, Sans-serif;
                width: 100%;
            }
            thead {
                background: #395870;
                -webkit-background: linear-gradient(#49708f, #293f50);
                -moz-background: linear-gradient(#49708f, #293f50);
                background: linear-gradient(#49708f, #293f50);
                color: #fff;
            }
            tbody tr:nth-child(even) {
                background: #f0f0f2;
            }
            /* borders cannot be applied to tr elements or table structure elements. we should follow like below code. */
            tfoot tr:last-child td {
                /*//border-bottom: 0;*/
            }
            th,
            td {
                /*//border: 2px solid #666;*/
                padding: 6px 10px;
                vertical-align: middle;
            }
            td {
                border-bottom: 1px solid #cecfd5;
                border-right: 1px solid #cecfd5;
            }
            td:first-child {
                border-left: 1px solid #cecfd5;
            }
            .book-title {
                color: #395870;
                /*//display: block;*/
            }
            .item-stock,
            .item-qty {
                text-align: center;
            }
            .item-price {
                text-align: right;
            }
            .item-multiple {
                display: block;
            }
            /* task */
            .task table {
                margin-bottom: 44px;
            }
            .task a {
                color: #666666;
                /*//text-decoration: none;*/
            }
            .task thead {
                background-color: #f5f5f5;
                -webkit-background: transparent;
                -moz-background: transparent;
                background: transparent;
                color: #333;
            }
            .task table th, .task table td {
                border-bottom: 0;
                border-right: 0;
            }
            .task table td {
                border-bottom: 1px solid #ddd;
            }
            .task table th, .task table td {
                padding-bottom: 22px;
                vertical-align: top;
            }
            .task tbody tr:nth-child(even) {
                background: transparent;
            }
            .task table:last-child {
                /*//margin-bottom: 0;*/
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <%            Connection con = ConnectionProvider.getConnection();
//            out.println("<h1>Connection is : " +con+"</h1>");
        %>

        <%
//    Signup sign = new Signup();
        %>

        <%    String sql = "select * from feedback";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next() == false) {
                out.println("Not found");
            } else {
        %>  

        <!--new--> 
        <div class="container">
            <h1 style="text-align: center"><u>Contact Details</u></h1>
            <table style="margin-bottom: 5%; margin-top: 5%;">
                <h3><thead>
                    <tr>
                        <th style="font-size: 20px; text-align: center;" scope="col">Contact Id</th>
                        <th style="font-size: 20px; text-align: center;" scope="col">Name</th>
                        <th style="font-size: 20px; text-align: center;" scope="col">Email</th>
                        <th style="font-size: 20px; text-align: center;" scope="col">Mobile No.</th>
                        <th style="font-size: 20px; text-align: center;" scope="col">Description</th>
                        <th style="font-size: 20px; text-align: center;" scope="col" colspan="3">Action</th>
                    </tr>
                </thead>
                </h3>
                <%
                    do {
                %>
                <tbody>
                <tr>
                    <td style="text-align: center;"><%= rs.getInt(1)%></td>
                    <td style="text-align: center;"><%= rs.getString(2)%></td>
                    <td style="text-align: center;"><%= rs.getString(3)%></td>
                    <td style="text-align: center;"><%= rs.getString(4)%></td>
                    <td style="text-align: center;"><%= rs.getString(5)%></td>
                    <td style="text-align: center;">
                        <!--<a href=""-->
                    </td>
                   <td><a href="#"><input type="submit" value="Update" style="background-color: green; padding: 5px; cursor: pointer; width: 100%; color: white;"></a></td>
                    <td><a href="../DeleteContactDetailsServlet"><input type="submit" value="Delete" style="background-color: red; padding: 5px; cursor: pointer; width: 100%; color: white;"></a></td>
                </tr>           
                </tbody>
                <%
                        } while (rs.next());
                    }
                %>       
            </table></div>
                <%@include file="footer.jsp" %>
                <!--<h1>Hello World!</h1>-->
                </body>
                </html>
