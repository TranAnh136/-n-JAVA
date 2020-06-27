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
import model.SignUpCourse;

/**
 *
 * @author Pham An
 */
public class SignUpCourseGet {

        //lấy tất cả danh sách các đăng ký khóa học
        public ArrayList<SignUpCourse> getListSignUpCourse() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM signup_course";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<SignUpCourse> list = new ArrayList<>();
        while (rs.next()) {
            SignUpCourse signUpCourse = new SignUpCourse();
            signUpCourse.setSigupCourseId(rs.getInt("signup_course_id"));
            signUpCourse.setCourseId(rs.getInt("course_id"));
            signUpCourse.setQuantity(rs.getInt("quantity"));
            signUpCourse.setName(rs.getString("name"));
            signUpCourse.setPhoneNumber(rs.getString("phone_number"));
            signUpCourse.setEmail(rs.getString("email"));
            signUpCourse.setNote(rs.getString("note"));
            signUpCourse.setUserId(rs.getInt("user_id"));
           
            list.add(signUpCourse);
        }
        return list;
    }

 //lấy tất cả danh sách các các đăng ký khóa học của 1 user thông qua id user
        public ArrayList<SignUpCourse> getListSignUpCourseOfUser(int userd) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM signup_course WHERE user_id = '" + userd + "' ";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<SignUpCourse> list = new ArrayList<>();
        while (rs.next()) {
            SignUpCourse signUpCourse = new SignUpCourse();
            signUpCourse.setSigupCourseId(rs.getInt("signup_course_id"));
            signUpCourse.setCourseId(rs.getInt("course_id"));
            signUpCourse.setQuantity(rs.getInt("quantity"));
            signUpCourse.setName(rs.getString("name"));
            signUpCourse.setPhoneNumber(rs.getString("phone_number"));
            signUpCourse.setEmail(rs.getString("email"));
            signUpCourse.setNote(rs.getString("note"));
            signUpCourse.setUserId(rs.getInt("user_id"));
           
            list.add(signUpCourse);
        }
        return list;
    }
    //lấy 1 một đăng ký khóa học thông qua id đăng ký khóa học
    public SignUpCourse getSignUpCcourse(int signUpCourseId) throws SQLException {
     Connection connection = DBConnect.getConnection();
     String sql = "SELECT * FROM signup_course WHERE signup_course_id = '" + signUpCourseId + "'";
     PreparedStatement ps = connection.prepareCall(sql);
     ResultSet rs = ps.executeQuery();
     SignUpCourse signUpCourse = new SignUpCourse();
     while (rs.next()) {
         
            signUpCourse.setSigupCourseId(rs.getInt("signup_course_id"));
            signUpCourse.setCourseId(rs.getInt("course_id"));
            signUpCourse.setQuantity(rs.getInt("quantity"));
            signUpCourse.setName(rs.getString("name"));
            signUpCourse.setPhoneNumber(rs.getString("phone_number"));
            signUpCourse.setEmail(rs.getString("email"));
            signUpCourse.setNote(rs.getString("note"));
            signUpCourse.setUserId(rs.getInt("user_id"));
            
     }
     return signUpCourse;
}

    
    //Thêm 1 một đăng ký khóa học
       public boolean insertSignUpCourse(SignUpCourse c) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO signup_course(course_id,quantity,name,phone_number,email,note,user_id) VALUES(?,?,?,?,?,?,?)";
        try {
         PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, c.getCourseId());
         ps.setInt(2, c.getQuantity());
         ps.setString(3, c.getName());
         ps.setString(4, c.getPhoneNumber());
         ps.setString(5,c.getEmail());
         ps.setString(6, c.getNote());
         ps.setInt(7, c.getUserId());
         
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CourseGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // cập nhật dữ liệu
    public boolean updateSignUpCourse(SignUpCourse c) {
        
        Connection connection = DBConnect.getConnection();
       
        String sql = "UPDATE signup_course SET signup_course_id=?, course_id=?, quantity=?, name=?, phone_number=?, email=?, note=?, user_id = ?  WHERE signup_course_id = ?";
        
        try {
         PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, c.getSigupCourseId());
         ps.setInt(2, c.getCourseId());
         ps.setInt(3, c.getQuantity());
         ps.setString(4, c.getName());
         ps.setString(5, c.getPhoneNumber());
         ps.setString(6, c.getEmail());
         ps.setString(7, c.getNote());
         ps.setInt(8, c.getUserId());
         ps.setInt(9, c.getSigupCourseId());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CourseGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    // xóa một đăng ký khóa học
    public boolean deleteSignUpCourse(int signUpCourseId) {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM signup_course WHERE signup_course_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, signUpCourseId);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CourseGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
