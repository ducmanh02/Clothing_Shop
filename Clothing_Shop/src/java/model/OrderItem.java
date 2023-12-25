/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;

/**
 *
 * @author ducmanh
 */
public class OrderItem {
    private String order_item_id;
    private Order order;
    private Product product;
    private int quantity;
    private BigDecimal total_price;

    public OrderItem() {
    }

    public OrderItem(String order_item_id, Order order, Product product, int quantity, BigDecimal total_price) {
        this.order_item_id = order_item_id;
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.total_price = total_price;
    }

    public String getOrder_item_id() {
        return order_item_id;
    }

    public void setOrder_item_id(String order_item_id) {
        this.order_item_id = order_item_id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getTotal_price() {
        return total_price;
    }

    public void setTotal_price(BigDecimal total_price) {
        this.total_price = total_price;
    }
    
    
}
