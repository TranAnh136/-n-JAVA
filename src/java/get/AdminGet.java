/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package get;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin;

/**
 *
 * @author ACER
 */
public class AdminGet {
       public boolean insertUserAdmin(Admin u) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO users VALUES(?,?,?,?,?)";
        try{
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, u.getAdminId());
            ps.setString(2, u.getAdminName());
            ps.setString(3, u.getAdminPass());
            ps.setString(4, u.getAdminEmail());
            ps.setInt(5, u.getAdminRole());
            ps.executeUpdate();
            return true;
        }catch(SQLException ex){
            Logger.getLogger(AdminGet.class.getName()).log(Level.SEVERE,null,ex);
        }
        return false;
    } 
    public Admin login(String email, String password){
        Connection conn = DBConnect.getConnection();
        String sql = "select * from admin where admin_email='"+ email +"' and admin_pass='"+password+"'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement)conn.prepareStatement(sql); // lưu trữ câu lênh sql
            ResultSet rs = ps.executeQuery(); // thực thi câu lệnh sql
            if(rs.next()){
                Admin ad = new Admin();
                ad.setAdminId(rs.getInt("admin_id"));
                ad.setAdminName(rs.getString("admin_name"));
                ad.setAdminPass(rs.getString("admin_pass"));
                ad.setAdminEmail(rs.getString("admin_email"));
                conn.close();
                return ad;
            }
            
        }
        catch(SQLException e){
            
        }
        return null;
    }
}
