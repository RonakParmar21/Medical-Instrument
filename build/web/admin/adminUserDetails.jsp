<%-- 
    Document   : customerUserDetails
    Created on : 05-Aug-2023, 2:52:54 pm
    Author     : LENOVO
--%>
<%@page import="com.gemtrack.dao.SignupDao" %>
<%@page import="com.gemtrack.entities.Signup"%>
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




            /*update modal style*/
            label{
                color:#000;
                font-weight:500;
                background:#fff;
                margin-bottom:5px;
                padding:4px;
                border-radius:4px;
            }
            input{
                margin-bottom:10px
            }
            .sub-bg {
                background: url('https://the-french.co.uk/wp-content/uploads/2018/02/111-400x600.jpg')no-repeat;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .subs-header{
                padding-top: 0px;
                border-bottom: 0px;
            }
            .heading-text h4{
                color: #fff;
                padding: 20px;
                border: 2px solid #d3d3d3;
                display: inline-block;
                border-radius: 20px;
                box-shadow: inset 10px 12px 13px -7px rgba(0,0,0,0.7);
                -moz-box-shadow: inset 10px 12px 13px -7px rgba(0,0,0,0.7);
                -webkit-box-shadow: inset 10px 12px 13px -7px rgba(0,0,0,0.7);
                -o-box-shadow: inset 10px 12px 13px -7px rgba(0,0,0,0.7);
            }
            .heading-text{
                margin-top: 10px;
            }
            .close:not(:disabled):not(.disabled):focus, .close:not(:disabled):not(.disabled):hover {
                outline: none;
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

        <%    String sql = "select * from admin_signup";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next() == false) {
                out.println("Not found");
            } else {
        %>  

        <!--new--> 
        <div class="container">
            <h1 style="text-align: center; margin-top: 1%;"><u>Admin User Details</u></h1>
            <a href="addAdmin.jsp"><input type="submit" value="Add Admin"  style="background-color: #141d28; color: white; width: 150px; padding: 10px; margin-top: 10px; margin-bottom: 10px; font-size: 20px; text-align: center; margin-left: 86%; cursor: pointer;"></a>
            <table style="margin-bottom: 5%; margin-top: 0;">
                <h3><thead>
                        <tr>
                            <th style="font-size: 20px; text-align: center;" scope="col">Admin Id</th>
                            <th style="font-size: 20px; text-align: center;" scope="col">Admin Name</th>
                            <th style="font-size: 20px; text-align: center;" scope="col">Admin Email</th>
                            <!--<th style="font-size: 20px; text-align: center;" scope="col">User Mobile No.</th>-->
                            <!--<th style="font-size: 20px; text-align: center;" scope="col">User Birth of Date</th>-->
                            <th style="font-size: 20px; text-align: center;" scope="col" colspan="2">Action</th>
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


                        <td><a href="#" data-toggle="modal"><input type="submit" value="Update" style="background-color: green; padding: 5px; cursor: pointer; width: 100%; color: white;"></a></td>
                        <!--<td><a href="updateAdmin.jsp?id=<%= rs.getInt(1) %>">Update</a>-->
                        <td><a href="../DeleteAdminUserServlet?id=<%= rs.getInt(1)%>"><input type="submit" value="Delete" style="background-color: red; padding: 5px; cursor: pointer; width: 100%; color: white;"></a></td>
                    </tr>           
                </tbody>
                <%
                        } while (rs.next());
                    }
                %>       

                <!--<h1>Hello World!</h1>-->


<!--                update modal
                <div class="modal fade" id="susbc-form">
                    <div class="modal-dialog shadow-lg p-3 mb-5 bg-white rounded">
                        <div class="modal-content sub-bg">
                            <div class="modal-header subs-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                 <h4 class="modal-title">Modal title</h4> 
                            </div>
                            <div class="modal-body">
                                <div class="text-center">
                                    <img src="../assets/images/Profile Pictures/profile.png" alt="alt"/>
                                    <img class="img-fluid" src="httssp://pluspng.com/img-png/national-geographic-logo-vector-png-national-geographic-kids-logo-vector-300.png" alt="">
                                </div>
                                <div class="heading-text text-center ">
                                    
                                    <h4 class="shadow p-3 mb-5">Kiddoz Club Presenting <br> Special Offer</h4>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <form id="subs-form">
                                            <div class="form-group row">
                                                <div class="col-md-12 col-xs-12">
                                                    <label for="firstName" class="">First Name </label>
                                                    <input type="text" class="form-control" id="firstName" placeholder="Please enter first name" required>
                                                </div>
                                                <div class="col-md-12 col-xs-12" >
                                                    <label for="firstName">Middle Name </label>
                                                    <input type="text" class="form-control" id="firstName" placeholder="Please enter middle name" required>
                                                </div>
                                                <div class="col-md-12 col-xs-12">
                                                    <label for="firstName">Last Name </label>
                                                    <input type="text" class="form-control" id="firstName" placeholder="Please enter last name" required>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary text-center">Subscribe Now</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="susbc-form-thank">
                    <div class="modal-dialog">
                        <div class="modal-content sub-bg shadow-lg">
                            <div class="modal-header subs-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                 <h4 class="modal-title">Modal title</h4> 
                            </div>
                            <div class="modal-body">
                                <div class="text-center">
                                  
                                    <img ssrc="httpss://pluspng.com/img-png/national-geographic-logo-vector-png-national-geographic-kids-logo-vector-300.png" alt="">
                                </div>
                                <div class="heading-text text-center">
                                    <h4>Thank you For Subscribe</h4>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>-->


<!--                <script>
                    setTimeout(function () {
                        $('#susbc-form').modal('show');
                    }, 3000);
                    var form = document.getElementById("subs-form");
                    form.addEventListener("submit", onSubmitForm);
                    function onSubmitForm(e) {
                        e.preventDefault();
                        $('#subs-form')[0].reset();
                        $('#susbc-form').modal('hide');
                        $('#susbc-form-thank').modal('show');
                    }

                </script>-->
            </table></div>
<%@include file="footer.jsp" %>
                </body>
                </html>
