<%-- 
    Document   : UpdatePosition
    Created on : 9 Jun, 2017, 1:17:42 AM
    Author     : Vicky
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            int id =Integer.parseInt(request.getParameter("id"));
            String pos_name =request.getParameter("e_pos");
            
            
            Connection con = null; 
            try{ 
                Class.forName("com.mysql.jdbc.Driver"); 
                con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms", "root", ""); 
                Statement st=con.createStatement(); 
                int i=st.executeUpdate("UPDATE position SET POS_NAME='"+pos_name+"' WHERE POS_ID='"+id+"'"); 
                    RequestDispatcher requestDispatcher; 
                    requestDispatcher = request.getRequestDispatcher("/position.jsp");
                    requestDispatcher.forward(request, response);
            } 
            catch(Exception e){ 
                System.out.print(e); 
                out.println(e);
                e.printStackTrace(); 
            } 
        %>
    </body>
</html>
