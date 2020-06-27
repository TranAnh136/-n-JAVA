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
import model.Review;

/**
 *
 * @author Pham An
 */
public class ReviewGet {

    //lấy danh sách tất cả các bình luận
    public ArrayList<Review> getListReview() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM review";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Review> list = new ArrayList<>();
        while (rs.next()) {
            Review review = new Review();
           review.setReviewId(rs.getInt("review_id"));
           review.setRecipeId(rs.getInt("recipe_id"));
           review.setUserIdReview(rs.getInt("user_id"));
           review.setReviewMessenges(rs.getString("review_messenges"));
           review.setReviewDate(rs.getTimestamp("review_date"));
           review.setPostId(rs.getInt("post_id"));
           review.setType(rs.getInt("type"));
           list.add(review);
        }
        return list;
    }
   //lấy danh sách các bình luận thông qua id công thức
    public ArrayList<Review> getListReviewByRecipeId(int recipeId) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM review WHERE recipe_id ='" + recipeId + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Review> list = new ArrayList<>();
        while (rs.next()) {
            Review review = new Review();
           review.setReviewId(rs.getInt("review_id"));
           review.setRecipeId(rs.getInt("recipe_id"));
           review.setUserIdReview(rs.getInt("user_id"));
           review.setReviewMessenges(rs.getString("review_messenges"));
           review.setReviewDate(rs.getTimestamp("review_date"));
           review.setPostId(rs.getInt("post_id"));
           review.setType(rs.getInt("type"));
           list.add(review);
        }
        return list;
    }
    
     //lấy danh sách các bình luận thông qua id user
    public ArrayList<Review> getListReviewByUserId(int userId) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM review WHERE user_id =" + userId + "";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Review> list = new ArrayList<>();
        while (rs.next()) {
            Review review = new Review();
           review.setReviewId(rs.getInt("review_id"));
           review.setRecipeId(rs.getInt("recipe_id"));
           review.setUserIdReview(rs.getInt("user_id"));
           review.setReviewMessenges(rs.getString("review_messenges"));
           review.setReviewDate(rs.getTimestamp("review_date"));
           review.setPostId(rs.getInt("post_id"));
           review.setType(rs.getInt("type"));
           list.add(review);
        }
        return list;
    }
    
     //lấy danh sách các bình luận thông qua id user
    public ArrayList<Review> getListReviewByPostId(int postId) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM review WHERE post_id =" + postId + "";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Review> list = new ArrayList<>();
        while (rs.next()) {
            Review review = new Review();
           review.setReviewId(rs.getInt("review_id"));
           review.setRecipeId(rs.getInt("recipe_id"));
           review.setUserIdReview(rs.getInt("user_id"));
           review.setReviewMessenges(rs.getString("review_messenges"));
           review.setReviewDate(rs.getTimestamp("review_date"));
           review.setPostId(rs.getInt("post_id"));
           review.setType(rs.getInt("type"));
           list.add(review);
        }
        return list;
    }
    //đếm số bình luận của một công thức
     public int countReviewByRecipeId(int recipeId, int type) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(review_id) FROM review WHERE recipe_id = '" + recipeId + "' and type="+type+"";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;  
    }
    //Thêm bình luận
    public boolean insertReview(Review re) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO review(`review_id`, `recipe_id`, `review_messenges`, `user_id`,`type`) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, re.getReviewId());
            ps.setInt(2, re.getRecipeId());
            ps.setString(3, re.getReviewMessenges());
            ps.setInt(4, re.getUserIdReview());
            ps.setInt(5, re.getType());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
     public boolean insertReviewWithPost(Review re) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO review(`review_id`, `recipe_id`, `review_messenges`, `user_id`, `post_id`,`type`) VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, re.getReviewId());
            ps.setInt(2, re.getRecipeId());
            ps.setString(3, re.getReviewMessenges());
            ps.setInt(4, re.getUserIdReview());
            ps.setInt(5, re.getPostId());
            ps.setInt(6, re.getType());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    //cập nhật một review
     public boolean updateReivew(Review re) {
        
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE review SET review_id=?, recipe_id=?, user_id=?, review_messenges=?, post_id =? WHERE review_id = ?";
        
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, re.getReviewId());
            ps.setInt(2, re.getRecipeId());
            ps.setInt(3, re.getUserIdReview());
            ps.setString(4, re.getReviewMessenges());
            ps.setInt(5, re.getUserIdReview());
            ps.setInt(6, re.getReviewId());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
           Logger.getLogger(UserGet.class.getName()).log(Level.SEVERE,null, ex);
        }
        return false;
    }
     
     public static void main(String args[]) {
        // TODO code application logic here
    }
}
    
  
