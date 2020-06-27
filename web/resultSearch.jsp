<%-- 
    Document   : resultSearch
    Created on : Jun 14, 2020, 9:32:01 PM
    Author     : Pham An
--%>

<%@page import="get.ChefGet"%>
<%@page import="get.CategoryCourseGet"%>
<%@page import="model.Chef"%>
<%@page import="model.CategoryCourse"%>
<%@page import="model.Course"%>
<%@page import="get.CourseGet"%>
<%@page import="model.Recipe"%>
<%@page import="get.RecipeGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Công thức- Chuẩn cơm mẹ nấu</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/recipe.css" rel="stylesheet">
        <script src="js/modernizer.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%
            RecipeGet recipeGet = new RecipeGet();  
            CourseGet courseGet = new CourseGet();
            CategoryCourseGet categoryCourseGet = new CategoryCourseGet();
            ChefGet chefGet = new ChefGet();
            String search = "";
            if (request.getParameter("search") != null) {
            search = request.getParameter("search");
         }
    %>
        <section>
		<div class="insert_backgroud_menu" >

		</div>
		<div class="container" style="padding-top: 50px;">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Kết quả tìm kiếm</h2>
						
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Công thức</h2>
                                                <%
                                                    if(recipeGet.getListRecipeSearch(search)!=null){
                                                    for(Recipe r: recipeGet.getListRecipeSearch(search)){
                                                      
                                                        %>
                                                    <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
                                                                            <a href="CountViewsServlet?recipeId=<%=r.getRecipeId()%>&&views=<%= r.getRecipeViews()+1%>"><img src="images/<%=r.getRecipeImage()%>" alt="" /></a>
                                                                            <a href="CountViewsServlet?recipeId=<%=r.getRecipeId()%>&&views=<%= r.getRecipeViews()+1%>"><h2 class= "name_recipe"><%=r.getRecipeName()%></h2></a>
                                                                            <p>Công thức bởi: <%=r.getRecipeAuthor()%></p>
                                                                            <p><img src="images/views.png" style="width:auto; height:auto" alt=""> <%=r.getRecipeViews()%>  <img src="images/enery.png" alt="" style="width:auto; height:auto"><%=r.getRecipeCalories()%>kcal</p>
										
									</div>
								</div>
							</div>
                                                    </div>
                                                    <%}%>    
                                                   <%}
                                                    else{%>
                                                    <h2>Không tìm thấy công thức</h2>
                                                  <%  }
                                                   %>
                                                    
                                                    
					</div><!--features_items-->
				</div>
                                <div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Khóa học</h2>
                                                 <%
                                                    if(courseGet.getListCourseSearch(search)!=null){
                                                        for(Course c: courseGet.getListCourseSearch(search)){
                                                      CategoryCourse categoryCourse = categoryCourseGet.getCategoryCourse(c.getCategoryCourseId());
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
                                                   <% }
                                                    else{%>
                                                    <h2>Không tìm thấy khóa học</h2>
                                                   <% }
                                                   %>
                                                    
                                                    
					</div><!--features_items-->
				</div>
			</div>
		</div>
	</section>
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="js/all.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
    </body>
</html>
