package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import get.PostGet;
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
import model.Post;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Pham An
 */
public class InsertPostServlet extends HttpServlet {

     // thư mục lưu file sau khi upload
    private static final String UPLOAD_DIRECTORY = "images";

    // cài đặc phần upload
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
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
        int recipeId=0;
        String postName="";
        String cost = "";
        String servings="";
        String level ="";
        String success ="";
        String infomationComment ="";
        List<String> list = new ArrayList<String>();
        
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
                    case "recipeId" : recipeId = Integer.parseInt(fileItem.getString());
                         break;
                    case "postname" : postName =fileItem.getString("UTF-8");
                         break;
                    case "cost" : cost =  fileItem.getString("UTF-8");
                         break;
                    case "servings" : servings =  fileItem.getString("UTF-8");
                         break;
                    case "level" : level =  fileItem.getString("UTF-8");
                         break;
                    case "success" : success =  fileItem.getString("UTF-8");
                         break;
                    case "infomationComment" : infomationComment =  fileItem.getString("UTF-8");
                         break;
                
                }
            
                
            }
            else {
                if (fileItem.getSize() > 0) {
                String fileName = new File(fileItem.getName()).getName();
                String filePath = uploadPath + File.separator + fileName;
                File storeFile = new File(filePath);
                fileItem.write(storeFile);
                list.add(fileName);
                }
 }
        }
          
        } catch (Exception ex) {
           
        }
        
        int postId = (int) new java.util.Date().getTime();
        String postImg ="";
       if(list.size()==1){
           postImg =list.get(0);
       }
       else{
           postImg =list.get(0)+"*"+list.get(1);
       }
        
        int heart = 0;
       
        int userId = Integer.parseInt(request.getParameter("userId"));
        PostGet postGet = new PostGet();
        postGet.insertPost(new Post(postId,postName,recipeId,postImg,heart, cost, servings,infomationComment, level,userId,success));
         url ="/chuancommenau/community.jsp";
         response.sendRedirect(url);
    }

}
