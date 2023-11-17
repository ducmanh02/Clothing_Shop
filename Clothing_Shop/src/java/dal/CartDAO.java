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

/**
 *
 * @author ducmanh
 */
public class CartDAO extends DAO{

    public List<Cart> getAll(){
        List<Cart> list = new ArrayList<>();
        
        String sql = "select * form carts";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Cart c = new Cart();
                c.setCart_id(rs.getString(1));

            }
        }
        catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
}
