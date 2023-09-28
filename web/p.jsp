<%-- 
    Document   : p
    Created on : 10-Sept-2023, 3:39:21 pm
    Author     : LENOVO
--%>
<%@page import="com.gemtrack.dao.SignupDao"%>
<%@page import="com.gemtrack.entities.Signup"%>
<%@page errorPage="error_page.jsp" %>
<%
    Signup sign = (Signup) session.getAttribute("currentUser");

    if (sign == null) {
        response.sendRedirect("login.jsp");
    } else {

//    out.write(sign);
//    out.println(sign);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
              <style>
            input[type=text], [type=email], [type=number], [type=file], select, textarea {
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
        <%--<%@include file="nav-header.jsp" %>--%>
        
        
<!--        <h1>Hello <= sign.getUser_name() %> </h1>        -->


<%
    String name = request.getParameter(name);
%>



<!--    <div style="background-color: #ededed;padding: 20px;margin-top: 20px; width: 80%;">
            <form action="" method="POST" enctype="multipart/form-data">
                <h1 style="text-align: center" >Add Delivery Address</h1> <hr><br>

                                <label>Choose Main Category</label>
                                <select onchange="return loadDoc(this.value)" name="main_cat_name">
                                    <option>Select Main Category</option>
                                    % 
                //                        String sql = "select * from main_category";
                //                        ps = con.prepareStatement(sql);
                //                        rs = ps.executeQuery();
                //                        while (rs.next()) {
                                    >  
                                    <option value="=// rs.getString("main_cat_id") %>">
                                     %= //rs.getString("main_cat_name")%>
                                    </option>
                                    <
                                        //}
                                    %>  
                                </select>
                                <select id="mainCategory">
                                    
                                    String sql = "SELECT * FROM main_category";
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                
                            while (rs.next()) {
                                 str += "<option value='" + rs.getString("main_cat_id") + "'>" + rs.getString("main_cat_name") + "</option>";
                            }
                                   %>
                                </select>

                <label style="margin-top: 10px;">Choose Sub Category</label>
                <p id="demo"></p>

                                <select id="demo"  onchange="return loadDoc1(this.value)" name="sub_cat">
                                    <option>Select Sub Category</option>
                                </select> 
                                
                                <label style="margin-top: 10px;">Choose Product</label>
                                <select id="demo1" name="product">
                                    <option>Select Product</option>
                                </select>

                <label style="margin-top: 10px;">Full Name (Required)<span style="color: red;">*</span></label>
                <input type="text" name="name" placeholder="Enter Full Name" required />
                <label style="margin-top: 10px;">Email (Required)<span style="color: red;">*</span></label>
                <input type="email" name="email" placeholder="Enter Email" required />
                <label style="margin-top: 10px;">Mobile No. (Required)<span style="color: red;">*</span></label>
                <input type="text" pattern="[0-9]{10}" title="Please enter a valid 10-digit mobile number." name="mobile" placeholder="Enter Valid Mobile No." required />
                <label style="margin-top: 10px;">Pin Code No. (Required)<span style="color: red;">*</span></label>
                <input type="text" pattern="[0-9]{6}" title="Please enter a valid 6-digit pin code number." name="pin" placeholder="Enter Pin Code No." required />

                <label style="margin-top: 10px;">State (Required)<span style="color: red;">*</span></label>
                <input type="text" name="state" placeholder="Enter State Name" required />

                <label style="margin-top: 10px;">City Name (Required)<span style="color: red;">*</span></label>
                <input type="text" name="city" placeholder="Enter City Name" required />


                <label style="margin-top: 10px;">Address, House no., Building Name (Required)<span style="color: red;">*</span></label>
                <textarea id="id" name="address1" rows="5" cols="10"></textarea>
                <label style="margin-top: 10px;">Address, Road name, Area, Colony (Required)<span style="color: red;">*</span></label>
                <textarea id="id" name="address2" rows="5" cols="10"></textarea>

                <a href="p.jsp">
                    <button id="button">Add</button> 
                    <input type="submit" value="Save Address & Go Next" style="background-color: orange; font-size: 20px;" />
                </a>
            </form>
        </div>
-->








        
                <%            }
        %>
    </body>
</html>
