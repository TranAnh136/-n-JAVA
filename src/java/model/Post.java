/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author Duong Nguyen
 */
public class Post {
    private int postId;
    private String postName;
    private int recipeId;
    private String postImages;
    private int postHeart;
    private String cost;
    private String servings;
    private String description_post;
    private String level;
    private int userId;
    private String levelOfSuccess;
    private Timestamp datePost;
    
    public Post(){
        
    }

    public Post(int postId, String postName, int recipeId, String postImages, int postHeart, String cost, String servings, String description_post, String level, int userId, String levelOfSuccess, Timestamp datePost) {
        this.postId = postId;
        this.postName = postName;
        this.recipeId = recipeId;
        this.postImages = postImages;
        this.postHeart = postHeart;
        this.cost = cost;
        this.servings = servings;
        this.description_post = description_post;
        this.level = level;
        this.userId = userId;
        this.levelOfSuccess = levelOfSuccess;
        this.datePost = datePost;
    }

    public Post(int postId, String postName, int recipeId, String postImages, int postHeart, String cost, String servings, String description_post, String level, int userId, String levelOfSuccess) {
        this.postId = postId;
        this.postName = postName;
        this.recipeId = recipeId;
        this.postImages = postImages;
        this.postHeart = postHeart;
        this.cost = cost;
        this.servings = servings;
        this.description_post = description_post;
        this.level = level;
        this.userId = userId;
        this.levelOfSuccess = levelOfSuccess;
    }
    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName;
    }

    public int getRecipeId() {
        return recipeId;
    }

    public void setRecipeId(int recipeId) {
        this.recipeId = recipeId;
    }

    public String getPostImages() {
        return postImages;
    }

    public void setPostImages(String postImages) {
        this.postImages = postImages;
    }

    public int getPostHeart() {
        return postHeart;
    }

    public void setPostHeart(int postHeart) {
        this.postHeart = postHeart;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public String getServings() {
        return servings;
    }

    public void setServings(String servings) {
        this.servings = servings;
    }

    public String getDescription_post() {
        return description_post;
    }

    public void setDescription_post(String description_post) {
        this.description_post = description_post;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getLevelOfSuccess() {
        return levelOfSuccess;
    }

    public void setLevelOfSuccess(String levelOfSuccess) {
        this.levelOfSuccess = levelOfSuccess;
    }

    public Timestamp getDatePost() {
        return datePost;
    }

    public void setDatePost(Timestamp datePost) {
        this.datePost = datePost;
    }
    
}
