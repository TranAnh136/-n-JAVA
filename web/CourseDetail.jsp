<%-- 
    Document   : coursedetail
    Created on : Jun 1, 2020, 9:15:45 AM
    Author     : Pham An
--%>

<%@page import="get.UserGet"%>
<%@page import="model.User"%>
<%@page import="model.CategoryCourse"%>
<%@page import="get.CategoryCourseGet"%>
<%@page import="model.Chef"%>
<%@page import="get.ChefGet"%>
<%@page import="model.Course"%>
<%@page import="get.CourseGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Khóa học chi tiết</title>
        <link rel="stylesheet" href="css/style_detail_dish.css">
        <link rel="stylesheet" href="css/style_review.css">
        <script src="js/modernizer.js"></script>
        <style>
            .modal-body1 {
  padding: 0px;
}
.row-1 {
    padding: 0px;
  max-width: 100%;
  display: flex;
}
.col {
  float: left;
  width: 50%;
}
.col-introduce {
  padding: 15px;
  height: 100%;
  background-color: #ffc037;
}
.col-introduce h3 {
  padding: 10px 0;
}
.col-introduce span {
  padding: 10px 0;
  color: rgb(255, 126, 21);
}
.infor {
  text-align: center;
}
.infor-1 {
  margin: 0;
  padding: 10px 0;
}
.col-1 {
  float: left;
  padding: 15px;
  width: 50%;
}
.buttons {
  float: right;
}
        </style>
        <script>
            if(<%=request.getParameter("status")%>!=null){
                alert("Bạn đã đăng ký lớp học thành công! Thông tin lớp học đã được gửi đến mail của bạn!");
            }
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
         <%
        CourseGet courseGet = new CourseGet();  
        Course course = new Course();
        ChefGet chefGet = new ChefGet();
        Chef chef = new Chef();
        CategoryCourseGet categoryCourseGet = new CategoryCourseGet();
        CategoryCourse  categoryCourse = new CategoryCourse();
    String courseId = "";
     if (request.getParameter("courseId") != null) {
          courseId = request.getParameter("courseId");
          course = courseGet.getCourse(Integer.parseInt(courseId));
          chef = chefGet.getChef(course.getTeacherId());
          categoryCourse = categoryCourseGet.getCategoryCourse(course.getCategoryCourseId());
     }
        %>

        <div class="session-dish-detail">
        <div class="detail-dish">
            <div class="row">
                <br>
                <h3 style="color: white;"><a  href="index.jsp" style ="color:white;">Trang chủ</a> / <a href="course.jsp"style ="color:white;">Khóa học</a> / <%=course.getCourseName()%></h3>
          <div class="leftcolumn">
            <div class="card">
                <div class="img-dish" ><img src="images/<%=course.getCourseImages()%>" alt=""class="piture-dish" ></div>
              
                <h2 class="name-dish"><b><%=course.getCourseName()%></b></h2>
                <h4 class="name-athour"><img src="images/rsz_1pin.png" alt=""> Địa điểm: <%=course.getCourseAddress()%></h4>
                <p class="text-heading"> <img src="images/time.png" alt="">  <%=course.getCoursesTimeStart()%><img src="images/time.png" alt=""> <%=course.getCoursesTimeFinish()%></p>
                <p><%=course.getIntroduce()%></p>
            </div>
            <div class="card">
              <h2 class="text-heading"><b>Thông tin đầu bếp</b></h2><hr>
              <ul class="comment-list">
                <li class="comment">
                  <div class="vcard bio">
                      <img src="images/<%=chef.getImagesChef()%>"alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                      <h3><%=chef.getChefName()%></h3>
                    <div class="meta"> <img src="images/tick.png" alt=""> Đầu bếp tài năng</div>
                    <p><%=chef.getIndoduceChef()%></p>
                    
                  </div>
                </li>
                
              </ul>
               
            </div>
            <div class="card">
              <h2 class="text-heading"><b>Thông tin lớp học</b></h2>
              <hr>
              <h4 class="name-athour"><img src="images/clock.png" alt=""> Thời gian: <%=course.getTime()%></h4>
              <h4 class="name-athour"><img src="images/duration.png" alt=""> Thời lượng: <%=course.getDuration()%> tiếng</h4>
              <p><%=course.getInfomationCourse()%></p>
              <img src="images/<%=course.getImagesCourse1()%>" alt=""class="piture-dish" >
              <p></p>
              <img src="images/<%=course.getImagesCourse2()%>" alt=""class="piture-dish" >

            </div>
            <div class="card">
              <h2 class="text-heading"><b>Tham gia lớp học bạn sẽ được gì?</b></h2>
              <hr>
              <pre class="infor-class"><%=course.getBenifitOfCourse()%></pre>
            </div>
            
          </div>
          <div class="rightcolumn">
            <div class="card">
              <h2 class="text-heading-class"><b>Lớp đang chọn</b></h2>
              <hr />
              <h3>Ngày bắt đầu: <%=course.getCoursesTimeStart()%></h3>
              <h3>Thời gian: <%=course.getTime()%></h3>

             <form action="SignUpCourseServlet?courseId=<%=course.getCourseId()%>" method="post">
           
  
                 <h3>
                  Số lượng:
                  <input
                    type="number"
                    name="numbercourse"
                    class="numbercourse"
                    id ="sl"
                  />
                 
                </h3>
                <button
                  type="button"
                  class="button_submit_dk"
                  data-toggle="modal"
                  data-target=".myModal"
                >
                  Đăng ký
                </button>
                  
                <div
                  class="modal fade myModal"
                  tabindex="-1"
                  role="dialog"
                  aria-labelledby="myLargeModalLabel"
                >
                  <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="modal-body1">
                        <div class="row-1">
                          <div class="col">
                            <div class="col-introduce">
                              <h2 class="infor">THÔNG TIN LỚP HỌC</h2>
                              <span><%= categoryCourse.getCategoryCourseName()%></span>
                              <input type="hidden" name="typeCourse" value="<%= categoryCourse.getCategoryCourseName()%>">
                              <h3><%=course.getCourseName()%></h3>
                              <input type="hidden" name="nameCourse" value="<%=course.getCourseName()%>">
                              <p class="infor-1">Địa điểm: <%=course.getCourseAddress()%></p>
                              <input type="hidden" name="addressCourse" value="<%=course.getCourseAddress()%>">
                              <p class="infor-1">Lớp: <%=course.getTime()%></p>
                              <input type="hidden" name="timeCourse" value="<%=course.getTime()%></">
                              <p class="infor-1" id ="quantity" name ="quantity">  
<!--                                  <script type="text/javascript">
                     quantity= document.forms["fromdk"]["numbercourse"].value;
                    
                      document.getElementById("quantity").innerHTML = "Số lượng: "+ quantity;//chưa được
                  </script>-->
                              </p>
                            </div>
                          </div>
                          <div class="col-1">
                            <h3>THÔNG TIN ĐĂNG KÝ</h3>
                            <%
                                if(session.getAttribute("user")!=null){
                                 User users = (User)session.getAttribute("user");
                                 UserGet userGet = new UserGet();
                                 User user= userGet.getUser(users.getUserId());


                            %>
                            <input type="hidden" name="userId" value="<%=user.getUserId()%>">
                              <label for="name"  >Họ và tên </label><br />
                              <input
                                type="text"
                                id="name"
                                name="nameSignup"
                                value ="<%=user.getUserName()%>"
                                required =""
                              /><br />

                              <label for="name" >Số điện thoại</label><br />
                              <input
                                type="text"
                                id="sdt"
                                name="phoneNumber"
                                value ="<%= user.getUserPhone()%>"
                                 required =""
                              /><br />

                              <label for="name" >Email</label><br />
                              <input
                                type="text"
                                id="email"
                                name="email"
                                value ="<%= user.getUserEmail()%>"
                                 required =""
                              /><br />
                             <%   }
                            else{%>
                                 <label for="name"  >Họ và tên </label><br />
                              <input
                                type="text"
                                id="name"
                                name="nameSignup"
                                 required =""
                              /><br />

                              <label for="name" >Số điện thoại</label><br />
                              <input
                                type="text"
                                id="sdt"
                                name="phoneNumber"
                                 required =""
                              /><br />

                              <label for="name" >Email</label><br />
                              <input
                                type="text"
                                id="email"
                                name="email"
                                 required =""
                              /><br />
                           <% }
                            %>
                               
                              <input
                                type="checkbox"
                                id="cap nhat"
                                name="updateinfor"
                              /><label for="update"
                                >Cập nhật thông tin vào tài khoản</label
                              ><br />

                              <label for="note">Ghi chú</label><br />
                              <textarea type="text" cols="50" rows="4" name ="note" placeholder="Điền thông tin ghi chú về lớp học"></textarea
                              ><br />
                              <div class="buttons">
                                <input
                                  type="submit"
                                  name="submit"
                                  value="Đăng ký"
                                />
                              </div>
                            </form
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
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
