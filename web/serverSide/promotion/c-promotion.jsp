<%-- 
    Document   : c-promotion
    Created on : Sep 18, 2025, 2:16:59 PM
    Author     : nur
--%>

<%@page import="java.sql.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>จัดการโปรโมชั่น</title>
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
		String name= request.getParameter("name");
                              String discount= request.getParameter("discount");

                 String sql = "INSERT INTO promotion (promotion_date, promotion_name, discount) VALUES (?, ?, ?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, date); //(colที่, ตัวแปรที่ getParameter)
                    pstmt.setString(2, name);
                    pstmt.setString(3, discount);

                    int rows = pstmt.executeUpdate();
                                        if (rows > 0) {
                        //response.sendRedirect("./backOffice/r-stock.jsp");
                        //response.getWriter().println("✅ Image uploaded successfully!");
                        
                        //แสดงข้อความแจ้งเดตือนและกลับไปหน้า insert
                        response.getWriter().println(
                                "<script>alert('✅ update successfully!'); window.location='r-promotion-table.jsp';</script>"
                        );

                    } else {
                        //response.sendRedirect("./backOffice/error_page.jsp");
                        //response.getWriter().println("❌ Image upload failed.");
                         response.getWriter().println(
                                "<script>alert('❌ update  failed');</script>"
                        );
                    }

                out.println(sql);
         s.execute(sql);
//         out.println("Record Insert Successfully");       
//         response.sendRedirect("r-register-table.jsp");
	  		
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
