/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bean;

import java.util.Date;
import java.util.List;

/**
 *
 * @author nur
 */
public class Order {
     private int orderId;
    private Date orderDate;
    private double totalAmount;
    private String userEmail;
    private String orderStatus;
    private List<CartItem> items;

    public Order() {}

    public Order(Date orderDate, double totalAmount, String userEmail, List<CartItem> items) {
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.userEmail = userEmail;
        this.items = items;
    }

    // Getter/Setter
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public Date getOrderDate() { return orderDate; }
    public void setOrderDate(Date orderDate) { this.orderDate = orderDate; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }

    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }

    public String getOrderStatus() { return orderStatus; }
    public void setOrderStatus(String orderStatus) { this.orderStatus = orderStatus; }

    public List<CartItem> getItems() { return items; }
    public void setItems(List<CartItem> items) { this.items = items; }
}
