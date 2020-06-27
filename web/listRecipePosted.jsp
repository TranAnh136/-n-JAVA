<%-- 
    Document   : listRecipePosted
    Created on : May 16, 2020, 5:07:40 PM
    Author     : Pham An
--%>

<%@page import="model.Recipe"%>
<%@page import="get.RecipeGet"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/modernizer.js"></script>
        <link href="css/themeuser.css" rel="stylesheet" type="text/css"> 
    </head>
    <body>
         <jsp:include page="header.jsp"></jsp:include>
        <section class="breadcrumb-bg">                
                <div class="theme-container container ">                       
                    <div class="site-breadcumb">                        
                        <h2 class="section-title"> <span class="light-font"></span> <strong class="clr-txt">Quản lý tài khoản </strong> </h2>
                        <h3 style="color: white;"><a  href="index.jsp" style ="color:white;">Trang chủ</a> / <a href="listRecipePosted.jsp"style ="color:white;">Công thức đã đăng</a></h3>
                    </div>  
                </div>
            </section>
            <!--Breadcrumb Section End-->

            <!-- My Account Starts-->
            <section class="account-page ptb-50">
                <div class="container"> 
                    <div class="row">  
                        <!-- Sidebar Starts --> 
                        <aside class="col-md-3 col-sm-4">
                            <div class="widget-wrap">
                                <h2 class="widget-title"> <span class="light-font">Thông tin </span> <strong>tài khoản</strong> </h2>
                                <div class="divider-full-1"></div>
                                <ul class="cate-widget">
                                    <li> <i class="fa fa-arrow-circle-o-right clr-txt"></i>  <a href="updateAccountInformation.jsp"> Chỉnh sửa thông tin cá nhân </a></li>
                                    <li> <i class="fa fa-arrow-circle-o-right clr-txt"></i> <a href="changePasswordUser.jsp"> Thay đổi mật khẩu</a></li>                                        
                                    <li> <i class="fa fa-arrow-circle-o-right clr-txt"></i> <a href="changeAvatar.jsp"> Thay đổi ảnh đại diện</a></li>
                                    <li> <i class="fa fa-arrow-circle-o-right clr-txt"></i> <a href="listRecipePosted.jsp"> Công thức đã đăng</a></li>
                                    <li> <i class="fa fa-arrow-circle-o-right clr-txt"></i> <a href="InsertRecipe.jsp"> Đăng công thức mới</a></li>
                                    
                                </ul>
                            </div>
                        </aside>   
                        <!-- Sidebar Ends --> 

                        <aside class="col-md-9 col-sm-8 ptb-15">
                         <%
                            User user = (User)session.getAttribute("user");
                            if (user == null) {
                             response.sendRedirect("/chuancommenau/signup-signin.jsp");
                            }
                            int count =0;
                            RecipeGet recipeGet = new RecipeGet();
                            if(recipeGet.getListRecipeByUserId(user.getUserId()).isEmpty()){
                                %>
                                <h2>Bạn chưa đăng bất kỳ công thức nào!</h2>
                            <%}else{%>
                             <table>
                                  <tr>
                                  <th>STT</th>
                                  <th>Tên công thức</th>
                                  <th>Loại công thức</th>
                            </tr>  
                                 <%
                                     for(Recipe recipe: recipeGet.getListRecipeByUserId(user.getUserId())){
                                         %>
                             <tr>
                                 <td><%=count%></td>
                                 <td><%=recipe.getRecipeName()%></td>
                                 <%
                                     String typeRecipe="";
                                     switch(recipe.getCategoryId()){
                                         case 1:  typeRecipe ="Khai vị"; break;
                                         case 2:  typeRecipe ="Món chính"; break;
                                         case 3:  typeRecipe ="Tráng miệng"; break;
                                         case 4:  typeRecipe ="Đồ uống"; break;
                                          default:
                                              break;
                                     }
                                     %>
                                 <td><%=typeRecipe%></td>
                                </tr>   
                            
                            <% count ++;}%>
                                
                              </table>
                                
                            <%}%>
                            
                           
                           
                        </aside>                        
                    </div>
                </div>
            </section>
            <!-- / My Account Ends --> 
            <jsp:include page="footer.jsp"></jsp:include>
            <a href="#" class="scrollup" style="display: none;">Scroll</a>
    <script src="js/all.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
    </body>
</html>
