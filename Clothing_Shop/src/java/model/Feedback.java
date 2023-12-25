/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author ducmanh
 */
public class Feedback {
    private String feedback_id;
    private User user;
    private Product product;
    private int rating;
    private String comment;
    private Timestamp created_at;

    public Feedback() {
    }

    public Feedback(String feedback_id, User user, Product product, int rating, String comment, Timestamp created_at) {
        this.feedback_id = feedback_id;
        this.user = user;
        this.product = product;
        this.rating = rating;
        this.comment = comment;
        this.created_at = created_at;
    }

    public String getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(String feedback_id) {
        this.feedback_id = feedback_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    
    
}
