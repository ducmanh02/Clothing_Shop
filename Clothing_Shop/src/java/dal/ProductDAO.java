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
 * @author ducmanh
 */
public class ProductDAO extends DAO {

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from products; ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product b = new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBigDecimal(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8),rs.getString(9));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        ProductDAO pdb = new ProductDAO();
        System.out.println(pdb.getAll());
    }
}
