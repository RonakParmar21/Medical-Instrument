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
    Signup sign = new Signup();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <!--delete modal script & style links-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<script src="httpss://code.jquery.com/jquery-3.5.1.min.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <!--delete & style modal links end-->

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


            /*modal css*/
            /* Add animation (Chrome, Safari, Opera) */
            @-webkit-keyframes example {
                from {
                    top: -100px;
                    opacity: 0;
                }
                to {
                    top: 0px;
                    opacity: 1;
                }
            }

            /* Add animation (Standard syntax) */
            @keyframes example {
                from {
                    top: -100px;
                    opacity: 0;
                }
                to {
                    top: 0px;
                    opacity: 1;
                }
            }

            /* The mod's background */
            .mod {
                display: none;
                position: fixed;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0.4);
            }

            /* Display the mod when targeted */
            .mod:target {
                display: table;
                position: absolute;
            }

            /* The mod box */
            .mod-dialog {
                display: table-cell;
                vertical-align: middle;
            }

            /* The mod's content */
            .mod-dialog .mod-content {
                margin: auto;
                background-color: #f3f3f3;
                position: relative;
                padding: 0;
                outline: 0;
                border: 1px #777 solid;
                text-align: justify;
                width: 80%;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

                /* Add animation */
                -webkit-animation-name: example; /* Chrome, Safari, Opera */
                -webkit-animation-duration: 0.5s; /* Chrome, Safari, Opera */
                animation-name: example;
                animation-duration: 0.5s;
            }

            /* The button used to close the mod */
            .mod-btn {
                text-decoration: none;
                float: right;
                font-size: 35px;
                font-weight: bold;
                color: #fff;
            }

            .mod-btn:hover,
            .mod-btn:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

            .mod-container {
                padding: 2px 16px;
            }

            .mod-hea {
                background-color: #5cb85c;
                font-size: 25px;
                color: white;
            }

            .mod-foo {
                background-color: #5cb85c;
                font-size: 20px;
                color: white;
            }







            /*delete modal style*/
            .modal-confirm {
                color: #636363;
                width: 400px;
            }
            .modal-confirm .modal-content {
                padding: 20px;
                border-radius: 5px;
                border: none;
                text-align: center;
                font-size: 14px;
            }
            .modal-confirm .modal-header {
                border-bottom: none;
                position: relative;
            }
            .modal-confirm h4 {
                text-align: center;
                font-size: 26px;
                margin: 30px 0 -10px;
            }
            .modal-confirm .close {
                position: absolute;
                top: -5px;
                right: -2px;
            }
            .modal-confirm .modal-body {
                color: #999;
            }
            .modal-confirm .modal-footer {
                border: none;
                text-align: center;
                border-radius: 5px;
                font-size: 13px;
                padding: 10px 15px 25px;
            }
            .modal-confirm .modal-footer a {
                color: #999;
            }
            .modal-confirm .icon-box {
                width: 80px;
                height: 80px;
                margin: 0 auto;
                border-radius: 50%;
                z-index: 9;
                text-align: center;
                border: 3px solid #f15e5e;
            }
            .modal-confirm .icon-box i {
                color: #f15e5e;
                font-size: 46px;
                display: inline-block;
                margin-top: 13px;
            }
            .modal-confirm .btn, .modal-confirm .btn:active {
                color: #fff;
                border-radius: 4px;
                background: #60c7c1;
                text-decoration: none;
                transition: all 0.4s;
                line-height: normal;
                min-width: 120px;
                border: none;
                min-height: 40px;
                border-radius: 3px;
                margin: 0 5px;
            }
            .modal-confirm .btn-secondary {
                background: #c1c1c1;
            }
            .modal-confirm .btn-secondary:hover, .modal-confirm .btn-secondary:focus {
                background: #a8a8a8;
            }
            .modal-confirm .btn-danger {
                background: #f15e5e;
            }
            .modal-confirm .btn-danger:hover, .modal-confirm .btn-danger:focus {
                background: #ee3535;
            }
            .trigger-btn {
                display: inline-block;
                /*margin: 100px auto;*/
            }



















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

        <%    String sql = "select * from signup";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next() == false) {
                out.println("Not found");
            } else {
        %>  

        <!--new--> 
        <div class="container">
            <div style="display: flex;justify-content: space-between">
                <h1 style="text-align: left; margin-top: 1%;"><u>Customer User Details</u></h1>
                <!--<input type="search" name="s"/>-->
            </div>

            <table style="margin-bottom: 5%; margin-top: 2%;">
                <h3><thead>
                        <tr>
                            <th style="font-size: 20px; text-align: center;" scope="col">User Id</th>
                            <th style="font-size: 20px; text-align: center;" scope="col">User Name</th>
                            <th style="font-size: 20px; text-align: center;" scope="col">User Email</th>
                            <th style="font-size: 20px; text-align: center;" scope="col">User Mobile No.</th>
                            <th style="font-size: 20px; text-align: center;" scope="col">User Birth of Date</th>
                            <th style="font-size: 20px; text-align: center;" scope="col">Action</th>
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
                        <td style="text-align: center;"><%= rs.getString(6)%></td>
                        <td style="text-align: center;"><%= rs.getString(7)%></td>
                        <!--<td><a href="#myModal?id" data-toggle="modal" ><input type="submit" value="Update" style="background-color: green; padding: 5px; cursor: pointer; width: 100%; color: white;"></a></td>-->
                        <!--<td>-->
                        <!--<a href="updateCustomerUserDetails.jsp?i=%= rs.getInt(1) %>" class="btn btn-warning bold-btn" style="background-color: green; padding: 5px; cursor: pointer; width: 100%; color: white;">Update</a>-->
                        <!--</td>-->

                        <!--                        <td style="text-align: center;">
                                                                  <a href="#id02">
                                                                    <button  id="edit-profile-button" style="background-color: green; padding: 5px; cursor: pointer; width: 100%; color: white;">Update</button> </a>
                                                </td>-->

                        <!--<td><a href="#myModal" class="trigger-btn" data-toggle="modal"><input type="submit" value="Delete" style="background-color: red; padding: 5px; cursor: pointer; width: 100%; color: white;"></a></td>-->
                        <td>
                            <a href="../DeleteUserServlet?id=<%= rs.getInt(1)%>"><input type="submit" value="Delete" style="background-color: red; padding: 5px; cursor: pointer; width: 100%; color: white;"></a>
                            <!--<a href=""></a>-->
                        </td>
                    </tr>           
                </tbody>
                <%
                    } while (rs.next());
                %>


                <div id="id02" class="mod">
                    <div class="mod-dialog">
                        <div class="mod-content">
                            <div class="mod-hea mod-container">
                                <a href="#" class="mod-btn" style="color: #141d28;">×</a>
                                <h2 style="text-align: center; font-size: 40px;"><span style="color: #EE1E4E;">G</span><span style="color: #F6851F;">E</span><span style="color: #B71D8D;">M</span><span style="color: #4E2E8F;">T</span><span style="color: #2885C7;">R</span><span style="color: #B55845;">A</span><span style="color: #B31E8E;">C</span><span style="color: #21A8B2;">K</span></h2> <hr>
                            </div>
                            <div class="mod-container">

                                <!--<div id="profile-details">-->
                                <!--<center><img src=""file picture" style="margin-top: 20px; margin-bottom: 20px;"/>-->
                                <h1><%= sign.getUser_id()%></h1>
                                </center>

                                <div id="container">
                                    <h1>Edit Profile Please Carefull</h1>
                                    <div class="underline">
                                    </div>

                                    <form action="#" method="POST" id="contact_form">


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




                            <hr>
                            <div class="mod-foo mod-container" style="display: flex;">


                                <a href="#id01" style="background-color: #141d28; width: 200px; margin-right: 10px; margin-left: 45%;">
                                    <button  id=" edit-profile-button" style="padding: 10px; widows: 200px; background-color: #141d28; color: white; cursor: pointer; width: 200px;">Back</button> </a>



                            </div>
                        </div>
                        <!--</div>-->
                    </div>  
                </div>     



                <%
                    }
                %>       

                <!--<h1>Hello World!</h1>-->

                <!--                <div id="id02" class="mod">
                                    <div class="mod-dialog">
                                        <div class="mod-content">
                                            <div class="mod-hea mod-container">
                                                <a href="#" class="mod-btn" style="color: #141d28;">×</a>
                                                <h2 style="text-align: center; font-size: 40px;"><span style="color: #EE1E4E;">G</span><span style="color: #F6851F;">E</span><span style="color: #B71D8D;">M</span><span style="color: #4E2E8F;">T</span><span style="color: #2885C7;">R</span><span style="color: #B55845;">A</span><span style="color: #B31E8E;">C</span><span style="color: #21A8B2;">K</span></h2> <hr>
                                            </div>
                                            <div class="mod-container">
                
                                                <div id="profile-details">
                                                <center><img src="../assets/images/Profile Pictures/profile.png" alt="profile picture" style="margin-top: 20px; margin-bottom: 20px;"/>
                
                                                </center>
                
                                                                                        <div>
                                                                                            <form action="UpdateUserServlet" method="POST">
                                                                        
                                                                                                <input type="text" name="user_name"placeholder="Enter Name" required/>
                                                                                                <input type="email" name="user_email"placeholder="Enter Email" required/>
                                                                                                <input type="password" name="user_password"placeholder="Enter Password" required/>
                                                                                                <input type="tel" name="user_mobile"placeholder="Enter Mobile" required/>
                                                                                                <input type="date" name="user_bdate"placeholder="Select Birth of Date" required/>
                                                                                                <input type="submit" value="update" placeholder="Enter Name" required/>
                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                            </form>
                                                                                        </div>
                
                                                <div id="container">
                                                    <h1>Edit Profile Please Carefull</h1>
                                                    <div class="underline">
                                                    </div>
                                                                <div class="icon_wrapper">
                                                                    <div><a href="#"><i class="fa-brands fa-facebook fa-2xl icon" style="color: #141d28;"></i></a></div>
                                                                    
                                                                     <div><a href="#"><i class="fa-brands fa-square-twitter fa-2xl icon" style="color: #141d28;"></i></a></div>
                                                                     
                                                                      <div><a href="#"><i class="fa-brands fa-square-instagram fa-2xl icon" style="color: #141d28;"></i></a></div>
                                                                      
                                                                       <div><a href="#"><i class="fa-brands fa-linkedin fa-2xl icon" style="color: #141d28;"></i></a></div>
                                                                   
                                                    
                                                    
                                                                </div>
                                                    <form action="../UpdateUserServlet" method="POST" id="contact_form">
                
                
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
                                                    </form>  End form 
                                                </div> 
                
                
                
                                            </div>
                
                
                
                
                                            <hr>
                                            <div class="mod-foo mod-container" style="display: flex;">
                
                
                                                <a href="#id01" style="background-color: #141d28; width: 200px; margin-right: 10px; margin-left: 45%;">
                                                <button  id=" edit-profile-button" style="padding: 10px; widows: 200px; background-color: #141d28; color: white; cursor: pointer; width: 200px;">Back</button> </a>
                                                <a href="LogoutServlet" style="justify-content: right; align-items: right;"><button style="padding: 10px; widows: 200px; background-color: #141d28; color: white; cursor: pointer; width: 200px; justify-content: right; align-items: right;">logout</button></a>
                
                
                
                                            </div>
                                        </div>
                                        </div>
                                    </div>  
                                </div>     -->



                <!--delete modal start-->
                <!--                <div id="myModal" class="modal fade">
                                    <div class="modal-dialog modal-confirm">
                                        <div class="modal-content">
                                            <div class="modal-header flex-column">
                                                <div class="icon-box">
                                                    <i class="material-icons">&#xE5CD;</i>
                                                </div>						
                                                <h4 class="modal-title w-100">Are you sure?</h4>	
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Do you really want to delete these records? This process cannot be undone.</p>
                                            </div>
                                            <div class="modal-footer justify-content-center">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                <button type="button" class="btn btn-danger">Delete</button>
                                            </div>
                                        </div>
                                    </div>
                                </div> -->
                <!--delete modal end-->



                <!--                <div class="modal fade" id="susbc-form">
                                    <div class="modal-dialog shadow-lg p-3 mb-5 bg-white rounded">
                                        <div class="modal-content sub-bg">
                                            <div class="modal-header subs-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                 <h4 class="modal-title">Modal title</h4> 
                                            </div>
                                            <div class="modal-body">
                                                <div class="text-center">
                                                    <img src="../assets/images/Profile Pictures/profile.png" alt="alt"/>   
                                                    <img class="img-fluid" src=s"hssttp://pluspng.com/img-png/national-geographic-logo-vector-png-national-geographic-kids-logo-vector-300.png" alt="">
                                                </div>
                                                <div class="heading-text text-center ">
                                                    <h4 class="shadow p-3 mb-5">Kiddoz Club Presenting <br> Special Offer</h4>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <form id="subs-form">
                                                            <div class="form-group row">
                                                                <div class="col-md-12 col-xs-12">
                                                                    <label for="firstName" class="">Name </label>
                                                                    <input type="text" class="form-control" name="user_name" id="firstName" placeholder="Please enter first name" required>
                                                                </div>
                                                                <div class="col-md-12 col-xs-12" >
                                                                    <label for="firstName">Email </label>
                                                                    <input type="email" name="user_email" class="form-control" id="firstName" placeholder="Please enter middle name" required>
                                                                </div>
                                                                <div class="col-md-12 col-xs-12">
                                                                    <label for="firstName">Password </label>
                                                                    <input type="password" name="user_password" class="form-control" id="firstName" placeholder="Please enter last name" required>
                                                                </div>
                                                                <div class="col-md-12 col-xs-12">
                                                                    <label for="firstName">Mobile No. </label>
                                                                    <input type="tel" name="user_mobile" class="form-control" id="firstName" placeholder="Please enter last name" required>
                                                                </div>
                                                                <div class="col-md-12 col-xs-12">
                                                                    <label for="firstName">Birth of Date </label>
                                                                    <input type="date" name="user_bdate" class="form-control" id="firstName" placeholder="Please enter last name" required>
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
                                                    <img src="httssp://pluspng.com/img-png/national-geographic-logo-vector-png-national-geographic-kids-logo-vector-300.png" alt="">
                                                </div>
                                                <div class="heading-text text-center">
                                                    <h4>Thank you For Subscribe</h4>
                                                </div>
                
                                            </div>
                                        </div>
                                    </div>
                                </div>-->
            </table></div>
                
                <%@include file="footer.jsp" %>


                <script>
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
                </script>
                </body>
                </html>

