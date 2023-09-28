<%-- 
    Document   : login
    Created on : 24-Jul-2023, 7:04:58 pm
    Author     : LENOVO
--%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@page import="com.gemtrack.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>



        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
            }

            body,
            input {
                font-family: 'Montserrat', sans-serif;
            }

            .container1 {
                position: relative;
                width: 100%;
                background-color: #fff;
                min-height: 100vh;
                overflow: hidden;
            }

            .forms-container {
                position: absolute;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
            }

            .signin-signup {
                position: absolute;
                top: 50%;
                transform: translate(-50%, -50%);
                left: 75%;
                width: 50%;
                transition: 1s 0.7s ease-in-out;
                display: grid;
                grid-template-columns: 1fr;
                z-index: 5;
            }

            form {
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                padding: 0rem 5rem;
                transition: all 0.2s 0.7s;
                overflow: hidden;
                grid-column: 1 / 2;
                grid-row: 1 / 2;
            }

            form.sign-up-form {
                opacity: 0;
                z-index: 1;
            }

            form.sign-in-form {
                z-index: 2;
            }

            .title {
                font-size: 2.2rem;
                color: #444;
                margin-bottom: 10px;
            }

            .input-field {
                max-width: 380px;
                width: 100%;
                background-color: #f0f0f0;
                margin: 10px 0;
                height: 55px;
                border-radius: 5px;
                display: grid;
                grid-template-columns: 15% 85%;
                padding: 0 0.4rem;
                position: relative;

                z-index: 999;
            }

            .input-field i {
                text-align: center;
                line-height: 55px;
                color: #acacac;
                transition: 0.5s;
                font-size: 1.1rem;
            }

            .input-field input {
                background: none;
                outline: none;
                border: none;
                line-height: 1;
                font-weight: 600;
                font-size: 1.1rem;
                color: #333;
                margin-top: 5px;
                align-items: center;

                /*z-index: 999;*/
            }

            .input-field input::placeholder {
                color: #aaa;
                font-weight: 500;
            }

            .social-text {
                padding: 0.7rem 0;
                font-size: 1rem;
            }

            .social-media {
                display: flex;
                justify-content: center;
            }

            .social-icon {
                height: 46px;
                width: 46px;
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0 0.45rem;
                color: #333;
                border-radius: 50%;
                border: 1px solid #333;
                text-decoration: none;
                font-size: 1.1rem;
                transition: 0.3s;
            }

            .social-icon:hover {
                color: white;
                border-color: #141d28;
                background-color: #141d28;
            }

            .btn {
                width: 150px;
                background-color: #141d28;
                border: none;
                outline: none;
                height: 49px;
                border-radius: 4px;
                color: #fff;
                text-transform: uppercase;
                font-weight: 600;
                margin: 10px 0;
                cursor: pointer;
                transition: 0.5s;
            }

            .btn:hover {
                /*background-color: #f98c39;*/
                background-color: #141d28;
                color: white;
            }
            .panels-container {
                position: absolute;
                height: 100%;
                width: 100%;
                top: 0;
                left: 0;
                display: grid;
                grid-template-columns: repeat(2, 1fr);
            }

            .container1:before {
                content: "";
                position: absolute;
                height: 2000px;
                width: 2000px;
                top: -10%;
                right: 48%;
                transform: translateY(-50%);
                background-image: linear-gradient(-45deg, #F86F03 0%, #FFA41B 100%);
                transition: 1.8s ease-in-out;
                border-radius: 50%;
                z-index: 6;
            }

            .image {
                width: 100%;
                transition: transform 1.1s ease-in-out;
                transition-delay: 0.4s;
            }

            .panel {
                display: flex;
                flex-direction: column;
                align-items: flex-end;
                justify-content: space-around;
                text-align: center;
                z-index: 6;

            }

            .left-panel {
                pointer-events: all;
                padding: 3rem 17% 2rem 12%;
            }

            .right-panel {
                pointer-events: none;
                padding: 3rem 12% 2rem 17%;
            }

            .panel .content {
                color: #fff;
                transition: transform 0.9s ease-in-out;
                transition-delay: 0.6s;
            }

            .panel h3 {
                font-weight: 600;
                line-height: 1;
                font-size: 1.5rem;
            }

            .panel p {
                font-size: 0.95rem;
                padding: 0.7rem 0;
            }

            .btn.transparent {
                margin: 0;
                background: none;
                border: 2px solid #fff;
                width: 130px;
                height: 41px;
                font-weight: 600;
                font-size: 0.8rem;
            }

            .right-panel .image,
            .right-panel .content {
                transform: translateX(800px);
            }

            /* ANIMATION */

            .container1.sign-up-mode:before {
                transform: translate(100%, -50%);
                right: 52%;
            }

            .container1.sign-up-mode .left-panel .image,
            .container1.sign-up-mode .left-panel .content {
                transform: translateX(-800px);
            }

            .container1.sign-up-mode .signin-signup {
                left: 25%;
            }

            .container1.sign-up-mode form.sign-up-form {
                opacity: 1;
                z-index: 2;
            }

            .container1.sign-up-mode form.sign-in-form {
                opacity: 0;
                z-index: 1;
            }

            .container1.sign-up-mode .right-panel .image,
            .container1.sign-up-mode .right-panel .content {
                transform: translateX(0%);
            }

            .container1.sign-up-mode .left-panel {
                pointer-events: none;
            }

            .container1.sign-up-mode .right-panel {
                pointer-events: all;
            }

            @media (max-width: 870px) {
                .container1 {
                    min-height: 800px;
                    height: 100vh;
                }
                .signin-signup {
                    width: 100%;
                    top: 95%;
                    transform: translate(-50%, -100%);
                    transition: 1s 0.8s ease-in-out;
                }

                .signin-signup,
                .container1.sign-up-mode .signin-signup {
                    left: 50%;
                }

                .panels-container1 {
                    grid-template-columns: 1fr;
                    grid-template-rows: 1fr 2fr 1fr;
                }

                .panel {
                    flex-direction: row;
                    justify-content: space-around;
                    align-items: center;
                    padding: 2.5rem 8%;
                    grid-column: 1 / 2;
                }

                .right-panel {
                    grid-row: 3 / 4;
                }

                .left-panel {
                    grid-row: 1 / 2;
                }

                .image {
                    width: 200px;
                    transition: transform 0.9s ease-in-out;
                    transition-delay: 0.6s;
                }

                .panel .content {
                    padding-right: 15%;
                    transition: transform 0.9s ease-in-out;
                    transition-delay: 0.8s;
                }

                .panel h3 {
                    font-size: 1.2rem;
                }

                .panel p {
                    font-size: 0.7rem;
                    padding: 0.5rem 0;
                }

                .btn.transparent {
                    width: 110px;
                    height: 35px;
                    font-size: 0.7rem;
                }

                .container1:before {
                    width: 1500px;
                    height: 1500px;
                    transform: translateX(-50%);
                    left: 30%;
                    bottom: 68%;
                    right: initial;
                    top: initial;
                    transition: 2s ease-in-out;
                }

                .container1.sign-up-mode:before {
                    transform: translate(-50%, 100%);
                    bottom: 32%;
                    right: initial;
                }

                .container1.sign-up-mode .left-panel .image,
                .container1.sign-up-mode .left-panel .content {
                    transform: translateY(-300px);
                }

                .container1.sign-up-mode .right-panel .image,
                .container1.sign-up-mode .right-panel .content {
                    transform: translateY(0px);
                }

                .right-panel .image,
                .right-panel .content {
                    transform: translateY(300px);
                }

                .container1.sign-up-mode .signin-signup {
                    top: 5%;
                    transform: translate(-50%, 0);
                }
            }

            @media (max-width: 570px) {
                form {
                    padding: 0 1.5rem;
                }

                .image {
                    display: none;
                }
                .panel .content {
                    padding: 0.5rem 1rem;
                }
                .container1 {
                    padding: 1.5rem;
                }

                .container1:before {
                    bottom: 72%;
                    left: 50%;
                }

                .container1.sign-up-mode:before {
                    bottom: 28%;
                    left: 50%;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="nav-header.jsp" %>
        <div><%@include file="side.jsp" %></div>
        <%--<%@include file="header.jsp" %>--%>
        <%--<%@include file="navbar.jsp" %>--%>

        <div class="container1" style="margin-top: 20px; height: 100%; margin-bottom: 20px;">
            <div class="forms-container">
                <div class="signin-signup">
                    <form action="LoginServlet" method="POST" class="sign-in-form">
                        <h2 class="title">Sign in</h2>

                        <%                            Message m = (Message) session.getAttribute("msg");

                            if (m != null) {
                        %>
                        <div class="alert  <%= m.getCssClass()%>" role="alert">
                            <%= m.getContent()%>
                        </div>
                        <%
                                session.removeAttribute("msg");
                            }


                        %>

                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="email" name="user_email" placeholder="User Email" pattern=".{4,}@gmail\.com" style="margin-top: 15px;" required/>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-eye" id="eye-icon" onclick="pass()"></i>
                            <input type="password" id="password1" name="user_password" placeholder="Password" style="margin-top: 15px;" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Password must be at least 8 characters long and contain at least one letter, one digit, and one special character (@$!%*#?&)." required />
                        </div>

                        <!--                        <div class="input-field">
                                                    <i class="fas fa-lock"></i>
                                                    <input type="password" id="password1" name="user_password" placeholder="Password"  style="margin-top: 15px;" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Password must be at least 8 characters long and contain at least one letter, one digit, and one special character (@$!%*#?&)."value="" required />
                                                    <span><input type="button" id="pass-icon1" onclick="pass()" value="show" /></span>
                                                    
                                                     pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.@_])[A-Za-z\d@$!%*#?&]{8,}$"
                                                </div>-->
                        <input type="submit" value="Login" class="btn solid" />
                        <!--                        <p class="social-text">Or Sign in with social platforms</p>
                                                <div class="social-media">
                                                    <a href="#" class="social-icon">
                                                        <i class="fab fa-facebook-f"></i>
                                                    </a>
                                                    <a href="#" class="social-icon">
                                                        <i class="fab fa-twitter"></i>
                                                    </a>
                                                    <a href="#" class="social-icon">
                                                        <i class="fab fa-google"></i>
                                                    </a>
                                                    <a href="#" class="social-icon">
                                                        <i class="fab fa-linkedin-in"></i>
                                                    </a>
                                                </div>-->
                    </form>
                    <form id="reg" onsubmit="return validateForm()" action="SignupServlet" method="POST" class="sign-up-form">
                        <h2 class="title">Sign up</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" pattern="[A-Za-z]+" title="Only letters are allowed." name="user_name" placeholder="Username" style="margin-top: 15px;" required/>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-envelope"></i>
                            <input type="hidden" name="my_email" value="parmarronak21112003@gmail.com" />
                            <input type="email" name="user_email" placeholder="Email" pattern=".{4,}@gmail\.com" title="Your Email Address is not valid" style="margin-top: 15px;" required/>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" id="password" name="user_password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Password must be at least 8 characters long and contain at least one letter, one digit, and one special character (@$!%*#?&)." style="margin-top: 15px;" required/>
                        </div>
                        <!--pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" title="Password must be at least 8 characters long and contain at least one letter, one digit, and one special character (@$!%*#?&)."-->
                        
                        
                        
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" id="confirm_password" name="user_cpassword" placeholder="Confirm Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Password must be at least 8 characters long and contain at least one letter, one digit, and one special character (@$!%*#?&)."  style="margin-top: 15px;" required />
                        </div>
                        <!--pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" title="Password must be at least 8 characters long and contain at least one letter, one digit, and one special character (@$!%*#?&)."-->
                        <!--pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$" title="Password must be at least 8 characters long and contain at least one letter, one digit, and one special character (@$!%*#?&)."-->
                        <div class="input-field">
                            <!--<i class="fas fa-lock"></i>-->
                            <i class="fa-solid fa-mobile-button"></i>
                            <input type="tel" name="user_mobile" placeholder="Mobile" pattern="[0-9]{10}" title="Please enter a valid 10-digit mobile number." style="margin-top: 15px;" required/>
                        </div>
                        <div class="input-field">
                            <!--<i class="fas fa-cal"></i>-->
                            <i class="fa-solid fa-calendar-days"></i>
                            <input type="date" name="user_bdate" name="user_bdate" style="margin-top: 30px;" required/>
                        </div>

                        <input type="submit" class="btn" value="Sign up" />
                        <p></p>
                        <!--<p class="social-text">Or Sign up with social platforms</p>-->
                        <!--                        <div class="social-media">
                                                    <a href="#" class="social-icon">
                                                        <i class="fab fa-facebook-f"></i>
                                                    </a>
                                                    <a href="#" class="social-icon">
                                                        <i class="fab fa-twitter"></i>
                                                    </a>
                                                    <a href="#" class="social-icon">
                                                        <i class="fab fa-google"></i>
                                                    </a>
                                                    <a href="#" class="social-icon">
                                                        <i class="fab fa-linkedin-in"></i>
                                                    </a>
                                                </div>-->
                    </form>
                </div>
            </div>

            <div class="panels-container">
                <div class="panel left-panel">
                    <div class="content">
                        <h3>New here ?</h3>
                        <p>
                            If you are not register please register click on below button
                        </p>
                        <button class="btn transparent" id="sign-up-btn">
                            Sign up
                        </button>
                    </div>
                    <img  src="https://i.ibb.co/6HXL6q1/Privacy-policy-rafiki.png" class="image" alt="" />
                </div>
                <div class="panel right-panel">
                    <div class="content">
                        <h3>One of us ?</h3>
                        <p>
                            If you are register your account then login click on below button.
                        </p>
                        <button class="btn transparent" id="sign-in-btn">
                            Sign in
                        </button>
                    </div>
                    <img src="https://i.ibb.co/nP8H853/Mobile-login-rafiki.png"  class="image" alt="" />
                </div>
            </div>
        </div>


        <%@include file="footer.jsp" %>

        <script>
            $(document).ready(function () {

                console.log("loaded...");
                $('#reg').on('submit', function(event)) {
                    event.preventDefault();

                    let form = new FormData(this);

                    // send register servlet

                    $.ajax({
                        url: "SignupServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
//                        console.log(data)
                            alert("Success");
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
//                        console.log(jqXHR)
                            alert("NOT SUCCESS")
                        },

                        processData: false,
                        contentType: false
                    });
                }
            });
        </script>

        <script>
            const sign_in_btn = document.querySelector("#sign-in-btn");
            const sign_up_btn = document.querySelector("#sign-up-btn");
            const container1 = document.querySelector(".container1");

            sign_up_btn.addEventListener("click", () => {
                container1.classList.add("sign-up-mode");
            });

            sign_in_btn.addEventListener("click", () => {
                container1.classList.remove("sign-up-mode");
            });
        </script>

        <!--password match validation script code-->
        <script>
            function validateForm() {
                var password = document.getElementById("password").value;
                var confirm_password = document.getElementById("confirm_password").value;

                if (password !== confirm_password) {
                    alert("Both Password are not matched. Please try again.");
                    return false; // Prevent form submission
                }

                // Form submission will proceed if passwords match
                return true;
            }
        </script>

        <script>

//            function check(){
//if(document.getElementsByTagName('input')[0].value.match(/[0-9]/g))
//{
//console.log('please enter alphapet only')
//}
//
//}

        </script>
        <script>
            // password show hide 
        //    var a;
        //    function pass() {
        //        if (a == 1) {
        //            document.getElementById('password1').type = 'password';
        //            document.getElementById('pass-icon1').innerHTML = 'hide';
        //            a = 0;
        //        }
        //        else {
        //            document.getElementById('password1').type = 'text';
        //            document.getElementById('pass-icon1').innerHTML = 'show';
        //            a = 1;
        //        }
        //    }
        </script>

        <script>
            var passwordInput = document.getElementById("password1");
            var eyeIcon = document.getElementById("eye-icon");
            var isPasswordVisible = false;

            function pass() {
                if (isPasswordVisible) {
                    passwordInput.type = "password";
                    eyeIcon.classList.remove("fa-eye-slash");
                    eyeIcon.classList.add("fa-eye");
                } else {
                    passwordInput.type = "text";
                    eyeIcon.classList.remove("fa-eye");
                    eyeIcon.classList.add("fa-eye-slash");
                }

                isPasswordVisible = !isPasswordVisible;
            }

        </script>
    </body>
</html>
