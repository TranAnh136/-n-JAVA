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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Chef;
import model.User;

/**
 *
 * @author Pham An
 */
public class ChefGet {
    
    // lấy danh sách tất cả cá đầu bếp
    public ArrayList<Chef> getListChef() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM chef";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Chef> list = new ArrayList<>();
        while (rs.next()) {
            Chef chef = new Chef();
           chef.setChefId(rs.getInt("chef_id"));
           chef.setChefName(rs.getString("chef_name"));
           chef.setImagesChef(rs.getString("images"));
           chef.setIndoduceChef(rs.getString("introduce_chef"));
           list.add(chef);
        }
        return list;
    }
   
    // lấy ra 1 đầu bếp thông qua id
     public Chef getChef(int chefId) throws SQLException {
     Connection connection = DBConnect.getConnection();
     String sql = "SELECT * FROM chef WHERE chef_id = '" + chefId + "'";
     PreparedStatement ps = connection.prepareCall(sql);
     ResultSet rs = ps.executeQuery();
     Chef chef = new Chef();
     while (rs.next()) {
         
           chef.setChefId(rs.getInt("chef_id"));
           chef.setChefName(rs.getString("chef_name"));
           chef.setImagesChef(rs.getString("images"));
           chef.setIndoduceChef(rs.getString("introduce_chef"));
     }
     return chef;
}
    // phương thức thêm đầu bếp
    public boolean insertChef(Chef u) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO chef VALUES(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, u.getChefId());
            ps.setString(2, u.getChefName());
            ps.setString(3, u.getImagesChef());
            ps.setString(4, u.getIndoduceChef());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ChefGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
   
    // cập nhật thông tin đầu bếp
     public boolean updateChef(Chef u) {
        
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE chef SET chef_id=?, chef_name=?, images=?, introduce_chef=? WHERE chef_id = ?";
        
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, u.getChefId());
            ps.setString(2, u.getChefName());
            ps.setString(3, u.getImagesChef());
            ps.setString(4, u.getIndoduceChef());
            ps.setInt(5, u.getChefId());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
           Logger.getLogger(ChefGet.class.getName()).log(Level.SEVERE,null, ex);
        }
        return false;
    }
     // xóa thông tin đầu bếp
     public boolean deleteChef(int chefId) {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM chef WHERE chef_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, chefId);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ChefGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
