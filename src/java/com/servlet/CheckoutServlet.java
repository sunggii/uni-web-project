package com.servlet;

import com.bean.CartItem;
import com.bean.Order;
import com.dao.OrderDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // ดึงข้อมูลตะกร้าสินค้าและอีเมลจาก session
        HttpSession session = request.getSession();
        List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart");
        String userEmail = (String) session.getAttribute("email");
        double total = (Double) session.getAttribute("grandTotal");

        if (cartList == null || cartList.isEmpty()) {
            response.sendRedirect("viewCart.jsp?error=empty");
            return;
        }

        // สร้างออเดอร์และบันทึกลงฐานข้อมูล
        Order order = new Order(new Date(), total, userEmail, cartList);
        OrderDao dao = new OrderDao();

        if (dao.insertOrder(order)) {
            // เคลียร์ตะกร้าออกจาก session และ itemCount
            session.removeAttribute("cart");
            session.removeAttribute("itemCount");
            
            //ที่ไม่ใช้ response.sendRedirect เพราะ
            //เมื่อ servlet ตัวนี้ทำงานเสร็จ อย่าเพิ่งตอบกลับผู้ใช้ แต่ให้ไปทำงานต่อในหน้า payment.jsp
            request.getRequestDispatcher("/serverSide/payment/payment.jsp").forward(request, response);
            
        } else {
             response.sendRedirect("viewCart.jsp?error=db");
        }
    }
}
