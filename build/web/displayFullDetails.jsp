<%-- 
    Document   : displayFullDetails
    Created on : 03-Sept-2023, 2:50:20 pm
    Author     : LENOVO
--%>
<%@page import="java.lang.String"%>
<%@page import="com.gemtrack.dao.SignupDao"%>
<%@page import="com.gemtrack.entities.Signup"%>
<%@page errorPage="error_page.jsp" %>
<%
    Signup sign1 = (Signup) session.getAttribute("currentUser");

    if(sign1 == null) {
        response.sendRedirect("login.jsp");
        
    }
    
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
        <!--<script src="assets/js/cart.js"></script>-->
        <link rel="stylesheet" href="assets/css/sidebar.css"/>
        
        <style>
            /*product cards*/
            :root {
                --font1: 'Heebo', sans-serif;
                --font2: 'Fira Sans Extra Condensed', sans-serif;
                --font3: 'Roboto', sans-serif;

                --btnbg: #ffcc00;
                --btnfontcolor: rgb(61, 61, 61);
                --btnfontcolorhover: rgb(255, 255, 255);
                --btnbghover: #ffc116;
                --btnactivefs: rgb(241, 195, 46);


                --label-index: #960796;
                --danger-index: #5bc257;
                /* PAGINATE */
                --link-color: #000;
                --link-color-hover: #fff;
                --bg-content-color: #ffcc00;

            }

            .container-fluid {
                max-width: 1400px;
            }

            .card {
                background: #fff;
                box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
                transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
                border: 0;
                border-radius: 1rem;
            }

            .card-img,
            .card-img-top {
                border-top-left-radius: calc(1rem - 1px);
                border-top-right-radius: calc(1rem - 1px);
            }


            .card h5 {
                overflow: hidden;
                /*height: 55px;*/
                font-weight: 300;
                font-size: 1rem;
            }

            .card h5 a {
                color: black;
                text-decoration: none;
            }

            .card-img-top {
                width: 100%;
                min-height: 250px;
                max-height: 250px;
                object-fit: contain;
                /*padding: 30px;*/
            }

            .card h2 {
                font-size: 1rem;
            }


            .card:hover {
                transform: scale(1.02);
                box-shadow: 0 10px 20px rgba(0, 0, 0, .12), 0 4px 8px rgba(0, 0, 0, .06);
            }

            /* Centered text */
            .label-top {
                position: absolute;
                background-color: var(--label-index);
                color: #fff;
                top: 8px;
                right: 8px;
                /*padding: 5px 10px 5px 10px;*/
                font-size: .7rem;
                font-weight: 600;
                border-radius: 3px;
                text-transform: uppercase;
            }

            .top-right {
                position: absolute;
                top: 24px;
                left: 24px;

                width: 90px;
                /*height: 90px;*/
                border-radius: 50%;
                font-size: 1rem;
                font-weight: 900;
                background: #8bc34a;
                line-height: 90px;
                text-align: center;
                color: white;
            }

            .top-right span {
                display: inline-block;
                vertical-align: middle;
                /*line-height: normal;*/
                /*padding: 0 25px;*/
            }

            .aff-link {
                /* text-decoration: overline; */
                font-weight: 500;
            }

            .over-bg {
                background: rgba(53, 53, 53, 0.85);
                box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
                backdrop-filter: blur(0.0px);
                -webkit-backdrop-filter: blur(0.0px);
                border-radius: 10px;
            }
            .bold-btn {

                font-size: 1rem;
                font-weight: 500;
                text-transform: uppercase;
                padding: 5px 50px 5px 50px;
            }
            .box .btn {
                font-size: 1.5rem;
            }

            @media (max-width: 1025px) {
                .btn {
                    padding: 5px 40px 5px 40px;
                }
            }
            @media (max-width: 250px) {
                .btn {
                    padding: 5px 30px 5px 30px;
                }
            }

            /* START BUTTON */
            .btn-warning {
                background: var(--btnbg);
                color: var(--btnfontcolor);
                fill: #ffffff;
                border: none;
                text-decoration: none;
                outline: 0;
                box-shadow: -1px 6px 19px rgba(247, 129, 10, 0.25);
                border-radius: 100px;
            }
            .btn-warning:hover {
                background: var(--btnbghover);
                color: var(--btnfontcolorhover);
                box-shadow: -1px 6px 13px rgba(255, 150, 43, 0.35);
            }
            .btn-check:focus + .btn-warning, .btn-warning:focus {
                background: var(--btnbghover);
                color: var(--btnfontcolorhover);
                box-shadow: -1px 6px 13px rgba(255, 150, 43, 0.35);
            }
            .btn-warning:active:focus {
                box-shadow: 0 0 0 0.25rem var(--btnactivefs);
            }
            .btn-warning:active {
                background: var(--btnbghover);
                color: var(--btnfontcolorhover);
                box-shadow: -1px 6px 13px rgba(255, 150, 43, 0.35);
            }

            /* END BUTTON */

            .bg-success {
                font-size: 1rem;
                background-color: var(--btnbg)!important;
                color: var(--btnfontcolor)!important;
            }
            .bg-danger {
                font-size: 1rem;
            }


            .price-hp {
                font-size: 1rem;
                font-weight: 600;
                color: darkgray;
            }

            .amz-hp {
                font-size: .7rem;
                font-weight: 600;
                color: darkgray;
            }

            .fa-question-circle:before {
                /* content: "\f059"; */
                color: darkgray;
            }

            .fa-heart:before {
                /*color:crimson;*/
            }
            .fa-chevron-circle-right:before {
                color: darkgray;
            }


            /*grid view*/
            .grid-container1 {
                display: grid;
                grid-template-columns: repeat(4, 1fr); /* Creates three columns with equal width */
                /*gap: 20px;*/
                /* Gap between grid items */
            }

            .grid-item1 {
                width: 100%;
                height: 100%;
                /*border: 1px solid black;*/
            }
        </style> 
        <style>
            /*        body {
                        font-family: Arial, sans-serif;
                        margin: 0;
                        padding: 0;
                    }*/

            .container11 {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                padding: 20px;
            }

            .product-image {
                flex: 1;
                padding: 20px;
                /*border: 1px solid black;*/
                /*width:*/ 
                /*margin-right: 100px;*/
                /*padding-right: -100px;*/
                /*justify-content: center;*/
                /*padding-right: 100px;*/
                /*border-radius: 10px;*/
                /*margin-right: -100px;*/
                /*margin: 30px;*/
            }

            .product-image img {
                max-width: 100%;
                height: auto;
                cursor: pointer;
                /*padding-right: -30px;*/
                /*margin-left: 80px;*/
            }

            .product-details {
                flex: 1;
                padding: 20px;
            }

            .product-name {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .product-description {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7;">  
        <%@include file="nav-header.jsp" %>
        <div><%@include file="side.jsp" %></div>

        <%            String id = request.getParameter("spid");

            try {
                Statement statement = con.createStatement();

                String sql = "select * from sub_product where sub_product_id = '" + id + "'";

                ResultSet rs = statement.executeQuery(sql);
                while (rs.next()) {

                    String fileName = rs.getString("sub_product_image");
        %>  

        <div class="container11" style="width: 90%; margin-left: 5%; border-radius: 20px; background-color: white; box-shadow: 20px 20px 50px gray; border: 1px solid black;">
            
            <form action="AddCartServlet" method="POST" style="border: 1px solid black; width: 100%;">
            <div class="product-image">
                <img id="product-image" src="assets/images/Sub_Product/<%= fileName%>" alt="product.title" width="50%;" />
            </div>
            
            
            <div class="product-details">
                
          
                <h1 class="product-name"><%= rs.getString(5)%></h1>
                <p class="product-description"><strong><u><h3>Description : </h3></u></strong>
                    <span style="margin-left: 50px;"><%= rs.getString(6)%></span>
                </p>
                <p class="product-description"><strong><u><h3>Features : </h3></u></strong>
                    <span style="margin-left: 50px;"><%= rs.getString(7)%></span>
                    <!--<input type="hidden" name="f" value="= rs.getInt(8) %>" />-->
                    <input type="hidden" name="p" id="price" value="<%= rs.getInt(9) %>" />
                    <input type="hidden" name="pid" value="<%= rs.getInt(1) %>" />
                    <input type="hidden" name="pnm" value="<%= rs.getString(5) %>" /><br><br>

                    
                    <% 
                        String user = sign1.getUser_name();
                    %>
                    
                    <input type="text" name="user" value="<%= user %>" />
                    
                </p>
                <p><strong><u><h3>Price : </h3></u></strong>
                    <span style="margin-left: 50px;"><%= rs.getInt(9)%></span>
                </p>
                
                <p><strong><u><h3>Quantity : </h3></u></strong>
                    <span style="margin-left: 50px; width: 60%;">
                        <input type="number" id="quantity" value="" min="1" max="<%= rs.getInt(8) %>" placeholder="Enter Number of Quantity" name="f" onchange="updateTotalPrice(<%= rs.getInt(9) %>)">
                        <!--<input type="number" placeholder="Enter Number of Quantity" name="f" value="" min="0" max="= rs.getInt(8) %>" /><span>-->
                            <p style="color: orange;">Enter Final quantity of product after you can not change from cart.</p>
                        <%
                            if(rs.getInt(8) == 0) {
                                %>
                                <p style="color: red; width: 30%; padding: 10px;">Out of Stock</p>                                
                                <%
                            } else {
                            %>
                            <p style="color: green; width: 100%; padding: 10px;">In Stock</p>
                            <p>Total Price: <span id="totalPrice"></span></p>
<%
}
%></span>
                    </span>
                </p>
                
                                    
                <!--            <p><strong>Price:</strong><span><= rs.getInt(9) %></span></p>
                            <p><strong>Availability:</strong> In Stock</p>-->
                
                <!--<--> 
<!--//                    int q = rs.getInt(8);-->
                    
                    
                <!--%>-->
                
                <%    if (sign1 == null) {%>
<a href="login.jsp" class="btn btn-warning bold-btn" style="width: 100%; border-radius: 20px; background-color: yellow; box-shadow: 20px 20px 50px gray; padding: 15px;">Add to Cart</a>
<%
    } else {
%>
                
                
                <button style="width: 100%; border-radius: 20px; background-color: yellow; box-shadow: 20px 20px 50px gray; padding: 15px;">Add to Cart</button>
                
                
                <!--<button style="width: 100%; border-radius: 20px; background-color: yellow; box-shadow: 20px 20px 50px gray; padding: 15px;" onclick="add_to_cart(<= rs.getInt("sub_product_id") %>, '<= rs.getString("model_no") %>', <= rs.getInt("quantity") %>, <= rs.getInt("price") %>)">Add to Cart</button>-->

<% } %>
            </div>
            </form>
        </div>



        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>       



        <br><br>
        <h1><u>Similar Product</u></h1>
        <div class="grid-container1">


            <%
//                String n = request.getParameter("n");
//                String n1 = request.getParameter("n1");
//                String product_id = request.getParameter("pid");
                try {
                    Statement statement = con.createStatement();

                    String sql = "select * from sub_product";

                    ResultSet rs = statement.executeQuery(sql);
                    
                    
                    while (rs.next()) {

                        String fileName = rs.getString("sub_product_image");
            %>  

            <div style="width: 100%;" class="grid-item1">
                <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css'>

                <div class="container-fluid bg-trasparent my-4 p-3" style="position: relative;">
                    <div class="row row-cols-1 row-cols-xs-2 row-cols-sm-2 row-cols-lg-4 g-3">

                        <div class="col hp" style="height: 380px; width: 100%; display: inline-block;">
                            <div class="card h-100 shadow-sm" style="width:100%;">
                                <a href="#">
                                    <img src="assets/images/Sub_Product/<%= fileName%>" class="card-img-top" alt="product.title" />
                                </a>
                                <div class="card-body">
                                    <div class="d-grid gap-2 my-4">


                                        <a href="displayFullDetails.jsp?spid=<%= rs.getInt(1)%>" class="btn btn-warning bold-btn"><%= rs.getString(5)%></a>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--</div>-->


            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>       


        </div>










        <%@include file="footer.jsp" %>


        <script>
            // JavaScript for image zoom
            const productImage = document.getElementById('product-image');

            productImage.addEventListener('mouseover', () => {
                productImage.style.transform = 'scale(1.2)';
            });

            productImage.addEventListener('mouseout', () => {
                productImage.style.transform = 'scale(1)';
            });
        </script>
        
        <script>
            function updateTotalPrice(p) {
  // Get the quantity input element
  var quantityInput = document.getElementById("quantity");
//  var price = document.getElementById("price");
//  var price = document.getElementsByName("p");


  // Get the total price span element
  var totalPriceSpan = document.getElementById("totalPrice");

  // Get the current quantity value
  var quantity = parseInt(quantityInput.value);

  // Calculate the new total price (assuming the price per item is $10.00)
//  var pricePerItem = parseInt(price);
  var total = quantity * p;

  // Update the total price display
  totalPriceSpan.textContent = total.toFixed(2); // Format the total price to two decimal places
}

        </script>
    </body>
</html>
