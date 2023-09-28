<%-- 
    Document   : inquiry
    Created on : 27-Aug-2023, 7:35:51 pm
    Author     : LENOVO
--%>

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

            input[type='text'], [type='email'], [type='tel'], select, textarea {
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

            input[type='text']:focus, [type='email']:focus, [type='tel']:focus, textarea:focus {
                outline: none;
                padding: 0 0 0.875em 0;
            }

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

                input[type='text'], [type='email'], [type='tel'], select, textarea {
                    font-size: 0.875em;
                }
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
            
            function loadDoc2(str) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("demo2").innerHTML =
                                this.responseText;
                    }
                };
                xhttp.open("GET", "load-cat2.jsp?cat2=" + str, true);
                xhttp.send();
            }
        </script>
    </head>
    <body style="background-color: #f7f7f7;">
        <div style="box-shadow: 20px 20px 50px gray;">
            <%@include file="nav-header.jsp" %></div>
        <div><%@include file="side.jsp" %></div>
        <%//            Connection con = ConnectionProvider.getConnection();
            PreparedStatement ps;
            ResultSet rs;
            String str;
//            out.println("<h1>Connection is : "+con+"</h1>");
        %>
        <div id="container" style="box-shadow: 20px 20px 50px gray;">
            <h1>Inquiry</h1>
            <div class="underline">
            </div>
            <div class="icon_wrapper">
                <div><a href="#"><i class="fa-brands fa-facebook fa-2xl icon" style="color: #141d28;"></i></a></div>

                <div><a href="#"><i class="fa-brands fa-square-twitter fa-2xl icon" style="color: #141d28;"></i></a></div>

                <div><a href="#"><i class="fa-brands fa-square-instagram fa-2xl icon" style="color: #141d28;"></i></a></div>

                <div><a href="#"><i class="fa-brands fa-linkedin fa-2xl icon" style="color: #141d28;"></i></a></div>



            </div>
            <form action="InquiryServlet" method="POST" id="contact_form">


                <div class="name">
                    <label for="name"></label>
                    <input type="text" placeholder="Enter Your Name" name="user_name" id="name_input" required>
                </div>
                <div class="email">
                    <label for="email"></label>
                    <input type="email" placeholder="Enter your Email" name="user_email" id="email_input" required>
                </div>
                <div class="telephone">
                    <label for="name"></label>
                    <input type="tel" placeholder="Enter Your Mobile No." name="user_mobile" pattern="[0-9]{10}" id="telephone_input" required>
                </div>
                <div class="subject">
                    <label for="subject"></label>
                    <!--                    <select placeholder="Choose Main Cateogry" select onchange="return loadDoc(this.value)" name="main_cat_name" id="subject_input" required>
                                            <    String sql = "select * from main_category";
                                            ps = con.prepareStatement(sql);
                                            rs = ps.executeQuery();
                                            while (rs.next()) {
                                        %>  
                                        <option value="<= rs.getString("main_cat_id") %>">
                                            <= rs.getString("main_cat_name")%>
                                        </option>
                                        <
                                            
                                        %>  
                                            <option disabled hidden selected>Subject line</option>
                                            <option>I'd like to start a project</option>
                                            <option>I'd like to ask a question</option>
                                            <option>I'd like to make a proposal</option>
                                        </select>-->
                    <select onchange="return loadDoc(this.value)" name="main_cat_name">
                        <option>Select Main Category</option>
                        <%    String sql = "select * from main_category";
                            ps = con.prepareStatement(sql);
                            rs = ps.executeQuery();
                            while (rs.next()) {
                        %>  
                        <option value="<%= rs.getString("main_cat_id")%>">
                            <%= rs.getString("main_cat_name")%>
                        </option>
                        <%
                            }
                        %>  
                    </select>
                </div>

                <div class="subject">
                    <label for="subject"></label>
                    <select id="demo"  onchange="return loadDoc1(this.value)" name="sub_cat">
                        <option>Select Sub Category</option>
                        <!--</select>--> 
                    </select> 
                    <!--                <label style="margin-top: 10px;">Choose Product</label>
                                    <select id="demo1" name="product">
                                        <option>Select Product</option>
                                    </select>-->
                </div>

                <div class="subject">
                    <label for="subject"></label>
                    <select id="demo1" onchange="return loadDoc2(this.value)" name="product">
                        <option>Select Product</option>
                    </select>
                </div>
                    
                <div class="subject">
                    <label for="subject"></label>
                    <select id="demo2" name="sub-product">
                        <option>Select Sub Product</option>
                    </select>
                </div>
                    
                    
                <div class="message">
                    <label for="message"></label>
                    <input type="text" name="user_description" placeholder="Description" class="name_input" required />
                    <!--<textarea name="message" placeholder="I'd like to chat about" id="user_description" cols="30" rows="5" required></textarea>-->
                </div>
                <div class="submit">
                    <input type="submit" value="Send Inquiry" id="form_button" />
                </div>
            </form> <!-- End form -->
        </div> 


















        <div style="box-shadow: 20px 20px 50px gray;">
            <%@include file="footer.jsp" %></div>
    </body>
</html>
