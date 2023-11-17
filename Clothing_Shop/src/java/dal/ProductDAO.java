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
import model.Brand;
import model.Category;

import model.Product;
import model.ProductTK;

/**
 *
 * @author ducmanh getAll(), getProductTheoTen getProductTheoId insert update
 * delete
 */
public class ProductDAO extends DAO {

    private static BrandDAO bdb = new BrandDAO();
    private static CategoryDAO cdb = new CategoryDAO();

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            BrandDAO bdb = new BrandDAO();
            CategoryDAO cdb = new CategoryDAO();
            while (rs.next()) {
                Product b = new Product();
                b.setProduct_id(rs.getString(1));
                b.setProduct_name(rs.getString(2));
                b.setDescription(rs.getString(3));
                b.setPrice(rs.getBigDecimal(4));
                b.setStock_quantity(rs.getInt(5));
                Brand brand = bdb.getBrandById(rs.getString(6));
                b.setBrand(brand);
                Category category = cdb.getCategoryByID(rs.getString(7));
                b.setCategory(category);
                b.setImage_url(rs.getString(8));
                b.setSize(rs.getString(9));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductTKTheoTen(String tuKhoa) {
        List<Product> list = new ArrayList<>();
        BrandDAO bdb = new BrandDAO();
        CategoryDAO cdb = new CategoryDAO();
        String sql = "SELECT\n"
                + "    Products.product_id,\n"
                + "    Products.product_name,\n"
                + "    Products.description,\n"
                + "    Products.price,\n"
                + "    Products.stock_quantity,\n"
                + "    Products.brand_id AS brand,\n"
                + "    Products.category_id AS category,\n"
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
                Product b = new Product();
                b.setProduct_id(rs.getString(1));
                b.setProduct_name(rs.getString(2));
                b.setDescription(rs.getString(3));
                b.setPrice(rs.getBigDecimal(4));
                b.setStock_quantity(rs.getInt(5));
                Brand brand = bdb.getBrandById(rs.getString(6));
                b.setBrand(brand);
                Category category = cdb.getCategoryByID(rs.getString(7));
                b.setCategory(category);
                b.setImage_url(rs.getString(8));
                b.setSize(rs.getString(9));
                list.add(b);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ProductTK getProductTKByID(String product_id) {
        String sql = "SELECT\n"
                + "    Products.product_id,\n"
                + "    Products.product_name,\n"
                + "    Products.description,\n"
                + "    Products.price,\n"
                + "    Products.stock_quantity,\n"
                + "    Brands.brand_id AS brand,\n"
                + "    Categories.category_id AS category,\n"
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
                ProductTK b = new ProductTK();
                b.setProduct_id(rs.getString(1));
                b.setProduct_name(rs.getString(2));
                b.setDescription(rs.getString(3));
                b.setPrice(rs.getBigDecimal(4));
                b.setStock_quantity(rs.getInt(5));
                Brand brand = bdb.getBrandById(rs.getString(6));
                b.setBrand(brand);
                Category category = cdb.getCategoryByID(rs.getString(7));
                b.setCategory(category);
                b.setImage_url(rs.getString(8));
                b.setSize(rs.getString(9));
                b.setTotal_sold(rs.getInt(10));
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

//    public void insert(Product p) {
//        String sql = "INSERT INTO `clothing_shop`.`products`\n"
//                + "(`product_id`,`product_name`,`description`,`price`,`stock_quantity`,`brand_id`,`category_id`,`image_url`,`size`)\n"
//                + "VALUES (?,?,?,?,?,?,?,?,?);";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, p.getProduct_id());
//            st.setString(2, p.getProduct_name());
//            st.setString(3, p.getDescription());
//            st.setBigDecimal(4, p.getPrice());
//            st.setInt(5, p.getStock_quantity());
//            st.setString(6, p.getBrand_id());
//            st.setString(7, p.getCategory_id());
//            st.setString(8, p.getImage_url());
//            st.setString(9, p.getSize());
//
//            st.execute();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
//
//    public void update(Product p, String product_id) {
//        String sql = "UPDATE products SET `product_name` = ?, `description` = ?, `price` = ?, `stock_quantity` = ?, `brand_id` = ?, `category_id` = ? ,`image_url` = ?,`size` = ? WHERE `product_id` = ?;";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, p.getProduct_name());
//            st.setString(2, p.getDescription());
//            st.setBigDecimal(3, p.getPrice());
//            st.setInt(4, p.getStock_quantity());
//            st.setString(5, p.getBrand_id());
//            st.setString(6, p.getCategory_id());
//            st.setString(7, p.getImage_url());
//            st.setString(8, p.getSize());
//            st.setString(9, p.getProduct_id());
//            st.execute();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
//
//    public void delete(String product_id) {
//        String sql = "DELETE FROM products\n"
//                + "WHERE `product_id` = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, product_id);
//            st.execute();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
//
    public List<ProductTK> getProductBanChay() {
        List<ProductTK> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "    Products.product_id,\n"
                + "    Products.product_name,\n"
                + "    Products.description,\n"
                + "    Products.price,\n"
                + "    Products.stock_quantity,\n"
                + "    Brands.brand_id AS brand,\n"
                + "    Categories.category_id AS category,\n"
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
                ProductTK b = new ProductTK();
                b.setProduct_id(rs.getString(1));
                b.setProduct_name(rs.getString(2));
                b.setDescription(rs.getString(3));
                b.setPrice(rs.getBigDecimal(4));
                b.setStock_quantity(rs.getInt(5));
                Brand brand = bdb.getBrandById(rs.getString(6));
                b.setBrand(brand);
                Category category = cdb.getCategoryByID(rs.getString(7));
                b.setCategory(category);
                b.setImage_url(rs.getString(8));
                b.setSize(rs.getString(9));
                b.setTotal_sold(rs.getInt(10));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ProductTK> getProductTKLienQuan(ProductTK p) {
        List<ProductTK> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "           Products.product_id,\n"
                + "           Products.product_name,\n"
                + "           Products.description,\n"
                + "           Products.price,\n"
                + "           Products.stock_quantity,\n"
                + "           Brands.brand_id AS brand,\n"
                + "                 Categories.category_id AS category,\n"
                + "                 Products.image_url,\n"
                + "                    Products.size,\n"
                + "                    SUM(Order_Items.quantity) AS total_sold\n"
                + "                FROM\n"
                + "                    Products\n"
                + "                INNER JOIN Brands ON Products.brand_id = Brands.brand_id\n"
                + "                INNER JOIN Categories ON Products.category_id = Categories.category_id\n"
                + "                LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id\n"
                + "                 where (Brands.brand_id = ? or Categories.category_id = ?) and Products.product_id != ?\n"
                + "                GROUP BY\n"
                + "                    Products.product_id\n"
                + "               ;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, (p.getBrand()).getBrand_id());
            st.setString(2, (p.getCategory()).getCategory_id());
            st.setString(3, p.getProduct_id());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductTK b = new ProductTK();
                b.setProduct_id(rs.getString(1));
                b.setProduct_name(rs.getString(2));
                b.setDescription(rs.getString(3));
                b.setPrice(rs.getBigDecimal(4));
                b.setStock_quantity(rs.getInt(5));
                Brand brand = bdb.getBrandById(rs.getString(6));
                b.setBrand(brand);
                Category category = cdb.getCategoryByID(rs.getString(7));
                b.setCategory(category);
                b.setImage_url(rs.getString(8));
                b.setSize(rs.getString(9));
                b.setTotal_sold(rs.getInt(10));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO pdb = new ProductDAO();
        ProductTK p = pdb.getProductTKByID("PR03");
        
        System.out.println(pdb.getProductTKLienQuan(p));
    }
}
