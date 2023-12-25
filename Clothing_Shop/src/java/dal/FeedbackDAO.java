/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;

/**
 *
 * @author ducmanh
 */
public class FeedbackDAO extends DAO {

    public List<Feedback> getAll() {
        UserDAO udb = new UserDAO();
        ProductDAO pdb = new ProductDAO();
        List<Feedback> list = new ArrayList<>();
        String sql = "Select * from feedback";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback(rs.getString(1), udb.getUserById(rs.getString(2)), pdb.getProductByID(rs.getString(3)), rs.getInt(4), rs.getString(5), rs.getTimestamp(6));
                list.add(f);
                
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Feedback> getFeedbackOnThisProduct(String product_id) {
        List<Feedback> list = new ArrayList<>();
        UserDAO udb = new UserDAO();
        ProductDAO pdb = new ProductDAO();
        String sql = "SELECT\n"
                + "    Feedback.feedback_id,\n"
                + "    Users.username AS user_username,\n"
                + "    Products.product_id ,\n"
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
                Feedback f = new Feedback(rs.getString(1), udb.checkUser(rs.getString(2)), pdb.getProductByID(rs.getString(3)), rs.getInt(4), rs.getString(5), rs.getTimestamp(6));
                list.add(f);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public void insert(String user_id, String product_id, int rating, String comment, Timestamp created_at) {
        UserDAO udb = new UserDAO();
        ProductDAO pdb = new ProductDAO();
        String sql = "INSERT INTO `clothing_shop`.`feedback`\n"
                + "(`feedback_id`,`user_id`,`product_id`,`rating`,`comment`,`created_at`)\n"
                + "VALUES(?,?,?,?,?,?);";

        try {
            
            String getMaxIdQuery = "SELECT MAX(CAST(SUBSTRING(feedback_id, 4) AS UNSIGNED)) AS max_id FROM feedback;";
            PreparedStatement st1 = connection.prepareStatement(getMaxIdQuery);
            ResultSet rs1 = st1.executeQuery();

            int maxId = 0;

            if (rs1.next()) {
                maxId = rs1.getInt("max_id");
            }
            System.out.println(maxId);
            // Tạo mã `product_id` mới
            String newFB_id = "FDB" + String.format("%02d", maxId + 1);
            
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newFB_id);
            st.setString(2, user_id);
            st.setString(3, product_id);
            st.setInt(4, rating);
            st.setString(5, comment);
            st.setTimestamp(6, created_at);

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
