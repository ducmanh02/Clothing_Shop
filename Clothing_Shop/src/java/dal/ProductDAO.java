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

import model.Product;

/**
 *
 * @author ducmanh getAll(), getProductTheoTen getProductTheoId insert update
 * delete
 */
public class ProductDAO extends DAO {

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from products; ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product b = new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBigDecimal(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductTheoTen(String tuKhoa) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from products where product_name like ?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + tuKhoa + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product b = new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBigDecimal(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));

                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByID(String product_id) {
        String sql = "select * from products where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product b = new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBigDecimal(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(Product p) {
        String sql = "INSERT INTO `clothing_shop`.`products`\n"
                + "(`product_id`,`product_name`,`description`,`price`,`stock_quantity`,`brand_id`,`category_id`,`image_url`,`size`)\n"
                + "VALUES (?,?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getProduct_id());
            st.setString(2, p.getProduct_name());
            st.setString(3, p.getDescription());
            st.setBigDecimal(4, p.getPrice());
            st.setInt(5, p.getStock_quantity());
            st.setString(6, p.getBrand_id());
            st.setString(7, p.getCategory_id());
            st.setString(8, p.getImage_url());
            st.setString(9, p.getSize());
            
            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Product p, String product_id) {
        String sql = "UPDATE products SET `product_name` = ?, `description` = ?, `price` = ?, `stock_quantity` = ?, `brand_id` = ?, `category_id` = ? ,`image_url` = ?,`size` = ? WHERE `product_id` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getProduct_name());
            st.setString(2, p.getDescription());
            st.setBigDecimal(3, p.getPrice());
            st.setInt(4, p.getStock_quantity());
            st.setString(5, p.getBrand_id());
            st.setString(6, p.getCategory_id());
            st.setString(7, p.getImage_url());
            st.setString(8, p.getSize());
            st.setString(9, p.getProduct_id());
            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(String product_id) {
        String sql = "DELETE FROM products\n"
                + "WHERE `product_id` = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product_id);
            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        ProductDAO pdb = new ProductDAO();
        System.out.println(pdb.getProductByID("PR01"));
    }
}
