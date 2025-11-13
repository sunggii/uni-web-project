package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.bean.CartItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Ensure request is read using UTF-8 so product names in Thai are handled correctly
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // รับค่าจากฟอร์ม
        String productName = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // สร้างตะกร้าสินค้าด้วย session
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart"); //ลอง get ดูว่ามี session ไหม
        
        // ถ้าไม่มี สร้างใหม่
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // ตรวจว่ามีสินค้านี้อยู่ในตะกร้าแล้วหรือไม่
        boolean found = false;
        //for each <DataType> <variableName> : <array/collection>
        for (CartItem item : cart) {
            if (item.getProductName().equals(productName)) {
                item.setQuantity(item.getQuantity() + quantity); // บวกจำนวนเพิ่ม
                found = true;
                break;
            }
        }   

        // ถ้ายังไม่มี ให้เพิ่มใหม่
        if (!found) {
            cart.add(new CartItem(productName, price, quantity));
        }

        // เก็บตะกร้าสินค้าใน session
        session.setAttribute("cart", cart);

        // คำนวณจำนวนรวม (sum ของ quantity) แล้วเก็บเป็น session attribute "itemCount"
        int totalCount = 0;
        for (CartItem ci : cart) {
            totalCount += ci.getQuantity();
        }
        session.setAttribute("itemCount", Integer.valueOf(totalCount));
        
        // ให้กลับไปที่หน้าที่เรียกมา
        String referer = request.getHeader("Referer");
        if (referer != null && !referer.isEmpty()) {
            response.sendRedirect(referer);
        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }
}
