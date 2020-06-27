<%-- 
    Document   : Header
    Created on : May 13, 2020, 8:01:24 PM
    Author     : Tien Anh
--%>

<%@page import="model.User"%>
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
    <title>header</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Fontawesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css" integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous">


    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    
    <!-- color -->
    <link id="changeable-colors" rel="stylesheet" href="css/colors/orange.css" />

    <!-- Modernizer -->
    
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .search{
  width: 25%;
  box-sizing: border-box;
  border-radius: 12px;
  font-size: 16px;
  background-color: white;
  background-image: url('images/search.png');
  background-position: 10px 10px; 
  background-repeat: no-repeat;
  padding: 12px 20px 12px 40px;
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
  margin-bottom: 5px;
  float:right;
        }
        .search:focus{
            width: 50%;
        }
    </style>
    
</head>
<body>
    <div id="loader">
        <div id="status"></div>
    </div>
    <div id="site-header">
        <header id="header" class="fixed-menu">
            <div class="container">
                <div class="row">
                    <div class="main-menu">
                        <!-- navbar -->
                        <nav class="navbar navbar-default" id="mainNav">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <div class="logo">
                                    <a class="navbar-brand js-scroll-trigger logo-header" href="index.jsp">
                                        <img src="images/logo3.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div id="navbar" class="navbar-collapse collapse">
                                <ul class="nav navbar-nav navbar-right">
                                    <li class="active"><a href="index.jsp">TRANG CHỦ</a></li>
                                    <li><a href="aboutUs.jsp">GIỚI THIỆU</a></li>
                                    <li><a href="Recipe.jsp">CÔNG THỨC</a></li>
                                    <li><a href="community.jsp">CỘNG ĐỒNG</a></li>
                                    <li><a href="course.jsp">KHÓA HỌC</a></li>
                                    <li><a href="contact.jsp">LIÊN HỆ</a></li>
                                    <% 
                                        User user = null;
                                        if(session.getAttribute("user") != null){
                                            user = (User) session.getAttribute("user");
                                        } 
                                    %>
                                      <%if(user!=null){ %>
                                    <li style="font-size: 10px;"><a href="/chuancommenau/myaccount.jsp">Xin chào, <%=user.getUserName() %></a></li>   <li><a href="/chuancommenau/LogoutServlet">THOÁT</a></li><% }%>
                                   
                                      <%if(user==null){ %>
                                      <li style="padding-top: -5px; margin-top: -7px; "><a href="signup-signin.jsp"><i class="fas fa-user-circle fa-2x"></i></a></li> 
                                      <% } %>
                                      
                                </ul>
                            </div>
                                    <form action="SearchRecipeAndCourseServlet" method="POST">
                                        <input type="text" name="search" placeholder="Tìm công thức hoặc khóa học..." class="search">
                                    </form>
                            <!-- end nav-collapse -->
                        </nav>
                        <!-- end navbar -->
                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- end container-fluid -->
        </header>
        <!-- end header -->
    </div>
	<!-- end site-header -->
   
  
    
</body>
</html>
