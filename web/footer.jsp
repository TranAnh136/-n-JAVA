<%-- 
    Document   : footer
    Created on : May 13, 2020, 8:09:57 PM
    Author     : Pham An
--%>

<%@page import="model.Recipe"%>
<%@page import="get.RecipeGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
    <!-- Site Metas -->
    <title>footer</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- color -->
    <link id="changeable-colors" rel="stylesheet" href="css/colors/orange.css" />
     <!-- Modernizer -->
    <script src="js/modernizer.js"></script>
</head>
<body>
    
        <div class="footer-box pad-top-70">
            <div class="container">
                <div class="row">
                    <div class="footer-in-main">
                        <div class="footer-logo">
                            <div class="text-center">
                                <img src="images/logo.png" alt="" />
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-box-a">
                                <h3>Giới thiệu</h3>
                                <p>"Chuẩn cơm mẹ nấu" là nơi cung cấp vô vàng những công thức nấu các món ăn ngon. Ngoài ra, hãy kết nối với chúng tôi thông qua các dịch vụ mạng xã hội.</p>
                                <ul class="socials-box footer-socials pull-left">
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border"><i class="fa  fa-facebook"></i></div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border"><i class="fa fa-twitter"></i></div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border"><i class="fa fa-google-plus"></i></div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border"><i class="fa fa-pinterest"></i></div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border"><i class="fa fa-linkedin"></i></div>
                                        </a>
                                    </li>
                                </ul>

                            </div>
                            <!-- end footer-box-a -->
                        </div>
                        <!-- end col -->
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-box-b">
                                <h3>Công thức mới</h3>
                                 <%
                                RecipeGet recipeGet = new RecipeGet();
                                Recipe r1= recipeGet.getRecipe(25);
                                Recipe r2= recipeGet.getRecipe(26);
                                Recipe r3= recipeGet.getRecipe(27);
                                %>
                                <ul>
                                    <li><a href="CountViewsServlet?recipeId=<%=r1.getRecipeId()%>&&views=<%= r1.getRecipeViews()+1%>"><%=r1.getRecipeName()%></a></li>
                                    <li><a href="CountViewsServlet?recipeId=<%=r2.getRecipeId()%>&&views=<%= r2.getRecipeViews()+1%>"><%=r2.getRecipeName()%></a></li>
                                    <li><a href="CountViewsServlet?recipeId=<%=r3.getRecipeId()%>&&views=<%= r3.getRecipeViews()+1%>"><%=r3.getRecipeName()%></a></li>
                                </ul>
                            </div>
                            <!-- end footer-box-b -->
                        </div>
                        <!-- end col -->
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-box-c">
                                <h3>Liên hệ</h3>
                                <p>
                                    <i class="fa fa-map-signs" aria-hidden="true"></i>
                                    <span>Khu phố 6, phường Linh Trung, quận Thủ Đức, TPHCM</span>
                                </p>
                                <p>
                                    <i class="fa fa-mobile" aria-hidden="true"></i>
                                    <span>
									+84 123 456 789
								</span>
                                </p>
                                <p>
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <span><a href="#">help.chuancommenau@gmail.com</a></span>
                                </p>
                            </div>
                            <!-- end footer-box-c -->
                        </div>
                        <!-- end col -->
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-box-b">
                                <h3>Bạn quan tâm</h3>
                                <ul>
                                    <li><a href="community.jsp">Cộng đồng chia sẻ</a></li>
                                    <li><a href="course.jsp">Khóa học nấu ăn</a></li>
                                </ul>
                            </div>
                            <!-- end footer-box-d -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end footer-in-main -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
            <div id="copyright" class="copyright-main">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <h6 class="copy-title"> Copyright &copy; 2020 Chuẩn cơm mẹ nấu <a href="#" target="_blank"></a> </h6>
                        </div>
                    </div>
                    <!-- end row -->
                </div>
                <!-- end container -->
            </div>
            <!-- end copyright-main -->
        </div>
        <!-- end footer-box -->
    
  
</body>
</html>
