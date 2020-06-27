/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import get.CourseGet;
import get.SignUpCourseGet;
import get.UserGet;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SignUpCourse;
import model.User;

/**
 *
 * @author Pham An
 */
public class SignUpCourseServlet extends HttpServlet {
SignUpCourseGet signUpCourseGet = new SignUpCourseGet();
UserGet userGet = new UserGet();
CourseGet courseGet = new CourseGet();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
        
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        int userId;
        String nameSignup = request.getParameter("nameSignup");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String note = request.getParameter("note");
        int quantity = Integer.parseInt(request.getParameter("numbercourse"));
        String typeCourse = request.getParameter("typeCourse");
        String nameCourse = request.getParameter("nameCourse");
        String addressCourse = request.getParameter("addressCourse");
        String timeCourse = request.getParameter("timeCourse");
        String url = "";
        if (request.getParameter("userId")==null) {
            userId = (int) new java.util.Date().getTime();
        }
        else
            userId = Integer.parseInt(request.getParameter("userId"));
        if(request.getParameter("updateinfor")!=null&&request.getParameter("userId")!=null){
            userGet.updateUser(userId,nameSignup,email,phoneNumber);
        }

        try {
            
            signUpCourseGet.insertSignUpCourse(new SignUpCourse(courseId,quantity,nameSignup,phoneNumber,email,note,userId));
            url = "/chuancommenau/CourseDetail.jsp?courseId="+courseId+"";

        } catch (Exception e) {
        }
        
        // Gửi mail cho khách hàng
        Properties mailServerProperties;
        Session getMailSession;
        MimeMessage mailMessage;
 
        // Step1: setup Mail Server
        mailServerProperties = System.getProperties();
        mailServerProperties.put("mail.smtp.port", "587");
        mailServerProperties.put("mail.smtp.auth", "true");
        mailServerProperties.put("mail.smtp.starttls.enable", "true");

        // Step2: get Mail Session
        getMailSession = Session.getDefaultInstance(mailServerProperties, null);
        mailMessage = new MimeMessage(getMailSession);
    try {
        mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
    } catch (AddressException ex) {
        Logger.getLogger(SignUpCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
    } catch (MessagingException ex) {
        Logger.getLogger(SignUpCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
    }

    try {
        mailMessage.setSubject("Thông tin đăng ký khóa học "+nameCourse, "UTF-8");
    } catch (MessagingException ex) {
        Logger.getLogger(SignUpCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
        String emailBody = "<!DOCTYPE html>\n" +
                            "<html lang=\"en\">\n" +
                            "<head>\n" +
                            "    <meta charset=\"UTF-8\">\n" +
                            "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                            "    <title>Document</title>\n" +
                            "    <style>\n" +
                            "        .card {\n" +
                            "  background-color: white;\n" +
                            "  padding: 20px;\n" +
                            "  margin-top: 20px;\n" +
                            "  border-radius: 20px;\n" +
                            "}\n" +
                            ".modal-body {\n" +
                            "  padding: 0px;\n" +
                            "}\n" +
                            ".row-1 {\n" +
                            "  max-width: 100%;\n" +
                            "  display: flex;\n" +
                            "}\n" +
                            ".col {\n" +
                            "  float: left;\n" +
                            "  width: 50%;\n" +
                            "}\n" +
                            ".col-introduce {\n" +
                            "  padding: 15px;\n" +
                            "  height: 100%;\n" +
                            "  background-color: #ffc037;\n" +
                            "}\n" +
                            ".col-introduce h3 {\n" +
                            "  padding: 10px 0;\n" +
                            "}\n" +
                            ".col-introduce span {\n" +
                            "  padding: 10px 0;\n" +
                            "  color: rgb(255, 126, 21);\n" +
                            "}\n" +
                            ".infor {\n" +
                            "  text-align: center;\n" +
                            "}\n" +
                            ".infor-1 {\n" +
                            "  margin: 0;\n" +
                            "  padding: 10px 0;\n" +
                            "}\n" +
                            ".col-1 {\n" +
                            "  float: left;\n" +
                            "  padding: 15px;\n" +
                            "  width: 50%;\n" +
                            "}\n" +
                            ".buttons {\n" +
                            "  float: right;\n" +
                            "}\n" +
                            "/* Clear floats after the columns */\n" +
                            ".row:after {\n" +
                            "  content: \"\";\n" +
                            "  display: table;\n" +
                            "  clear: both;\n" +
                            "}\n" +
                            "    </style>\n" +
                            "</head>\n" +
                            "<body>\n" +
                            "    <div\n" +
                            "    class=\"modal fade myModal\"\n" +
                            "    tabindex=\"-1\"\n" +
                            "    role=\"dialog\"\n" +
                            "    aria-labelledby=\"myLargeModalLabel\"\n" +
                            "  >\n" +
                            "    <div class=\"modal-dialog modal-lg\" role=\"document\">\n" +
                            "      <div class=\"modal-content\">\n" +
                            "        <div class=\"modal-body\">\n" +
                            "          <div class=\"row-1\">\n" +
                            "            <div class=\"col\">\n" +
                            "              <div class=\"col-introduce\">\n" +
                            "                <h2 class=\"infor\">THÔNG TIN LỚP HỌC</h2>\n" +
                            "                <span>"+typeCourse+"</span>\n" +
                            "                <h3>"+nameCourse+"</h3>\n" +
                            "                <p class=\"infor-1\">Địa điểm: "+addressCourse+"</p>\n" +
                            "                <p class=\"infor-1\">Lớp: "+timeCourse+"</p>\n" +
                            "                <p class=\"infor-1\">Số lượng: "+quantity+"</p>\n" +
                            "              </div>\n" +
                            "            </div>\n" +
                            "            <div class=\"col-1\">\n" +
                            "              <h3>THÔNG TIN ĐĂNG KÝ</h3>\n" +
                            "              \n" +
                            "                <p for=\"name\">Họ và tên : "+nameSignup+"</p>\n" +
                            "                <p for=\"name\">Số điện thoại : "+phoneNumber+"</p>\n" +
                            "                <p for=\"name\">Email : "+email+"</p>\n" +
                            "                <p for=\"name\">Ghi chú : "+note+"</p>\n" +
                            "               \n" +
                            "                          </div>\n" +
                            "                        </div>\n" +
                            "                      </div>\n" +
                            "                    </div>\n" +
                            "                  </div>\n" +
                            "                </div>\n" +
                            "</body>\n" +
                            "</html>";
    try {
        mailMessage.setContent(emailBody, "text/html; charset=UTF-8");
    } catch (MessagingException ex) {
        Logger.getLogger(SignUpCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
    }

        // Step3: Send mail
        Transport transport = null;
    try {
        transport = getMailSession.getTransport("smtp");
    } catch (NoSuchProviderException ex) {
        Logger.getLogger(SignUpCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
    }

    try {
        // Thay your_gmail thành gmail của bạn, thay your_password thành mật khẩu gmail của bạn
        transport.connect("smtp.gmail.com", "help.chuancommenau@gmail.com", "chuancommenau@1"); 
    } catch (MessagingException ex) {
        Logger.getLogger(SignUpCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
    try {
        transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
    } catch (MessagingException ex) {
        Logger.getLogger(SignUpCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
    try {
        transport.close();
    } catch (MessagingException ex) {
        Logger.getLogger(SignUpCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
        response.sendRedirect(url+"&&status=1");
    }


}
