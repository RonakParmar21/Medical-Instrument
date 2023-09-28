<%@page import="com.gemtrack.entities.AdminSignup"%>
<%@page errorPage="../error_page.jsp" %>
<%
    AdminSignup adminsign = (AdminSignup) session.getAttribute("currentAdminUser");

    if (adminsign == null) {

        response.sendRedirect("adminLogin.jsp");
    } else if (adminsign != null) {

//    out.write(sign);
//    out.println(sign);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="adminCss.css">

        <!--font awesome cdn-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!--bootstrap css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>








    <body>
    <!--<h1>Hello World!</h1>-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #cad1d9;">
        <a class="navbar-brand" href="#"><img src="../assets/images/logo.png" width="250" height="100" alt="Gemtrack's Image" style="margin-left: 40%;"/></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav" style="margin-left: 50%;">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp" style="font-size: 30px;text-align: center;">Home</a>  
                    <!--<span class="sr-only">(current)</span>-->
                </li>
<!--                <li class="nav-item active">
                    <a class="nav-link" href="#" style="font-size: 30px; text-align: center;">Categories</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#" style="font-size: 30px; text-align: center;">Product<span class="sr-only">(current)</span></a>
                </li>-->
                <!--<li class="nav-item dropdown">-->
                    <!--<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">-->
                        <!--<a href="#" style="color: black"></a>-->                
                        
                    
                    <!--<div class="dropdown-menu" aria-labelledby="navbarDropdown">-->
                        <!--<a class="dropdown-item" href="#">Action</a>-->
                        <!--<a class="dropdown-item" href="#">Another action</a>-->
                        <!--<div class="dropdown-divider"></div>-->
                        <!--<a href="../AdminLogout" class="dropdown-item">Logout</a>-->
                    <!--</div>-->
                <!--</li>-->
                 <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"  style="font-size: 30px; text-align: center; color: black;">
          <i class="fa-solid fa-user" style="color: #000000;"></i><%= adminsign.getAdmin_name()  %>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">View Profile</a>
          <div class="dropdown-divider"></div>
          <a href="../AdminLogout" class="dropdown-item"><i class="fa-solid fa-arrow-right-from-bracket" style="color: #000000; text-align: center;"></i> logout</a>
        </div>
      </li>
                <!--<li class="nav-item active">--> 

                    <!--<a href="../AdminLogout"><i class="fa-solid fa-user" style="color: #ffffff;"></i> logout</a>-->
                <!--</li>-->
            </ul>
        </div>
    </nav>

    <!--bootstrap js-->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
<%
    }
//else {

//}
%>