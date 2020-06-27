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
 * @author Pham An
 */
public class RecipeGet {

    /**
     * @param args the command line arguments
     */
    //Lấy danh sách công thức từ Nav
    public ArrayList<Recipe> getListRecipeByNav(int categoryID, int firstResult, int maxResult) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM recipe WHERE category_id = '" + categoryID + "' limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Recipe> list = new ArrayList<>();
        while (rs.next()) {
            Recipe recipe = new Recipe();
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
            list.add(recipe);
        }
        return list;
    }
    
    //đếm số công thức của mỗi danh mục
    public int countRecipeByCategory(int categoryID) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT count(recipe_id) FROM recipe WHERE category_id = '" + categoryID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;  
    }
    
    //lấy danh sách công thức với danh mục
        public ArrayList<Recipe> getListRecipeByCategory(int category_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM recipe WHERE category_id = '" + category_id + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Recipe> list = new ArrayList<>();
        while (rs.next()) {
            
            Recipe recipe = new Recipe();
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
            list.add(recipe);
        }
        return list;
    }
        //lấy danh sách công thức với mã người dùng đã đăng
        public ArrayList<Recipe> getListRecipeByUserId(int userId) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM recipe WHERE category_id = '" + userId + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Recipe> list = new ArrayList<>();
        while (rs.next()) {
            
            Recipe recipe = new Recipe();
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
            list.add(recipe);
        }
        return list;
    }
        //lấy 4 công thức từ danh mục
        public ArrayList<Recipe> getList4RecipeByCategory(int category_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM recipe WHERE category_id = '" + category_id + "' LIMIT 4;";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Recipe> list = new ArrayList<>();
        while (rs.next()) {
            
            Recipe recipe = new Recipe();
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
            list.add(recipe);
        }
        return list;
    }

        //lấy các công thức liên quang trong danh mục
        public ArrayList<Recipe> getListRecipeRelated(int category_id, int recipe_id) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM recipe WHERE category_id = '" + category_id + "' and recipe_id != '" + recipe_id + "'" ;
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Recipe> list = new ArrayList<>();
        while (rs.next()) {
            
            Recipe recipe = new Recipe();
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
            list.add(recipe);
        }
        return list;
    }

        //lấy tất cả danh sách công thức 
        public ArrayList<Recipe> getListRecipe() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM recipe";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Recipe> list = new ArrayList<>();
        while (rs.next()) {
            Recipe recipe = new Recipe();
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
            list.add(recipe);
        }
        return list;
    }


    //Hiển thị chi tiết công thức
    public Recipe getRecipe(int recipeId) throws SQLException {
     Connection connection = DBConnect.getConnection();
     String sql = "SELECT * FROM recipe WHERE recipe_id = '" + recipeId + "'";
     PreparedStatement ps = connection.prepareCall(sql);
     ResultSet rs = ps.executeQuery();
     Recipe recipe = new Recipe();
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
     }
     return recipe;
}
 //lấy danh sách công thức được tìm kiếm
        public ArrayList<Recipe> getListRecipeSearch(String text) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM recipe WHERE recipe_name LIKE  '%"+text+"%'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Recipe> list = new ArrayList<>();
        while (rs.next()) {
            
            Recipe recipe = new Recipe();
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
            list.add(recipe);
        }
        return list;
    }

    //Thêm 1 công thức
public boolean insert(Recipe c) throws SQLException {
    try {
         Connection connection = DBConnect.getConnection();
         String sql = "INSERT INTO recipe VALUE(?,?,?,?,?,?,?,?,?,?,?,?,?)";
         PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, c.getRecipeId());
         ps.setString(2, c.getRecipeName());
         ps.setString(3, c.getRecipeImage());
         ps.setInt(4, c.getRecipeViews());
         ps.setInt(5, c.getRecipeCalories());
         ps.setString(6, c.getRecipeAuthor());
         ps.setInt(7, c.getCategoryId());
         ps.setString(8, c.getIngredientRecipe());
         ps.setString(9, c.getNutritionIngredients());
         ps.setString(10, c.getMaking());
         ps.setString(11, c.getDescriptionRecipe());
         ps.setString(12, c.getVideo());
         ps.setInt(13, c.getUserIdPostedRecipe());
         int temp = ps.executeUpdate();
         return temp == 1;
    } catch (Exception e) {
         return false;
    }
}

    //cập nhật một công thức
    public boolean update(Recipe c) throws SQLException {
    try {
         Connection connection = DBConnect.getConnection();
         String sql = "UPDATE recipe SET recipe_name=?, category_id=?, recipe_image=?, recipe_views=?, calories=?, recipe_author=?, ingredients = ?, nutritions=?, making= ?, description_recipe= ?, video = ?, user_id =? WHERE recipe_id = ?";
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
         ps.setInt(13, c.getRecipeId());
         int temp = ps.executeUpdate();
         return temp == 1;
    } catch (Exception e) {
         return false;
    }
}

    //xóa 1 công thức
    public boolean delete(int recipeId) throws SQLException {
    try {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM recipe WHERE recipe_id = ?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, recipeId);
        int temp = ps.executeUpdate();
            return temp == 1;
    } catch (Exception e) {
        return false;
    }
}
    //Thêm 1 công thức
       public boolean insertRecipe(Recipe c) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO recipe VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(RecipeGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // cập nhật dữ liệu
    public boolean updateRecipe(Recipe c) {
        
        Connection connection = DBConnect.getConnection();
       
        String sql = "UPDATE recipe SET recipe_name=?, category_id=?, recipe_image=?, recipe_views=?, calories=?, recipe_author=?, ingredients=?, nutritions=?, making=?, description_recipe=?, video=? WHERE recipe_id=?";
        
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
//         ps.setInt(12, c.getUserIdPostedRecipe());
         ps.setInt(12, c.getRecipeId());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(RecipeGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
     public boolean updateRecipeViews(int views, int recipeId) {
        
        Connection connection = DBConnect.getConnection();
       
        String sql = "UPDATE recipe SET recipe_views=? WHERE recipe_id = ?";
        
        try {
        PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, views);
         ps.setInt(2, recipeId);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(RecipeGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // xóa dữ liệu
    public boolean deleteRecipe(int recipe_id) {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM recipe WHERE recipe_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, recipe_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(RecipeGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    //thêm recipe_temp sang recipe
     public boolean insertRecipeT(RecipeTemp c) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO recipe VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
         PreparedStatement ps = connection.prepareCall(sql);
         ps.setInt(1, c.getRecipeId());
         ps.setString(2, c.getRecipeName());
         ps.setInt(3, c.getCategoryId());
         ps.setString(4, c.getRecipeImage());
         ps.setInt(5, c.getRecipeViews());
         ps.setInt(6, c.getRecipeCalories());
         ps.setString(7, c.getRecipeAuthor());
         ps.setString(8, c.getIngredientRecipe());
         ps.setString(9, c.getNutritionIngredients());
         ps.setString(10, c.getMaking());
         ps.setString(11, c.getDescriptionRecipe());
         ps.setString(12, c.getVideo());
         ps.setInt(13, c.getUserIdPostedRecipe());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(RecipeGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
     
    public static void main(String args[]) throws SQLException {
        
        RecipeGet get = new RecipeGet();
        System.out.println(get.getRecipe(1).getRecipeName());

    }
}
