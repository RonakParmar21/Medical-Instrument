
<%-- 
    Document   : addProduct
    Created on : 20-Aug-2023, 6:27:12 pm
    Author     : LENOVO
--%>

<%@page import="com.gemtrack.dao.MainCategoryDao" %>
<%@page import="com.gemtrack.entities.MainCategory"%>
<%@page import="com.gemtrack.dao.SubCategoryDao" %>
<%@page import="com.gemtrack.entities.SubCategory"%>
<%@page import="java.sql.*" %>

<%@page import="com.gemtrack.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <script>
            function loadDoc(str) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("demo").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "load-cat.jsp?cat=" + str, true);
                xhttp.send();
            }
            
            
                    function loadDoc1(str) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("demo1").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "load-cat1.jsp?cat1=" + str, true);
                xhttp.send();
            }
        </script>

    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <%            // Connection conn = ConnectionProvider.getConnection();

        %>

        <%            Connection con = ConnectionProvider.getConnection();

            PreparedStatement ps;
            ResultSet rs;
            String str;
//            out.println("<h1>Connection is : "+con+"</h1>");
        %>
        <!--<div style="background-color: #ededed;padding: 20px;margin-top: 20px; width: 50%;">-->
        <div style="background-color: #ededed;padding: 20px;margin-top: 20px; width: 80%;">
            <form action="../AddSubProductServlet" method="POST" enctype="multipart/form-data">
                <h1 style="text-align: center" >Add Sub Product</h1> <hr><br>
                
                

                <label>Choose Main Category</label>
                <select onchange="return loadDoc(this.value)" name="main_cat_name">
                    <option>Select Main Category</option>
                    <%    String sql = "select * from main_category";
                        ps = con.prepareStatement(sql);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                    %>  
                    <option value="<%= rs.getString("main_cat_id") %>">
                        <%= rs.getString("main_cat_name")%>
                    </option>
                    <%
                        }
                    %>  
                </select>
                <!--                <select id="mainCategory">
                                    
                                    String sql = "SELECT * FROM main_category";
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                
                            while (rs.next()) {
                                 str += "<option value='" + rs.getString("main_cat_id") + "'>" + rs.getString("main_cat_name") + "</option>";
                            }
                                   %>
                                </select>-->

                <label style="margin-top: 10px;">Choose Sub Category</label>
                <!--<p id="demo"></p>-->
                
                <select id="demo"  onchange="return loadDoc1(this.value)" name="sub_cat">
                    <option>Select Sub Category</option>
                </select> 
                
                <label style="margin-top: 10px;">Choose Product</label>
                <select id="demo1" name="product">
                    <option>Select Product</option>
                </select>
                
                <label style="margin-top: 10px;">Model No.</label>
                <input type="text" name="model_no" placeholder="Enter Model No" required />
                <label style="margin-top: 10px;">Description</label>
                <textarea id="id" name="description" rows="5" cols="10"></textarea>
                
                <label style="margin-top: 10px;">Fetures</label>
                <textarea id="id" name="fetures" rows="5" cols="10"></textarea>
                
                <label style="margin-top: 10px;">Quantity</label>
                <input type="number" name="quantity" placeholder="Enter Quantity of Product" />
                
                <label style="margin-top: 10px;">Price</label>
                <input type="number" name="price" placeholder="Enter Price" />
                

<!--                <label style="margin-top: 10px;">Model No.</label>
                <input type="number" name="productModelNumber" placeholder="Enter Product Model Number" />-->

<!--                <label style="margin-top: 10px;">Description</label>
                <textarea rows="5"></textarea>
                <input type="number" name="productModelNumber" placeholder="Enter Product Model Number" />-->

                <label>Choose Image</label>
                <input type="file" name="sub_product_image" required />


                <a href="#">
                    <!--<button id="button">Add</button>--> 
                    <input type="submit" value="Add" />
                </a>
            </form>
        </div>
    
    </body>
</html>
