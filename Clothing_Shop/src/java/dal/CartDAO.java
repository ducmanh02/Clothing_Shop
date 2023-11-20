/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.math.BigDecimal;
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
        String sql = "select ci.cart_item_id, ci.cart_id,ci.product_id,ci.quantity,(p.price * ci.quantity) AS total_price  from cart_items ci  JOIN products p ON ci.product_id = p.product_id  where cart_id = ? ";

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
                c.setTotal_price(BigDecimal.valueOf(Double.parseDouble(rs.getString(5))));
                list.add(c);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addProductToCart(String user_id, String product_id, int quantity) {
        CartDAO cdb = new CartDAO();
        if (cdb.getCartByUserId(user_id) == null) {
            // tao cart moi 
        } else { // neu da co cart
            Cart c = cdb.getCartByUserId(user_id);
            //kiem tra san pham da co trong gio hang chua
            String checkCartItemQuery = "SELECT cart_item_id, quantity FROM cart_items WHERE cart_id = ? AND product_id = ?;";
            try {
                PreparedStatement st = connection.prepareStatement(checkCartItemQuery);
                st.setString(1, c.getCart_id());
                st.setString(2, product_id);
                ResultSet rs = st.executeQuery();
                if (rs.next()) { // neu da co
                    String cartItemId = rs.getString("cart_item_id");
                    int existingQuantity = rs.getInt("quantity");
                    int newQuantity = existingQuantity + quantity; // them so luong

                    String updateCartItemQuery = "UPDATE cart_items SET quantity = ? WHERE cart_item_id = ?;";
                    st = connection.prepareStatement(updateCartItemQuery);
                    st.setInt(1, newQuantity);
                    st.setString(2, cartItemId);
                    st.executeUpdate();
                } else {
                    // Sản phẩm chưa tồn tại trong giỏ hàng, thêm mới

                    // tao cart_item_id
                    // Lấy giá trị `cart_item_id` lớn nhất
                    String getMaxIdQuery = "SELECT MAX(CAST(SUBSTRING(cart_item_id, 10) AS UNSIGNED)) AS max_id FROM cart_items;";
                    st = connection.prepareStatement(getMaxIdQuery);
                    rs = st.executeQuery();

                    int maxId = 0;

                    if (rs.next()) {
                        maxId = rs.getInt("max_id");
                    }

                    // Tạo mã `product_id` mới
                    String newCart_item_id = "CRT_ITEM" + String.format("%02d", maxId + 1);
                    String addCartItemQuery = "INSERT INTO cart_items (cart_item_id,cart_id, product_id, quantity) VALUES (?, ?, ?, ?);";
                    st = connection.prepareStatement(addCartItemQuery);
                    st.setString(1, newCart_item_id);
                    st.setString(2, c.getCart_id());
                    st.setString(3, product_id);
                    st.setInt(4, quantity);
                    st.executeUpdate();
                }
            } catch (SQLException e) {
                System.out.println("Line : 139 " + e);
            }

        }

    }

    public void updateProductInCart(String user_id, String product_id, int quantity) {
        CartDAO cdb = new CartDAO();
        Cart c = cdb.getCartByUserId(user_id);
        String sql = "UPDATE `clothing_shop`.`cart_items`\n"
                + "SET `quantity` = ?\n"
                + "WHERE `cart_id` = ? and\n"
                + "`product_id` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setString(2, c.getCart_id());
            st.setString(3, product_id);
            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void deleteProductInCart(String user_id, String product_id) {
        CartDAO cdb = new CartDAO();
        Cart c = cdb.getCartByUserId(user_id);
        String sql = "DELETE FROM `clothing_shop`.`cart_items`\n"
                + "WHERE cart_id= ? and product_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getCart_id());
            st.setString(2, product_id);
            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void removeItemsFromCart(Cart cart, List<CartItem> listCartItem) {
        String sql = "DELETE FROM `clothing_shop`.`cart_items`\n"
                + "WHERE cart_item_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = null;

            for (CartItem item : listCartItem) {
                // Xóa từng sản phẩm trong order_item
                st.setString(1, item.getCart_item_id());
                st.execute();
            }
            
            
        } catch (SQLException e) {
            System.out.println("Line 228" + e);
        }

    }

    public static void main(String[] args) {
        CartDAO cartDB = new CartDAO();
        System.out.println(cartDB.getCartByUserId("USR02"));
    }
}
