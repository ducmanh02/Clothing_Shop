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
import model.User;

/**
 *
 * @author ducmanh
 */
public class UserDAO extends DAO {

    public List<User> getAllUsers() {
        List<User> listUsers = new ArrayList<>();
        String sql = "Select * from users ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

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
                listUsers.add(u);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listUsers;
    }

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

    //tao moi user dong thoi tao luon cart cho user do
    public void createUser(String username, String password) {
        CartDAO cdb = new CartDAO();

        String sql = "INSERT INTO `clothing_shop`.`users`\n"
                + "(`user_id`,`username`,`password`,`is_admin`)\n"
                + "VALUES\n"
                + "(?, ?, ?, 0);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            String sqlGetMaxID = "SELECT MAX(CAST(SUBSTRING(user_id, 4) AS UNSIGNED)) AS max_id FROM users;";
            PreparedStatement st2 = connection.prepareStatement(sqlGetMaxID);
            ResultSet rs = st2.executeQuery();
            int maxId = 0;
            if (rs.next()) {
                maxId = rs.getInt(1);
            }
            String newUser_id = "USR" + String.format("%02d", maxId + 1);

            st.setString(1, newUser_id);
            st.setString(2, username);
            st.setString(3, password);
            st.execute();
            //co user_id thi tao cart moi
            cdb.creatCartForNewUser(newUser_id);
            System.out.println("runnnnn");
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //Tao user by Admin
    public void createUser2(String username, String password, String email, String full_name, String address, String phone, int is_admin) {

        CartDAO cdb = new CartDAO();

        String sql = "INSERT INTO `clothing_shop`.`users`"
                + "(`user_id`, `username`, `password`, `email`, `full_name`, `address`, `phone`, `is_admin`)"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            String sqlGetMaxID = "SELECT MAX(CAST(SUBSTRING(user_id, 4) AS UNSIGNED)) AS max_id FROM users;";
            try ( PreparedStatement st2 = connection.prepareStatement(sqlGetMaxID)) {
                ResultSet rs = st2.executeQuery();
                int maxId = 0;
                if (rs.next()) {
                    maxId = rs.getInt(1);
                }
                String newUser_id = "USR" + String.format("%02d", maxId + 1);
                
                st.setString(1, newUser_id);
                st.setString(2, username);
                st.setString(3, password);
                st.setString(4, email);
                st.setString(5, full_name);
                st.setString(6, address);
                st.setString(7, phone);
                st.setInt(8, is_admin);
                st.execute();
                cdb.creatCartForNewUser(newUser_id);
            }

            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //update user 
    public void updateUser(String userId, String newUsername, String newPassword, String newEmail,
            String newFullName, String newAddress, String newPhone, int newAdmin) {
        String sql = "UPDATE `clothing_shop`.`users`\n"
                + "SET `username` = ?, `password` = ?, `email` = ?, `full_name` = ?, `address` = ?, `phone` = ?, `is_admin` = ?\n"
                + "WHERE `user_id` = ?;";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, newUsername);
            st.setString(2, newPassword);
            st.setString(3, newEmail);
            st.setString(4, newFullName);
            st.setString(5, newAddress);
            st.setString(6, newPhone);
            st.setInt(7, newAdmin);
            st.setString(8, userId);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteUser(String username) {
        UserDAO udb = new UserDAO();
        User u = udb.checkUser(username);

        String sql = "DELETE FROM `clothing_shop`.`users` where username= ?";
        String deleteCart = "DELETE FROM `clothing_shop`.`cart` where user_id= ?";
        try {
            //delete cart first
            PreparedStatement st1 = connection.prepareStatement(deleteCart);
            st1.setString(1, u.getUser_id());
            st1.execute();

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.execute();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public String getPasswordStored(String username) {

        String password = null;
        String sql = "Select password from users where username = ?  ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                password = rs.getString(1);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return password;
    }

    public static void main(String[] args) {
        UserDAO usb = new UserDAO();
//        usb.createUser("manh", "1");
        System.out.println(usb.getPasswordStored("hash"));
    }
}
