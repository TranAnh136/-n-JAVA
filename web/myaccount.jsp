<%-- 
    Document   : myaccount
    Created on : May 16, 2020, 3:36:23 PM
    Author     : Pham An
--%>

<%@page import="get.UserGet"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý tài khoản</title>
         
        <script src="js/modernizer.js"></script>
        <link href="css/themeuser.css" rel="stylesheet" type="text/css">  
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <section class="breadcrumb-bg">                
                <div class="theme-container container ">                       
                    <div class="site-breadcumb">                        
                        <h2 class="section-title"> <span class="light-font"></span> <strong class="clr-txt">Quản lý tài khoản </strong> </h2>
                        
                        <h3 style="color: white;"><a  href="index.jsp" style ="color:white;">Trang chủ</a> / <a href="myaccount.jsp"style ="color:white;">Thông tin tài khoản</a></h3>                          
                        
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
                            UserGet userGet = new UserGet();
                            User users = userGet.getUser(user.getUserId());
                        %>
                            <div class="comment">
                                  <div class="img-avatar">
                                      <img src="images/<%=users.getUserAvatar()%>" alt="Image placeholder" style="float:left; padding-right: 50px;width: 250px;height:250px">
                                  </div>
                                  <div class="user-infomation" style="padding-top: 50px;" >
                                      <h2><strong><%=users.getUserName()%></strong></h2>
                                      <p><img src="images/email.png" style=" width: 16px; height: 16px;"alt=""><span> Email: <%=users.getUserEmail()%></span> </p>
                                      <p><img src="images/phone.png" style=" width: 16px; height: 16px;"alt=""><span> Số điện thoại: <%=users.getUserPhone()%></span></p>
                                      <p><img src="images/address.png" style=" width: 16px; height: 16px;"alt=""><span> Địa chỉ: <%=users.getUserAddress()%></span></p>
                                  </div>
                                <div class="pt-15 col-sm-12" style="padding-left: 39%;">                                               
                                    <a href="updateAccountInformation.jsp"><button class="theme-btn btn-black" > <b> Chỉnh sửa thông tin </b> </button> </a>                                           
                            </div>
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
