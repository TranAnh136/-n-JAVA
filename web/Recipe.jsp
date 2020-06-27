<%-- 
    Document   : Recipe
    Created on : May 13, 2020, 9:20:48 AM
    Author     : Pham An
--%>

<%@page import="model.Category"%>
<%@page import="get.CategoryGet"%>
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
            CategoryGet categoryGet = new CategoryGet();
            String categoryId = "1";//mặc định hiển thị món khai vị
            if (request.getParameter("categoryId") != null) {
            categoryId = request.getParameter("categoryId");
         }
    %>
        <section>
		<div class="insert_backgroud_menu" >

		</div>
		<div class="container" style="padding-top: 50px;">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Thực đơn</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                                    <%
                                                        for (Category c : categoryGet.getListCategory()) {
                                                        %>
							
							<div class="panel panel-default">
								<div class="panel-heading">
                                                                    <h4 class="panel-title"><a href="Recipe.jsp?categoryId=<%=c.getCategoryId()%>"><%=c.getCategoryName()%></a></h4>
								</div>
							</div>
                                                                <% }%>
						</div><!--/category-productsr-->
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Công thức</h2>
                                                <%
                                                    int views;
                                                    for(Recipe r: recipeGet.getListRecipeByCategory(Integer.parseInt(categoryId))){
                                                      
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
                                                    
					</div><!--features_items-->
				</div>
			</div>
		</div>
	</section>
        <jsp:include page="footer.jsp"></jsp:include>
        
        <a href="#" class="scrollup" style="display: none;">Scroll</a>
    
    <!-- ALL PLUGINS -->
    <script src="js/all.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
    </body>
</html>
