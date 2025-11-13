<%-- 
    Document   : d-payment
    Created on : Sep 18, 2025, 7:15:04 AM
    Author     : nur
--%>

<%@page import="java.sql.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         //   response.setContentType("text/xml;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");%>
        <%	
            request.setCharacterEncoding("UTF-8");
	Connection connect = null;
	Statement s = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		connect =  DriverManager.getConnection("jdbc:mysql://localhost/my_project?autoReconnect=true&useSSL=false","root", "17905apy");
	
		s = connect.createStatement();
		
		String Id = request.getParameter("id");
		

                String sql = "Delete from payment  WHERE payment_id = '" + Id + "' ";
                out.println(sql);
         s.execute(sql);
         out.println("Record Deleted Successfully");       
         response.sendRedirect("r-payment-table.jsp");
	  		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(s!=null){
				s.close();
				connect.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
    </body>
</html>
