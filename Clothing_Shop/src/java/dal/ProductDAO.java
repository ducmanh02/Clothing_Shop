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

import model.Product;
import model.ProductTK;

/**
 *
 * @author ducmanh getAll(), getProductTheoTen getProductTheoId insert update
 * delete
 */
public class ProductDAO extends DAO {

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "    Products.product_id,\n"
                + "    Products.product_name,\n"
                + "    Products.description,\n"
                + "    Products.price,\n"
                + "    Products.stock_quantity,\n"
                + "    Brands.brand_name AS brand,\n"
                + "    Categories.category_name AS category,\n"
                + "    Products.image_url,\n"
                + "    Products.size \n"
                + "FROM\n"
                + "    Products\n"
                + "INNER JOIN Brands ON Products.brand_id = Brands.brand_id\n"
                + "INNER JOIN Categories ON Products.category_id = Categories.category_id\n"
                + "Order by Products.product_id;";
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
        String sql = "SELECT\n"
                + "    Products.product_id,\n"
                + "    Products.product_name,\n"
                + "    Products.description,\n"
                + "    Products.price,\n"
                + "    Products.stock_quantity,\n"
                + "    Brands.brand_name AS brand,\n"
                + "    Categories.category_name AS category,\n"
                + "    Products.image_url,\n"
                + "      Products.size\n"
                + "FROM\n"
                + "    Products\n"
                + "LEFT JOIN Brands ON Products.brand_id = Brands.brand_id\n"
                + "LEFT JOIN Categories ON Products.category_id = Categories.category_id\n"
                + "WHERE\n"
                + "    Products.product_name LIKE ? OR\n"
                + "    Brands.brand_name LIKE ? OR\n"
                + "    Categories.category_name LIKE ?;";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + tuKhoa + "%");
            st.setString(2, "%" + tuKhoa + "%");
            st.setString(3, "%" + tuKhoa + "%");
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

    public ProductTK getProductByID(String product_id) {
        String sql = "SELECT\n"
                + "    Products.product_id,\n"
                + "    Products.product_name,\n"
                + "    Products.description,\n"
                + "    Products.price,\n"
                + "    Products.stock_quantity,\n"
                + "    Brands.brand_name AS brand,\n"
                + "    Categories.category_name AS category,\n"
                + "    Products.image_url,\n"
                + "    Products.size,\n"
                + "    SUM(Order_Items.quantity) AS total_sold\n"
                + "FROM\n"
                + "    Products\n"
                + "INNER JOIN Brands ON Products.brand_id = Brands.brand_id\n"
                + "INNER JOIN Categories ON Products.category_id = Categories.category_id\n"
                + "LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id\n"
                + "\n"
                + "Where Products.product_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductTK b = new ProductTK(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBigDecimal(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10));
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

    public List<ProductTK> getProductBanChay() {
        List<ProductTK> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "    Products.product_id,\n"
                + "    Products.product_name,\n"
                + "    Products.description,\n"
                + "    Products.price,\n"
                + "    Products.stock_quantity,\n"
                + "    Brands.brand_name AS brand,\n"
                + "    Categories.category_name AS category,\n"
                + "    Products.image_url,\n"
                + "    Products.size,\n"
                + "    SUM(Order_Items.quantity) AS total_sold\n"
                + "FROM\n"
                + "    Products\n"
                + "INNER JOIN Brands ON Products.brand_id = Brands.brand_id\n"
                + "INNER JOIN Categories ON Products.category_id = Categories.category_id\n"
                + "LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id\n"
                + "GROUP BY\n"
                + "    Products.product_id\n"
                + "ORDER BY\n"
                + "    total_sold DESC ;\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductTK b = new ProductTK(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBigDecimal(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductLienQuan(Product p) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "    Products.product_id,\n"
                + "    Products.product_name,\n"
                + "    Products.description,\n"
                + "    Products.price,\n"
                + "    Products.stock_quantity,\n"
                + "    Brands.brand_name AS brand,\n"
                + "    Categories.category_name AS category,\n"
                + "    Products.image_url,\n"
                + "    Products.size \n"
                + "FROM\n"
                + "    Products\n"
                + "INNER JOIN Brands ON Products.brand_id = Brands.brand_id\n"
                + "INNER JOIN Categories ON Products.category_id = Categories.category_id\n"
                + "where (Brands.brand_name = ? or Categories.category_name = ?) and Products.product_id != ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getBrand_id());
            st.setString(2, p.getCategory_id());
            st.setString(3, p.getProduct_id());
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

    public static void main(String[] args) {
        ProductDAO pdb = new ProductDAO();
        Product p = pdb.getProductByID("PR04");
        System.out.println(pdb.getProductLienQuan(p));
        System.out.println(p.getBrand_id());
        System.out.println(p.getCategory_id());
    }
}
