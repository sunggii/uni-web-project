package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.bean.CartItem;
import com.bean.Order;

public class OrderDao {

    // --- เชื่อม DB แบบ AI ---
    private static final String URL = "jdbc:mysql://localhost/my_project?allowPublicKeyRetrieval=true&useSSL=false";
    private static final String USER = "root";
    private static final String PASS = "17905apy";
    
    // --- mathod บันทึก Order ---
    public boolean insertOrder(Order order) {
        boolean result = false;
        Connection conn = null;
        PreparedStatement psOrder = null;
        PreparedStatement psItem = null;
        ResultSet rs = null;

        try {
            // โหลด JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // เชื่อมต่อฐานข้อมูล
            conn = DriverManager.getConnection(URL, USER, PASS);
            conn.setAutoCommit(false);

            // เพิ่มข้อมูลลงในตาราง orders
            String sqlOrder = "INSERT INTO orders (user_email, order_date, total_amount) VALUES (?, ?, ?)";
            psOrder = conn.prepareStatement(sqlOrder, PreparedStatement.RETURN_GENERATED_KEYS);
            psOrder.setString(1, order.getUserEmail());
            psOrder.setTimestamp(2, new java.sql.Timestamp(order.getOrderDate().getTime()));
            psOrder.setDouble(3, order.getTotalAmount());
            psOrder.executeUpdate();
            

            // ดึง order_id ที่เพิ่งเพิ่มเข้าไป
            rs = psOrder.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // เพิ่มสินค้าแต่ละชิ้นในตาราง order_items
            String sqlItem = "INSERT INTO order_items (order_id, product_name, quantity, price) VALUES (?, ?, ?, ?)";
            psItem = conn.prepareStatement(sqlItem);

            for (CartItem item : order.getItems()) {
                psItem.setInt(1, orderId);
               psItem.setString(2, item.getProductName());
                psItem.setInt(3, item.getQuantity());
                psItem.setDouble(4, item.getPrice());
                psItem.addBatch();
            }

            psItem.executeBatch();

            conn.commit();
            result = true;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                if (conn != null) conn.rollback();
            } catch (SQLException ignored) {}
        } finally {
            try {
                if (rs != null) rs.close();
                if (psItem != null) psItem.close();
                if (psOrder != null) psOrder.close();
                if (conn != null) conn.close();
            } catch (SQLException ignored) {}
        }
        return result;

        
    }

    // --- mathod เชื่อม DB แบบอาจารย์ ---
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

    // --- mathod แสดงข้อมูล Order ทั้งหมด ---
    //---Read---
    public static List<Order> getAllRecords() {
        List<Order> list = new ArrayList<Order>();

        try {
                Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM orders");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUserEmail(rs.getString("user_email"));
                o.setOrderDate(rs.getTimestamp("order_date"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setOrderStatus(rs.getString("order_status"));
                list.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // --- mathod ลบ Order ---
    //---Delete---
    public static int delete(Order o) {
        int status = 0;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = getConnection();
            ps = con.prepareStatement("delete from orders where order_id=?");
            ps.setInt(1, o.getOrderId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } 
        return status;
    }

    // --- mathod แก้ไข Order ---
    public static Order getRecordById(int id) {
        Order o = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from orders where order_id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUserEmail(rs.getString("user_email"));
                o.setOrderDate(rs.getTimestamp("order_date"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setOrderStatus(rs.getString("order_status"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return o;
    }

    //---Update---
    public static int update(Order o){
            int status=0;
            try{
                    Connection con=getConnection();
                    PreparedStatement ps=con.prepareStatement("UPDATE orders SET user_email=?, total_amount=?, order_status=? WHERE order_id=?");
                    ps.setString(1,o.getUserEmail());
                    ps.setDouble(2,o.getTotalAmount());
                    ps.setString(3,o.getOrderStatus());
                    ps.setInt(4,o.getOrderId());
                    status=ps.executeUpdate();//บรรทัดนี้ไม่ยอมทำงาน
            }catch(Exception e){System.out.println(e);}
            return status;
    }
    
    //--- mathod แสดงข้อมูล Order ตามสถานะ ---
    public static List<Order> getOrdersByStatus(String status) {
        List<Order> list = new ArrayList<>();
        try {
            Connection con = getConnection();
            PreparedStatement ps;
            if (status.equals("all")) {
                ps = con.prepareStatement("SELECT * FROM orders");
            } else {
                ps = con.prepareStatement("SELECT * FROM orders WHERE order_status = ?");
                ps.setString(1, status);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUserEmail(rs.getString("user_email"));
                o.setOrderDate(rs.getDate("order_date"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setOrderStatus(rs.getString("order_status"));
                list.add(o);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
