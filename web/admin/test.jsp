<%-- 
    Document   : test
    Created on : 01-Sept-2023, 10:56:56 am
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
        <%@include file="navbar.jsp" %>
        <h1>Hello World!</h1>
        
        
        
        <% 
            String main_cat_id = request.getParameter("mainId");
//            String oldName = request.getParameter("old");
        %>
        
        <%
try {            Connection con = ConnectionProvider.getConnection();
//            out.println("<h1>Connection is : " +con+"</h1>");
        %>

        <%    String sql = "select * from main_category where main_cat_id = '"+main_cat_id+"'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
//            String old = rs.getString("old_cat_name");
//            String new_cat = rs.getString("main_cat_name");
//            String id = rs.getString("main_cat_id");
        %>  
        
        <h1>
        <% 
            
//            out.println(old);
//            out.println(new_cat);
//            out.println(id);
//           out.println(rs.getString("main_cat_id"));
//           out.println(rs.getString("old_cat_name"));
//           out.println(rs.getString("main_cat_name"));
           
//           out.println("<br><br>");
//           out.println("Old name is : ame+"<br><br>");
    
//           out.println("New name is : "+main_cat_name+"<br><br>");
        %>
        </h1>

       
        
                <div style="background-color: #ededed;padding: 20px;margin-top: 20px;">
                    <form action="updateMainCategoryDetailsAction.jsp" method="POST">
                <h1 style="text-align: center">Add Main Category</h1> <hr><br>
                <!--<input type="hidden" name="old" value="<%= // old %>"  />-->
                <label>Category Name</label>
                
                <input type="text" name="main_cat_name" value="<%= rs.getString("main_cat_name") %>" placeholder="Enter Main Category Name" required />
                <label>Choose Image</label>
                <input type="file" name="main_cat_image"  />


                <a href="#">
                    <!--<button id="button">Add</button>--> 
                    <input type="submit" value="Update" />
                </a>
            </form>
        </div>
                
                 <%
            }}
catch(Exception e) {
e.printStackTrace();
}
        %>
    </body>
</html>
