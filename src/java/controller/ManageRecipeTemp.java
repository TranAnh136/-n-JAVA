/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import get.RecipeGet;
import get.RecipeTempGet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class ManageRecipeTemp extends HttpServlet{
   
    
    RecipeTempGet recipeGet = new RecipeTempGet();
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String command = request.getParameter("command");
        String url = "";
        String recipe_id = request.getParameter("recipe_id");
        try{
           
        switch(command){
            
      
         case "delete":
                      
                       recipeGet.deleteRecipe(Integer.parseInt(recipe_id));
                       url="/chuancommenau/admin/manage_user.jsp";
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
    }
}
