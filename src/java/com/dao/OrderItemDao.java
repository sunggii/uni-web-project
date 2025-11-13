/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.OrderItem;

/**
 *
 * @author nur
 */
public class OrderItemDao {
    
    // --- mathod เชื่อม DB แบบอาจารย์ ---
    private static final String URL = "jdbc:mysql://localhost/my_project?allowPublicKeyRetrieval=true&useSSL=false";
    private static final String USER = "root";
    private static final String PASS = "17905apy";

       public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // ใช้ driver ใหม่
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public static List<OrderItem> getRecordById(int id) {
        List<OrderItem> list = new ArrayList<>();
        String sql = "SELECT * FROM order_items WHERE order_id = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    OrderItem o = new OrderItem();
                    o.setOrderItemId(rs.getInt("order_item_id"));
                    o.setOrderId(rs.getInt("order_id"));
                    o.setProductName(rs.getString("product_name"));
                    o.setQuantity(rs.getInt("quantity"));
                    o.setPrice(rs.getDouble("price"));
                    list.add(o);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
