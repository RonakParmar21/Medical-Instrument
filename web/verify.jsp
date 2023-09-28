<%-- 
    Document   : verify
    Created on : 19-Sept-2023, 5:51:35 pm
    Author     : LENOVO
--%>
<%@page import="com.gemtrack.dao.SignupDao"%>
<%@page import="com.gemtrack.entities.Signup"%>
<%@page import="java.sql.*" %>
<%@page import="com.gemtrack.helper.ConnectionProvider" %>
<%@page errorPage="error_page.jsp" %>
<%
    //Signup sign = (Signup) session.getAttribute("currentUser");

    //if (sign == null) {

//        response.sendRedirect("login.jsp");
    // }

//    out.write(sign);
//    out.println(sign);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: #f7f7f7;">
        <!--<h1>Hello World!</h1>-->
         <%@include file="nav-header.jsp" %>
        <%//    Signup sign = (Signup) session.getAttribute("currentUser");
//                            if (sign == null) {
//                            response.sendRedirect("login.jsp");
//            }  else {
                        %>
                       
                       
        <%
//            String uvc = request.getParameter("uvc");
//int uvc = Integer.parseInt(request.getParameter("uvc"));
        %>
        <%
 
            String user_id = (String)request.getAttribute("user_id");
            String user_name = (String)request.getAttribute("user_name");
            String user_email = (String)request.getAttribute("user_email");
            String user_password = (String)request.getAttribute("user_password");
            String user_cpassword = (String)request.getAttribute("user_cpassword");
            String user_mobile = (String)request.getAttribute("user_mobile");
            String user_bdate = (String)request.getAttribute("user_bdate");
            String user_registration = (String)request.getAttribute("user_registration");
            String uvc = (String)request.getAttribute("uvc");
        %>
        <!--<h1>User Verification code is : < uvc %></h1>-->
    <center><div style="border: 1px solid black; background-color: white; width: 500px; padding-top: -100px;">
            <form method="post" action="Verify" style="margin-bottom: 50px;">
            <p style="font-size: 15px; margin-top: -70px; margin-bottom: 50px;">We already send otp in your email address</p>
            <input type= "hidden" name="user_id" value="<%= user_id %>" />
            <input type="hidden" name="user_name" value="<%= user_name %>" />
            <input type="hidden" name="user_email" value="<%= user_email %>" />
            <input type="hidden" name="user_password" value="<%= user_password %>" />
            <input type="hidden" name="user_cpassword" value="<%= user_cpassword %>" />
            <input type="hidden" name="user_mobile" value="<%= user_mobile %>" />
            <input type="hidden" name="user_bdate" value="<%= user_bdate %>" />
            <input type="hidden" name="user_registration" value="<%= user_registration %>" />
            <input type="hidden" name="uvc" value="<%= uvc %>" />
            <input type="text" name="uvc1" placeholder="Enter OTP" />
            <button style="border: 1px solid black; padding: 10px; background-color: white; color: black; border-radius: 5px; font-size: 20px; width: 150px; align-items: center; text-align: center;">Submit</button>
            
        </form>
        </div></center>
    <center><b>NOTE:</b>If otp is not found then go to login page and register again . <a href="login.jsp">REGISTER</a></center>
            
            <div style="margin-top: 20px;">
                <%@include file="footer.jsp" %>
            </div>
        
        <%
//            }
        %>
    </body>
</html>
