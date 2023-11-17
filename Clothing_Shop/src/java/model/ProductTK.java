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
public class ProductTK extends Product {
    private int total_sold;

    public ProductTK() {
    }

    public ProductTK( String product_id, String product_name, String description, BigDecimal price, int stock_quantity, Brand brand, Category category, String image_url, String size,int total_sold) {
        super(product_id, product_name, description, price, stock_quantity, brand, category, image_url, size);
        this.total_sold = total_sold;
    }

    public int getTotal_sold() {
        return total_sold;
    }

    public void setTotal_sold(int total_sold) {
        this.total_sold = total_sold;
    }

    
    
    
}
