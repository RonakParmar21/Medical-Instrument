<%-- 
    Document   : load-cat
    Created on : 27-Aug-2023, 9:16:48 pm
    Author     : LENOVO
--%>
<%@page import="com.gemtrack.dao.MainCategoryDao" %>
<%@page import="com.gemtrack.entities.MainCategory"%>
<%@page import="com.gemtrack.dao.SubCategoryDao" %>
<%@page import="com.gemtrack.entities.SubCategory"%>
<%@page import="java.sql.*" %>

<%@page import="com.gemtrack.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection conn = ConnectionProvider.getConnection();
        %>
        <%
            Statement stmt = null;
            ResultSet rs = null;
//            String str = "";
//            String c = request.getParameter("cat");
//            out.println("Hello 11." + c);
            try {
                String str = "";
                String c = request.getParameter("cat1");
                
                //int c = Integer.parseInt(request.getParameter("cat"));
            out.println("H" + c);
                String sql1 = "select * from product where sub_cat_id = '"+c+"'";
//                String sql = "SELECT * FROM sub_category where main_cat_name='hp'";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql1);
        %>
        
             <!--<select name="sub_cat">-->
            <%
                while (rs.next()) {
            %>
           
            <option value="<%= rs.getString("product_id")%>"><%= rs.getString("product_name")%></option>
            <%
//                    str += "<option value='" + rs.getString(4) + "'>" + rs.getString(4) + "</option>";
                }

            %>
             <!--</select>-->
        <%
            } catch (Exception e) {
                e.printStackTrace();
            }
//finally {
//                try {
//                    if (rs != null) {
//                        rs.close();
//                    }
//                    if (stmt != null) {
//                        stmt.close();
//                    }
//                    if (conn != null) {
//                conn.close();
//                    }
//                } catch (SQLException se) {
//                    se.printStackTrace();
//                }
//            }
%>


    </body>
</html>
