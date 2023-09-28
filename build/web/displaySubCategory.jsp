<%-- 
    Document   : displaySubCategory
    Created on : 27-Aug-2023, 9:39:37 am
    Author     : LENOVO
--%>

<%@page import="com.gemtrack.entities.MainCategory"%>
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
        <!--<script src="assets/js/jquery/jquery.min.js"></script>-->
        <!--<script src="assets/js/jquery/sidebar.js"></script>-->
        <!--<link rel="stylesheet" href="assets/css/sidebar.css"/>-->
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
    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="nav-header.jsp" %>
        <div><%@include file="side.jsp" %></div>
        <!--<h1>Hello World!</h1>-->
         <div class="grid-container1">
            <%   
                String id = request.getParameter("id");
                
                try {
                Statement statement = con.createStatement();
                
                String sql = "select * from sub_category where main_cat_id = '"+id+"'";
                
                ResultSet rs = statement.executeQuery(sql);
                while (rs.next()) {

                    String fileName = rs.getString("sub_cat_image");
            %>  
            
            <div style="width: 100%;" class="grid-item1">
                <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css'>

                <div class="container-fluid bg-trasparent my-4 p-3" style="position: relative">
                    <div class="row row-cols-1 row-cols-xs-2 row-cols-sm-2 row-cols-lg-4 g-3">

                        <div class="col hp" style="height: 380px; width: 100%; display: inline-block">
                            <div class="card h-100 shadow-sm" style="width:100%;">
                                <a href="#">
                                    <img src="assets/images/Sub_Categories/<%= fileName%>" class="card-img-top" alt="product.title" />
                                </a>
                                <div class="card-body">
                                    <div class="d-grid gap-2 my-4">

                                        <a href="displayMainProduct.jsp?subid=<%=  rs.getInt(1)  %>" class="btn btn-warning bold-btn"><%= rs.getString(3)%></a>
                                        <!--<a href="displayMainProduct.jsp?nm=<= rs.getString(3) %>" class="btn btn-warning bold-btn"><= rs.getString(3)%></a>-->
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
} catch(Exception e) {
e.printStackTrace();
}
%>       


        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
