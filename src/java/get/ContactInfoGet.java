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
import model.ContactInfo;

/**
 *
 * @author Dell
 */
public class ContactInfoGet {
    // Lấy danh sách tất cả các liên hệ.
    public ArrayList<ContactInfo> getListContact() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM contact";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<ContactInfo> list = new ArrayList<>();
        while (rs.next()) {
           ContactInfo contact = new ContactInfo();
           contact.setName(rs.getString("name"));
           contact.setEmail(rs.getString("email"));
           contact.setSubject(rs.getString("subject"));
           contact.setContent(rs.getString("content"));
           list.add(contact);
        }
        return list;
    }
    
    // Thêm Liên hệ.
    public boolean insertContactInfo(ContactInfo ci) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO contact(`name`, `email`, `subject`, `content`) VALUES(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, ci.getName());
            ps.setString(2, ci.getEmail());
            ps.setString(3, ci.getSubject());
            ps.setString(4, ci.getContent());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(ContactInfoGet.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
    
    public static void main(String[] args) {
        // TODO
    }
}
