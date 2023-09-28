<%@page import="com.gemtrack.dao.SignupDao"%>
<%@page import="com.gemtrack.entities.Signup"%>
<%@page import="java.sql.*" %>
<%@page import="com.gemtrack.helper.ConnectionProvider" %>

<%
    Signup sign = (Signup) session.getAttribute("currentUser");

    if (sign == null) {

//        response.sendRedirect("login.jsp");
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
        <link rel="stylesheet" href="./assets/css/style-prefix.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            /*@import url(https://fonts.googleapis.com/css?family=Montserrat:400,700);*/

            html {
                /*font-family: 'Montserrat', Arial, sans-serif;*/
                -ms-text-size-adjust: 100%;
                -webkit-text-size-adjust: 100%;
            }

            body {
                /*background: #F2F3EB;*/
                background: #141d28;
            }

            button {
                overflow: visible;
            }

            button, select {
                text-transform: none;
            }

            button, input, select, textarea {
                /*color: #5A5A5A;*/
                color: #141d28;
                font: inherit;
                margin: 0;
            }

            input {
                line-height: normal;
            }

            textarea {
                overflow: auto;
            }

            #container {
                border: solid 3px #141d28;
                max-width: 768px;
                margin: 60px auto;
                position: relative;
            }

            form {
                padding: 37.5px;
                margin: 50px 0;
            }

            h1 {
                color: #141d28;
                font-size: 32px;
                font-weight: 700;
                letter-spacing: 7px;
                text-align: center;
                /*text-transform: uppercase;*/
            }

            .underline {
                border-bottom: solid 2px #141d28;
                margin: -0.512em auto;
                width: 80px;
            }

            .icon_wrapper {
                margin: 50px auto 0;
                width: 100%;
                display: flex;
                justify-content: center;
            }

            .icon {
                display: block;
                /*fill: #474544;*/
                height: 0px;
                margin: 0 auto;
                width: 50px;
                margin-left: 5%;
            }

            .email {
                float: right;
                width: 45%;
            }

            input[type='text'], [type='date'], [type='password'], [type='tel'], [type='email'], select, textarea {
                background: none;
                border: none;
                border-bottom: solid 2px #474544;
                color: #141d28;
                font-size: 1.000em;
                font-weight: 400;
                letter-spacing: 1px;
                margin: 0em 0 1.875em 0;
                padding: 0 0 0.875em 0;
                /*text-transform: uppercase;*/
                width: 100%;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                -ms-box-sizing: border-box;
                -o-box-sizing: border-box;
                box-sizing: border-box;
                -webkit-transition: all 0.3s;
                -moz-transition: all 0.3s;
                -ms-transition: all 0.3s;
                -o-transition: all 0.3s;
                transition: all 0.3s;
            }

            input[type='text']:focus, [type='email']:focus, [type='password']:focus, textarea:focus {
                outline: none;
                padding: 0 0 0.875em 0;
            }

            /*            input[type=']:focus, [type='email']:focus, textarea:focus {
                            outline: none;
                            padding: 0 0 0.875em 0;
                        }*/

            .message {
                float: none;
            }

            .name {
                float: left;
                width: 45%;
            }

            select {
                background: url('https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-arrow-down-32.png') no-repeat right;
                outline: none;
                -moz-appearance: none;
                -webkit-appearance: none;
            }

            select::-ms-expand {
                display: none;
            }

            .subject {
                width: 100%;
            }

            .telephone {
                width: 100%;
            }

            textarea {
                line-height: 150%;
                height: 150px;
                resize: none;
                width: 100%;
            }

            ::-webkit-input-placeholder {
                color: #141d28;
            }

            :-moz-placeholder {
                color: #141d28;
                opacity: 1;
            }

            ::-moz-placeholder {
                color: #141d28;
                opacity: 1;
            }

            :-ms-input-placeholder {
                color: #141d28;
            }

            #form_button {
                background: none;
                border: solid 2px #474544;
                color: #141d28;
                cursor: pointer;
                display: inline-block;
                font-family: 'Helvetica', Arial, sans-serif;
                font-size: 0.875em;
                font-weight: bold;
                outline: none;
                padding: 20px 35px;
                /*text-transform: uppercase;*/
                -webkit-transition: all 0.3s;
                -moz-transition: all 0.3s;
                -ms-transition: all 0.3s;
                -o-transition: all 0.3s;
                transition: all 0.3s;
            }

            #form_button:hover {
                background: #141d28;
                color: #F2F3EB;
            }

            @media screen and (max-width: 768px) {
                #container {
                    margin: 20px auto;
                    width: 95%;
                }
            }

            @media screen and (max-width: 480px) {
                h1 {
                    font-size: 26px;
                }

                .underline {
                    width: 68px;
                }

                #form_button {
                    padding: 15px 25px;
                }
            }

            @media screen and (max-width: 420px) {
                h1 {
                    font-size: 18px;
                }

                .icon {
                    height: 35px;
                    width: 35px;
                }

                .underline {
                    width: 53px;
                }

                input[type='text'], [type='email'], select, textarea {
                    font-size: 0.875em;
                }
            }
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


            /*table design*/
            table {
                border: 1px solid #ccc;
                border-collapse: collapse;
                margin: 0;
                padding: 0;
                width: 100%;
                table-layout: fixed;
            }

            table caption {
                font-size: 1.5em;
                margin: .5em 0 .75em;
            }

            table tr {
                background-color: #f8f8f8;
                border: 1px solid #ddd;
                padding: .35em;
            }

            table th,
            table td {
                padding: .625em;
                text-align: center;
            }

            table th {
                font-size: .85em;
                letter-spacing: .1em;
                text-transform: uppercase;
            }

            @media screen and (max-width: 600px) {
                table {
                    border: 0;
                }

                table caption {
                    font-size: 1.3em;
                }

                table thead {
                    border: none;
                    clip: rect(0 0 0 0);
                    height: 1px;
                    margin: -1px;
                    overflow: hidden;
                    padding: 0;
                    position: absolute;
                    width: 1px;
                }

                table tr {
                    border-bottom: 3px solid #ddd;
                    display: block;
                    margin-bottom: .625em;
                }

                table td {
                    border-bottom: 1px solid #ddd;
                    display: block;
                    font-size: .8em;
                    text-align: right;
                }

                table td::before {
                    /*
                    * aria-label has no advantage, it won't be read inside a table
                    content: attr(aria-label);
                    */
                    content: attr(data-label);
                    float: left;
                    font-weight: bold;
                    text-transform: uppercase;
                }

                table td:last-child {
                    border-bottom: 0;
                }
            }


        </style>        

        <!--font awesome cdn-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- google font link -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <!--bootstrap-->
        <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">-->
    </head>

    <body>

        <div class="overlay" data-overlay></div>

        <div class="modal" data-modal>

            <div class="modal-close-overlay" data-modal-overlay></div>

            <div class="modal-content">

                <button class="modal-close-btn" data-modal-close>
                    <!--close icon-->
                </button>

                <div class="newsletter-img">
                    <img src="./assets/images/newsletter.png" alt="subscribe newsletter" width="400" height="400">
                </div>

                <div class="newsletter">

                    <form action="#">

                        <div class="newsletter-header">

                            <h3 class="newsletter-title">Subscribe Newsletter.</h3>

                            <p class="newsletter-desc">
                                Subscribe the <b>Anon</b> to get latest products and discount update.
                            </p>

                        </div>

                        <input type="email" name="email" class="email-field" placeholder="Email Address" required>

                        <button type="submit" class="btn-newsletter">Subscribe</button>

                    </form>

                </div>

            </div>

        </div>





        <!--
          - NOTIFICATION TOAST
        -->

        <div class="" data-toast>

            <button class="toast-close-btn" data-toast-close>
                <!--<ion-icon name="close-outline"></ion-icon>-->
            </button>

            <!-- <div class="toast-banner">
              <img src="./assets/images/products/jewellery-1.jpg" alt="Rose Gold Earrings" width="80" height="70">
            </div>
        
            <div class="toast-detail">
        
              <p class="toast-message">
                Someone in new just bought
              </p>
        
              <p class="toast-title">
                Rose Gold Earrings
              </p>
        
              <p class="toast-meta">
                <time datetime="PT2M">2 Minutes</time> ago
              </p>
        
            </div> -->

        </div>





        <!--
          - HEADER
        -->

        <header style="background-color: #ffffff;">
  <!--class="shadow p-3 mb-5 bg-white rounded"-->
            <div class="header-top">

                <div class="container">

                    <ul class="header-social-container">

                        <li>
                            <a href="https://www.facebook.com/gemtrack.eprocument?mibextid=ZbWKwL" class="social-link">
                                <i class="fa-brands fa-facebook" style="width: 25px; height: 20px; justify-content: center; align-items: center; text-align: center;"></i>
                            </a>
                        </li>

                        <li>
                            <a href="#" class="social-link"> 
                                <!--use class="social-link"-->
                                <i class="fa-brands fa-square-twitter" style="width: 25px; height: 20px; justify-content: center; align-items: center; text-align: center;"></i>
                            </a>
                        </li>

                        <li>
                            <a href="#" class="social-link">
                                <i class="fa-brands fa-square-instagram" style="width: 25px; height: 20px; justify-content: center; align-items: center; text-align: center;"></i>
                            </a>
                        </li>

                        <li>
                            <a href="#" class="social-link">
                                <i class="fa-brands fa-linkedin" style="width: 25px; height: 20px; justify-content: center; align-items: center; text-align: center;"></i>
                            </a>
                        </li>

                    </ul>

                    <!--<div class="header-alert-news">-->
                    <!--          <p>
                                <b>Free Shipping</b>
                                This Week Order Over - $55
                              </p>-->
                    <!--</div>-->

                    <div class="header-top-actions">


                        <!--<a href="#" style="color: white"><i class="fa-solid fa-user" style="color: #ffffff;"></i> Admin Login</a>-->
                        <%//    Signup sign = (Signup) session.getAttribute("currentUser");
                            if (sign == null) {
                        %><a href="login.jsp" style="color: #000;"><i class="fa-solid fa-user" style="color: #000;"></i> User Login</a>

                        <%
                        } else {
                        %>  

                        <a href="#id01" style="color: #000;"><i class="fa-solid fa-user" style="color: #000; margin-left: 20px;">  <%= sign.getUser_name()%></i></a>
                        <a href="LogoutServlet" style="color: #000;"><i class="fa-solid fa-arrow-right-from-bracket" style="color: #000;"></i> logout</a>

                        <div id="id01" class="mod">
                            <div class="mod-dialog">
                                <div class="mod-content">
                                    <div class="mod-hea mod-container">
                                        <a href="#" class="mod-btn" style="color: #141d28;">×</a>
                                        <h2 style="text-align: center; font-size: 40px;"><span style="color: #EE1E4E;">G</span><span style="color: #F6851F;">E</span><span style="color: #B71D8D;">M</span><span style="color: #4E2E8F;">T</span><span style="color: #2885C7;">R</span><span style="color: #B55845;">A</span><span style="color: #B31E8E;">C</span><span style="color: #21A8B2;">K</span></h2> <hr>
                                    </div>
                                    <div class="mod-container">

                                        <!--<div id="profile-details">-->
                                        <center><img src="assets/images/Profile Pictures/profile.png" alt="profile picture" style="margin-top: 20px; margin-bottom: 20px;"/>


                                            <div id="profile-detail">
                                                <table>
                                                    <caption><%= sign.getUser_name()%></caption>

                                                    <tbody>
                                                        <tr>
                                                            <th>Id : </th>
                                                            <td data-label="Account"><%= sign.getUser_id()%></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Name : </th>
                                                            <td data-label="Account"><%= sign.getUser_name()%></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Email : </th>
                                                            <td data-label="Account"><%= sign.getUser_email()%></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Mobile : </th>
                                                            <td data-label="Account"><%= sign.getUser_mobile()%></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Birth of Date : </th>
                                                            <td data-label="Account"><%= sign.getUser_bdate()%></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                    </div>




                                    <hr>
                                    <div class="mod-foo mod-container" style="display: flex;">


                                        <a href="#id02" style="background-color: #141d28; width: 200px; margin-right: 10px; margin-left: 45%;">
                                            <button  id="edit-profile-button" style="padding: 10px; widows: 200px; background-color: #141d28; color: white; cursor: pointer; width: 200px;">Edit</button> </a>
                                        <a href="LogoutServlet" style="justify-content: right; align-items: right;"><button style="padding: 10px; widows: 200px; background-color: #141d28; color: white; cursor: pointer; width: 200px; justify-content: right; align-items: right;">logout</button></a>


                                        <!--demo button--> 
                                        <!--                                        <a href="LogoutServlet" style="background-color: #141d28; width: 200px; justify-content: right; margin-left: 25%;">
                                                                                    <input type="submit" value="Logout" style="padding: 10px; widows: 200px; background-color: #141d28; color: white; justify-content: right; cursor: pointer;">
                                                                                </a>-->

                                        <!--<a href="#" class="" style="cursor: pointer; width: 200px; padding: 10px; font-size: 40px; background-color: #141d28; color: white;"><input type="submit" value="close" style="cursor: pointer"></a>-->

                                        <!--<a href="#" class="" style="cursor: pointer;"><input type="submit" value="close" style="cursor: pointer"></a>-->

                                        <!--<a href="#" style="cursor: pointer;"><input type="submit" value="close" style="cursor: pointer"  class="mod-btn"></a>-->

                                        <!--<p>Mod footer</p>-->
                                    </div>
                                </div>
                                <!--</div>-->
                            </div>  
                        </div>     

                        <div id="id02" class="mod">
                            <div class="mod-dialog">
                                <div class="mod-content">
                                    <div class="mod-hea mod-container">
                                        <a href="#" class="mod-btn" style="color: #141d28;">×</a>
                                        <h2 style="text-align: center; font-size: 40px;"><span style="color: #EE1E4E;">G</span><span style="color: #F6851F;">E</span><span style="color: #B71D8D;">M</span><span style="color: #4E2E8F;">T</span><span style="color: #2885C7;">R</span><span style="color: #B55845;">A</span><span style="color: #B31E8E;">C</span><span style="color: #21A8B2;">K</span></h2> <hr>
                                    </div>
                                    <div class="mod-container">

                                        <!--<div id="profile-details">-->
                                        <center><img src="assets/images/Profile Pictures/profile.png" alt="profile picture" style="margin-top: 20px; margin-bottom: 20px;"/>
                                            <h1><%= sign.getUser_name()%></h1>
                                        </center>

                                        <div id="container">
                                            <h1>Edit Profile Please Carefull</h1>
                                            <div class="underline">
                                            </div>
                                           
                                            <form action="UpdateUserServlet" method="POST" id="contact_form">


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
                                        <a href="LogoutServlet" style="justify-content: right; align-items: right;"><button style="padding: 10px; widows: 200px; background-color: #141d28; color: white; cursor: pointer; width: 200px; justify-content: right; align-items: right;">logout</button></a>



                                    </div>
                                </div>
                                <!--</div>-->
                            </div>  
                        </div>     

                        <%
                            }

                            //    out.write(sign);
//                            out.println(sign);

                        %>

                    </div>

                </div>

            </div>

            <div class="header-main">

                <div class="container">

                    <a href="index.jsp" class="header-logo">
                        <img src="assets/images/logo.png" alt="Anon's logo" width="250" height="100">
                    </a>

                    <div class="header-search-container">

                        <input type="search" name="search" class="search-field" placeholder="Enter your product name...">
                        <%
//                            String s = serch;
//                            select condition where product_name = s;
                            
                        %>
                        <button class="search-btn">
                            <i class="fa-solid fa-magnifying-glass"></i>

                        </button>

                    </div>

                    <div class="header-user-actions">



                        <button class="action-btn">
                            <!--<i class="fa-solid fa-user"></i>-->
                            <!--<a href="#"><i class="fa-regular fa-user" style="color: white;"></i></a>-->
                        </button>

                        <button class="action-btn">
                            <!--<a href="#"><i class="fa-regular fa-heart" style="color: black;"></i></a>-->
                            <!--<span class="count">0</span>-->
                        </button>

                        <button class="action-btn">
                            <a href="#cart"><i class="fa-solid fa-bag-shopping" style="color: black"></i><span style="font-size: 20px; color: black;" class="cart-items"></span></a>
                            <!--<a href="#"><i class="fa-solid fa-cart-shopping" style="color: gray"></i></a>-->
                            <!--<span class="count">0</span>-->
                        </button>

                    </div>

                </div>

            </div>

            <nav class="desktop-navigation-menu">

                <div class="container">

                    <ul class="desktop-menu-category-list">

                        <li class="menu-category">
                            <a href="index.jsp" class="menu-title" style="color: black;">Home</a>
                        </li>
<!--aa category menu 6 rakhavana 6-->
<!--                        <li class="menu-category">
                            <a href="#" class="menu-title">Categories</a>

                            <div class="dropdown-panel">

                                <ul class="dropdown-panel-list">

                                    <li class="menu-title">
                                        <a href="#">Electronics</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Desktop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Laptop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Camera</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Tablet</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Headphone</a>
                                    </li>
                                </ul>

                                <ul class="dropdown-panel-list">

                                    <li class="menu-title">
                                        <a href="#">Electronics</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Desktop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Laptop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Camera</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Tablet</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Headphone</a>
                                    </li>
                                </ul>


                                <ul class="dropdown-panel-list">

                                    <li class="menu-title">
                                        <a href="#">Electronics</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Desktop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Laptop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Camera</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Tablet</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Headphone</a>
                                    </li>

                                </ul>

                                <ul class="dropdown-panel-list">

                                    <li class="menu-title">
                                        <a href="#">Electronics</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Desktop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Laptop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Camera</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Tablet</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Headphone</a>
                                    </li>

                                </ul>

                                <ul class="dropdown-panel-list">

                                    <li class="menu-title">
                                        <a href="#">Electronics</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Desktop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Laptop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Camera</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Tablet</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Headphone</a>
                                    </li>


                                </ul>

                                <ul class="dropdown-panel-list">

                                    <li class="menu-title">
                                        <a href="#">Electronics</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Desktop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Laptop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Camera</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Tablet</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Headphone</a>
                                    </li>

                                </ul>

                                <ul class="dropdown-panel-list">

                                    <li class="menu-title">
                                        <a href="#">Electronics</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Desktop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Laptop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Camera</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Tablet</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Headphone</a>
                                    </li>
                                </ul>

                                <ul class="dropdown-panel-list">

                                    <li class="menu-title">
                                        <a href="#">Electronics</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Desktop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Laptop</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Camera</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Tablet</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Headphone</a>
                                    </li>

                                </ul>

                                <ul class="dropdown-panel-list">

                                    <li class="menu-title">
                                        <a href="#">Men's</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Formal</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Casual</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Sports</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Jacket</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Sunglasses</a>
                                    </li>

                                </ul>

                                <ul class="dropdown-panel-list">

                                    <li class="menu-title">
                                        <a href="#">Women's</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Formal</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Casual</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Perfume</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Cosmetics</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Bags</a>
                                    </li>
                                </ul>

                                <ul class="dropdown-panel-list">

                                    <li class="menu-title">
                                        <a href="#">Electronics</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Smart Watch</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Smart TV</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Keyboard</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Mouse</a>
                                    </li>

                                    <li class="panel-list-item">
                                        <a href="#">Microphone</a>
                                    </li>

                                </ul>

                            </div>
                        </li>-->

                        <!--dropdown demo--> 

                        <li class="menu-category">
                            <a href="about.jsp" class="menu-title" style="color: black;">About Us</a>
                        </li>

                        <li class="menu-category">
                            <a href="inquiry.jsp" class="menu-title" style="color: black;">Inquiry</a>
                        </li>

                        <li class="menu-category">
                            <a href="feedback.jsp" class="menu-title" style="color: black;">Feedback</a>
                        </li>




                    </ul>

                </div>

            </nav>



            <div class="mobile-bottom-navigation">

                <button class="action-btn" data-mobile-menu-open-btn>
                    <i class="fa-solid fa-bars"></i>

                </button>

                <button class="action-btn">
                    <a href="#cart"><i class="fa-solid fa-bag-shopping" style="color: black"></i><span style="font-size: 20px; color: black;" class="cart-items"></span></a>
                    <!--<i class="fa-solid fa-cart-shopping"></i>-->
                    <!--<span class="count">0</span>-->
                </button>

                <button class="action-btn">
                    <a href="index.jsp"><i class="fa-solid fa-house" style="color: #000000;"></i></a>
                </button>

                <button class="action-btn">
                    <!--<i class="fa-regular fa-heart"></i>-->

                    <!--<span class="count">0</span>-->
                </button>

                <button class="action-btn" data-mobile-menu-open-btn>
                    <i class="fa-solid fa-table-cells-large"></i>
                </button>

            </div>

            <nav class="mobile-navigation-menu  has-scrollbar" data-mobile-menu>

                <div class="menu-top">
                    <h2 class="menu-title">Menu</h2>

                    <button class="menu-close-btn" data-mobile-menu-close-btn>
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>

                <ul class="mobile-menu-category-list">

                    <li class="menu-category">
                        <a href="index.jsp" class="menu-title" style="color: #141d28;">Home</a>
                    </li>
                    <li class="menu-category">
                        <a href="about.jsp" class="menu-title" style="color: #141d28;">About us</a>
                    </li>
                    <li class="menu-category">
                        <a href="contact.jsp" class="menu-title" style="color: #141d28;">Contact us</a>
                    </li>
                    <li class="menu-category">
                        <a href="#" class="menu-title" style="color: #141d28;">Inquiry</a>
                    </li>


                </ul>

                <div class="menu-bottom">



                    <ul class="menu-social-container">

                        <li>
                            <a href="https://www.facebook.com/gemtrack.eprocument?mibextid=ZbWKwL" class="social-link">
                                <i class="fa-brands fa-facebook"></i>
                                <!--<ion-icon name="logo-facebook"></ion-icon>-->
                            </a>
                        </li>

                        <li>
                            <a href="#" class="social-link">
                                <i class="fa-brands fa-square-twitter"></i>
                                <!--<ion-icon name="logo-twitter"></ion-icon>-->
                            </a>
                        </li>

                        <li>
                            <a href="#" class="social-link">
                                <i class="fa-brands fa-square-instagram"></i>
                                <!--<ion-icon name="logo-instagram"></ion-icon>-->
                            </a>
                        </li>

                        <li>
                            <a href="#" class="social-link">
                                <i class="fa-brands fa-linkedin"></i>
                                <!--<ion-icon name="logo-linkedin"></ion-icon>-->
                            </a>
                        </li>

                    </ul>

                </div>

            </nav>


            <nav class="mobile-navigation-menu  has-scrollbar" data-mobile-menu>

                <div class="menu-top">
                    <h2 class="menu-title">Menu</h2>

                    <button class="menu-close-btn" data-mobile-menu-close-btn>
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                
                <ul class="mobile-munu-category-list">
                    
                     <%       
            Connection con1 = ConnectionProvider.getConnection();
//            out.println("<h1>Connection is : " +con+"</h1>");
        %>
                    
                    <%   
                        
                        
                String sql2 = "select * from main_category";
                
                PreparedStatement ps2 = con1.prepareStatement(sql2);

                ResultSet rs2 = ps2.executeQuery(sql2);
                while (rs2.next()) {

//                    String fileName = rs1.getString("main_cat_image");
            %>  
                    
                    <li class="menu-category">
                        <a href="displaySubCategory.jsp?id=<%= rs2.getInt(1) %>" style="font-size: 20px; color: #141d28;"><%= rs2.getString(2)%></a>
                    </li>
                    
                    <%
                        }
                    %>
                    
                    
                </ul>

<!--                <ul class="mobile-menu-category-list">



                    <li class="menu-category">

                        <button class="accordion-menu" data-accordion-btn>
                            <p class="menu-title">Men's</p>

                            <div>
                                <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                            </div>
                        </button>

                        <ul class="submenu-category-list" data-accordion>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Shirt</a>
                            </li>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Shorts & Jeans</a>
                            </li>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Safety Shoes</a>
                            </li>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Wallet</a>
                            </li>

                        </ul>

                    </li>

                    <li class="menu-category">

                        <button class="accordion-menu" data-accordion-btn>
                            <p class="menu-title">Women's</p>

                            <div>
                                <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                            </div>
                        </button>

                        <ul class="submenu-category-list" data-accordion>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Dress & Frock</a>
                            </li>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Earrings</a>
                            </li>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Necklace</a>
                            </li>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Makeup Kit</a>
                            </li>

                        </ul>

                    </li>

                    <li class="menu-category">

                        <button class="accordion-menu" data-accordion-btn>
                            <p class="menu-title">Jewelry</p>

                            <div>
                                <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                            </div>
                        </button>

                        <ul class="submenu-category-list" data-accordion>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Earrings</a>
                            </li>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Couple Rings</a>
                            </li>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Necklace</a>
                            </li>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Bracelets</a>
                            </li>

                        </ul>

                    </li>

                    <li class="menu-category">

                        <button class="accordion-menu" data-accordion-btn>
                            <p class="menu-title">Perfume</p>

                            <div>
                                <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                            </div>
                        </button>

                        <ul class="submenu-category-list" data-accordion>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Clothes Perfume</a>
                            </li>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Deodorant</a>
                            </li>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Flower Fragrance</a>
                            </li>

                            <li class="submenu-category">
                                <a href="#" class="submenu-title">Air Freshener</a>
                            </li>

                        </ul>

                    </li>

                    <li class="menu-category">
                        <a href="#" class="menu-title">Blog</a>
                    </li>

                    <li class="menu-category">
                        <a href="#" class="menu-title">Hot Offers</a>
                    </li>

                </ul>-->

                <div class="menu-bottom">


                    <ul class="menu-social-container">

                        <li>
                            <a href="https://www.facebook.com/gemtrack.eprocument?mibextid=ZbWKwL" class="social-link">
                                <i class="fa-brands fa-facebook"></i>
                                <!--<ion-icon name="logo-facebook"></ion-icon>-->
                            </a>
                        </li>

                        <li>
                            <a href="#" class="social-link">
                                <i class="fa-brands fa-square-twitter"></i>
                                <!--<ion-icon name="logo-twitter"></ion-icon>-->
                            </a>
                        </li>

                        <li>
                            <a href="#" class="social-link">
                                <i class="fa-brands fa-square-instagram"></i>
                                <!--<ion-icon name="logo-instagram"></ion-icon>-->
                            </a>
                        </li>

                        <li>
                            <a href="#" class="social-link">
                                <i class="fa-brands fa-linkedin"></i>
                                <!--<ion-icon name="logo-linkedin"></ion-icon>-->
                            </a>
                        </li>

                    </ul>

                </div>

            </nav>








        </header>


        <main>
            <!--
              - CATEGORY
            -->

            <!-- PRODUCT -->
            <div class="product-container">

                <div class="container">
                    <div class="product-box">
                    </div>
                </div>
            </div>
        </div> 
    </main>



    <script src="./assets/js/script.js"></script>
    <!--modal-->
    <script>
        $(document).ready(function(){

        let editStatus = false;
                $("#edit-profile-button").click(function(){

        if (editStatus == false){
        $("#profile-detail").hide();
                $("#profile-edit").show();
                editStatus = true;
        } else {

        if (editStatus == false){
        $("#profile-detail").show();
                $("#profile-edit").hide();
                editStatus = false;
        }

        });
        });
//        $(document).ready(function(){

//           $("#edit-profile-button").click(function(){
//            $('#edit-profile-button').click(function(){

//               alert("button");
//            $("#profile-detail").hide();
//            $("#profile-edit").show();

//           });

//        });


//                                            function myFunction() {
//                                                let x = document.getElementById("profile-detail");
//                                                if (x.style.display === "none") {
//    x.style.display = "block";
//alert("click");
//                                                    $("#profile-detail").hide();
//                                                    $("#profile-edit").show();
//                                                } else {
                x.style.display = "none";
//            $("#profile-detail").show();
//            $("#profile-edit").hide();
//                                                }
        }
    </script>
    
            <div id="cart" class="mod">
                            <div class="mod-dialog">
                                <div class="mod-content">
                                    <div class="mod-hea mod-container">
                                        <a href="#" class="mod-btn" style="color: #141d28;">×</a>
<!--                                        <h2 style="text-align: center; font-size: 40px;"><span style="color: #EE1E4E;">G</span><span style="color: #F6851F;">E</span><span style="color: #B71D8D;">M</span><span style="color: #4E2E8F;">T</span><span style="color: #2885C7;">R</span><span style="color: #B55845;">A</span><span style="color: #B31E8E;">C</span><span style="color: #21A8B2;">K</span></h2> <hr>-->

<h2 style="text-align: center; font-size: 40px; color: black;">Your Cart</h2>
                                    </div>
<!--                                    <div class="mod-container">

                                        <div id="profile-details">
                                        <center><img src="assets/images/Profile Pictures/profile.png" alt="profile picture" style="margin-top: 20px; margin-bottom: 20px;"/>


                                            <div id="profile-detail">
                                                
                                            </div>

                                    </div>-->

<hr>

<div class="cart-body">
    <%
        if(sign == null) {
            %>
            <h1>You are not login, Please Login First...</h1>
            <a href="login.jsp" style="text-align: center;"><h3>Login Now</h3></a>
            <%
        } else {
    %>
    <!--<h1>You are cart detials</h1>-->
    <!--<h1 style='text-align:center; color:red;'>cart does not have any items</h1>-->
    
    <table class='table'>
        <thead class='thead-light'>
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
        
                <%    String sql3 = "select * from add_cart where user_name='"+u+"'";
            PreparedStatement ps3 = con3.prepareStatement(sql3);
//            ps3.setString(1, sign.getUser_name());
            ResultSet rs3 = ps3.executeQuery();
//            if (rs3.next() == false) {
//                out.println("Not found");
//            } else {
            
            while(rs3.next()) {
           
        %>  
                
                <tr>
                   
                    <td> <%= rs3.getInt(1) %> </td>
                    <td> <%= rs3.getInt(3) %> </td>
                    <td> <%= rs3.getString(4) %> </td>
                    <td> <%= rs3.getInt(5) %> </td>
                    <td> <%= rs3.getInt(6) %> </td>
                    <td> <%= rs3.getInt(5)*rs3.getInt(6) %> </td>
                    
                <form action="DeleteCartItemServlet" method="POST">
                    <input type="hidden" name="id" value="<%= rs3.getInt(1) %>" />
                    <input type="hidden" name="p_id" value="<%= rs3.getInt(3) %>" />
                    <input type="hidden" name="q" value="<%= rs3.getInt(6) %>" />
                
                    <!--<td> {item.quantity * item.price} </td>-->
                    <td> 
                        <a href="DeleteCartItemServlet?id=<%= rs3.getInt(1)%>">
                            <button class='btn btn-danger'>Remove</button>
                        </a>
                    </td>
                </form>
                </tr>
                
                <%
                    sum = sum + (rs3.getInt(5)*rs3.getInt(6));
                  %>                          
    <% }
    %>
                <tr>
                    <td>
                        
                        <b>Total Price is : <%= sum %></b>
                    </td>
                </tr>
                
    </table>
</div>


                                    <hr>
                                    <div class="mod-foo mod-container" style="display: flex;">


<!--                                        <a href="#" style="background-color: #141d28; width: 200px; margin-right: 10px; margin-left: 45%;">
                                            <button  id="edit-profile-button" style="padding: 10px; widows: 200px; background-color: #141d28; color: white; cursor: pointer; width: 200px;">Edit</button> </a>-->
<a href="checkout.jsp" style="justify-content: right; align-items: right;">
<button style="padding: 10px; widows: 200px; background-color: #141d28; color: white; cursor: pointer; width: 200px; justify-content: right; align-items: right;" class="checkout-btn">Checkout</button>

</a>

<%}%>
                                        <!--demo button--> 
                                        <!--                                        <a href="LogoutServlet" style="background-color: #141d28; width: 200px; justify-content: right; margin-left: 25%;">
                                                                                    <input type="submit" value="Logout" style="padding: 10px; widows: 200px; background-color: #141d28; color: white; justify-content: right; cursor: pointer;">
                                                                                </a>-->

                                        <!--<a href="#" class="" style="cursor: pointer; width: 200px; padding: 10px; font-size: 40px; background-color: #141d28; color: white;"><input type="submit" value="close" style="cursor: pointer"></a>-->

                                        <!--<a href="#" class="" style="cursor: pointer;"><input type="submit" value="close" style="cursor: pointer"></a>-->

                                        <!--<a href="#" style="cursor: pointer;"><input type="submit" value="close" style="cursor: pointer"  class="mod-btn"></a>-->

                                        <!--<p>Mod footer</p>-->
                                    </div>
                                </div>
                                <!--</div>-->
                            </div>  
                        </div>  
    
    

    <div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!--    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>-->
</body>
</html>
