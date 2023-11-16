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
import model.Category;
import model.Product;

/**
 *
 * @author ducmanh
 */
public class CategoryDAO extends DAO {

    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from categories ; ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1), rs.getString(2));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Category> getCategoryTheoTen(String tuKhoa) {
        List<Category> list = new ArrayList<>();
        String sql = "select * from categories where category_name like ?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + tuKhoa + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1), rs.getString(2));

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Category getCategoryByID(String product_id) {
        String sql = "select * from categories where category_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1), rs.getString(2));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(Category c) {
        String sql = "INSERT INTO `clothing_shop`.`categories`\n"
                + "(`category_id`,\n"
                + "`category_name`)\n"
                + "VALUES\n"
                + "(?,\n"
                + "?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(2, c.getCategory_name());
            st.setString(1, c.getCategory_id());

            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Category c, String product_id) {
        String sql = "UPDATE `clothing_shop`.`categories` SET`category_name` = ? WHERE `category_id` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getCategory_name());
            st.setString(2, c.getCategory_id());

            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(String category_id) {
        String sql = "DELETE FROM categories\n"
                + "WHERE `category_id` = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category_id);
            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        CategoryDAO pdb = new CategoryDAO();
        Category c = new Category("CA04", "test");
        pdb.insert(c);
    }
}
