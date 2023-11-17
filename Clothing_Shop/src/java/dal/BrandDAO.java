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
    public static void main(String[] args) {
        BrandDAO bdb = new BrandDAO();
        System.out.println(bdb.getBrandById("BR01"));
    }
}
