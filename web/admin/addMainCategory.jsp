<%-- 
    Document   : addMainCategory
    Created on : 20-Aug-2023, 3:56:28 pm
    Author     : LENOVO
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>


            input[type=text] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type=submit], input[type=button] {
                width: 25%;
                background-color: #141d28;
                color: white;
                padding: 14px 20px;
                margin-top: 12px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #018c94;
            }
            
            input[type=button]:hover {
                background-color: #018c94;
            }

            div {
                margin: auto;
                width: 30%;
                border-radius: 5px;
                /*background-color: #ededed;*/
                /*padding: 20px;*/
                font-family: 'Work Sans', sans-serif;
            }

        </style>
    </head>
    <body>

        <%@include file="navbar.jsp" %>

        <div style="background-color: #ededed;padding: 20px;margin-top: 20px;">
            <form action="../AddMainCategoryServlet" method="POST" enctype="multipart/form-data">
                <h1 style="text-align: center">Add Main Category</h1> <hr><br>
            
                <label>Category Name</label>
                <input type="text" name="main_cat_name" placeholder="Enter Main Category Name" required />
                <label>Choose Image</label>
                <input type="file" name="main_cat_image" required />


                <a href="#">
                    <!--<button id="button">Add</button>--> 
                    <input type="submit" value="Add" />
                </a>
                <a href="addSubCategory.jsp">
                    <input type="button" value="Add Sub-Category" style="width: 46%;" />
                </a>
                <a href="index.jsp">
                    <input type="button" value="Cancel" />
                </a>
                <!--<a href="LogoutServlet" style="justify-content: right; align-items: right;"><button style="padding: 10px; widows: 200px; background-color: #141d28; color: white; cursor: pointer; width: 200px; justify-content: right; align-items: right;">logout</button></a>-->
                <!--<a href="#id02" style="background-color: #141d28; width: 200px; margin-right: 10px; margin-left: 45%;">-->
                <!--<button  id="edit-profile-button" style="padding: 10px; widows: 200px; background-color: #141d28; color: white; cursor: pointer; width: 200px;">Edit</button> </a>-->

                <!--<a href="#"><input type="submit" value="Add" style="margin-left: 0px;"></a>-->
                <!--<a href="#"><button>Add</button></a>-->
                <!--<a href="addSubCategory.jsp"><button style="width: 46%">Add Sub Category</button></a>-->
                <!--<a href="index.jsp"><button>Cancel</button></a>-->
                <!--<a href="addSubCategory.jsp"><input type="submit" value="Add Sub Category" style="width: 46%"></a>-->
                <!--<a href="index.jsp"><input type="submit" value="Cancel" /></a>-->
            </form>
        </div>
        <div></div>
        <%@include file="footer.jsp" %>
    </body>
</html>
