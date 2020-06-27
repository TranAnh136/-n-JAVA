<%-- 
    Document   : index
    Created on : May 16, 2020, 8:41:35 PM
    Author     : ACER
--%>

<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Dashboard Admin</title>
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
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
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
            <!--
            <li class="nav-item">
              <a href="#" class="nav-link px-2">
                <i class="material-icons icon"> insert_chart </i
                ><span class="text">Charts</span></a
              >
            </li>
           <li class="nav-item">
              <a href="#" class="nav-link px-2">
                <i class="material-icons icon">
                  settings
                </i>
                <span class="text">Settings</span>
              </a>
            </li>
            
            <li class="nav-item">
              <a href="#" class="nav-link px-2">
                <i class="material-icons icon">
                  pages
                </i>
                    <span class="text">Khóa học</span>
              </a>
            </li>
            -->
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
      <div class="content">
        <main>
            
            
            
            <p></p>
            <p></p>
            <p></p>
            <p></p>
            <p></p>
            <p></p>
            <p></p>
            <p></p>
            <h1 style="text-align: center"><b>TỔNG QUAN</b></h1>
            <jsp:include page="chart.jsp"></jsp:include>
<!--          <div class="container-fluid">
            <div class="row">
              <div class="col-md-4 my-3">
                <div class="bg-mattBlackLight px-3 py-3">
                  <h4 class="mb-2">New Clients</h4>
                  <div class="progress" style="height: 16px;">
                    <div
                      class="progress-bar bg-warning text-mattBlackDark"
                      role="progressbar"
                      style="width: 25%;"
                      aria-valuenow="25"
                      aria-valuemin="0"
                      aria-valuemax="100"
                    >
                      25
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4 my-3">
                <div class="bg-mattBlackLight px-3 py-3">
                  <h4 class="mb-2">New Projects</h4>
                  <div class="progress" style="height: 16px;">
                    <div
                      class="progress-bar bg-info text-mattBlackDark"
                      role="progressbar"
                      style="width: 50%;"
                      aria-valuenow="25"
                      aria-valuemin="0"
                      aria-valuemax="100"
                    >
                      50
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4 my-3">
                <div class="bg-mattBlackLight p-3">
                  <h4 class="mb-2">Completed</h4>
                  <div class="progress" style="height: 16px;">
                    <div
                      class="progress-bar bg-success"
                      role="progressbar"
                      style="width: 80%;"
                      aria-valuenow="25"
                      aria-valuemin="0"
                      aria-valuemax="100"
                    >
                      80
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="bg-mattBlackLight my-2 p-3">
                  Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                  Ratione libero totam rerum eos nam ab perspiciatis voluptatum
                  in. Quidem natus autem quae. Velit accusamus sit, perspiciatis
                  sunt earum tempora veniam.
                </div>
              </div>
              <div class="col-md-6">
                <div class="bg-mattBlackLight my-2 p-3">
                  Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                  Ratione libero totam rerum eos nam ab perspiciatis voluptatum
                  in. Quidem natus autem quae. Velit accusamus sit, perspiciatis
                  sunt earum tempora veniam.
                </div>
              </div>
            </div>
          </div>-->
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
