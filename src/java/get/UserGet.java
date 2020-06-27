/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package get;

/**
 *
 * @author Tien Anh
 */
import connect.DBConnect;
import java.awt.event.FocusEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import sun.awt.KeyboardFocusManagerPeerImpl;

// Lấy dữ liệu từ database
public class UserGet {
    public ArrayList<User> getListUser() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM user";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<User> list = new ArrayList<>();
        while (rs.next()) {
            User user = new User();
           user.setUserId(rs.getInt("user_id"));
           user.setUserName(rs.getString("user_name"));
           user.setUserEmail(rs.getString("user_email"));
           user.setUserPass(rs.getString("user_pass"));
           user.setUserPhone(rs.getString("user_phone"));
           user.setUserAddress(rs.getString("user_address"));
           user.setUserAvatar(rs.getString("user_avatar"));
           list.add(user);
        }
        return list;
    }
   
    // Kiểm tra email
    public boolean checkEmail(String email) throws SQLException{
    Connection connection = DBConnect.getConnection();
    String sql = "SELECT * FROM user WHERE user_email = '" + email + "'";
    PreparedStatement ps;
    try {
        ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            connection.close();
            return true;
        }
    } catch (SQLException ex) {
        Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE,null, ex);
    }
    return false;
    }
    // phương thức thêm tài khoản
    public boolean insertUser(User u) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO user VALUES(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, u.getUserId());
            ps.setString(2, u.getUserName());
            ps.setString(3, u.getUserPass());
            ps.setString(4, u.getUserEmail());
            ps.setString(5, u.getUserPhone());
            ps.setString(6, u.getUserAddress());
            ps.setString(7, u.getUserAvatar());
 
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    //Đăng nhập
     public User login(String email, String password) {
        Connection con = DBConnect.getConnection();
        String sql = "select * from user where user_email='" + email + "' and user_pass='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement)con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setUserName(rs.getString("user_name"));
                u.setUserEmail(rs.getString("user_email"));
                u.setUserPass(rs.getString("user_pass"));
                con.close();
                return u;
            }
          
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return null;
    }
     
     //Lấy dữ liệu user từ database
     public User getUser(int userID) throws SQLException {
     Connection connection = DBConnect.getConnection();
     String sql = "SELECT * FROM user WHERE user_id = '" + userID + "'";
     PreparedStatement ps = connection.prepareCall(sql);
     ResultSet rs = ps.executeQuery();
     User user = new User();
     while (rs.next()) {
         
           user.setUserId(rs.getInt("user_id"));
           user.setUserName(rs.getString("user_name"));
           user.setUserPass(rs.getString("user_pass"));
           user.setUserEmail(rs.getString("user_email"));
           user.setUserPhone(rs.getString("user_phone"));
           user.setUserAddress(rs.getString("user_address"));
           user.setUserAvatar(rs.getString("user_avatar"));
       
     }
     return user;
}
     public boolean updateUser(User u) {
        
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE user SET user_id=?, user_name=?, user_pass=?, user_email=?, user_phone=?, user_address=?, user_avatar=? WHERE user_id = ?";
        
        try {
            PreparedStatement ps = connection.prepareCall(sql);
          ps.setInt(1, u.getUserId());
            ps.setString(2, u.getUserName());
            ps.setString(3, u.getUserPass());
            ps.setString(4, u.getUserEmail());
            ps.setString(5, u.getUserPhone());
            ps.setString(6, u.getUserAddress());
            ps.setString(7, u.getUserAvatar());
            ps.setInt(8, u.getUserId());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
           Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE,null, ex);
        }
        return false;
    }
     
     //cập nhật thông tin user
     public boolean updateUser(int userId, String name,String email, String phone) {
        
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE user SET  user_name=?, user_email=?, user_phone=? WHERE user_id = ?";
        
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setInt(4, userId);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
           Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE,null, ex);
        }
        return false;
    }
     //cập nhật mật khẩu
      public boolean updateUserPassword(int userId, String userPassword) {
        
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE user SET user_pass=? WHERE user_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, userPassword);
            ps.setInt(2, userId);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
           Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE,null, ex);
        }
        return false;
    }
    
    //cập nhật ảnh đại diện
      public boolean updateUserAvatar(int userId, String avatar) {
        
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE user SET user_avatar=? WHERE user_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, avatar);
            ps.setInt(2, userId);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
           Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE,null, ex);
        }
        return false;
    }
    
}