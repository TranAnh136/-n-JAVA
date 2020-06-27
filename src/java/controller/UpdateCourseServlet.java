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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Pham An
 */
public class UpdateCourseServlet extends HttpServlet {

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
        int CourseId=0;
        String courseName="";
        Date coursesTimeStart = null;
        Date coursesTimeFinish = null;
        int typecourse=0;
        String courseAddress ="";
        int chef =0;
        String introduce="";
        Time time = null;
        int duration=0;
        String infomationCourse="";
        String benifitOfCourse ="";
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
                    case "coId" : CourseId = Integer.parseInt(fileItem.getString());
                         break;
                    case "courseName" : courseName = fileItem.getString("UTF-8");
                         break;
                    case "TimeStart" : coursesTimeStart = new SimpleDateFormat("MM/dd/yyyy").parse(fileItem.getString());
                         break;
                    case "TimeFinish" : coursesTimeFinish = new SimpleDateFormat("MM/dd/yyyy").parse(fileItem.getString());
                         break;
                    case "catecourse" : typecourse =  Integer.parseInt(fileItem.getString());
                         break;
                    case "addresscousre" : courseAddress =  fileItem.getString("UTF-8");
                         break;
                    case "chefcourseId" : chef =  Integer.parseInt(fileItem.getString());
                         break;
                    case "introducecorse" : introduce =  fileItem.getString("UTF-8");
                         break;
                    case "timecourse" : time =  (Time) new SimpleDateFormat("h:mm a").parse(fileItem.getString());
                         break;
                    case "durationcourse" : duration =  Integer.parseInt(fileItem.getString());
                         break;
                    case "courseInfor" : infomationCourse =  fileItem.getString("UTF-8");
                         break;
                    case "courseBenit" : benifitOfCourse =  fileItem.getString("UTF-8");
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
        CourseGet courseGet = new CourseGet();
        if(img !=null){
            courseGet.updateCourseNotImagesClass(CourseId, courseName, coursesTimeStart, coursesTimeFinish, typecourse,courseAddress,chef,img,introduce,time, duration, infomationCourse,benifitOfCourse);
        url = "/chuancommenau/admin/success.jsp";
        }
        else{
            courseGet.updateCourseNotImages(CourseId, courseName, coursesTimeStart, coursesTimeFinish, typecourse,courseAddress,chef,introduce,time, duration, infomationCourse,benifitOfCourse);
        url = "/chuancommenau/admin/success.jsp";
        }
        response.sendRedirect(url+"?"+img+"&"+courseName+"&"+CourseId+"&"+coursesTimeStart+"&"+coursesTimeFinish+"&"+typecourse+"&"+courseAddress+"&"+chef+"&"+time+"&"+duration+"&"+infomationCourse+"&"+benifitOfCourse+"");
    }

    
}
