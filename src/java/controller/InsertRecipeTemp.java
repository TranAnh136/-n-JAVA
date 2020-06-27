/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import get.RecipeGet;
import get.RecipeTempGet;
import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Recipe;
import model.RecipeTemp;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author ACER
 */


public class InsertRecipeTemp extends HttpServlet{
    //kết nối 
      
         RecipeGet recipeGet = new RecipeGet();
         
     // thư mục lưu file sau khi upload

     // thư mục lưu file sau khi upload
    private static final String UPLOAD_DIRECTORY = "images";

    // cài đặc phần upload
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
    }
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
             
        //xử lí request
        request.setCharacterEncoding("utf-8");
        String url="";
        //                 Recipe recipe = recipeGet.getRecipe(Integer.parseInt(request.getParameter("RecipeId")));
//                 recipe.setRecipeId(Integer.parseInt(request.getParameter("RecipeId")));
//                 recipe.setRecipeName(request.getParameter("nameRecipe"));
//                 recipe.setCategoryId(Integer.parseInt(request.getParameter("catogoryId")));
//                 recipe.setRecipeImage(request.getParameter("img"));
//                 recipe.setRecipeViews(0);
//                 recipe.setRecipeCalories(Integer.parseInt(request.getParameter("calo")));
//                 recipe.setRecipeAuthor(request.getParameter("author"));
//                 recipe.setIngredientRecipe(request.getParameter("ingredients"));
//                 recipe.setNutritionIngredients(request.getParameter("nuti"));
//                 recipe.setMaking(request.getParameter("making"));
//                 recipe.setDescriptionRecipe(request.getParameter("descriptionRecipe"));
//                 recipe.setVideo(request.getParameter("video"));
//                 recipe.setCategoryId(Integer.parseInt(request.getParameter("userid")));
//                 recipeGet.insertRecipe(recipe);


int view =0;
String nameRecipe = "";
int  catogoryId = 0;        
int calo = 0;
String author = "";
String video = "";
String nuti = "";
String img = "";
String re = request.getParameter("RecipeId");
String cate = request.getParameter("catogoryId");
String cal = request.getParameter("calo");
String id = request.getParameter("userid");
String ingredients = "";
String descriptionRecipe= "";
String making = "";
int userid =0;
int recipeid =0;
RecipeGet recipe = new RecipeGet();
if(re!=null){
    try{
        recipeid = Integer.parseInt(re);
    }catch(NumberFormatException e){}
}
if(cate!=null){
    try{
        catogoryId = Integer.parseInt(cate);
    }catch(NumberFormatException e){}
}
if(cal!=null){
    try{
        calo = Integer.parseInt(cal);
    }catch(NumberFormatException e){}
}
if(id!=null){
    try{
        userid = Integer.parseInt(id);
    }catch(NumberFormatException e){}
}
nameRecipe =  request.getParameter("nameRecipe");
img = request.getParameter("img");
author = request.getParameter("author");
ingredients =  request.getParameter("ingredients");
nuti = request.getParameter("nuti");
making = request.getParameter("making");
descriptionRecipe =  request.getParameter("descriptionRecipe");
video = request.getParameter("video");
recipe.insertRecipe(new Recipe(recipeid, nameRecipe, img, view , calo, author, catogoryId ,ingredients, nuti, making, descriptionRecipe, video, userid));
RecipeTempGet t = new RecipeTempGet();
int check =1;
t.updateRecipeCheck(check, recipeid);

url="/chuancommenau/admin/manage_recipe_user.jsp";
response.sendRedirect(url);
            
    }
}


//                  int recipeid = Integer.parseInt(request.getParameter("RecipeId"));
//              
//                  RecipeGet recipe = new RecipeGet();
//                  RecipeTempGet recT = new RecipeTempGet(); 
//                  RecipeTempGet t = new RecipeTempGet();
//                  RecipeTemp recipeT;
//             try {
//                 recipeT = recT.getRecipe(recipeid);
//                  int check =1;
//                   
//                  t.updateRecipeCheck(check, recipeT.getRecipeId());
//                  recipe.insertRecipeT(recipeT);
//             } catch (SQLException ex) {
//                 Logger.getLogger(InsertRecipeTemp.class.getName()).log(Level.SEVERE, null, ex);
//             }
//                 RecipeTemp recipe = new RecipeTemp();
//                recipe.getRecipeId();
//                recipe.getRecipeName();
//                recipe.getCategoryId();
//                recipe.getRecipeImage();
//                recipe.getRecipeViews();
//                recipe.getRecipeCalories();
//                recipe.getRecipeAuthor();
//                recipe.getIngredientRecipe();
//                recipe.getNutritionIngredients();
//                recipe.getMaking();
//                recipe.getDescriptionRecipe();
//                recipe.getVideo();
//                recipe.getUserIdPostedRecipe();
//                RecipeGet recipeGet = new RecipeGet();
//                recipeGet.insertRecipeT(recipe);


//                 RecipeTemp recipeT = new RecipeTemp();
//                 RecipeTempGet recipeTemp = new RecipeTempGet();
//                 int check =1;
//                 int recipeId = recipeT.getRecipeId();
//                 recipeTemp.updateRecipeCheck(check, recipeId );





//        // kiểm tra nếu yêu cầu thực sự có hành động upload file
//        if (!ServletFileUpload.isMultipartContent(request)) {
//            // nếu không có thì dừng việc upload
//            PrintWriter writer = response.getWriter();
//            writer.println("Error: Form must has enctype=multipart/form-data.");
//            writer.flush();
//            return;
//        }
//        String url ="/chuancommenau/index.jsp";
//        String img ="";
//        // cấu hình cài đặc upload
//        
//        DiskFileItemFactory factory = new DiskFileItemFactory();
//        // đặc ngưỡng bộ nhớ - giới hạn file lưu trữ
//        
//        factory.setSizeThreshold(MEMORY_THRESHOLD);
//        // đặc vị trí lưu file tạm thời
//        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
//
//        ServletFileUpload upload = new ServletFileUpload(factory);
//
//        // đặc kích thước file lớn nhất có thể upload
//        upload.setFileSizeMax(MAX_FILE_SIZE);
//
//        // đặc kích thước file lớn nhất có thể upload (bao gồm file và dữ liệu)
//        upload.setSizeMax(MAX_REQUEST_SIZE);
//
//        // xây dựng đường dẫn thư mục để lưu trữ tập tin upload
//        // đây là đường dẫn tương đối đến thư mục lưu trữ
//        String uploadPath = getServletContext().getRealPath("")
//                + File.separator + UPLOAD_DIRECTORY;
//
//        // tạo thư mục lưu trữ nếu thư mục không tồn tại
//        File uploadDir = new File(uploadPath);
//        if (!uploadDir.exists()) {
//            uploadDir.mkdir();
//        }
     //lấy dữ liệu từ các trường nhập liệu tại form insert
//     int view =0;
//     String nameRecipe = "";
//     int  catogoryId = 0;
//     int calo = 0;
//     String author = "";
//     String video = "";
//     String nuti = "";
//     String ingredients = "";
//     String descriptionRecipe= "";
//     String making = "";
//     int userid =0;
//     int recipe_id =0;
//    int check =1;
//         
//        try {
//             // xử lý upload file khi người dùng nhấn nút cập nhật
//            List<FileItem> formItems = upload.parseRequest(request);
//            Iterator < FileItem > it = formItems.iterator();
//            if (!it.hasNext()) {
//            return;
//            }
//            while (it.hasNext()){
//            FileItem fileItem = it.next();
//            boolean isFormField = fileItem.isFormField();
//            if (isFormField) {
//                switch(fileItem.getFieldName()){
//                    case "RecipeId" : recipe_id = Integer.parseInt(fileItem.getString());
//                         break;
//                    case "nameRecipe" : nameRecipe = fileItem.getString("UTF-8");
//                         break;
//                    case "catogoryId" : catogoryId =Integer.parseInt(fileItem.getString());
//                         break;
//                    case "calo" : calo = Integer.parseInt(fileItem.getString());
//                         break;
//                    case "author" : author =  fileItem.getString("UTF-8");
//                         break;
//                    case "ingredients" : ingredients =  fileItem.getString("UTF-8");
//                         break;
//                    case "nutritions" : nuti =  fileItem.getString("UTF-8");
//                         break;
//                    case "making" : making =  fileItem.getString("UTF-8");
//                         break;
//                    case "descriptionRecipe" : descriptionRecipe =  fileItem.getString("UTF-8");
//                         break;
//                    case "video" : video =  fileItem.getString("UTF-8");
//                         break;
//                    case "img" : img =  fileItem.getString("UTF-8");
//                         break;
//                    case "userid": userid = Integer.parseInt(fileItem.getString());
//                         break;
//                  
//                }
//
//                
//            }
//            
//        }
//          
//        } catch (Exception ex) {
//           
//        }

            
//String url="";
//RecipeTemp recipe = new RecipeTempGet().getRecipe(Integer.parseInt(request.getParameter("recipe_id")));
//RecipeTempGet rp = new RecipeTempGet();
//int check_id = recipe.getCheck();
//int recipeId = recipe.getRecipeId();
//String nameRecipe = recipe.getRecipeName();
//String img = recipe.getRecipeName();
//int view = 0;
//int calo = recipe.getRecipeCalories();
//String author = recipe.getRecipeAuthor();
//int categoryId = recipe.getCategoryId();
//String ingredients = recipe.getIngredientRecipe();
//String nuti = recipe.getNutritionIngredients();
//String makinng = recipe.getMaking();
//String descriptionRecipe = recipe.getDescriptionRecipe();
//String video = recipe.getVideo();
//int userid = recipe.getUserIdPostedRecipe();
//
//check_id=1;
//int recipeid = Integer.parseInt(request.getParameter("RecipeId"));
//  RecipeTempGet recipe = new RecipeTempGet();
//        recipe.updateRecipeCheck(check, recipeid);




// recipeGet.insertRecipe(new Recipe(recipe_id, nameRecipe, img, view , calo, author, catogoryId ,ingredients, nuti, making, descriptionRecipe, video, userid));






    


