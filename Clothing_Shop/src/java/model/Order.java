/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 *
 * @author ducmanh
 */
public class Order {
    private String order_id;
    private User user;
    private BigDecimal total_amount;
    private Timestamp order_date;
    private String status;  // Pending - Shipped - Delivered

    public Order() {
    }

    public Order(String order_id, User user, BigDecimal total_amount, Timestamp order_date, String status) {
        this.order_id = order_id;
        this.user = user;
        this.total_amount = total_amount;
        this.order_date = order_date;
        this.status = status;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser_id(User user) {
        this.user = user;
    }

    public BigDecimal getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(BigDecimal total_amount) {
        this.total_amount = total_amount;
    }

    public Timestamp getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Timestamp order_date) {
        this.order_date = order_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
