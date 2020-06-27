/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import get.UserGet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class CheckEmailServlet extends HttpServlet{
    //tạo mới 1 user 
    UserGet userGet = new UserGet();
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
            try {
                    if (userGet.checkEmail(request.getParameter("email"))) {
                    response.getWriter().write(" <img src=\"admin/img/not-available.png\"/> Tài khoản này đã có người sử dụng");
                    }
                    else{
                         response.getWriter().write("<img src=\"admin/img/available.png\"/> Tài khoản hợp lệ");
                    }
                } catch (SQLException ex) {
                Logger.getLogger(CheckEmailServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
    }


    
    }
