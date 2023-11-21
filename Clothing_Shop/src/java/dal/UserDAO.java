/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author ducmanh
 */
public class UserDAO extends DAO {

    public User validateUser(String username, String password) {
        String sql = "Select * from users where username=? and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getString(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setEmail(rs.getString(4));
                u.setFull_name(rs.getString(5));
                u.setAddress(rs.getString(6));
                u.setPhone(rs.getString(7));
                u.setIs_admin(rs.getInt(8));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

 public User getUserById(String user_id) {
        String sql = "Select * from users where user_id=? ;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user_id);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getString(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setEmail(rs.getString(4));
                u.setFull_name(rs.getString(5));
                u.setAddress(rs.getString(6));
                u.setPhone(rs.getString(7));
                u.setIs_admin(rs.getInt(8));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    
    public User checkUser(String username) {
        String sql = "Select * from users where username=? ;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getString(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setEmail(rs.getString(4));
                u.setFull_name(rs.getString(5));
                u.setAddress(rs.getString(6));
                u.setPhone(rs.getString(7));
                u.setIs_admin(rs.getInt(8));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public void createUser(String username, String password) {
        String sql = "INSERT INTO `clothing_shop`.`users`\n"
                + "(`user_id`,`username`,`password`,`is_admin`)\n"
                + "VALUES\n"
                + "(?, ?, ?, 0);";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            String sqlGetMaxID = "SELECT MAX(CAST(SUBSTRING(user_id, 4) AS UNSIGNED)) AS max_id FROM users;";
            PreparedStatement st2 = connection.prepareStatement(sqlGetMaxID);
            ResultSet rs = st2.executeQuery();
            int maxId = 0;
            if(rs.next()){
                maxId = rs.getInt(1);
            }
            String newUser_id = "USR" + String.format("%02d", maxId + 1);
            st.setString(1,newUser_id);
            st.setString(2,username);
            st.setString(3, password);
            st.execute();
        }
        catch(SQLException e){
            System.out.println(e);
        }
    }
    public void deleteUser(String username) {
        String sql = "";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,username);
                   
            st.execute();
        }
        catch(SQLException e){
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        UserDAO usb = new UserDAO();
//        usb.createUser("manh", "1");
//        System.out.println(usb.checkUser("manh"));
    }
}
