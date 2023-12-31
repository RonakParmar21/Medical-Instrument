<%-- 
    Document   : contact
    Created on : 17-Jul-2023, 2:17:01 pm
    Author     : LENOVO
--%>

<%@page import="com.gemtrack.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
               
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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

            input[type='text'], [type='email'], select, textarea {
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

            input[type='text']:focus, [type='email']:focus, textarea:focus {
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

                input[type='text'], [type='email'], select, textarea {
                    font-size: 0.875em;
                }
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7;">
        <%--<%@include file="header.jsp" %>--%>
        <%--<%@include file="navbar.jsp" %>--%>
        <%@include file="nav-header.jsp" %>
        <div><%@include file="side.jsp" %></div>
        <%--<%@include file="slider.jsp" %>--%>
        <!--<h1>Hello World!</h1>-->

        
        
        <br><hr>
        <!--contact form-->
        <div id="container">
            <h1>Get in Touch</h1>
            <div class="underline">
            </div>
            <div class="icon_wrapper">
                <div><a href="#"><i class="fa-brands fa-facebook fa-2xl icon" style="color: #141d28;"></i></a></div>
                
                 <div><a href="#"><i class="fa-brands fa-square-twitter fa-2xl icon" style="color: #141d28;"></i></a></div>
                 
                  <div><a href="#"><i class="fa-brands fa-square-instagram fa-2xl icon" style="color: #141d28;"></i></a></div>
                  
                   <div><a href="#"><i class="fa-brands fa-linkedin fa-2xl icon" style="color: #141d28;"></i></a></div>
               


            </div>
            <form action="ContactServlet" method="POST" id="contact_form">
                

                <div class="name">
                    <label for="name"></label>
                    <input type="text" placeholder="My name is" name="user_name" id="name_input" required>
                </div>
                <div class="email">
                    <label for="email"></label>
                    <input type="email" placeholder="My e-mail is" name="user_email" id="email_input" required>
                </div>
                <div class="telephone">
                    <label for="name"></label>
                    <input type="text" placeholder="My number is" name="user_mobile" id="telephone_input" required>
                </div>
<!--                <div class="subject">
                    <label for="subject"></label>
                    <select placeholder="Subject line" name="subject" id="subject_input" required>
                        <option disabled hidden selected>Subject line</option>
                        <option>I'd like to start a project</option>
                        <option>I'd like to ask a question</option>
                        <option>I'd like to make a proposal</option>
                    </select>
                </div>-->
                <div class="message">
                    <label for="message"></label>
                    <input type="text" name="user_description" placeholder="Description" class="name_input" required />
                    <!--<textarea name="message" placeholder="I'd like to chat about" id="user_description" cols="30" rows="5" required></textarea>-->
                </div>
                <div class="submit">
                    <input type="submit" value="Send Message" id="form_button" />
                </div>
            </form> <!-- End form -->
        </div> 
                         <!--End container--> 
        
        <hr><br>

        <%@include file="footer.jsp" %>
    </body>
</html>
