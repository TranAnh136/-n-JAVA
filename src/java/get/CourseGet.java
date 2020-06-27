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
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;

/**
 *
 * @author Pham An
 */
public class CourseGet {
    
    
    //đếm số khóa học của mỗi danh mục
    public int countCourseByCategory(int categoryID) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(category_course_id) FROM course WHERE category_course_id = '" + categoryID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;  
    }
    
    //lấy danh sách khóa học với danh mục
        public ArrayList<Course> getListCourseByCategory(int category_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM course WHERE category_course_id = '" + category_id + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Course> list = new ArrayList<>();
        while (rs.next()) {
            
            Course course = new Course();
            course.setCourseId(rs.getInt("course_id"));
            course.setCourseName(rs.getString("course_name"));
            course.setCoursesTimeStart(rs.getDate("courses_time_start"));
            course.setCoursesTimeFinish(rs.getDate("courses_time_finish"));
            course.setCategoryCourseId(rs.getInt("category_course_id"));
            course.setCourseAddress(rs.getString("course_address"));
            course.setTeacherId(rs.getInt("teacher_id"));
            course.setCourseImages(rs.getString("course_images"));
            course.setIntroduce(rs.getString("introduction"));
            course.setTime(rs.getTime("time"));
            course.setDuration(rs.getInt("duration"));
            course.setInfomationCourse(rs.getString("infomation_course"));
            course.setImagesCourse1(rs.getString("images_course_1"));
            course.setImagesCourse2(rs.getString("images_course_2"));
            course.setBenifitOfCourse(rs.getString("benifit_of_course"));
            list.add(course);
        }
        return list;
    }
       //lấy 4 ra khóa học
        public ArrayList<Course> getList4Course() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM course LIMIT 4";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Course> list = new ArrayList<>();
        while (rs.next()) {
            
           Course course = new Course();
            course.setCourseId(rs.getInt("course_id"));
            course.setCourseName(rs.getString("course_name"));
            course.setCoursesTimeStart(rs.getDate("courses_time_start"));
            course.setCoursesTimeFinish(rs.getDate("courses_time_finish"));
            course.setCategoryCourseId(rs.getInt("category_course_id"));
            course.setCourseAddress(rs.getString("course_address"));
            course.setTeacherId(rs.getInt("teacher_id"));
            course.setCourseImages(rs.getString("course_images"));
            course.setIntroduce(rs.getString("introduction"));
            course.setTime(rs.getTime("time"));
            course.setDuration(rs.getInt("duration"));
            course.setInfomationCourse(rs.getString("infomation_course"));
            course.setImagesCourse1(rs.getString("images_course_1"));
            course.setImagesCourse2(rs.getString("images_course_2"));
            course.setBenifitOfCourse(rs.getString("benifit_of_course"));
            list.add(course);
        }
        return list;
    }

        //lấy tất cả danh sách khóa học
        public ArrayList<Course> getListCourse() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM course";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Course> list = new ArrayList<>();
        while (rs.next()) {
            Course course = new Course();
            course.setCourseId(rs.getInt("course_id"));
            course.setCourseName(rs.getString("course_name"));
            course.setCoursesTimeStart(rs.getDate("courses_time_start"));
            course.setCoursesTimeFinish(rs.getDate("courses_time_finish"));
            course.setCategoryCourseId(rs.getInt("category_course_id"));
            course.setCourseAddress(rs.getString("course_address"));
            course.setTeacherId(rs.getInt("teacher_id"));
            course.setCourseImages(rs.getString("course_images"));
            course.setIntroduce(rs.getString("introduction"));
            course.setTime(rs.getTime("time"));
            course.setDuration(rs.getInt("duration"));
            course.setInfomationCourse(rs.getString("infomation_course"));
            course.setImagesCourse1(rs.getString("images_course_1"));
            course.setImagesCourse2(rs.getString("images_course_2"));
            course.setBenifitOfCourse(rs.getString("benifit_of_course"));
            list.add(course);
        }
        return list;
    }


    //lấy 1 khóa học thông qua Id khóa học
    public Course getCourse(int courseId) throws SQLException {
     Connection connection = DBConnect.getConnection();
     String sql = "SELECT * FROM course WHERE course_id = '" + courseId + "'";
     PreparedStatement ps = connection.prepareCall(sql);
     ResultSet rs = ps.executeQuery();
     Course course = new Course();
     while (rs.next()) {
         
            course.setCourseId(rs.getInt("course_id"));
            course.setCourseName(rs.getString("course_name"));
            course.setCoursesTimeStart(rs.getDate("courses_time_start"));
            course.setCoursesTimeFinish(rs.getDate("courses_time_finish"));
            course.setCategoryCourseId(rs.getInt("category_course_id"));
            course.setCourseAddress(rs.getString("course_address"));
            course.setTeacherId(rs.getInt("teacher_id"));
            course.setCourseImages(rs.getString("course_images"));
            course.setIntroduce(rs.getString("introduction"));
            course.setTime(rs.getTime("time"));
            course.setDuration(rs.getInt("duration"));
            course.setInfomationCourse(rs.getString("infomation_course"));
            course.setImagesCourse1(rs.getString("images_course_1"));
            course.setImagesCourse2(rs.getString("images_course_2"));
            course.setBenifitOfCourse(rs.getString("benifit_of_course"));
     }
     return course;
}
    //lấy danh sách khóa học được tìm kiếm
        public ArrayList<Course> getListCourseSearch(String text) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM course WHERE course_name LIKE '%"+text+"%'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Course> list = new ArrayList<>();
        while (rs.next()) {
            
            Course course = new Course();
            course.setCourseId(rs.getInt("course_id"));
            course.setCourseName(rs.getString("course_name"));
            course.setCoursesTimeStart(rs.getDate("courses_time_start"));
            course.setCoursesTimeFinish(rs.getDate("courses_time_finish"));
            course.setCategoryCourseId(rs.getInt("category_course_id"));
            course.setCourseAddress(rs.getString("course_address"));
            course.setTeacherId(rs.getInt("teacher_id"));
            course.setCourseImages(rs.getString("course_images"));
            course.setIntroduce(rs.getString("introduction"));
            course.setTime(rs.getTime("time"));
            course.setDuration(rs.getInt("duration"));
            course.setInfomationCourse(rs.getString("infomation_course"));
            course.setImagesCourse1(rs.getString("images_course_1"));
            course.setImagesCourse2(rs.getString("images_course_2"));
            course.setBenifitOfCourse(rs.getString("benifit_of_course"));
            list.add(course);
        }
        return list;
    }

    
    //Thêm 1 khóa học
       public boolean insertCourse(Course c) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO course VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
         PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, c.getCourseId());
         ps.setString(2, c.getCourseName());
         ps.setDate(3, (java.sql.Date) c.getCoursesTimeStart());
         ps.setDate(4, (java.sql.Date) c.getCoursesTimeFinish());
         ps.setInt(5, c.getCategoryCourseId());
         ps.setString(6, c.getCourseAddress());
         ps.setInt(7, c.getTeacherId());
         ps.setString(8, c.getCourseImages());
         ps.setString(9, c.getIntroduce());
         ps.setTime(10, c.getTime());
         ps.setInt(11, c.getDuration());
         ps.setString(12, c.getInfomationCourse());
         ps.setString(13, c.getImagesCourse1());
         ps.setString(14, c.getImagesCourse2());
         ps.setString(15, c.getBenifitOfCourse());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CourseGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // cập nhật dữ liệu
    public boolean updateCourse(Course c) {
        
        Connection connection = DBConnect.getConnection();
       
        String sql = "UPDATE course SET course_id=?, course_name=?, courses_time_start=?, courses_time_finish=?, category_course_id=?, course_address=?, teacher_id=?, course_images = ?, introduction= ?, time = ?, duration =?,infomation_course=?,images_course_1=?, images_course_2=?, benifit_of_course=?  WHERE course_id = ?";
        
        try {
            PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, c.getCourseId());
         ps.setString(2, c.getCourseName());
         ps.setDate(3, (java.sql.Date) c.getCoursesTimeStart());
         ps.setDate(4, (java.sql.Date) c.getCoursesTimeFinish());
         ps.setInt(5, c.getCategoryCourseId());
         ps.setString(6, c.getCourseAddress());
         ps.setInt(7, c.getTeacherId());
         ps.setString(8, c.getCourseImages());
         ps.setString(9, c.getIntroduce());
         ps.setTime(10, c.getTime());
         ps.setInt(11, c.getDuration());
         ps.setString(12, c.getInfomationCourse());
         ps.setString(13, c.getImagesCourse1());
         ps.setString(14, c.getImagesCourse2());
         ps.setString(15, c.getBenifitOfCourse());
         ps.setInt(16, c.getCourseId());
         
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CourseGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
     // cập nhật dữ liệu
    public boolean updateCourseNotImagesClass(int course_id,String course_name,Date courses_time_start, Date courses_time_finish, int  category_course_id, String course_address, int teacher_id, String course_images, String introduction,Time time,int duration, String infomation_course, String benifit_of_course       ) {
        
        Connection connection = DBConnect.getConnection();
       
        String sql = "UPDATE course SET course_id=?,course_name=?,courses_time_start=?,courses_time_finish=?,category_course_id=?,course_address=?,teacher_id=?,course_images =?,introduction=?,time=?,duration=?,infomation_course=?,benifit_of_course=? WHERE course_id=?";
        
        try {
         PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, course_id);
         ps.setString(2, course_name);
         ps.setDate(3, (java.sql.Date) courses_time_start);
         ps.setDate(4, (java.sql.Date) courses_time_finish);
         ps.setInt(5, category_course_id);
         ps.setString(6, course_address);
         ps.setInt(7, teacher_id);
         ps.setString(8, course_images);
         ps.setString(9, introduction);
         ps.setTime(10, time);
         ps.setInt(11, duration);
         ps.setString(12, infomation_course);
         ps.setString(13, benifit_of_course);
         ps.setInt(14, course_id);
         
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CourseGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
     public boolean updateCourseNotImages(int course_id,String course_name,Date courses_time_start, Date courses_time_finish, int  category_course_id, String course_address, int teacher_id, String introduction,Time time,int duration, String infomation_course, String benifit_of_course       ) {
        
        Connection connection = DBConnect.getConnection();
       
        String sql = "UPDATE course SET course_id=?,course_name=?,courses_time_start=?,courses_time_finish=?,category_course_id=?,course_address=?,teacher_id=?,introduction=?,time =?,duration =?,infomation_course=?,benifit_of_course=?  WHERE course_id=?";
        
        try {
            PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, course_id);
         ps.setString(2, course_name);
         ps.setDate(3, (java.sql.Date) courses_time_start);
         ps.setDate(4, (java.sql.Date) courses_time_finish);
         ps.setInt(5, category_course_id);
         ps.setString(6, course_address);
         ps.setInt(7, teacher_id);
         ps.setString(8, introduction);
         ps.setTime(9, time);
         ps.setInt(10, duration);
         ps.setString(11, infomation_course);
         ps.setString(12, benifit_of_course);
         ps.setInt(13, course_id);
         
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CourseGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    // xóa dữ liệu
    public boolean deleteCourse(int courseId) {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM course WHERE course_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, courseId);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CourseGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
