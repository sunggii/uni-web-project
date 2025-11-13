<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <jsp:include page="/components/header/import.jsp"/>

    <style>
        td a i { font-size: 24px; margin-left: 4.5rem !important; }
        td a i:hover { opacity: 0.5; }
    </style>
</head>

<body>        
    <!--nav-->
    <jsp:include page="/components/navbar/navbar_emp.jsp"/>
    <!-------->
    
    <div class="box">
    <h1 class="mb-3 text-center">ข้อมูลการชำระเงิน</h3>

    <!-- ✅ ส่วนเลือกสถานะ -->
    <div class="mb-4 d-flex align-items-center gap-3">
        <label for="statusSelect" class="form-label mb-0 fw-semibold text-secondary">
            <i class="fa-solid fa-filter me-1 text-primary"></i> กรองสถานะ:
        </label>
        <select id="statusSelect" class="form-select shadow-sm px-3 py-2" style="max-width: 150px;" onchange="filterStatus()">
            <option value="all">ทั้งหมด</option>
            <option value="pending">pending</option>
            <option value="completed">completed</option>
        </select>
    </div>

    <table class="table table-hover table-bordered align-middle">
        <thead>
            <tr class="table-info">
                <th>payment_id</th>
                <th>email_user</th>
                <th>payment_date</th>
                <th>status</th>
                <th>amount</th>
                <th>edit</th>
                <th>delete</th>
            </tr>
        </thead>
        <tbody id="paymentTableBody">
            <%-- โหลดข้อมูลเริ่มต้นทั้งหมด --%>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection c = DriverManager.getConnection(
                        "jdbc:mysql://localhost/my_project?allowPublicKeyRetrieval=true&useSSL=false",
                        "root", "17905apy");
                    Statement s = c.createStatement();
                    ResultSet r = s.executeQuery("SELECT * FROM payment");
                    while (r.next()) {
            %>
            <tr>
                <td><%=r.getString("payment_id")%></td>
                <td><%=r.getString("user_email")%></td>
                <td><%=r.getString("payment_date")%></td>
                <td><%=r.getString("status")%></td>
                <td><%=r.getString("amount")%></td>
                <td>
                    <a href="u-payment-form.jsp?id=<%=r.getString("payment_id")%>">
                        <i class="bi bi-pencil-fill"></i>
                    </a>
                </td>
                <td>
                    <a href="d-payment.jsp?id=<%=r.getString("payment_id")%>"
                       onclick="return confirm('⚠️ คุณแน่ใจหรือไม่ที่จะลบข้อมูลนี้?')">
                        <i class="bi bi-trash3-fill"></i>
                    </a>
                </td>
            </tr>
            
            <%
                    }
                    r.close();
                    s.close();
                    c.close();
                } catch (Exception e) {
                    out.print("<tr><td colspan='6' class='text-danger'>" + e + "</td></tr>");
                }
            %>
        </tbody>
    </table>
    </div>
        
        <!-- Footer Info -->
        <jsp:include page="/components/footer/footer_emp.jsp"/>
        
    <script>
        function filterStatus() {
            var status = document.getElementById("statusSelect").value;
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById("paymentTableBody").innerHTML = xhr.responseText;
                }
            };
            xhr.open("GET", "fetch_status.jsp?status=" + status, true);
            xhr.send();
        }
    </script>
</body>
</html>
