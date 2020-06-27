<%-- 
    Document   : updateAccountInformation
    Created on : May 16, 2020, 4:01:22 PM
    Author     : Pham An
--%>

<%@page import="get.UserGet"%>
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
                          <h3 style="color: white;"><a  href="index.jsp" style ="color:white;">Trang chủ</a> / <a href="updateAccountInformation.jsp"style ="color:white;">Chỉnh sửa thông tin cá nhân</a></h3>
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
                            UserGet userGet = new UserGet();
                            User users = userGet.getUser(user.getUserId());
                        %>
                            <div class="account-wrap cart-box">
                                <form class="gray-control" action="UserServlet" method="POST">
                                    <div class="row">
                                         <input type="hidden" name="user_id" value="<%=users.getUserId()%>">
                                        <div class="form-group col-sm-6">
                                            <label> * Họ và tên </label>
                                            <input type="text" class="form-control" name ="user_name" required="" value ="<%=users.getUserName()%>">                                               
                                        </div>
                                         <div class="form-group col-sm-6">
                                            <label> * Email </label>
                                            <input type="text" class="form-control" name ="user_email" required="" value="<%=users.getUserEmail()%>">                                               
                                        </div>     
                                        <input type="hidden" name="user_pass" value="<%=users.getUserPass()%>">
                                        <input type="hidden" name="user_avatar" value="<%=users.getUserAvatar()%>">
                                         <div class="form-group col-sm-6">
                                            <label> Số điện thoại </label>
                                            <input type="text" class="form-control" name ="user_phone" required="" value="<%=users.getUserPhone()%>">                                               
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label> Địa chỉ</label>
                                            <input type="text" class="form-control" name ="user_address" value="<%=users.getUserAddress()%>" >                                               
                                        </div>
                                        <div class="pt-15 col-sm-12">  
                                            <input type="hidden" value="update" name="command">
                                            <button type="submit" class="theme-btn btn-black"> <b> Cập nhật </b> </button>                                            
                                        </div>
                                    </div>
                                </form>
                            </div>
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
