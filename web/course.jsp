<%-- 
    Document   : course
    Created on : May 28, 2020, 2:27:59 PM
    Author     : Pham An
--%>

<%@page import="model.Chef"%>
<%@page import="get.ChefGet"%>
<%@page import="model.Course"%>
<%@page import="model.CategoryCourse"%>
<%@page import="get.CategoryCourseGet"%>
<%@page import="get.CourseGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Khóa học- Chuẩn cơm mẹ nấu</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/recipe.css" rel="stylesheet">
        <script src="js/modernizer.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%
            CourseGet courseGet = new CourseGet();  
            CategoryCourseGet categoryCourseGet = new CategoryCourseGet();
            ChefGet chefGet = new ChefGet();
            String categoryCourseId = "1";//mặc định hiển thị khóa học làm bánh
            if (request.getParameter("categoryCourseId") != null) {
            categoryCourseId = request.getParameter("categoryCourseId");
         }
    %>
        <section>
		<div class="insert_backgroud_menu" >

		</div>
		<div class="container" style="padding-top: 50px;">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Danh mục</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                                    <%
                                                        for (CategoryCourse c : categoryCourseGet.getListCategoryCourse()) {
                                                        %>
							
							<div class="panel panel-default">
								<div class="panel-heading">
                                                                    <h4 class="panel-title"><a href="course.jsp?categoryCourseId=<%= c.getCategoryCourseId()%>"><%= c.getCategoryCourseName()%></a></h4>
								</div>
							</div>
                                                                <% }%>
						</div><!--/category-productsr-->
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Khóa học</h2>
                                                <%
                                                    
                                                    for(Course c: courseGet.getListCourseByCategory(Integer.parseInt(categoryCourseId))){
                                                      CategoryCourse categoryCourse = categoryCourseGet.getCategoryCourse(Integer.parseInt(categoryCourseId));
                                                      Chef chef = chefGet.getChef(c.getTeacherId());
                                                        %>
                                                    <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
                                                                            <a href="CourseDetail.jsp?courseId=<%=c.getCourseId()%>"><img src="images/<%=c.getCourseImages()%>" alt="" /></a>
                                                                            <h5 class= "name_course_type" style="text-align:left"><%=categoryCourse.getCategoryCourseName()%></h5>
                                                                            <a href="CourseDetail.jsp?courseId=<%=c.getCourseId()%>"><h2 ><%=c.getCourseName()%></h2></a>
                                                                            <p><%=chef.getChefName()%></p>
                                                                            <p><img src="images/address.png" style="width:auto; height:auto" alt=""> <%=c.getCourseAddress()%></p>
                                                                            <p><img src="images/time.png" alt="" style="width:auto; height:auto">  <%=c.getCoursesTimeFinish()%>    <img src="images/clock.png" alt="" style="width:auto; height:auto">  <%=c.getTime()%></p>
                                                                        <a href="CourseDetail.jsp?courseId=<%=c.getCourseId()%>"><button class="buttonsignup" >Đăng ký</button></a>
                                       
									</div>
								</div>
							</div>
						</div>
                                                    <%}%>
                                                    
					</div><!--features_items-->
				</div>
			</div>
		</div>
	</section>
        <jsp:include page="footer.jsp"></jsp:include>
        <a href="#" class="scrollup" style="display: none;">Scroll</a>
        <script src="js/all.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
    </body>
</html>
