<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            .go-corner {
                display: flex;
                align-items: center;
                justify-content: center;
                position: absolute;
                width: 32px;
                height: 32px;
                overflow: hidden;
                top: 0;
                right: 0;
                background-color: rgb(224, 102, 36);
                border-radius: 0 4px 0 32px;
            }

            span {
                color: white;
            }
            .datcard {
                height: 10em;
                color: white;
                display: block;
                font-family: sans-serif;
                position: relative;
                background-color: rgb(3, 36, 77);
                border-radius: 4px;
                padding: 1em;
                z-index: 0;
                overflow: hidden;
                text-decoration: none !important;
            }

            .datcard:before {
                content: "";
                position: absolute;
                z-index: -1;
                top: -16px;
                right: -16px;
                background: rgb(224, 102, 36);
                height: 1em;
                width: 1em;
                border-radius: 100%;
                transform: scale(1);
                transform-origin: 50% 50%;
                transition: transform 0.25s ease-out;
            }

            .datcard:hover:before {
                transform: scale(45);
            }

            .datcard:hover p {
                transition: all 0.3s ease-out;
                color: rgb(255, 255, 255);
                color: rgba(255, 255, 255, 0.8);
            }

            .cardImg {
                background-color: #03244d;
                color: #03244d;
            }

            .cardIcon {
                color: #03244d;
            }

            .background-color {
                color: rgba(3, 36, 77, 0.1);
            }

            .invisible {
                display: none;
            }

            .visible {
                display: block;
            }
            .grid {
                background-color: #ffffff;
                border-radius: 10px 10px / 0px 0px;
                margin-bottom: 20px;
            }

            #pageHeader {
                margin-top: 25px;
                margin-bottom: 25px;
            }
            .gridHeader {
                background-color: #ffffff;
                border-bottom: 1px solid #e0e0e0;
                text-align: center;
                margin-bottom: 10px;
            }

            .gridHeaderTxt {
                color: #000000;
                padding: 10px 0px;
            }

            .gridRow {
                padding-bottom: 25px;
            }

            .cardImg {
                background-color: #f4f4ff;
                color: #65377b;
                padding: 25px;
            }

            .link {
                color: #727375;
                padding: 17px 0px;
                width: 100%;
                text-align: center;
                cursor: pointer;
                font-size: 14px;
            }

            .link100 {
                color: #727375;
                padding: 17px 0px;
                width: 100% !important;
                text-align: center;
                cursor: pointer;
                font-size: 14px;
            }

            .link:hover {
                background-color: #f1f1f1;
                color: #03244d;
                transition: background 0.5s ease;
            }

            .link100:hover {
                background-color: #f4f4ff;
                color: #000000;
                transition: background 0.5s ease;
            }

            .card-action-bar {
                display: flex;
                border-top: 1px solid #e0e0e0;
                width: 100%;
            }

            .center {
                text-align: center;
            }

            .wrimagecard {
                margin-top: 0;
                margin-bottom: 1.5rem;
                text-align: center;
                position: relative;
                background: #fff;
                box-shadow: 0 15px 20px 0px rgba(46, 61, 73, 0.15);
                border-radius: 4px;
                transition: all 0.3s ease;
            }

            .wrimagecard .far {
                position: relative;
                font-size: 70px;
            }

            .wrimagecard .fas {
                position: relative;
                font-size: 70px;
            }

            .wrimagecard-topimage_header {
                background-color: rgba(3, 36, 77, 0.1);
                padding: 20px;
            }

            a.wrimagecard:hover,
            .wrimagecard-topimage:hover {
                box-shadow: 2px 4px 8px 0px rgba(46, 61, 73, 0.2);
            }

            .wrimagecard-topimage a {
                height: 100%;
                display: block;
            }

            .wrimagecard-topimage_title {
                padding: 20px 24px;
                height: 80px;
                padding-bottom: 0.75rem;
                position: relative;
            }

            .wrimagecard-topimage a {
                border-bottom: none;
                text-decoration: none;
                color: #525c65;
                transition: color 0.3s ease;
            }

            .h-140 {
                height: 140px !important;
            }

            #navBtns {
                width: 100%;
            }

            /*modal */
            .modalHeader {
                padding: 1rem;
                border-bottom: 1px solid #e9ecef;
                border-top-left-radius: 0.3rem;
                border-top-right-radius: 0.3rem;
                width: 100%;
                text-align: center;
            }

            .closeModalLink100 {
                color: #727375;
                padding: 17px 0px;
                width: 100%;
                text-align: center;
                cursor: pointer;
                font-size: 14px;
            }

            .closeModalLink100:hover {
                background-color: #fff0d9;
                color: #03244d;
                transition: background 0.5s ease;
            }

            .modal-body {
                padding-left: 1.3rem;
                padding-right: 1.3rem;
            }

            .modalFooter {
                display: flex;
                border-top: 1px solid #e0e0e0;
                width: 100%;
            }

            .bg-g {
                padding: 7px;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
            }

            .app {
                display: grid;
                grid-gap: 15px;
                grid-template-columns: repeat(auto-fit, minmax(10em,1fr));
                justify-items: center;
            }

            .display-4 {
                font-size: 1.5rem;
            }

            .card.tile {
                height: 10em;
                width: 10.75em;
                text-align: center;
            }

            .card.tile:hover {
                box-shadow: 0 0 1rem 0 #00000040;
                transform: scale(1.05);
            }


            .bg-secondary-orange {
                background-color: #f68026;
            }

            .top {
                display: flex;
                justify-content: space-between;
            }

            .topper {
                padding: 0;
                height: .5rem;
            }

            a {
                text-decoration: none !important;
            }

            a.btn.btn-info.btn-sm {
                justify-content: center;
            }

            .top {
                align-items: baseline;
            }

            span.fa-3x.mb-auto.mt-auto {
                color: black;
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        
        <div class="container">
            
            <!--this row is contain add category and product-->
            <div>
                <h1>
                    Add Products And Category
                </h1>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <i class="fas fa-shapes" style="color: #7d92b5;"></i>
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                Add Main Category
                            </h2>
                            <p>Add Main Category</p>
                        </div>
                        <div class="card-action-bar">
                            <a href="addMainCategory.jsp" class="float-lg-none link">Add Main Category</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <!--<i class="fas fa-desktop cardIcon"></i>-->
                            <!--<i class="fas fa-address-card" style="color: #7d92b5;"></i>-->
   
                            <i class="fas fa-square-plus" style="color: #7d92b5;"></i>
                            <!--<i class="fas fa-grid"></i>-->
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                Add Sub Category
                            </h2>
                            <p>Add Sub Category</p>
                        </div>
                        <div class="card-action-bar">
                            <a href="addSubCategory.jsp" class="float-right link">Add Sub Category</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <!--<i class="far fa-envelope cardIcon"></i>-->
                                                  <!--<i class="fas fa-users cardIcon"  style="color: #7d92b5;"></i>-->
                                                  
                                                  <!--<i class="fas fa-shapes"></i>-->
                                                  <i class="fas fa-plus" style="color: #7d92b5;"></i>
                                                  
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                Add Product
                            </h2>
                            <p>Add Product</p>
                        </div>
                        <div class="card-action-bar">
                            <a href="addProduct.jsp" class="float-right link">Add Product</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <!--<i class="far fa-envelope cardIcon"></i>-->
                                                  <!--<i class="fas fa-users cardIcon"  style="color: #7d92b5;"></i>-->
                                                  
                                                  <!--<i class="fas fa-shapes"></i>-->
                                                  <i class="fas fa-plus" style="color: #7d92b5;"></i>
                                                  
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                Add Sub Product
                            </h2>
                            <p>Add Sub Product</p>
                        </div>
                        <div class="card-action-bar">
                            <a href="addSubProduct.jsp" class="float-right link">Add Sub Product</a>
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            
            
            <!--this row is contain user and admin details-->
            <div>
                <h1>
                    View Products Details
                </h1>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <!--<i class="fas fa-users cardIcon"  style="color: #7d92b5;"></i>-->
                            <i class="fas fa-boxes-stacked" style="color: #7d92b5;"></i>
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                View Main Category's Details
                            </h2>
                            <p>Contains the list of All Main Category.</p>
                        </div>
                        <div class="card-action-bar">
                            <a href="mainCategoryDetails.jsp" class="float-lg-none link">View Main Product's Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <!--<i class="fas fa-desktop cardIcon"></i>-->
                            <i class="fas fa-address-card" style="color: #7d92b5;"></i>
                            <!--<i class="fa-solid fa-address-card fa-2xl" style="font-size: 10px; color: #141d28;"></i>-->
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                View Sub Category's Details
                            </h2>
                            <p>Contains the list of all sub details.</p>
                        </div>
                        <div class="card-action-bar">
                            <a href="subCategoryDetails.jsp" class="float-right link">View Sub Category's Details</a>
                        </div>
                    </div>
                </div>
              
                <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <!--<i class="far fa-envelope cardIcon"></i>-->
                            <i class="fas fa-boxes-stacked" style="color: #7d92b5;"></i>
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                Main Product
                            </h2>
                            <p>Contains the list of all main product's detials</p>
                        </div>
                        <div class="card-action-bar">
                            <a href="mainProductDetails.jsp" class="float-right link">View Main Product's Details</a>
                        </div>
                    </div>
                </div>
                
            <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <!--<i class="far fa-envelope cardIcon"></i>-->
                            <i class="fas fa-boxes-stacked" style="color: #7d92b5;"></i>
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                Sub Product
                            </h2>
                            <p>Contains the list of all sub product's detials</p>
                        </div>
                        <div class="card-action-bar">
                            <a href="subProductDetails.jsp" class="float-right link">View Sub Product's Details</a>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <!--<i class="far fa-envelope cardIcon"></i>-->
                            <i class="fas fa-boxes-stacked" style="color: #7d92b5;"></i>
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                Cart Details
                            </h2>
                            <p>Contains the all user's cart details</p>
                        </div>
                        <div class="card-action-bar">
                            <a href="cartDetails.jsp" class="float-right link">View Cart Details</a>
                        </div>
                    </div>
                </div>
            </div>
            
            </div>
            
<!--            <div class="row" style="margin-top: 20px;">
                <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <i class="fas fa-users cardIcon"></i>
                            <i class="fas fa-comment-dots" style="color: #7d92b5;"></i>
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                Big Event Staff
                            </h2>
                            <p>Contains the list of staff members for The Big Event.</p>
                        </div>
                        <div class="card-action-bar">
                            <a class="float-lg-none link">View Staff</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <i class="fas fa-desktop cardIcon"></i>
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                Dashboard
                            </h2>
                            <p>View Event status and communicate with team members.</p>
                        </div>
                        <div class="card-action-bar">
                            <a class="float-right link">View Dashboard</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <i class="far fa-envelope cardIcon"></i>
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                Email Hub
                            </h2>
                            <p>Edit email templates sent by the application.</p>
                        </div>
                        <div class="card-action-bar">
                            <a class="float-right link">View Templates</a>
                        </div>
                    </div>
                </div>
            </div>-->

        </div>
        
        <!--view All Product's Details-->
        <div class="container">
         <div>
                <h1>
                    View Details
                </h1>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <i class="fas fa-users cardIcon"  style="color: #7d92b5;"></i>
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                Customer User
                            </h2>
                            <p>Contains the list of customer user.</p>
                        </div>
                        <div class="card-action-bar">
                            <a href="customerUserDetails.jsp" class="float-lg-none link">View Customer User's Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <!--<i class="fas fa-desktop cardIcon"></i>-->
                            <i class="fas fa-address-card" style="color: #7d92b5;"></i>
                            <!--<i class="fa-solid fa-address-card fa-2xl" style="font-size: 10px; color: #141d28;"></i>-->
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                Inquiries
                            </h2>
                            <p>Contains the list of Inquiries.</p>
                        </div>
                        <div class="card-action-bar">
                            <a href="inquiriesDetails.jsp" class="float-right link">View Contact Details</a>
                        </div>
                    </div>
                </div>
              
                <div class="col-md-6 col-lg-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <div class="wrimagecard-topimage_header">
                            <!--<i class="far fa-envelope cardIcon"></i>-->
                                                  <i class="fas fa-users cardIcon"  style="color: #7d92b5;"></i>
                        </div>
                        <div class="wrimagecard-topimage_title h-140">
                            <h2 class="h4 text-center">
                                Admin User
                            </h2>
                            <p>Contains the list of admin user.</p>
                        </div>
                        <div class="card-action-bar">
                            <a href="adminUserDetails.jsp" class="float-right link">View Admin User's Details</a>
                        </div>
                    </div>
                </div>
            </div>
        
        </div>
        
        <!--add admin-->
        <!--<a href="addAdmin.jsp"><input type="submit" value="Add Admin"></a>-->
        
        <!--old category-->
        <!--     <div class="box-wrapper" style="margin: 20px; margin-left: 8%;">
                    <figure class="shape-box shape-box_half" style="width: 30%;">
                        <img src="../assets/images/category.png" alt="">
                        <div class="brk-abs-overlay z-index-0 bg-black opacity-60"></div>
                        <figcaption>
                            <div class="show-cont">
                                <h3 class="card-no">01</h3>
                                <h4 class="card-main-title">Categories</h4>
                            </div>
                            <p class="card-content">Customer interactions, study and analysis of company branding through creative briefs. Creation of mock-up designs by using UI tools that simulate actions and pre-visualize the reactions.</p>
                            <a href="#" class="read-more-btn">Show All Cateogries</a>
                        </figcaption>
                        <span class="after"></span>
                    </figure>
                    <figure class="shape-box shape-box_half" style="width: 30%;">
                        <img src="../assets/images/produt.png">
                        <div class="brk-abs-overlay z-index-0 bg-black opacity-60"></div>
                        <figcaption>
                            <div class="show-cont">
                                <h3 class="card-no">02</h3>
                                <h4 class="card-main-title">Products</h4>
                            </div>
                            <p class="card-content">Customer interactions, study and analysis of company branding through creative briefs. Creation of mock-up designs by using UI tools that simulate actions and pre-visualize the reactions.</p>
                            <a href="#" class="read-more-btn">Show All Products</a>
                        </figcaption>
                        <span class="after"></span>
                    </figure>
                    <figure class="shape-box shape-box_half" style="width: 30%;">
                        <img src="../assets/images/users.png">
                        <div class="brk-abs-overlay z-index-0 bg-black opacity-60"></div>
                        <figcaption>
                            <div class="show-cont">
                                <h3 class="card-no">03</h3>
                                <h4 class="card-main-title">Admin Users</h4>
                            </div>
                            <p class="card-content">Customer interactions, study and analysis of company branding through creative briefs. Creation of mock-up designs by using UI tools that simulate actions and pre-visualize the reactions.</p>
                            <a href="#" class="read-more-btn">Show All Admin Users</a>
                        </figcaption>
                        <span class="after"></span>
                    </figure>
                    <figure class="shape-box shape-box_half">
                        <img src="../assets/images/users.png">
                        <div class="brk-abs-overlay z-index-0 bg-black opacity-60"></div>
                        <figcaption>
                            <div class="show-cont">
                                <h3 class="card-no">04</h3>
                                <h4 class="card-main-title">Customer Users</h4>
                            </div>
                            <p class="card-content">Customer interactions, study and analysis of company branding through creative briefs. Creation of mock-up designs by using UI tools that simulate actions and pre-visualize the reactions.</p>
                            <a href="CustomerUserServlet" class="read-more-btn">Show All Users</a>
                        </figcaption>
                        <span class="after"></span>
                    </figure>
                </div>-->

        <%@include file="footer.jsp" %>

    </body>
</html>
