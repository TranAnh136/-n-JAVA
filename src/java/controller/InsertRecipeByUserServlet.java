package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import get.RecipeTempGet;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RecipeTemp;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Pham An
 */
public class InsertRecipeByUserServlet extends HttpServlet {

     // thư mục lưu file sau khi upload
    private static final String UPLOAD_DIRECTORY = "images";

    // cài đặc phần upload
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
         // kiểm tra nếu yêu cầu thực sự có hành động upload file
        if (!ServletFileUpload.isMultipartContent(request)) {
            // nếu không có thì dừng việc upload
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }
        String url ="";
        String img ="";
        // cấu hình cài đặc upload
        
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // đặc ngưỡng bộ nhớ - giới hạn file lưu trữ
        
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // đặc vị trí lưu file tạm thời
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        // đặc kích thước file lớn nhất có thể upload
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // đặc kích thước file lớn nhất có thể upload (bao gồm file và dữ liệu)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // xây dựng đường dẫn thư mục để lưu trữ tập tin upload
        // đây là đường dẫn tương đối đến thư mục lưu trữ
        String uploadPath = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;

        // tạo thư mục lưu trữ nếu thư mục không tồn tại
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String nameRecipe="";
        int catogoryId=0;
        int calo=0;
        String author ="";
        String ingredients ="";
        String nuti="";
        String making="";
        String descriptionRecipe="";
        String video="";
        try {
             // xử lý upload file khi người dùng nhấn nút cập nhật
            List<FileItem> formItems = upload.parseRequest(request);
            Iterator < FileItem > it = formItems.iterator();
            if (!it.hasNext()) {
            return;
            }
            while (it.hasNext()){
            FileItem fileItem = it.next();
            boolean isFormField = fileItem.isFormField();
            if (isFormField) {
                switch(fileItem.getFieldName()){
                    case "nameRecipe" : nameRecipe = fileItem.getString("UTF-8");
                         break;
                    case "catogoryId" : catogoryId =Integer.parseInt(fileItem.getString());
                         break;
                    case "calo" : calo = Integer.parseInt(fileItem.getString());
                         break;
                    case "author" : author =  fileItem.getString("UTF-8");
                         break;
                    case "ingredients" : ingredients =  fileItem.getString("UTF-8");
                         break;
                    case "nutritions" : nuti =  fileItem.getString("UTF-8");
                         break;
                    case "making" : making =  fileItem.getString("UTF-8");
                         break;
                    case "descriptionRecipe" : descriptionRecipe =  fileItem.getString("UTF-8");
                         break;
                    case "video" : video =  fileItem.getString("UTF-8");
                         break;
                  
                }
            
                
            }
            else {
                if (fileItem.getSize() > 0) {
                String fileName = new File(fileItem.getName()).getName();
                String filePath = uploadPath + File.separator + fileName;
                File storeFile = new File(filePath);
                fileItem.write(storeFile);
                img=fileName;
               
                }
 }
        }
          
        } catch (Exception ex) {
           
        }
        
        int recipeId = (int) new java.util.Date().getTime();
        int userId = Integer.parseInt(request.getParameter("userId"));
        RecipeTempGet recipeTempGet = new RecipeTempGet();
        recipeTempGet.insertRecipe(new RecipeTemp(recipeId,nameRecipe,img,0, calo, author, catogoryId ,ingredients, nuti, making, descriptionRecipe, video, userId,0));
        url ="/chuancommenau/InsertRecipe.jsp";
         response.sendRedirect(url+"?check=1");
    }


}
