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
public class CartItem {

    private String cart_item_id;
    private Cart cart;
    private Product product;
    private int quantity;
    private BigDecimal total_price;

    public CartItem() {
    }

    public CartItem(String cart_item_id, Cart cart, Product product, int quantity, BigDecimal total_price) {
        this.cart_item_id = cart_item_id;
        this.cart = cart;
        this.product = product;
        this.quantity = quantity;
        this.total_price = total_price;
    }

    public String getCart_item_id() {
        return cart_item_id;
    }

    public void setCart_item_id(String cart_item_id) {
        this.cart_item_id = cart_item_id;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
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
