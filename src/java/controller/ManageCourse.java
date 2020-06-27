/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import get.CourseGet;
import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author ACER
 */

public class ManageCourse extends HttpServlet{
   
     // thư mục lưu file sau khi upload
    private static final String UPLOAD_DIRECTORY = "images";

    // cài đặc phần upload
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
   CourseGet courseGet = new CourseGet();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String command = request.getParameter("command");
        String url = "";
        String course_id = request.getParameter("course_id");
        try{
           
        switch(command){
            
      
         case "delete":
                      
                       courseGet.deleteCourse(Integer.parseInt(course_id));
                       url="/chuancommenau/admin/success.jsp";
                    break;
            }  
        }
        catch (Exception e) {
        }
        response.sendRedirect(url);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
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
        String namecourse="";
        Date datestart = null;
        Date datesfinish = null;
        Time time = null;
        int duration=0;
        int  typecourse=0;
        int chef=0;
        String introduction="";
        String informationcourse="";
        String addressCourse="";
        String benifit ="";
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
                    case "namecourse" : namecourse = fileItem.getString("UTF-8");
                         break;
                    case "datestart" : datestart = new SimpleDateFormat("MM/dd/yyyy").parse(fileItem.getString());;
                         break;
                    case "datesfinish" : datesfinish = new SimpleDateFormat("MM/dd/yyyy").parse(fileItem.getString());
                         break;
                    case "time" : time =  (Time) new SimpleDateFormat("h:mm a").parse(fileItem.getString());
                         break;
                    case "duration" : duration =  Integer.parseInt(fileItem.getString());
                         break;
                    case "typecourse" : typecourse =  Integer.parseInt(fileItem.getString());
                         break;
                    case "chef" : chef =  Integer.parseInt(fileItem.getString());
                         break;
                    case "introduction" : introduction =  fileItem.getString("UTF-8");
                         break;
                    case "informationcourse" : informationcourse =  fileItem.getString("UTF-8");
                         break;
                    case "addressCourse" : addressCourse =  fileItem.getString("UTF-8");
                         break;
                    case "benifit" : benifit =  fileItem.getString("UTF-8");
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
        String command = request.getParameter("command");
        

        try {
            
                  int count=1;
                       for (Course r : courseGet.getListCourse()) {
                           r.getCourseId();
                           count++;
                       }

            if (command.equals("insert")) {

              courseGet.insertCourse(new Course(count, namecourse, datestart, datesfinish, typecourse, addressCourse, chef, list.get(0), introduction,time,duration, informationcourse, list.get(1), list.get(2), benifit));
              url = "/chuancommenau/admin/success.jsp";
              

                }
             else {
                url = "/chuancommenau/admin/insert_course.jsp";
            }
        } catch (Exception e) {
        }
        response.sendRedirect(url);
}
}

    