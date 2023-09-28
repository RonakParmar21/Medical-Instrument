
<%@page import="java.sql.*" %>
<%@page import="com.gemtrack.helper.ConnectionProvider" %>
<%@page import="java.lang.String"%>
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
        <script src="assets/js/jquery/jquery.min.js"></script>
        <script src="assets/js/jquery/sidebar.js"></script>
        <link rel="stylesheet" href="assets/css/sidebar.css"/>
        <!--<script src="assets/js/cart.js"></script>-->
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
                z-index: 99999;
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
                color: #black;
                text-decoration: none;
                cursor: pointer;
            }

            .mod-container {
                padding: 2px 16px;
            }

            .mod-hea {
                /*background-color: #5cb85c;*/
                /*font-size: 25px;*/
                color: white;
            }

            .mod-foo {
                /*background-color: #5cb85c;*/
                font-size: 20px;
                color: white;
            }



        </style>


    </head>
    <body>

        <%--<%@include file="assets/css/common_modal.jsp" %>--%>
        <div style="padding: 10px; margin: 10px; display: flex; justify-content: space-between;">



            <!--<div class="cart"  style="">-->
            <!--<h2 style="text-align: center; font-size: 30px; color: #141d28;"><u>Your Cart</u></h2>-->
            <div class="cart-body"style="margin: 20px; padding: 20px;justify-content: space-around; margin: 20px;">

                <table class='table' border="2">
                    
                    <thead class='thead-light'>
                        <tr>
                            <!--<th colspan="7">-->
                            <td colspan="7">
                                <h2 style="text-align: center">
                                    <u>
                                        Confirm Your Order
                                    </u>
                                </h2>
                            </td>
                            <!--<th>-->
                        </tr>
                        <tr>
                            <th>Id</th>
                            <th>Item Id</th>
                            <th>Item Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <%            Connection con3 = ConnectionProvider.getConnection();
            //            out.println("<h1>Connection is : " +con+"</h1>");
                        String u = sign.getUser_name();
                        int sum = 0;
                    %>

                    <%    String sql3 = "select * from add_cart where user_name='" + u + "'";
                        PreparedStatement ps3 = con3.prepareStatement(sql3);
    //            ps3.setString(1, sign.getUser_name());
                        ResultSet rs3 = ps3.executeQuery();
    //            if (rs3.next() == false) {
    //                out.println("Not found");
    //            } else {
                        while (rs3.next()) {
                    %>  

                    <tr>

                        <td> <%= rs3.getInt(1)%> </td>
                        <td> <%= rs3.getInt(3)%> </td>
                        <td> <%= rs3.getString(4)%> </td>
                        <td> <%= rs3.getInt(5)%> </td>
                        <td> <%= rs3.getInt(6)%> </td>
                        <td> <%= rs3.getInt(5) * rs3.getInt(6)%> </td>

                    <form action="DeleteCartItemServlet" method="POST">
                        <input type="hidden" name="id" value="<%= rs3.getInt(1)%>" />
                        <input type="hidden" name="p_id" value="<%= rs3.getInt(3)%>" />
                        <input type="hidden" name="q" value="<%= rs3.getInt(6)%>" />

                        <!--<td> {item.quantity * item.price} </td>-->
                        <td> 
                            <a href="DeleteCartItemServlet?id=<%= rs3.getInt(1)%>">
                                <button class='btn btn-danger'>Remove</button>
                            </a>
                        </td>
                    </form>
                    </tr>

                    <%
                        sum = sum + (rs3.getInt(5) * rs3.getInt(6));
                    %>                          
                    <% }
                    %>
                    <tr>
                        <td>

                            <b>Total Price is : <%= sum%></b>
                        </td>
                    </tr>

                </table>

            </div>

            <!--</div>-->
            <!--            <div style="margin-left: 20px;">
                            <label style="margin-top: 10px;">Do Full Payment with name after reading payment conditions(Required)<span style="color: red;">*</span></label><br>
                            <img src="assets/images/ronak.jpeg" width="width" height="height" alt="alt"/>                    
                                
                            </div>-->
        </div>



        <div style="background-color: #ededed;padding: 20px;margin-top: 20px; width: 80%;">
            <form action="checkout1.jsp" method="POST">
                <h1 style="text-align: center" >Add Delivery Address</h1> <hr><br>

                <!--                <label>Choose Main Category</label>
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
                                </select>-->
                <!--                <select id="mainCategory">
                                    
                                    String sql = "SELECT * FROM main_category";
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                
                            while (rs.next()) {
                                 str += "<option value='" + rs.getString("main_cat_id") + "'>" + rs.getString("main_cat_name") + "</option>";
                            }
                                   %>
                                </select>-->

                <!--<label style="margin-top: 10px;">Choose Sub Category</label>-->
                <!--<p id="demo"></p>-->

                <!--                <select id="demo"  onchange="return loadDoc1(this.value)" name="sub_cat">
                                    <option>Select Sub Category</option>
                                </select> 
                                
                                <label style="margin-top: 10px;">Choose Product</label>
                                <select id="demo1" name="product">
                                    <option>Select Product</option>
                                </select>-->

                <label style="margin-top: 10px;">Full Name (Required)<span style="color: red;">*</span></label>
                <input type="text" name="name" value="<%= sign.getUser_name()%>" placeholder="Enter Full Name" required />
                <label style="margin-top: 10px;">Email (Required)<span style="color: red;">*</span></label>
                <input type="email" name="email" value="<%= sign.getUser_email() %>" placeholder="Enter Email" required />
                <label style="margin-top: 10px;">Mobile No. (Required)<span style="color: red;">*</span></label>
                <input type="text" pattern="[0-9]{10}" value="<%= sign.getUser_mobile() %>" title="Please enter a valid 10-digit mobile number." name="mobile" placeholder="Enter Valid Mobile No." required />
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
                <br>


                <br>
                <%
//                    String totalPrice = (String)request.getAttribute("totalPrice");
//String myVariable = request.getParameter("variable");
                %>
                <!--<input-->
                <!--type="text" value="<= myVariable %>" />-->
                <!--<a href="p.jsp">-->    
                <!--<button id="button">Add</button>--> 
                <!--Save Address & Go Next-->
                
                <!--<input type="submit" value="Confirm Order" style="background-color: orange; font-size: 20px;" />-->
                
                
                <!--</a>-->
                 <input type="hidden" name="orderId" value="order-01" />
        <input type="hidden" name="amount" value="10" />
                 <button type="submit" class="cart-btn">
          Checkout with Cashfree
        </button>
            </form>
        </div>

        <%            }
        %>
    </body>
</html>
