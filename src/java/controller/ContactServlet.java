/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import get.ContactInfoGet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ContactInfo;

/**
 *
 * @author Dell
 */
public class ContactServlet extends HttpServlet {
    ContactInfoGet contactServlet = new ContactInfoGet();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");        
        String content = request.getParameter("message");
   
        String url = "", error = "";
        if (content.equals("")) {
            error = "Vui lòng nhập nội dung góp ý!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                    
                contactServlet.insertContactInfo(new ContactInfo(name,email,subject,content));
                url = "/chuancommenau/index.jsp";
                       
            }else{
                url = "/chuancommenau/index.jsp";
            }
                
        } catch (Exception e) {
        }
        response.sendRedirect(url);
    }

}