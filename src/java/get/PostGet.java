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
import model.Post;

/**
 *
 * @author Duong Nguyen
 */
public class PostGet {
    //Lấy danh sách các bài viết
    public ArrayList<Post> getListPost() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM `post` ORDER BY `post`.`date_post` DESC" ;
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Post> list = new ArrayList<>();
        while (rs.next()) {
            
            Post post = new Post();
            post.setPostId(rs.getInt("post_id"));
            post.setPostName(rs.getString("post_name"));
            post.setRecipeId(rs.getInt("recipe_id"));
            post.setPostImages(rs.getString("post_images"));
            post.setPostHeart(rs.getInt("post_heart"));
            post.setCost(rs.getString("cost"));
            post.setServings(rs.getString("servings"));
            post.setDescription_post(rs.getString("description_post"));
            post.setLevel(rs.getString("level"));
            post.setUserId(rs.getInt("user_id"));
            post.setLevelOfSuccess(rs.getString("level_of_succcess"));
            post.setDatePost(rs.getTimestamp("date_post"));
            list.add(post);
        }
        return list;
    }
    
    //Hiển thị chi tiết công thức
    public Post getPost(int postId) throws SQLException {
     Connection connection = DBConnect.getConnection();
     String sql = "SELECT * FROM post WHERE post_id = '" + postId + "'";
     PreparedStatement ps = connection.prepareCall(sql);
     ResultSet rs = ps.executeQuery();
     Post post = new Post();
     while (rs.next()) {
         
            post.setPostId(rs.getInt("post_id"));
            post.setPostName(rs.getString("post_name"));
            post.setRecipeId(rs.getInt("recipe_id"));
            post.setPostImages(rs.getString("post_images"));
            post.setPostHeart(rs.getInt("post_heart"));
            post.setCost(rs.getString("cost"));
            post.setServings(rs.getString("servings"));
            post.setDescription_post(rs.getString("description_post"));
            post.setLevel(rs.getString("level"));
            post.setUserId(rs.getInt("user_id"));
            post.setLevelOfSuccess(rs.getString("level_of_succcess"));
            post.setDatePost(rs.getTimestamp("date_post"));
            
     }
     return post;
    }
    //Thêm 1 Bài post 
       public boolean insertPost(Post c) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO `post`(`post_id`, `recipe_id`, `post_name`, `post_images`, `post_heart`, `cost`, `servings`, `description_post`, `level`, `user_id`, `level_of_succcess`) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        try {
         PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, c.getPostId());
         ps.setInt(2, c.getRecipeId());
         ps.setString(3, c.getPostName());
         ps.setString(4, c.getPostImages());
         ps.setInt(5, c.getPostHeart());
         ps.setString(6, c.getCost());
         ps.setString(7, c.getServings());
         ps.setString(8, c.getDescription_post());
         ps.setString(9, c.getLevel());
         ps.setInt(10, c.getUserId());
         ps.setString(11, c.getLevelOfSuccess());
        
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(PostGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
