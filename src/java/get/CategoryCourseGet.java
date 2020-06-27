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
import model.CategoryCourse;

/**
 *
 * @author Pham An
 */
public class CategoryCourseGet {
    
    //lấy ra danh sách tất cả các category khóa học
    public ArrayList<CategoryCourse> getListCategoryCourse() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM category_course";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<CategoryCourse> list = new ArrayList<>();
        while (rs.next()) {
            CategoryCourse categoryCourse = new CategoryCourse();
            categoryCourse.setCategoryCourseId(rs.getInt("category_course_id"));
            categoryCourse.setCategoryCourseName(rs.getString("category_course_name"));
            list.add(categoryCourse);
        }
        return list;
}
    
    //lấy ra 1 category khóa học với id
    public CategoryCourse getCategoryCourse(int categoryID) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql =  "SELECT * FROM category_course WHERE category_course_id = '" + categoryID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        CategoryCourse categoryCourse = new CategoryCourse();
        while (rs.next()) {
            
            categoryCourse.setCategoryCourseId(rs.getInt("category_course_id"));
            categoryCourse.setCategoryCourseName(rs.getString("category_course_name"));
           
        }
        return categoryCourse;
        
}
 
    
    //Thêm 1 category
    public boolean insertCategory(CategoryCourse c) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO category_course VALUES(?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, c.getCategoryCourseId());
         ps.setString(2, c.getCategoryCourseName());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryCourseGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // cập nhật dữ liệu
    public boolean updateCategory(CategoryCourse c) {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE category_course SET category_course_name = ? WHERE category_course_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
         ps.setString(1, c.getCategoryCourseName());
         ps.setInt(2, c.getCategoryCourseId());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryCourseGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // xóa dữ liệu 1 category
    public boolean deleteCategory(int category_id) {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM category_course WHERE category_course_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, category_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryCourseGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
