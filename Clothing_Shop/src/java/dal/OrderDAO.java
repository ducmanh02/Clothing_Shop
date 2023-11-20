/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

/**
 *
 * @author ducmanh
 */
public class OrderDAO extends DAO {

    public String createOrder(String user_id, BigDecimal total_price, LocalDateTime order_date, String status) {
        String sql = "SELECT MAX(CAST(SUBSTRING(order_id, 4) AS UNSIGNED)) AS max_id FROM orders;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            //max order_id
            int maxId = 0;
            if (rs.next()) {
                maxId = rs.getInt("max_id");
            }
            //tao ma order_id moi
            String newOrder_id = "ORD" + String.format("%02d", maxId + 1);
            sql = "INSERT INTO `clothing_shop`.`orders` (`order_id`,`user_id`,`total_amount`,`order_date`,`status`) VALUES (?,?,?,?,?);";
            st = connection.prepareStatement(sql);
            st.setString(1, newOrder_id);
            st.setString(2, user_id);
            st.setBigDecimal(3, total_price);
            st.setObject(4, order_date);
            st.setString(5, status);
            st.execute();
            return newOrder_id;
        } catch (SQLException e) {
            System.out.println("Line 42: " + e);
        }
        return null;
    }

    public void createOderItem(String order_id, String product_id, int quantity, BigDecimal total_price) {
        String sql = "SELECT MAX(CAST(SUBSTRING(order_item_id, 9) AS UNSIGNED)) AS max_id FROM order_items;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            //max order_id
            int maxId = 0;
            if (rs.next()) {
                maxId = rs.getInt("max_id");
            }
            //tao ma order_id moi
            String newOrder_Item_id = "ORD_ITEM" + String.format("%02d", maxId + 1);
            sql = "INSERT INTO `clothing_shop`.`order_items`\n"
                    + "(`order_item_id`,`order_id`,`product_id`,`quantity`,`total_price`) VALUES (?,?,?,?,?);";
            st = connection.prepareStatement(sql);
            st.setString(1, newOrder_Item_id);
            st.setString(2,order_id );
            st.setString(3, product_id);
            st.setInt(4, quantity);
            st.setBigDecimal(5, total_price);
            st.execute();

        } catch (SQLException e) {
            System.out.println("Line 73: " + e);
        }
    }
}
