/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;

/**
 *
 * @author ducmanh
 */
public class FeedbackDAO extends DAO {

    public List<Feedback> getAll() {
        List<Feedback> list = new ArrayList<>();
        String sql = "Select * from feedback";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getTimestamp(6));
                list.add(f);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Feedback> getFeedbackOnThisProduct(String product_id) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "    Feedback.feedback_id,\n"
                + "    Users.username AS user_username,\n"
                + "    Products.product_name AS product_name,\n"
                + "    Feedback.rating,\n"
                + "    Feedback.comment,\n"
                + "    Feedback.created_at\n"
                + "FROM\n"
                + "    Feedback\n"
                + "INNER JOIN Users ON Feedback.user_id = Users.user_id\n"
                + "INNER JOIN Products ON Feedback.product_id = Products.product_id\n"
                + "WHERE\n"
                + "    Products.product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getTimestamp(6));
                list.add(f);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public void insert(Feedback f) {

        String sql = "INSERT INTO `clothing_shop`.`feedback`\n"
                + "(`feedback_id`,`user_id`,`product_id`,`rating`,`comment`,`created_at`)\n"
                + "VALUES(?,?,?,?,?,?);";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, f.getFeedback_id());
            st.setString(2, f.getUser_id());
            st.setString(3, f.getProduct_id());
            st.setInt(4, f.getRating());
            st.setString(5, f.getComment());
            st.setTimestamp(6, f.getCreated_at());

            st.execute();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(String feedback_id) {
        String sql = "DELETE FROM `clothing_shop`.`feedback`\n"
                + "WHERE feedback_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, feedback_id);
            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        FeedbackDAO fdb = new FeedbackDAO();
        System.out.println(fdb.getAll());
        System.out.println(fdb.getFeedbackOnThisProduct("PR01"));
    }
}
