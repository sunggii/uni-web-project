package com.servlet;

import java.io.IOException;
import java.util.List;

import com.bean.CartItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // รับ index
        int index = Integer.parseInt(request.getParameter("index"));

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null && index >= 0 && index < cart.size()) {
            cart.remove(index);
            session.setAttribute("cart", cart);

            // นับจำนวนชิ้นสินค้า
            int totalCount = 0;
            //ตัวอย่าง for each
            for (CartItem ci : cart) {
                totalCount += ci.getQuantity();
            }
            session.setAttribute("itemCount", totalCount);
        }

        // กลับไปหน้าที่มา
        String referer = request.getHeader("Referer");
        if (referer != null && !referer.isEmpty()) {
            response.sendRedirect(referer);
        } else {
            response.sendRedirect(request.getContextPath() + "/clientSide/cart/viewCart.jsp");
        }
    }
}
