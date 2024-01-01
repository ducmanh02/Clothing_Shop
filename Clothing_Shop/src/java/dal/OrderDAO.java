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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Order;
import model.OrderItem;
import model.Product;
import model.User;

/**
 *
 * @author ducmanh
 */
public class OrderDAO extends DAO {

    public Order getOrderByOrderId(String order_id) {
        String sql = "select * from orders where order_id =?";
        UserDAO udb = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, order_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String user_id = rs.getString(2);

                Order o = new Order(rs.getString(1), udb.getUserById(user_id), rs.getBigDecimal(3), rs.getTimestamp(4), rs.getString(5));
                return o;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        UserDAO udb = new UserDAO();
        String sql = "select * from orders";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Order o = new Order(rs.getString(1), udb.getUserById(rs.getString(2)), rs.getBigDecimal(3), rs.getTimestamp(4), rs.getString(5));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> getAllOrderByUserId(String user_id) {
        List<Order> list = new ArrayList<>();
        UserDAO udb = new UserDAO();
        String sql = "select * from orders where user_id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Order o = new Order(rs.getString(1), udb.getUserById(user_id), rs.getBigDecimal(3), rs.getTimestamp(4), rs.getString(5));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<OrderItem> getOrderItemByOrderId(String order_id) {
        OrderDAO odb = new OrderDAO();
        List<OrderItem> list = new ArrayList<>();
        UserDAO udb = new UserDAO();
        ProductDAO pdb = new ProductDAO();
        String sql = "select * from order_items where order_id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, order_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                OrderItem o = new OrderItem(rs.getString(1), odb.getOrderByOrderId(rs.getString(2)), pdb.getProductByID(rs.getString(3)), rs.getInt(4), rs.getBigDecimal(5));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // update order
    public void updateStatusOrder(String order_id, String newStatus) {
        String sql = "UPDATE orders SET status = ? WHERE order_id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newStatus);
            st.setString(2, order_id);
            st.executeUpdate();
        } catch (SQLException var5) {
            System.out.println("Error updating order status: " + String.valueOf(var5));
        }
    }

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
            st.setString(2, order_id);
            st.setString(3, product_id);
            st.setInt(4, quantity);
            st.setBigDecimal(5, total_price);
            st.execute();

        } catch (SQLException e) {
            System.out.println("Line 73: " + e);
        }
    }

    // thong ke doanh thu theo san pham
    public Map<Product, BigDecimal> getTKDoanhThuTheoSP() {
        Map<Product, BigDecimal> productTotals = new HashMap<Product, BigDecimal>();
        ProductDAO pdb = new ProductDAO();
        String sql = "SELECT    product_id,    SUM(total_price) AS total_price FROM    Order_Items GROUP BY    product_id ORDER BY\n" +
        "    total_price DESC ;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                
                String productId = rs.getString(1);
                Product p = pdb.getProductByID(productId);
                BigDecimal totalPrice = rs.getBigDecimal(2);
                productTotals.put(p, totalPrice);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return productTotals;
    }

    public static void main(String[] args) {
        OrderDAO odb = new OrderDAO();
        System.out.println(odb.getTKDoanhThuTheoSP());
    }
}
