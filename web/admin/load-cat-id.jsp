<%-- 
    Document   : load-cat-id
    Created on : 31-Aug-2023, 2:25:41 pm
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
                String c = request.getParameter("cat");
                
            out.println("Hello 11." + c);
                String sql1 = "select main_cat_id from main_category where main_cat_name = '" + c + "'";
//                String sql = "SELECT * FROM sub_category where main_cat_name='hp'";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql1);
                
//while(rs.next()) {
        %>
        <input type="hidden" value="<%= rs.getInt("main_cat_id") %>" />
            
            <%

            %>
            <!--<option value="< rs.getString("sub_cat_name")%>"><= rs.getString("sub_cat_name")%></option>-->
            <%
//                    str += "<option value='" + rs.getString(4) + "'>" + rs.getString(4) + "</option>";
//                }
            %>
        
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
