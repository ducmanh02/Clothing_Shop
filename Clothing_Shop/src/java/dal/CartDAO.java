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
import model.Cart;
import model.CartItem;
import model.Product;
import model.User;

/**
 *
 * @author ducmanh
 */
public class CartDAO extends DAO {

    public List<Cart> getAll() {
        List<Cart> list = new ArrayList<>();

        String sql = "SELECT * FROM cart;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCart_id(rs.getString(1));
                UserDAO usb = new UserDAO();
                User u = usb.getUserById(rs.getString(2));
                c.setUser(u);
                c.setCreated_at(rs.getTimestamp(3));
                c.setStatus(rs.getString(4));
                list.add(c);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
//  lay cart cua user do

    public Cart getCartByUserId(String user_id) {

        String sql = "SELECT * FROM clothing_shop.cart where user_id=?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCart_id(rs.getString(1));
                UserDAO usb = new UserDAO();
                User u = usb.getUserById(rs.getString(2));
                c.setUser(u);
                c.setCreated_at(rs.getTimestamp(3));
                c.setStatus(rs.getString(4));
                return c;

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //lay thong tin cart
    public Cart getCartByCartId(String cart_id) {

        String sql = "select * from cart where cart_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            UserDAO usb = new UserDAO();
            st.setString(1, cart_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCart_id(rs.getString(1));
                User u = usb.getUserById(rs.getString(2));
                c.setUser(u);
                c.setCreated_at(rs.getTimestamp(3));
                c.setStatus(rs.getString(4));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // lay danh sach cac san pham trong gio hang
    public List<CartItem> getAllItemInCart(String cart_id) {
        List<CartItem> list = new ArrayList<>();
        String sql = "select * from cart_items where cart_id = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cart_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CartItem c = new CartItem();
                c.setCart_item_id(rs.getString(1));
                CartDAO cdb = new CartDAO();
                Cart cart = cdb.getCartByCartId(rs.getString(2));
                c.setCart(cart);
                ProductDAO pdb = new ProductDAO();
                Product p = pdb.getProductByID(rs.getString(3));
                c.setProduct(p);
                c.setQuantity(rs.getInt(4));
                list.add(c);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        CartDAO cartDB = new CartDAO();
        System.out.println(cartDB.getCartByUserId("USR02"));
    }
}
