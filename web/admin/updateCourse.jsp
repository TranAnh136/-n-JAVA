<%-- 
    Document   : updateRecipe
    Created on : Jun 2, 2020, 9:14:22 PM
    Author     : ACER
--%>
<%@page import="model.CategoryCourse"%>
<%@page import="get.ChefGet"%>
<%@page import="get.CategoryCourseGet"%>
<%@page import="model.Chef"%>
<%@page import="model.Course"%>
<%@page import="java.util.ArrayList"%>
<%@page import="get.CourseGet"%>
<%@page import="model.Recipe"%>
<%@page import="get.RecipeGet"%>
<%@page import="model.Admin"%>
<%@page import="model.Category"%>
<%@page import="get.CategoryGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật khóa học</title>
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
        <link rel="stylesheet" href="css/style-dash.css" />
    </head>
    <body>
         <%
            Admin useradmin = (Admin) session.getAttribute("useradmin");
            if (useradmin == null) {
                response.sendRedirect("/chuancommenau/admin/login.jsp");
            }
        %>   
        <% 
        CourseGet courseGet = new CourseGet();
        Course course = courseGet.getCourse(Integer.parseInt(request.getParameter("course_id")));
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
                <h3  align="center" style="margin-top: 30px;background-color: white;"><b>CẬP NHẬT KHÓA HỌC</b></h3>
                <form  action="/chuancommenau/UpdateCourseServlet" method="post" enctype="multipart/form-data">
                    <table width="100%" style="margin-left: 380px;background-color: #2D4435;color: white;">
                      <tr>
                            <td width="125px">
                                <b>Mã khóa học</b>
                            </td>
                            <td>
                                <input type="text" size="50" name="coId" value="<%=course.getCourseId()%>" >
                            </td>
                        </tr>
                        <tr>
                            <td width="125px">
                                <b>Tên khóa học</b>
                                <br><br>
                            </td>
                            <td>
                                <input type="text" name="courseName" size="50" value="<%=course.getCourseName()%>">
                            </td>  
                        </tr>
                        <tr>
                            <td>
                                <b>Ngày bắt đầu</b>
                                <br><br>
                            </td>
                            <td>
                                <input type="date" size="50" name="TimeStart" value="<%=course.getCoursesTimeStart()%>" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Ngày kết thúc</b>
                                <br><br>
                            </td>
                            <td>
                             <input type="date" size="50" name="TimeFinish" value="<%=course.getCoursesTimeFinish()%>" >
                            </td>
                        </tr>
                        <%
                        CategoryCourseGet categoryCourseGet = new CategoryCourseGet();
                        ChefGet chefGet = new ChefGet();
                        %>
                        <tr>
                            <td>
                                <b>Mã loại khóa học</b>
                                <br><br>
                            </td>
                            <td>
                            <select id="typecourse" name="catecourse">
                                <%
                                CategoryCourseGet categoryCourseGet1 = new CategoryCourseGet();
                                CategoryCourse cate = categoryCourseGet1.getCategoryCourse(course.getCategoryCourseId());%>
                                <option value="<%=cate.getCategoryCourseId()%>" selected=""><%=cate.getCategoryCourseName()%></option>
                                <%for(CategoryCourse ca: categoryCourseGet.getListCategoryCourse()){%>
                                <option value="<%=ca.getCategoryCourseId()%>"><%=ca.getCategoryCourseName()%></option>   

                              <% } %>
                            </select><br>
                            <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Địa chỉ</b>
                                <br><br>
                            </td>
                            <td>
                                <input type="text"  name="addresscousre" size="50" value="<%=course.getCourseAddress()%>">
                            <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Mã giáo viên</b>
                                <br><br>
                            </td>
                            <td>
                                <select id="chef" name="chefcourseId">
                                    <%
                                        ChefGet chefGet1= new ChefGet();
                                        Chef c = chefGet1.getChef(course.getTeacherId());%>
                                    <option value="<%=c.getChefId()%>" selected=""><%=c.getChefName()%></option>
                                   <% for(Chef chef : chefGet.getListChef()){%>
                                    <option value="<%=chef.getChefId()%>"><%=chef.getChefName()%></option>
                                   <%} %>
                                </select><br>
                            <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Ảnh đại diện khóa học</b>
                                <br><br>
                            </td>
                           <td>
                                <img  name="courseImages" size="50" src="../images/<%=course.getCourseImages()%>">
                                 <input type="file" id="imagescourse" name="imagescourse">
                            <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Giới thiệu khóa học</b>
                                <br><br>
                            </td>
                            <td>
                                <textarea cols="100" rows="5" name="introducecorse" ><%=course.getIntroduce()%>"</textarea>
                            <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Thời gian học</b>
                                <br><br>
                            </td>
                            <td>
                                   <input type="time" name="timecourse" size="50" value="<%=course.getTime()%>">
                            <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Thời lượng</b>
                                <br><br>
                            </td>
                            <td>
                                 <input type="text" name="durationcourse" size="50" value="<%=course.getDuration()%>">
                            <br><br>
                            <br><br>
                            </td>
                        </tr>
                      <br><br>
                        <tr>
                            <td>
                                <b>Thông tin khóa học</b>
                                <br><br>
                            </td>
                            <td>
                                <textarea cols="100" rows="5" name="courseInfor" ><%=course.getInfomationCourse()%></textarea>
                                <br>
                                <br>
                            </td>
                        </tr>
                             <br><br>
                        <tr>
                            <td>
                                <b>Lợi ích khóa học</b>
                                <br><br>
                            </td>
                            <td>
                                <textarea cols="100" rows="5" name="courseBenit" ><%=course.getBenifitOfCourse()%></textarea>
                                <br>
                                <br>
                            </td>
                        </tr>
                            <tr><td></td><td>
<!--                                    <input type="hidden" name="recipe_id" value="<%=request.getParameter("recipe_id")%>">-->
                                <button type="submit" value="update" name="command">Cập nhật</button>
<!--                                <input type="hidden" name="command" value="insert">
                                <input type="submit" class="button" value="Thêm công thức" />-->
                                <br><br>
                            </td></tr>
                    </table>
                </form>    
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

