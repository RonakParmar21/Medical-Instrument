<%-- 
    Document   : subCategoryDetails
    Created on : 26-Aug-2023, 8:59:47 pm
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

        <%    String sql = "select * from sub_category";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next() == false) {
                out.println("Not found");
            } else {
        %>  

        <!--new--> 
        <div class="container">
            <h1 style="text-align: center; margin-top: 1%;"><u>Sub Category Details</u></h1>
            <table style="margin-bottom: 5%; margin-top: 2%;">
                <h3><thead>
                        <tr>
                            <th style="font-size: 20px; text-align: center;" scope="col">ID</th>
                            <th style="font-size: 20px; text-align: center;" scope="col">Image</th>
                            <th style="font-size: 20px; text-align: center;" scope="col">Main Category id</th>
<!--                            <th style="font-size: 20px; text-align: center;" scope="col">Main Category Name</th>-->
                                              <th style="font-size: 20px; text-align: center;" scope="col">Sub Category Name</th>
                        
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
                        <td style="text-align: center;">
                            <img src="../assets/images/Sub_Categories/<%= rs.getString(4) %>" width="80" height="80"/>                        
                        </td>
                        <td style="text-align: center;"><%= rs.getString(2)%></td>
                        <td style="text-align: center;"><%= rs.getString(3)%></td>
                        
                        <td>
                        <a href="updateSubCategoryDetails.jsp?subId=<%=  rs.getInt(1) %>" class="btn btn-warning bold-btn" style="background-color: green; padding: 5px; cursor: pointer; width: 100%; color: white;">Update</a>
                        </td>
<!--                        <td><a href="updateSubCategoryDetails.jsp?subId=<=  rs.getString(1) %>" data-toggle="modal" ><input type="submit" value="Update" style="background-color: green; padding: 5px; cursor: pointer; width: 100%; color: white;"></a></td>-->
                        <!--<td>-->
                            <!--<a href="../DeleteSubCatServlet?id=<= rs.getInt(1)%>"><input type="submit" value="Delete" style="background-color: red; padding: 5px; cursor: pointer; width: 100%; color: white;"></a>-->
                            <!--<a href=""></a>-->
                        <!--</td>-->
                    </tr>           
                </tbody>
                <%
                        } while (rs.next());
                    }
                %>       
            </table>
        </div>
                <%@include file="footer.jsp" %>

    </body>
</html>
