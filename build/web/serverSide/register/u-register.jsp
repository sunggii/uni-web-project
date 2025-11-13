<%-- 
    Document   : u-register
    Created on : Sep 16, 2025, 11:16:21 AM
    Author     : nur
--%>

<%@page import="java.sql.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>จัดการบัญชี</title>
        <link rel="icon" type="image/png" href="../../img/logo.png?v=1">
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
		String Name = request.getParameter("name");
		String Surname= request.getParameter("surname");
		String Address = request.getParameter("address");
                             String Email = request.getParameter("email");
                             String Password = request.getParameter("password");
                             String type = request.getParameter("type");

                String sql = "UPDATE register " +
				"SET name = '" + Name + "' "
                                                        + ", surname = '" + Surname + "' "
                                                        + ", address = '" + Address + "' "
                                                        + ", email= '" + Email + "' "
                                                        + ", password = '" + Password+ "' "
                                                        + ", user_type = '" + type+ "' "
                                                        + " WHERE id_register = '" + Id + "' ";
                out.println(sql);
         s.execute(sql);
         out.println("Record Update Successfully");       
         response.sendRedirect("r-register-table.jsp");
	  		
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
