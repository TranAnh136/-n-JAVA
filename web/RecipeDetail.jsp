<%-- 
    Document   : RecipeDetail
    Created on : May 12, 2020, 2:22:48 PM
    Author     : Pham An
--%>

<%@page import="get.UserGet"%>
<%@page import="model.Review"%>
<%@page import="get.ReviewGet"%>
<%@page import="model.User"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="model.Recipe"%>
<%@page import="get.RecipeGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Công thức chi tiết</title>
        <link rel="stylesheet" href="css/style_detail_dish.css">
        <link rel="stylesheet" href="css/style_review.css">
        <script src="js/modernizer.js"></script>
    </head>
    <body>
         <jsp:include page="header.jsp"></jsp:include>
        <% 
        RecipeGet recipeGet = new RecipeGet();  
        Recipe recipe = new Recipe();
    String recipeId = "";
     if (request.getParameter("recipeId") != null) {
          recipeId = request.getParameter("recipeId");
          recipe = recipeGet.getRecipe(Integer.parseInt(recipeId));
     }
            %>
        <div class="session-dish-detail">
        <div class="detail-dish">
            <div class="row">
                <br>
                <h3 style="color: white;"><a  href="index.jsp" style ="color:white;">Trang chủ</a> / <a href="Recipe.jsp"style ="color:white;">Công thức</a> / <%=recipe.getRecipeName()%></h3>
          <div class="leftcolumn">
            <div class="card">
                <div class="img-dish" ><iframe class="piture-dish" src="https://www.youtube.com/embed/<%=recipe.getVideo() %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
              
                <h2 class="name-dish"><b><%= recipe.getRecipeName()%></b></h2>
                <h4 class="name-athour">Tác giả: <%= recipe.getRecipeAuthor()%></h4>
              <p class="text-heading">Giới thiệu:</p>
              <p><%= recipe.getDescriptionRecipe()%></p>
            </div>
            <div class="card">
              <h2 class="text-heading"><b>Nguyên liệu</b></h2>
              <h5 class="text-heading">Phần ăn cho 2 người</h5>
                <ul class="ingredients-food" style="list-style-image: url('images/farm.png')"> 
                    <%
                        String ingredientRecipe = recipe.getIngredientRecipe();
                        StringTokenizer token = new StringTokenizer(ingredientRecipe, "-");
                        while (token.hasMoreTokens()) {
                            
                     %>  
                  <li> <%=token.nextToken()%></li><br>
                 <%}%>
                </ul>
            </div>
            <div class="card">
              <h2 class="text-heading"><b>Cách làm món ăn</b></h2>
              <hr>
                <ul class="list-to-do">
                    <%
                        String making = recipe.getMaking();
                        int step=1;
                        StringTokenizer token1 = new StringTokenizer(making, "-");
                        while (token1.hasMoreTokens()) {
                            
                     %>  
                     <li>Bước <%=step%><p><%=token1.nextToken()%></p></li>
                    <%step++;}%>
                </ul>
            </div>
            <div class="card">
                <%
                    if(session.getAttribute("user")!=null){%> <%-- ktra đã đăng nhập hay chưa (lấy giá trị phiên login từ UserServlet)--%>
                    <h2 class="text-heading"><b>Bình luận</b></h2>
                    <form action="ReviewServlet" method="POST">
                         <%if(request.getAttribute("error")!=null){%>
                    <div>
                        <p style="color:red"><%=request.getAttribute("error")%></p>
                    </div>
                        <% }
                            User users = (User)session.getAttribute("user");
                        %>
                        <input type="hidden" name="recipeId" value="<%=recipeId%>">
                        <input type="hidden" name="userId" value="<%=users.getUserId()%>">
                        <input type="hidden" name="typereview" value="commentRecipe">
                        <textarea name="text-comment" id="text-comment" class="text-comment" cols="120" rows="3" required=""></textarea>
                    <input type="submit" class="button_submit" value="Gửi bình luận">
                     </form>
                     <% }
                    else{%>
                    <h2 class="text-heading"><b>Hãy đăng nhập để bình luận! <span><a href="signup-signin.jsp"> Đăng nhập</a></span> </b></h2>
                   <% }
                     %>
            </div>
              <div class="card">
                  <%
                      ReviewGet reviewGet = new ReviewGet();
                      int numberReview = reviewGet.countReviewByRecipeId(Integer.parseInt(recipeId),1);
                      %>
                      <h2 class="mb-5"><b><%=numberReview%> bình luận</b></h2>
                    <ul class="comment-list">
                        <%
                            UserGet userGet = new UserGet();
                            for(Review rev: reviewGet.getListReviewByRecipeId(Integer.parseInt(recipeId))){
                                if(rev.getPostId()==0){
                                 User user = userGet.getUser(rev.getUserIdReview());  %>  
                                
                                
                               
                      <li class="comment">
                        <div class="vcard bio">
                            <img src="images/<%=user.getUserAvatar()%>" alt="Image placeholder">
                        </div>
                        <div class="comment-body">
                            <h3><%=user.getUserName()%></h3>
                          <div class="meta"><%=rev.getReviewDate()%></div>
                          <p><%=rev.getReviewMessenges()%></p>
                        </div>
                      </li>
                            <%}}%>
                    </ul>
             
               </div>
          </div>
          <div class="rightcolumn">
            <div class="card">
              <h2 class="text-heading"><b>Thành phần dinh dưỡng</b></h2>
              <hr>
              <p>Calories: <%=recipe.getRecipeCalories()%>Kcal</p>
              <p>Bổ sung: <%=recipe.getNutritionIngredients()%></p>
            </div>
            <div class="card">
              <h2 class="text-heading"><b>Món liên quan</b></h2>
              <hr>
              <%
                  int categoryId= recipe.getCategoryId();
                  for (Recipe r : recipeGet.getListRecipeRelated(categoryId,Integer.parseInt(recipeId))){
                %>      
              <div class="fakeimg">
                  <a href="CountViewsServlet?recipeId=<%=r.getRecipeId()%>&&views=<%= r.getRecipeViews()+1%>"><img src="images/<%=r.getRecipeImage()%>" alt="ảnh món ăn" class="img-dish-add"></a>
                  <a href="CountViewsServlet?recipeId=<%=r.getRecipeId()%>&&views=<%= r.getRecipeViews()+1%>"class="link-dish"><b><p style="text-align: center;"><%=r.getRecipeName()%></p></b><p></p></a>
              </div>
                 <% }%>
              
             </div>
            </div>
          </div>
        </div> 
        </div>
      </div>
       <jsp:include page="footer.jsp"></jsp:include>
       <a href="#" class="scrollup" style="display: none;">Scroll</a>
           <script src="js/all.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
    </body>
</html>
