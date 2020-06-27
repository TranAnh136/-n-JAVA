/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import get.RecipeGet;
import get.UserGet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Pham An
 */
public class CountViewsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int  views = Integer.parseInt(request.getParameter("views"));
        int recipeId = Integer.parseInt(request.getParameter("recipeId"));
        RecipeGet recipeGet = new RecipeGet();
        recipeGet.updateRecipeViews(views,recipeId);
        response.sendRedirect("/chuancommenau/RecipeDetail.jsp?recipeId="+recipeId+"");
    }

    

}
