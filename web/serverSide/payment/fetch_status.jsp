<%-- 
    Document   : fetch_status
    Created on : Oct 25, 2025, 6:57:09 PM
    Author     : nur
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String status = request.getParameter("status");
    String query;
    
    if (status == null ) {
         out.print("<tr><td colspan='7' style='text-align:center;color:gray;'>ไม่มีข้อมูล</td></tr>");
    }
    
    if (status == null || status.equals("all")) {
        query = "SELECT * FROM payment";
    } else {
        query = "SELECT * FROM payment WHERE status = ?";
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost/my_project?allowPublicKeyRetrieval=true&useSSL=false",
            "root", "17905apy");

        PreparedStatement ps = conn.prepareStatement(query);
        if (!status.equals("all")) {
            ps.setString(1, status);
        }

        ResultSet rs = ps.executeQuery();

        boolean hasData = false;
        while (rs.next()) {
            hasData = true;
%>
<tr>
    <td><%=rs.getString("payment_id")%></td>
    <td><%=rs.getString("user_email")%></td>
    <td><%=rs.getString("payment_date")%></td>
    <td><%=rs.getString("status")%></td>
    <td><%=rs.getString("amount")%></td>
    <td>
        <a href="u-payment-form.jsp?id=<%=rs.getString("payment_id")%>">
            <i class="bi bi-pencil-fill"></i>
        </a>
    </td>
    <td>
        <a href="d-payment.jsp?id=<%=rs.getString("payment_id")%>"
           onclick="return confirm('⚠️ คุณแน่ใจหรือไม่ที่จะลบข้อมูลนี้?')">
            <i class="bi bi-trash3-fill"></i>
        </a>
    </td>
</tr>
<%
        }
        if (!hasData) {
            out.print("<tr><td colspan='6' class='text-center text-muted'>ไม่มีข้อมูล</td></tr>");
        }

        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        out.print("<tr><td colspan='6' class='text-danger'>" + e + "</td></tr>");
    }
%>

