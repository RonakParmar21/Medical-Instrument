<%--<%@page import="com.gemtrack.entities.Message"%>--%>
<%--<%@page import="com.gemtrack.entities.AdminSignup"%>--%>
<%--<%@page errorPage="error_page.jsp" %>--%>
<%
//    AdminSignup adminsign = (AdminSignup) session.getAttribute("currentAdminUser");

//    if (adminsign == null) { 
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
              <style>

            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .form-container {
                width: 600px;
                margin: 0 auto;
                padding: 50px;
                background-color: #333;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                color: #fff;
            }

            h1 {
                text-align: center;
                margin-bottom: 30px;
                font-size: 36px;
                color: #b38bff;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            label {
                margin-bottom: 10px;
                font-size: 18px;
            }

            input {
                padding: 12px;
                border: none;
                border-radius: 5px;
                margin-bottom: 20px;
                font-size: 16px;
                color: #fff;
                background-color: #555;
            }

            button {
                padding: 10px;
                background-color: #b38bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 18px;
                transition: background-color 0.2s ease-in-out;
            }

            button:hover {
                background-color: #8c5fb2;
            }

            a {
                text-decoration: none;
                color: #b38bff;
                font-size: 18px;
                transition: color 0.2s ease-in-out;
            }

            a:hover {
                color: #8c5fb2;
            }

            p {
                text-align: center;
                margin: 8px;
            }
        </style>
        
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        
        
            <div class="container">
            <div class="form-container" id="signup-form">
                <h1>Add Admin</h1>
                <form method="POST" action="../AdminSignupServlet">
                    <label for="new-username">Username</label>
                    <input type="text" id="new-username" name="admin_name" placeholder="Enter Admin Name" required>
                    <label for="new-email">Email</label>
                    <input type="email" id="new-email" name="admin_email" placeholder="Enter Admin Email" required>
                    <label for="new-password">Password</label>
                    <input type="password" id="new-password" name="admin_password" placeholder="Enter Admin Password" required><br>
                    <!--<a href=""><input type="submit" value="Add Admin"></a>-->
                    <!--<a href=""><button type="submit"  style="width: 100%">Add Admin</button></a>-->
                    <input type="submit" value="Add Admin">
                    <!--<button type="submit">Login</button>-->
                </form>
            </div>
        </div>
        
        
       <% 
//           }
//else if(adminsign != null) {
//                   response.sendRedirect("index.jsp");
                   
//                   }
       %>
        
        
        <!--<h1>Hello World!</h1>-->
        
        <%@include file="footer.jsp" %>
    </body>
</html>
