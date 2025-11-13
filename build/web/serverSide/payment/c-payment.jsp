<%-- 
    Document   : c-payment
    Created on : Oct 24, 2025, 8:33:28 PM
    Author     : nur
--%>

<%@page import="java.sql.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>จัดการชำระเงิน</title>
        <link rel="icon" type="image/png" href="../../img/logo.png?v=1">
    </head>
    <body>
          <%
         //   response.setContentType("text/xml;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");%>
        <%	
            request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	Statement s = null;
               PreparedStatement pstmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		conn =  DriverManager.getConnection("jdbc:mysql://localhost/my_project?autoReconnect=true&useSSL=false","root", "17905apy");
		
		s = conn.createStatement();
		
		String date= request.getParameter("date");
		String amount= request.getParameter("amount");
                            String email = (String) session.getAttribute("email");

                 String sql = "INSERT INTO payment (payment_date, amount, user_email) VALUES (?, ?, ?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, date); //(colที่, ตัวแปรที่ getParameter)
                    pstmt.setString(2, amount);
                    pstmt.setString(3, email);

                    int rows = pstmt.executeUpdate();
                                        if (rows > 0) {
                       
                        //แสดงข้อความแจ้งเดตือนและกลับไปหน้า index
                       response.getWriter().println(
                                "<script>alert('✅ paid successfully!'); window.location='../../index.jsp';</script>"
                        );
                        

                    } else {
                         response.getWriter().println(
                                "<script>alert('❌ paid failed');</script>"
                        );
                    }

                out.println(sql);
         s.execute(sql);
	  		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(s!=null){
				s.close();
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
    </body>
</html>

