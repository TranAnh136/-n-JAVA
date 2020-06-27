/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Anh
 */
public class RecipeTemp {
    private int recipeId;
    private String recipeName;
    private String recipeImage;
    private int recipeViews;
    private int recipeCalories;
    private String recipeAuthor;
    private int CategoryId;
    private String ingredientRecipe;
    private String nutritionIngredients;
    private String making;
    private String descriptionRecipe;
    private String video;
    private int userIdPostedRecipe;
    private int check;

    public int getCheck() {
        return check;
    }

    public void setCheck(int check) {
        this.check = check;
    }
    
    public RecipeTemp(){
        
    }

    public RecipeTemp(int recipeId, String recipeName, String recipeImage, int recipeViews, int recipeCalories, String recipeAuthor, int CategoryId, String ingredientRecipe, String nutritionIngredients, String making, String descriptionRecipe, String video, int userIdPostedRecipe,int check) {
        this.recipeId = recipeId;
        this.recipeName = recipeName;
        this.recipeImage = recipeImage;
        this.recipeViews = recipeViews;
        this.recipeCalories = recipeCalories;
        this.recipeAuthor = recipeAuthor;
        this.CategoryId = CategoryId;
        this.ingredientRecipe = ingredientRecipe;
        this.nutritionIngredients = nutritionIngredients;
        this.making = making;
        this.descriptionRecipe = descriptionRecipe;
        this.video = video;
        this.userIdPostedRecipe = userIdPostedRecipe;
        this.check = check;
    }

    public int getRecipeId() {
        return recipeId;
    }

    public void setRecipeId(int recipeId) {
        this.recipeId = recipeId;
    }

    public String getRecipeName() {
        return recipeName;
    }

    public void setRecipeName(String recipeName) {
        this.recipeName = recipeName;
    }

    public String getRecipeImage() {
        return recipeImage;
    }

    public void setRecipeImage(String recipeImage) {
        this.recipeImage = recipeImage;
    }

    public int getRecipeViews() {
        return recipeViews;
    }

    public void setRecipeViews(int recipeViews) {
        this.recipeViews = recipeViews;
    }

    public int getRecipeCalories() {
        return recipeCalories;
    }

    public void setRecipeCalories(int recipeCalories) {
        this.recipeCalories = recipeCalories;
    }

    public String getRecipeAuthor() {
        return recipeAuthor;
    }

    public void setRecipeAuthor(String recipeAuthor) {
        this.recipeAuthor = recipeAuthor;
    }

    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int CategoryId) {
        this.CategoryId = CategoryId;
    }

    public String getIngredientRecipe() {
        return ingredientRecipe;
    }

    public void setIngredientRecipe(String ingredientRecipe) {
        this.ingredientRecipe = ingredientRecipe;
    }

    public String getNutritionIngredients() {
        return nutritionIngredients;
    }

    public void setNutritionIngredients(String nutritionIngredients) {
        this.nutritionIngredients = nutritionIngredients;
    }

    public String getMaking() {
        return making;
    }

    public void setMaking(String making) {
        this.making = making;
    }

    public String getDescriptionRecipe() {
        return descriptionRecipe;
    }

    public void setDescriptionRecipe(String descriptionRecipe) {
        this.descriptionRecipe = descriptionRecipe;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public int getUserIdPostedRecipe() {
        return userIdPostedRecipe;
    }

    public void setUserIdPostedRecipe(int userIdPostedRecipe) {
        this.userIdPostedRecipe = userIdPostedRecipe;
    }
}
