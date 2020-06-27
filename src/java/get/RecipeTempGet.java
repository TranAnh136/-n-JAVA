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
import model.Recipe;
import model.RecipeTemp;

/**
 *
 * @author Anh
 */
public class RecipeTempGet {
    
     //lấy danh sách công thức với danh mục
        public ArrayList<RecipeTemp> getListRecipeByCategory(int category_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM recipe_temp WHERE category_id = '" + category_id + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<RecipeTemp> list = new ArrayList<>();
        while (rs.next()) {
            
            RecipeTemp recipeTemp = new RecipeTemp();
            recipeTemp.setRecipeId(rs.getInt("recipe_id"));
            recipeTemp.setRecipeName(rs.getString("recipe_name"));
            recipeTemp.setCategoryId(rs.getInt("category_id"));
            recipeTemp.setRecipeImage(rs.getString("recipe_image"));
            recipeTemp.setRecipeViews(rs.getInt("recipe_views"));
            recipeTemp.setRecipeCalories(rs.getInt("calories"));
            recipeTemp.setRecipeAuthor(rs.getString("recipe_author"));
            recipeTemp.setIngredientRecipe(rs.getString("ingredients"));
            recipeTemp.setNutritionIngredients(rs.getString("nutritions"));
            recipeTemp.setMaking(rs.getString("making"));
            recipeTemp.setDescriptionRecipe(rs.getString("description_recipe"));
            recipeTemp.setVideo(rs.getString("video"));
            recipeTemp.setUserIdPostedRecipe(rs.getInt("user_id"));
            recipeTemp.setCheck(rs.getInt("check"));
            list.add(recipeTemp);
        }
        return list;
    }
        //lấy danh sách công thức với mã người dùng đã đăng
        public ArrayList<RecipeTemp> getListRecipeByUserId(int userId) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM recipe_temp WHERE category_id = '" + userId + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<RecipeTemp> list = new ArrayList<>();
        while (rs.next()) {
            
            RecipeTemp recipe = new RecipeTemp();
            recipe.setRecipeId(rs.getInt("recipe_id"));
            recipe.setRecipeName(rs.getString("recipe_name"));
            recipe.setCategoryId(rs.getInt("category_id"));
            recipe.setRecipeImage(rs.getString("recipe_image"));
            recipe.setRecipeViews(rs.getInt("recipe_views"));
            recipe.setRecipeCalories(rs.getInt("calories"));
            recipe.setRecipeAuthor(rs.getString("recipe_author"));
            recipe.setIngredientRecipe(rs.getString("ingredients"));
            recipe.setNutritionIngredients(rs.getString("nutritions"));
            recipe.setMaking(rs.getString("making"));
            recipe.setDescriptionRecipe(rs.getString("description_recipe"));
            recipe.setVideo(rs.getString("video"));
            recipe.setUserIdPostedRecipe(rs.getInt("user_id"));
            recipe.setCheck(rs.getInt("check"));
            list.add(recipe);
        }
        return list;
    }
        
        //lấy các công thức liên quang trong danh mục
        public ArrayList<RecipeTemp> getListRecipeRelated(int category_id, int recipe_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM recipe_temp WHERE category_id = '" + category_id + "' and recipe_id != '" + recipe_id + "'" ;
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<RecipeTemp> list = new ArrayList<>();
        while (rs.next()) {
            
            RecipeTemp recipe = new RecipeTemp();
            recipe.setRecipeId(rs.getInt("recipe_id"));
            recipe.setRecipeName(rs.getString("recipe_name"));
            recipe.setCategoryId(rs.getInt("category_id"));
            recipe.setRecipeImage(rs.getString("recipe_image"));
            recipe.setRecipeViews(rs.getInt("recipe_views"));
            recipe.setRecipeCalories(rs.getInt("calories"));
            recipe.setRecipeAuthor(rs.getString("recipe_author"));
            recipe.setIngredientRecipe(rs.getString("ingredients"));
            recipe.setNutritionIngredients(rs.getString("nutritions"));
            recipe.setMaking(rs.getString("making"));
            recipe.setDescriptionRecipe(rs.getString("description_recipe"));
            recipe.setVideo(rs.getString("video"));
            recipe.setUserIdPostedRecipe(rs.getInt("user_id"));
            recipe.setCheck(rs.getInt("check"));
            list.add(recipe);
        }
        return list;
    }

        //lấy tất cả danh sách công thức 
        public ArrayList<RecipeTemp> getListRecipe() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM recipe_temp";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<RecipeTemp> list = new ArrayList<>();
        while (rs.next()) {
            RecipeTemp recipe = new RecipeTemp();
            recipe.setRecipeId(rs.getInt("recipe_id"));
            recipe.setRecipeName(rs.getString("recipe_name"));
            recipe.setCategoryId(rs.getInt("category_id"));
            recipe.setRecipeImage(rs.getString("recipe_image"));
            recipe.setRecipeViews(rs.getInt("recipe_views"));
            recipe.setRecipeCalories(rs.getInt("calories"));
            recipe.setRecipeAuthor(rs.getString("recipe_author"));
            recipe.setIngredientRecipe(rs.getString("ingredients"));
            recipe.setNutritionIngredients(rs.getString("nutritions"));
            recipe.setMaking(rs.getString("making"));
            recipe.setDescriptionRecipe(rs.getString("description_recipe"));
            recipe.setVideo(rs.getString("video"));
            recipe.setUserIdPostedRecipe(rs.getInt("user_id"));
            recipe.setCheck(rs.getInt("check"));
            list.add(recipe);
        }
        return list;
    }


    //Lấy 1 công thức vói id công thức
    public RecipeTemp getRecipe(int recipeId) throws SQLException {
     Connection connection = DBConnect.getConnection();
     String sql = "SELECT * FROM recipe_temp WHERE recipe_id = '" + recipeId + "'";
     PreparedStatement ps = connection.prepareCall(sql);
     ResultSet rs = ps.executeQuery();
     RecipeTemp recipe = new RecipeTemp();
     while (rs.next()) {
         
            recipe.setRecipeId(rs.getInt("recipe_id"));
            recipe.setRecipeName(rs.getString("recipe_name"));
            recipe.setCategoryId(rs.getInt("category_id"));
            recipe.setRecipeImage(rs.getString("recipe_image"));
            recipe.setRecipeViews(rs.getInt("recipe_views"));
            recipe.setRecipeCalories(rs.getInt("calories"));
            recipe.setRecipeAuthor(rs.getString("recipe_author"));
            recipe.setIngredientRecipe(rs.getString("ingredients"));
            recipe.setNutritionIngredients(rs.getString("nutritions"));
            recipe.setMaking(rs.getString("making"));
            recipe.setDescriptionRecipe(rs.getString("description_recipe"));
            recipe.setVideo(rs.getString("video"));
            recipe.setUserIdPostedRecipe(rs.getInt("user_id"));
            recipe.setCheck(rs.getInt("check"));
     }
     return recipe;
}

    //Thêm 1 công thức
       public boolean insertRecipe(RecipeTemp c) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO recipe_temp VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
         PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, c.getRecipeId());
         ps.setString(2, c.getRecipeName());
         ps.setString(4, c.getRecipeImage());
         ps.setInt(5, c.getRecipeViews());
         ps.setInt(6, c.getRecipeCalories());
         ps.setString(7, c.getRecipeAuthor());
         ps.setInt(3, c.getCategoryId());
         ps.setString(8, c.getIngredientRecipe());
         ps.setString(9, c.getNutritionIngredients());
         ps.setString(10, c.getMaking());
         ps.setString(11, c.getDescriptionRecipe());
         ps.setString(12, c.getVideo());
         ps.setInt(13, c.getUserIdPostedRecipe());
         ps.setInt(14, c.getCheck());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(RecipeTempGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // cập nhật dữ liệu
    public boolean updateRecipe(RecipeTemp c) {
        
        Connection connection = DBConnect.getConnection();
       
        String sql = "UPDATE recipe_temp SET recipe_name=?, category_id=?, recipe_image=?, recipe_views=?, calories=?, recipe_author=?, ingredients = ?, nutritions=?, making= ?, description_recipe= ?, video = ?, user_id =?, check=? WHERE recipe_id = ?";
        
        try {
            PreparedStatement ps = connection.prepareCall(sql);
   
         ps.setString(1, c.getRecipeName());
         ps.setInt(2, c.getCategoryId());
         ps.setString(3, c.getRecipeImage());
         ps.setInt(4, c.getRecipeViews());
         ps.setInt(5, c.getRecipeCalories());
         ps.setString(6, c.getRecipeAuthor());
         ps.setString(7, c.getIngredientRecipe());
         ps.setString(8, c.getNutritionIngredients());
         ps.setString(9, c.getMaking());
         ps.setString(10, c.getDescriptionRecipe());
         ps.setString(11, c.getVideo());
         ps.setInt(12, c.getUserIdPostedRecipe());
         ps.setInt(13, c.getCheck());
         ps.setInt(14, c.getRecipeId());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(RecipeTempGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    // xóa dữ liệu
    public boolean deleteRecipe(int recipe_id) {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM recipe_temp WHERE recipe_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, recipe_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(RecipeTempGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
         public boolean updateRecipeCheck(int check, int recipe_id) {
        
        Connection connection = DBConnect.getConnection();
       
        String sql = "UPDATE recipe_temp SET check =? WHERE recipe_id = ?";
        
        try {
        PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, check);
         ps.setInt(2, recipe_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(RecipeGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

 
}
