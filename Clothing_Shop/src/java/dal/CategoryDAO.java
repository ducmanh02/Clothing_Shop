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

    public Category getCategoryByID(String category_id) {
        String sql = "select * from categories where category_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category_id);
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

    public Category getCategoryByName(String category_name) {
        String sql = "select * from categories where category_name = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category_name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category b = new Category(rs.getString(1), rs.getString(2));
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //them brand
    public void insert(String name) {
        String sql = "INSERT INTO `clothing_shop`.`categories` (`category_id`,\n"
                + "`category_name`)VALUES (?,?);";
        String getMaxIdQuery = "SELECT MAX(CAST(SUBSTRING(category_id, 3) AS UNSIGNED)) AS max_id FROM categories;";
        try {
            PreparedStatement st1 = connection.prepareStatement(getMaxIdQuery);
            ResultSet rs1 = st1.executeQuery();

            int maxId = 0;

            if (rs1.next()) {
                maxId = rs1.getInt("max_id");
            }
            System.out.println(maxId);
            // Tạo mã `category_id` mới
            String new_id = "CA" + String.format("%02d", maxId + 1);
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, new_id);
            st.setString(2, name);
            st.execute();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(String category_name, String category_id) {
        String sql = "UPDATE `clothing_shop`.`categories` SET`category_name` = ? WHERE `category_id` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category_name);
            st.setString(2, category_id);

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


    }
}
