<%-- 
    Document   : cart_modal
    Created on : 05-Sept-2023, 11:45:29 am
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        
        <a href="#cart" style="color: #000;"><i class="fa-solid fa-user" style="color: #000; margin-left: 20px;">  <%= sign.getUser_name()%></i></a>
          <div id="cart" class="mod">
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
    </body>
</html>
