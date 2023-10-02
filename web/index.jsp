<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.gemtrack.helper.ConnectionProvider" %>
<%--<%@include file="navbar.jsp" %>--%>
<%--<%@include file="cat.jsp" %>--%>

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


        <link rel="stylesheet" href="assets/css/style-prefix.css">      
    </head>
    <body style="background-color: #f7f7f7;">
  <%
        // Java code for generating dynamic content
        String dynamicContent = "This content is generated dynamically.";
    %>
    <p><%= dynamicContent %></p>
        <%@include file="nav-header.jsp" %>
        <%@include file="slider.jsp" %>
        <%@include file="category-slider.jsp" %>
        <div><%@include file="side.jsp" %></div>
        <%--<%@include file="test.jsp" %>--%>

        <%       
//            Connection con = ConnectionProvider.getConnection();
//            out.println("<h1>Connection is : " +con+"</h1>");
        %>

        <%
            //    Signup sign = new Signup();
        %>          
        <div class="grid-container1">
            <%   
                String sql = "select * from main_category";
                
                PreparedStatement ps = con.prepareStatement(sql);

                ResultSet rs = ps.executeQuery(sql);
                
                while (rs.next()) {
                

                    String fileName = rs.getString("main_cat_image");
            %>  
            
            <div style="width: 100%;" class="grid-item1">
                <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css'>

                <div class="container-fluid bg-trasparent my-4 p-3" style="position: relative">
                    <div class="row row-cols-1 row-cols-xs-2 row-cols-sm-2 row-cols-lg-4 g-3">

                        <div class="col hp" style="height: 380px; width: 100%; display: inline-block">
                            <div class="card h-100 shadow-sm" style="width:100%;">
                                <a href="#">
                                    <img src="assets/images/Main_Categories/<%= fileName%>" class="card-img-top" alt="product.title" />
                                </a>
                                <div class="card-body">
                                    <div class="d-grid gap-2 my-4">

                                        <a href="displaySubCategory.jsp?id=<%= rs.getInt(1) %>" class="btn btn-warning bold-btn"><%= rs.getString(2)%></a>
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
%>       


        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>



<!--




                              <div class="col hp" style="height: 380px;">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/81gK08T6tYL._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                <div class="card-body">
                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">Hospital</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                              <div class="col hp" style="height: 380px;">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/81gK08T6tYL._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                <div class="card-body">
                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">Hospital</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/71wF7YDIQkL._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>

                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">razer</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.345$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">Razer Blade 15 Base Gaming Laptop 2020: Intel Core i7-10750H 6-Core, NVIDIA GeForce GTX 1660 Ti, 15.6" FHD 1080p 120Hz, 16GB RAM, 256GB SSD, CNC Aluminum, Chroma RGB Lighting, Black</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">
                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/81w+3k4U8PL._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>

                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">lenovo</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">1.020$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">Lenovo Legion 5 Gaming Laptop, 15.6" FHD (1920x1080) IPS Screen, AMD Ryzen 7 4800H Processor, 16GB DDR4, 512GB SSD, NVIDIA GTX 1660Ti, Windows 10, 82B1000AUS, Phantom Black</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">
                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col hp">
                            <div class="card h-100 shadow-sm">
                                <a href="#">
                                    <img src="https://m.media-amazon.com/images/I/61Ze2wc9nyS._AC_SL1500_.jpg" class="card-img-top" alt="product.title" />
                                </a>
                                 <div class="label-top shadow-sm">Asus Rog</div>  
                                <div class="label-top shadow-sm">
                                    <a class="text-white" href="#">msi</a>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix mb-3">
                                        <span class="float-start badge rounded-pill bg-success">2.245$</span>

                                        <span class="float-end"><a href="#" class="small text-muted text-uppercase aff-link">reviews</a></span>
                                    </div>
                                    <h5 class="card-title">
                                        <a target="_blank" href="#">MSI GL66 Gaming Laptop: 15.6" 144Hz FHD 1080p Display, Intel Core i7-11800H, NVIDIA GeForce RTX 3070, 16GB, 512GB SSD, Win10, Black (11UGK-001)</a>
                                    </h5>

                                    <div class="d-grid gap-2 my-4">

                                        <a href="#" class="btn btn-warning bold-btn">add to cart</a>

                                    </div>
                                    <div class="clearfix mb-1">

                                        <span class="float-start"><a href="#"><i class="fas fa-question-circle"></i></a></span>

                                        <span class="float-end">

                                            <i class="far fa-heart" style="cursor: pointer"></i>

                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>-->















<!--aa nicheno code 4 layer dropdown no 6-->
<!--style="border: 1px solid black; height: 100vh; margin: 10px; display: flex"
            
            <div>
                class="container"
                <div id="side">
                    <table>
                        <thead>
                            <tr><h1 style="color: white;"><u>Categories</u></h1>  </tr>
                        <center>                  
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                            <tr>
                            <h3 style="text-align: center; padding: 4px;">
                                ONE
                            </h3>
                            </tr>
                        </center>
                        </thead>
                    </table>


                </div>
            </div>

            rakhavanu 6
                        <div style="border: 1px solid black; height: 90vh; margin: 5px; width: 20%">
                            <nav id="mysidebarmenu" class="amazonmenu">
                                <ul>
                                    <li><a href="#">Item 1</a></li>
            
                                    <li><a href="#">Folder 1</a>
                                        <ul>
                                            <li><a href="#">Sub Item 1.1</a>
                                                <ul>
                                                    <li><a href="#">Sub Item 1.1</a>
                                                        <div>
            
                                                            <ul>
                                                                <li><a href="#">JavaScript Kit</a></li>
                                                                <li><a href="#">CSS Drive</a></li>
                                                                <li><a href="#">CSS Library</a>
                                                                <li><a href="#">Webmaster Tools</a>
            
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li><a href="#">Sub Item 1.2</a></li>
                                                    <li><a href="#">Sub Item 1.3</a>
            
                                                    </li>
                                                    <li><a href="#">Sub Item 1.2</a></li>
                                                    <li><a href="#">Sub Item 1.3</a>
                                                        <ul>
                                                            <li>Sub Item 1.3.1</li>
                                                            <li>Sub Item 1.3.2</li>
                                                            <li>Sub Item 1.3.3
            
            
            
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="#">Sub Item 1.4</a></li>
                                                    <li><a href="#">Sub Item 1.2</a></li>
                                                    <li><a href="#">Sub Item 1.3</a></li>
                                                    <li><a href="#">Sub Item 1.4</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">Item 3</a></li>
                                             <li><a href="">Folder 2</a>
                                              <ul>
                                              <li><a href="">Sub Item 2.1</a></li>
                                              <li><a href="/">Sub Item 2.1</a></li>
                                              <li><a href="sshsttp://www.javascriptkit.com/">Sub Item 2.1</a></li>
                                              <li><a href="httsp://www.javascriptkit.com/">Sub Item 2.1</a></li>
                                              <li><a href="httpss://www.javascriptkit.com/">Sub Item 2.1</a></li>
                                              <li><a href="httsp://www.javascriptkit.com/">Sub Item 2.1</a></li>
                                              </ul>
                                            </li>
                                            <li><a href="">Item 4</a></li>
                                            </ul> 
                                            </nav>
                                            </div>
-->

<!--aa nicheno code product card no 6-->
<!--            
                <div style="border: 1px solid black; margin: 20px; height: 1000px">
                    
                </div>

                <div class="container1">
                    <div class="product">
                        <div class="product-card">
                            <h2 class="name">Nike Zoom Fly</h2>
                            <span class="price">$140.00</span>
                            <a class="popup-btn">Quick View</a>
                            <img src="assets/images/client/Gov. Client/c1.png" class="product-img" alt="">
                        </div>
                        <div class="popup-view">
                            <div class="popup-card">
                                <a><i class="fas fa-times close-btn"></i></a>
                                <div class="product-img">
                                    <img src="assets/images/client/Gov. Client/c1.png" alt="">
                                </div>
                                <div class="info">
                                    <h2>Nike Zoom Fly<br><span>Men's Sport</span></h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                    <span class="price">$ 140.00</span>
                                    <a href="#" class="add-cart-btn">Add to Cart</a>
                                    <a href="#" class="add-wish">Add to Wishlist</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product">
                        <div class="product-card">
                            <h2 class="name">Xiomi 7 Smart Watch</h2>
                            <span class="price">$100.00</span>
                            <a class="popup-btn">Quick View</a>
                            <img src="httpss://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFTA-GU5hfvjuHibMn5hU5SRgt-NJUBiR5mw&usqp=CAU" class="product-img" alt="">
                        </div>
                        <div class="popup-view">
                            <div class="popup-card">
                                <a><i class="fas fa-times close-btn"></i></a>
                                <div class="product-img">
                                    <img src="httpss://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFTA-GU5hfvjuHibMn5hU5SRgt-NJUBiR5mw&usqp=CAU" alt="">
                                </div>
                                <div class="info">
                                    <h2>Xiomi 7 Smart Watch<br><span>Smart Sport Modes</span></h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                    <span class="price">$100.00</span>
                                    <a href="#" class="add-cart-btn">Add to Cart</a>
                                    <a href="#" class="add-wish">Add to Wishlist</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product">
                        <div class="product-card">
                            <h2 class="name">Xiomi 7 Smart Watch</h2>
                            <span class="price">$100.00</span>
                            <a class="popup-btn">Quick View</a>
                            <img src="httpss://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFTA-GU5hfvjuHibMn5hU5SRgt-NJUBiR5mw&usqp=CAU" class="product-img" alt="">
                        </div>
                        <div class="popup-view">
                            <div class="popup-card">
                                <a><i class="fas fa-times close-btn"></i></a>
                                <div class="product-img">
                                    <img src="httsps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFTA-GU5hfvjuHibMn5hU5SRgt-NJUBiR5mw&usqp=CAU" alt="">
                                </div>
                                <div class="info">
                                    <h2>Xiomi 7 Smart Watch<br><span>Smart Sport Modes</span></h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                    <span class="price">$100.00</span>
                                    <a href="#" class="add-cart-btn">Add to Cart</a>
                                    <a href="#" class="add-wish">Add to Wishlist</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product">
                        <div class="product-card">
                            <h2 class="name">Xiomi 7 Smart Watch</h2>
                            <span class="price">$100.00</span>
                            <a class="popup-btn">Quick View</a>
                            <img src="httsps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFTA-GU5hfvjuHibMn5hU5SRgt-NJUBiR5mw&usqp=CAU" class="product-img" alt="">
                        </div>
                        <div class="popup-view">
                            <div class="popup-card">
                                <a><i class="fas fa-times close-btn"></i></a>
                                <div class="product-img">
                                    <img src="httpss://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFTA-GU5hfvjuHibMn5hU5SRgt-NJUBiR5mw&usqp=CAU" alt="">
                                </div>
                                <div class="info">
                                    <h2>Xiomi 7 Smart Watch<br><span>Smart Sport Modes</span></h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                    <span class="price">$100.00</span>
                                    <a href="#" class="add-cart-btn">Add to Cart</a>
                                    <a href="#" class="add-wish">Add to Wishlist</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product">
                        <div class="product-card">
                            <h2 class="name">Xiomi 7 Smart Watch</h2>
                            <span class="price">$100.00</span>
                            <a class="popup-btn">Quick View</a>
                            <img src="httpss://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFTA-GU5hfvjuHibMn5hU5SRgt-NJUBiR5mw&usqp=CAU" class="product-img" alt="">
                        </div>
                        <div class="popup-view">
                            <div class="popup-card">
                                <a><i class="fas fa-times close-btn"></i></a>
                                <div class="product-img">
                                    <img src="httpss://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFTA-GU5hfvjuHibMn5hU5SRgt-NJUBiR5mw&usqp=CAU" alt="">
                                </div>
                                <div class="info">
                                    <h2>Xiomi 7 Smart Watch<br><span>Smart Sport Modes</span></h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                    <span class="price">$100.00</span>
                                    <a href="#" class="add-cart-btn">Add to Cart</a>
                                    <a href="#" class="add-wish">Add to Wishlist</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product">
                        <div class="product-card">
                            <h2 class="name">Xiomi 7 Smart Watch</h2>
                            <span class="price">$100.00</span>
                            <a class="popup-btn">Quick View</a>
                            <img src="httpss://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFTA-GU5hfvjuHibMn5hU5SRgt-NJUBiR5mw&usqp=CAU" class="product-img" alt="">
                        </div>
                        <div class="popup-view">
                            <div class="popup-card">
                                <a><i class="fas fa-times close-btn"></i></a>
                                <div class="product-img">
                                    <img src="httpss://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFTA-GU5hfvjuHibMn5hU5SRgt-NJUBiR5mw&usqp=CAU" alt="">
                                </div>
                                <div class="info">
                                    <h2>Xiomi 7 Smart Watch<br><span>Smart Sport Modes</span></h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                    <span class="price">$100.00</span>
                                    <a href="#" class="add-cart-btn">Add to Cart</a>
                                    <a href="#" class="add-wish">Add to Wishlist</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product">
                        <div class="product-card">
                            <h2 class="name">Cannon Camera</h2>
                            <span class="price">$250.00</span>
                            <a class="popup-btn">Quick View</a>
                            <img src="httpss://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWMO0Vkxle2JPdwrPh8ixM1arC0pXpD4ov1g&usqp=CAU" class="product-img" alt="">
                        </div>
                        <div class="popup-view">
                            <div class="popup-card">
                                <a><i class="fas fa-times close-btn"></i></a>
                                <div class="product-img">
                                    <img src="httpss://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWMO0Vkxle2JPdwrPh8ixM1arC0pXpD4ov1g&usqp=CAU" alt="">
                                </div>
                                <div class="info">
                                    <h2>Cannon Camera<br><span>Classic Camera</span></h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                    <span class="price">$250.00</span>
                                    <a href="#" class="add-cart-btn">Add to Cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
