/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import get.UserGet;
import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;
import model.User;
import static model.User.getMd5;

/**
 *
 * @author Tien Anh
 */

public class UserServlet extends HttpServlet{
    UserGet userGet = new UserGet();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }
    
    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //Biến lưu trữ chức năng chèn hay update...
        String command = request.getParameter("command");
        
        String url = "";
        User users = new User();
        HttpSession session = request.getSession();
        switch(command){
            case "insert":
                users.setUserId((int) new java.util.Date().getTime());
                users.setUserName(request.getParameter("name"));
                users.setUserEmail(request.getParameter("email"));
                users.setUserPass(request.getParameter("pass"));
                users.setUserPhone(request.getParameter("phone"));
                users.setUserAddress(request.getParameter("address"));
                users.setUserAvatar("users.png");
          
                userGet.insertUser(users);
                session.setAttribute("user",users);
                
                url = "/chuancommenau/signup-signin.jsp";
               
                break;
               
            case "update":
                int user_id = Integer.parseInt(request.getParameter("user_id"));
                String username = request.getParameter("user_name");
                String useremail = request.getParameter("user_email");
                String password = request.getParameter("user_pass");
                String phone = request.getParameter("user_phone");
                String address = request.getParameter("user_address");
                String avatar = request.getParameter("user_avatar");
            
                userGet.updateUser(new User(user_id, username, useremail, password, phone, address, avatar));
                url = "/chuancommenau/myaccount.jsp";
                break;
             
            case "updatepassword":
                int userid = Integer.parseInt(request.getParameter("userId"));
                String userpassword = request.getParameter("pass");
            
                userGet.updateUserPassword(userid,userpassword);
                url = "/chuancommenau/changepasswordresult.jsp";
                break;
            case "login":
                users = userGet.login(request.getParameter("email"), (getMd5(request.getParameter("pass"))));
                if (users != null ){
                    session.setAttribute("user", users);
                    url = "/chuancommenau/index.jsp";
                   
                }
               else{
                    request.setAttribute("error", "Lỗi tên đăng nhập hoặc mật khẩu");
                    url = "/chuancommenau/signup-signin.jsp";
                }
                break;
                
                
    }
        response.sendRedirect(url);
   }
}
