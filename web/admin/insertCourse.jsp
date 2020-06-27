<%-- 
    Document   : insertCourse
    Created on : May 31, 2020, 4:41:41 PM
    Author     : ACER
--%>



<%@page import="model.Admin"%>
<%@page import="model.Admin"%>
<%@page import="model.Chef"%>
<%@page import="get.ChefGet"%>
<%@page import="get.CategoryCourseGet"%>
<%@page import="model.CategoryCourse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm khóa học</title>
         <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css"
            integrity="sha256-L/W5Wfqfa0sdBNIKN9cG6QA5F2qx4qICmU2VgLruv9Y="
            crossorigin="anonymous"
          />

        <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css"
          integrity="sha256-x8PYmLKD83R9T/sYmJn1j3is/chhJdySyhet/JuHnfY="
          crossorigin="anonymous"
        />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="css/insertCourse.css">
     <link rel="stylesheet" href="css/style-dash.css" />
    
    </head>
    <body>
        <%
            Admin useradmin = (Admin) session.getAttribute("useradmin");
            if (useradmin == null) {
                response.sendRedirect("/chuancommenau/admin/login.jsp");
            }
        %>
         <nav class="navbar navbar-expand-lg navbar-dark bg-mattBlackLight fixed-top">
      <button class="navbar-toggler sideMenuToggler" type="button">
        <span class="navbar-toggler-icon"></span>
      </button>

      <a class="navbar-brand"  href="/chuancommenau/index.jsp"><img src="img/logo3.png" height="35px"></a>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
          <a class="navbar-brand"  href="/chuancommenau/index.jsp"><img src="img/logo3.png" ></a>
        <span class="navbar-toggler-icon"></span>
      </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle p-0"
              href="#"
              id="navbarDropdown"
              role="button"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              <i class="material-icons icon">
                person
              </i>
              <span class="text"><%if(useradmin!=null){ %>Chào <%=useradmin.getAdminName()%> <% } %>
              </span>
            </a>
            <div
              class="dropdown-menu dropdown-menu-right"
              aria-labelledby="navbarDropdown"
            >
              <a class="dropdown-item" href="/chuancommenau/LogoutAdminServlet">Đăng xuất</a>
              
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <div class="wrapper d-flex">
      <div class="sideMenu bg-mattBlackLight">
        <div class="sidebar">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a href="index.jsp" class="nav-link px-2">
                <i class="material-icons icon">
                  dashboard
                </i>
                  <span class="text">
                     Tổng quan
                  </span>
              </a>
            </li>
            <li class="nav-item">
              <a href="manage_recipe.jsp" class="nav-link px-2">
                <i class="material-icons icon">
                    pages
                </i>
                <span class="text">Quản lý công thức</span>
              </a>
            </li>
            <li class="nav-item">
              <a href="manage_course.jsp" class="nav-link px-2">
                <i class="material-icons icon">
                  computer
                </i>
                <span class="text">Khóa học</span>
              </a>
            </li>
             <li class="nav-item">
              <a href="manage_recipe_user.jsp" class="nav-link px-2 sideMenuToggler">
                <i class="material-icons icon expandView ">
                  view_list
                </i>
                <span class="text">Duyệt công thức</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
      <div class="content" style="background-color: white;">
        <main>            
            <p></p>
            <p></p>
            <p></p>
            <p></p>
            <p></p>
            <p></p>
            <p></p>
            <p></p>
            <div style="background-color: #2D4435">
       <h1 style="margin-top: 30px;background-color: white;text-align: center;font-weight: bold;">THÊM KHÓA HỌC</h1>
    <%
        CategoryCourseGet categoryCourseGet = new CategoryCourseGet();
        ChefGet chefGet = new ChefGet();
        %>
    <div style="margin: auto;padding: auto;width: 40%;color: white;">
        <form action="/chuancommenau/ManageCourse?command=insert" method="post"  enctype="multipart/form-data">
        <label for="namecourse"><b>Tên khóa học</b></label><br>
        <input type="text" id="namecourse" name="namecourse" ><br>
        <div>
            <div class="w3-half">
                <label for="datestart"><b>Ngày bắt đầu khóa học</b> </label><br>
                <input type="date" name="datestart" id="datestart"><br>
            </div>
            <div class="w3-half">
                <label for="datesfinish"><b>Ngày kết thúc khóa học</b> </label><br>
                <input type="date" name="datesfinish" id="datesfinish"><br>
            </div>
        </div>
        <div>
            <div class="w3-half">
                <label for="time"><b>Thời gian lớp học</b> </label><br>
                <input type="time" name="time" id="time"><br>
            </div>
            <div class="w3-half">
                <label for="duration"><b>Thời lượng lớp học</b> </label><br>
                <input type="text" name="duration" id="duration"/><br>
            </div>
        </div>

        
        <label for="typecourse"><b>Chọn loại khóa học</b> </label><br>
        <select id="typecourse" name="typecourse">
            <%
            for(CategoryCourse ca: categoryCourseGet.getListCategoryCourse()){%>
            <option value="<%=ca.getCategoryCourseId()%>"><%=ca.getCategoryCourseName()%></option>   
                
          <% } %>
        </select><br>
        <label for="chef"><b>Chọn giáo viên</b> </label><br>
        <select id="chef" name="chef">
            <%
            for(Chef chef : chefGet.getListChef()){%>
            <option value="<%=chef.getChefId()%>"><%=chef.getChefName()%></option>
           <%} %>
        </select><br>
        <label for="imagescourse"><b>Chọn ảnh đại diện cho khóa học</b> </label><br>
        <input type="file"  name="imagescourse"><br><br>
        <label for="introduction"><b>Nội dung giới thiệu khóa học</b> </label><br>
        <textarea rows="4" cols="20" name="introduction" class="introduction"></textarea><br>
        
        <label for="informationcourse"><b>Thông tin về lớp học</b> </label><br>
        <textarea rows="4" cols="20" name="informationcourse" class="informationcourse"></textarea><br>
        <label for="introduction"><b>Địa chỉ khóa học</b> </label><br>
        <textarea rows="4" cols="20" name="addressCourse" class="introduction"></textarea><br>
        <label for="imagesclass"><b>Ảnh về giới thiệu về lớp học</b> </label><br>
        <input type="file" name="imagesclass1" id="imagesclass1"><br>
        <input type="file" name="imagesclass2" id="imagesclass2"><br>
        <label for="benifit"><b>Thông tin lợi ích về lớp học</b> </label><br>
        <textarea rows="4" cols="20" name="benifit" class="benifit"></textarea><br>
       
        <input type="reset" value="Làm mới" class="buttreset">
        <input type="submit" value="Thêm khóa học" class="buttsubmit">
      </form></div>
          
            </div> 
            
             </main>
      </div>
    </div>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"
      integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.bundle.min.js"
      integrity="sha256-OUFW7hFO0/r5aEGTQOz9F/aXQOt+TwqI1Z4fbVvww04="
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"
      integrity="sha256-qE/6vdSYzQu9lgosKxhFplETvWvqAAlmAuR+yPh/0SI="
      crossorigin="anonymous"
    ></script>
    </body>
</html>
