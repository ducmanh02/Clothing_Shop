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

/**
 *
 * @author ducmanh
 */
public class BrandDAO extends DAO{
    public List<Brand> getAll(){
        List<Brand> list = new ArrayList<>();
        String sql = "select * from brands; ";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Brand b = new Brand(rs.getString(1), rs.getString(2));
                list.add(b);
            }
        }
        catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    public Brand getBrandById(String brand_id){
        String sql = "select * from brands where brand_id = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, brand_id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Brand b = new Brand(rs.getString(1), rs.getString(2));
                return b;
            }
        }
        catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    public Brand getBrandByName(String brand_name){
        String sql = "select * from brands where brand_name = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, brand_name);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Brand b = new Brand(rs.getString(1), rs.getString(2));
                return b;
            }
        }
        catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    //them brand
    public void insert(String name){
        String sql = "INSERT INTO `clothing_shop`.`brands` (`brand_id`,`brand_name`)VALUES (?,?);";
        String getMaxIdQuery = "SELECT MAX(CAST(SUBSTRING(brand_id, 3) AS UNSIGNED)) AS max_id FROM brands;";
        try{
            PreparedStatement st1 = connection.prepareStatement(getMaxIdQuery);
            ResultSet rs1 = st1.executeQuery();

            int maxId = 0;

            if (rs1.next()) {
                maxId = rs1.getInt("max_id");
            }
            System.out.println(maxId);
            // Tạo mã `brand_id` mới
            String new_id = "BR" + String.format("%02d", maxId + 1);
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, new_id);
            st.setString(2,name);
            st.execute();
            
        }
        catch(SQLException e){
            System.out.println(e);
        }
    }
    
    
        public void update(String brand_name, String brand_id) {
        String sql = "UPDATE `clothing_shop`.`brands` SET`brand_name` = ? WHERE `brand_id` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, brand_name);
            st.setString(2, brand_id);

            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(String brand_id) {
        String sql = "DELETE FROM brands\n"
                + "WHERE `brand_id` = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, brand_id);
            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        BrandDAO bdb = new BrandDAO();
        System.out.println(bdb.getBrandById("BR01"));
    }
}
