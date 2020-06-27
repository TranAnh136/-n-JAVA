<%@page import="model.Post"%>
<%@page import="get.PostGet"%>
<%@page import="get.UserGet"%>
<%@page import="model.Review"%>
<%@page import="get.ReviewGet"%>
<%@page import="model.User"%>
<%@page import="java.util.StringTokenizer"%>

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
        Post post = new Post();
        PostGet postGet = new PostGet();  
        
        String post_id = "";
         if (request.getParameter("post_id") != null) {
              post_id = request.getParameter("post_id");
              post = postGet.getPost(Integer.parseInt(post_id));
         }
                %>
        <div class="session-dish-detail">
        <div class="detail-dish">
            <div class="row">
                <br>
                <h3 style="color: white;"><a  href="index.jsp" style ="color:white;">Trang chủ</a> / <a href="Recipe.jsp"style ="color:white;">Công thức</a> / <%= post.getPost_name() %></h3>
          <div class="leftcolumn">
            <div class="card">
                <div class="img-dish" ><iframe class="piture-dish" src="<%=post.getVideo() %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
              
                <h2 class="name-dish"><b><%=post.getPost_name()  %></b></h2>
                <h4 class="name-athour">Tác giả: </h4>
              <p class="text-heading">Giới thiệu:</p>
              <p><%= post.getDescription_post() %></p>
            </div>
            <div class="card">
              <h2 class="text-heading"><b>Nguyên liệu</b></h2>
              <h5 class="text-heading">Phần ăn cho 2 người</h5>
                <ul class="ingredients-food" style="list-style-image: url('images/farm.png')"> 
                    <%
                        String ingredient = post.getIngredient();
                        StringTokenizer token = new StringTokenizer(ingredient, "-");
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
                        String making = post.getMaking();
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
                        <input type="hidden" name="recipeId" value="<%=post_id%>">
                        <input type="hidden" name="userId" value="<%=users.getUserId()%>">
                    <textarea name="text-comment" id="text-comment" class="text-comment" cols="120" rows="3"></textarea>
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
                      int numberReview = reviewGet.countReviewByRecipeId(Integer.parseInt(post_id));
                      %>
                      <h2 class="mb-5"><b><%=numberReview%> bình luận</b></h2>
                    <ul class="comment-list">
                        <%
                            UserGet userGet = new UserGet();
                            for(Review rev: reviewGet.getListReviewByRecipeId(Integer.parseInt(post_id))){
                                User user = userGet.getUser(rev.getUserIdReview());
                                %>
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
                            <%}%>
                    </ul>
             
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
