/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import get.AdminGet;
import java.awt.event.FocusEvent;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.http.HTTPException;
import model.Admin;
import static model.Admin.getMd5;

/**
 *
 * @author ACER
 */
public class AdminServlet extends HttpServlet{
    AdminGet adminGet = new AdminGet();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse respond) 
            throws ServletException, IOException{
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        
        String commandadmin = request.getParameter("commandadmin"); //lưu trữ lệnh
        String url=""; //lưu trữ đường dẫn 
        Admin userAdmin = new Admin();
        HttpSession session = request.getSession(); // lưu trữ session
        
        switch(commandadmin){
            case "login":
                userAdmin = adminGet.login(request.getParameter("emailadmin"), 
                        ((request.getParameter("passadmin"))));//lưu trữ thong tin admin để kiểm tra
                if(userAdmin != null){
                    session.setAttribute("useradmin", userAdmin);
                    url = "/chuancommenau/admin/index.jsp";
                }
                else{
                    
                   request.setAttribute("error", "Lỗi tên đăng nhập hoặc mật khẩu");
                   url = "/chuancommenau/admin/login.jsp";
                }
                break;
        }
        response.sendRedirect(url);
    }
    
    
}
