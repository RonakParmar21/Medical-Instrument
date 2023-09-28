<%-- 
    Document   : addSubCategory
    Created on : 20-Aug-2023, 4:09:48 pm
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


            input[type=text], select {
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
                xhttp.open("GET", "load-cat-id.jsp?cat=" + str, true);
                xhttp.send();
            }
        </script>
    </head>
    <body>
        <%@include file="navbar.jsp" %>  
        
        
        <div style="background-color: #ededed;padding: 20px;margin-top: 20px;">
            <form action="../AddSubCatServlet" method="POST" enctype="multipart/form-data">
                <h1 style="text-align: center">Add Sub Category</h1> <hr><br>
                
                <label>Choose Main Category</label>
                <select onchange="return loadDoc(this.value)" name="main_cat_name">
                    <%       
            Connection con = ConnectionProvider.getConnection();
//            out.println("<h1>Connection is : " +con+"</h1>");
        %>
                    <%   
                String sql = "select * from main_category";
                
                PreparedStatement ps = con.prepareStatement(sql);

                ResultSet rs = ps.executeQuery(sql);
                while (rs.next()) {

                   // String fileName = rs.getString("main_cat_image");
            %>
            <option value="<%= rs.getString(1) %>" ><%= rs.getString(2) %></option>
                    
                     <%
                }
%>       
                    
                    
                    
                    
                    <!--<option>America</option>-->
                    <!--<option>Canada</option>-->
                    <!--<option>UK</option>-->
                </select>
<input type="hidden" name="main_cat_id" id="demo" />

                <label style="margin-top: 10px;">Sub Category Name</label>
                <input type="text" name="sub_cat_name" placeholder="Enter Sub Category Name" required />
                <label>Choose Image</label>
                <input type="file" name="sub_cat_image" required />


                <a href="#">
                    <!--<button id="button">Add</button>--> 
                    <input type="submit" value="Add" />
                </a>
                <a href="addProduct.jsp">
                    <input type="button" value="Add Product" style="width: 46%;" />
                </a>
                <a href="index.jsp">
                    <input type="button" value="Cancel" />
                </a>
                <!--<a href="LogoutServlet" style="justify-content: right; align-items: right;"><button style="padding: 10px; widows: 200px; background-color: #141d28; color: white; cursor: pointer; width: 200px; justify-content: right; align-items: right;">logout</button></a>-->
                <!--<a href="#id02" style="background-color: #141d28; width: 200px; margin-right: 10px; margin-left: 45%;">-->
                <!--<button  id="edit-profile-button" style="padding: 10px; widows: 200px; background-color: #141d28; color: white; cursor: pointer; width: 200px;">Edit</button> </a>-->

                <!--<a href="#"><input type="submit" value="Add" style="margin-left: 0px;"></a>-->
                <!--<a href="#"><button>Add</button></a>-->
                <!--<a href="addSubCategory.jsp"><button style="width: 46%">Add Sub Category</button></a>-->
                <!--<a href="index.jsp"><button>Cancel</button></a>-->
                <!--<a href="addSubCategory.jsp"><input type="submit" value="Add Sub Category" style="width: 46%"></a>-->
                <!--<a href="index.jsp"><input type="submit" value="Cancel" /></a>-->
            </form>
        </div>
        
    </body>
</html>
