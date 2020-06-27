<%-- 
    Document   : content
    Created on : May 13, 2020, 8:25:41 PM
    Author     : Anh
--%>

<%@page import="model.CategoryCourse"%>
<%@page import="get.CategoryCourseGet"%>
<%@page import="model.Chef"%>
<%@page import="get.ChefGet"%>
<%@page import="model.Course"%>
<%@page import="get.CourseGet"%>
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
    <title>Chuẩn cơm mẹ nấu</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- color -->
    <link id="changeable-colors" rel="stylesheet" href="css/colors/orange.css" />

    <!-- Modernizer -->
    <script src="js/modernizer.js"></script>
</head>

<body>
    
    <div id="about" class="about-main pad-top-100 pad-bottom-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                        <h2 class="block-title"> Về chúng tôi </h2>
                        <p>Chuẩn Cơm Mẹ Nấu là Website mang đến cho người nội trợ trong gia đình các bí quyết giúp việc nấu ăn hàng ngày sẽ được dễ dàng hơn. Bắt đầu từ việc chuẩn bị nguyên liệu, sơ chế, thiết bị dùng bếp hay chỉ đơn giản là lựa chọn món ăn phù hợp cũng sẽ trở nên nhẹ nhàng hơn bao giờ hết.</p>

                        <p style="color: #000;"><b>Nấu một món ngon sẽ dễ dàng hơn</b></p>

                        <p>Chuẩn Cơm Mẹ Nấu sẽ cố gắng từng ngày một với mong muốn tạo ra một sản phẩm có thể giúp cho những đầu bếp bình thường nhất nấu được các món ăn ngon nhất.<p>

                        <p>Bạn sẽ cảm thấy rất vui khi được tự tay nấu cho gia đình mình thưởng thức những món ăn như thế và đồng thời cảm nhận thành quả mà mình đã làm ra.</p>

                        <p style="color: #000;"><b>Cùng đam mê nấu nướng</b></p>
	    
                        <p>Bạn có thể tìm thấy những người cùng sở thích cùng đam mê, kết nối & và chia sẻ kinh nghiệm cho nhau. Với hy vọng có thể tạo được một sân chơi thật sự cho những người đam mê ẩm thực, đam mê nấu nướng.<p>
                    </div>
                </div>
                <!-- end col -->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                        <div class="about-images">
                            <img class="about-main" src="images/about-main.jpg" alt="About Main Image">
                            <img class="about-inset" src="images/about-inset1.jpg" alt="About Inset Image">
                        </div>
                    </div>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>

    <div class="special-menu pad-top-100 parallax">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                        <h2 class="block-title color-white text-center"> Công thức mới </h2>
                        <h5 class="title-caption text-center"> Hãy cùng Chuẩn cơm mẹ nấu bỏ túi những công thức món ăn mới vô cùng đặc biệt ngày hôm nay nha! </h5>
                    </div>
                    <div class="special-box">
                        <div id="owl-demo">
                            <%
                                RecipeGet recipeGet = new RecipeGet();
                                Recipe recipe1= recipeGet.getRecipe(25);
                                Recipe recipe2= recipeGet.getRecipe(26);
                                Recipe recipe3= recipeGet.getRecipe(27);
                                %>
                            <div class="item item-type-zoom">
                                <a href="CountViewsServlet?recipeId=<%=recipe1.getRecipeId()%>&&views=<%= recipe1.getRecipeViews()+1%>" class="item-hover">
                                    <div class="item-info">
                                        <div class="headline">
                                            <%= recipe1.getRecipeName()%>
                                            <div class="line"></div>
                                            <div class="dit-line">Cà phê bọt biển hay còn gọi là cà phê Dalgona là một món cà phê đang rất hot tại Hàn Quốc.</div>
                                        </div>
                                    </div>
                                </a>
                                <div class="item-img">
                                    <img src="images/<%=recipe1.getRecipeImage()%>" alt="sp-menu">
                                </div>
                            </div>
                            <div class="item item-type-zoom">
                                <a href="CountViewsServlet?recipeId=<%=recipe2.getRecipeId()%>&&views=<%= recipe2.getRecipeViews()+1%>" class="item-hover">
                                    <div class="item-info">
                                        <div class="headline">
                                            <%= recipe2.getRecipeName()%>
                                            <div class="line"></div>
                                            <div class="dit-line">Xôi hoa đậu là món ăn cực hot trên mạng xã hội thời gian vừa qua. Món xôi này xuất phát từ Hàn Quốc, chiếc bánh gốc có tên gọi là Bojagi cake.</div>
                                        </div>
                                    </div>
                                </a>
                                <div class="item-img">
                                    <img src="images/<%=recipe2.getRecipeImage()%>" alt="sp-menu">
                                </div>
                            </div>
                            <div class="item item-type-zoom">
                                <a href="CountViewsServlet?recipeId=<%=recipe3.getRecipeId()%>&&views=<%= recipe3.getRecipeViews()+1%>" class="item-hover">
                                    <div class="item-info">
                                        <div class="headline">
                                            <%= recipe3.getRecipeName()%>
                                            <div class="line"></div>
                                            <div class="dit-line">Lê Chưng Thanh Mát - được dân gian ví như bài thuốc trị ho khan hiệu quả.</div>
                                        </div>
                                    </div>
                                </a>
                                <div class="item-img">
                                    <img src="images/<%=recipe3.getRecipeImage()%>" alt="sp-menu">
                                </div>
                            </div>
                            <div class="item item-type-zoom">
                                <a href="CountViewsServlet?recipeId=<%=recipe1.getRecipeId()%>&&views=<%= recipe1.getRecipeViews()+1%>" class="item-hover">
                                    <div class="item-info">
                                        <div class="headline">
                                            <%= recipe1.getRecipeName()%>
                                            <div class="line"></div>
                                            <div class="dit-line">Cà phê bọt biển hay còn gọi là cà phê Dalgona là một món cà phê đang rất hot tại Hàn Quốc.</div>
                                        </div>
                                    </div>
                                </a>
                                <div class="item-img">
                                    <img src="images/<%=recipe1.getRecipeImage()%>" alt="sp-menu">
                                </div>
                            </div>
                            <div class="item item-type-zoom">
                                <a href="CountViewsServlet?recipeId=<%=recipe2.getRecipeId()%>&&views=<%= recipe2.getRecipeViews()+1%>" class="item-hover">
                                    <div class="item-info">
                                        <div class="headline">
                                            <%= recipe2.getRecipeName()%>
                                            <div class="line"></div>
                                            <div class="dit-line">Xôi hoa đậu là món ăn cực hot trên mạng xã hội thời gian vừa qua. Món xôi này xuất phát từ Hàn Quốc, chiếc bánh gốc có tên gọi là Bojagi cake.</div>
                                        </div>
                                    </div>
                                </a>
                                <div class="item-img">
                                    <img src="images/<%=recipe2.getRecipeImage()%>" alt="sp-menu">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end special-box -->
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end special-menu -->

    <div id="menu" class="menu-main pad-top-100 pad-bottom-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                        <h2 class="block-title text-center">
						Công thức 	
					</h2>
                        <p class="title-caption text-center">Khám phá vô vàng những công thức món ăn tuyệt vời nhất từ những vị đầu bếp tài năng đến những vị đầu bếp tại ra nhiều kinh nghiệm. </p>
                    </div>
                    <div class="tab-menu">
                        <div class="slider slider-nav">
                            <div class="tab-title-menu">
                                <h2>Khai vị</h2>
                                <p> <i class="flaticon-canape"></i> </p>
                            </div>
                            <div class="tab-title-menu">
                                <h2>Món chính</h2>
                                <p> <i class="flaticon-dinner"></i> </p>
                            </div>
                            <div class="tab-title-menu">
                                <h2>Món tráng miệng</h2>
                                <p> <i class="flaticon-desert"></i> </p>
                            </div>
                            <div class="tab-title-menu">
                                <h2>Đồ uống</h2>
                                <p> <i class="flaticon-coffee"></i> </p>
                            </div>
                        </div>
                        <div class="slider slider-single">
                            <div>
                                <%
                                    
                                    for(Recipe r: recipeGet.getList4RecipeByCategory(1)){
                                        %>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
                                    <div class="offer-item">
                                        <a href="CountViewsServlet?recipeId=<%=r.getRecipeId()%>&&views=<%= r.getRecipeViews()+1%>"><img src="images/<%=r.getRecipeImage()%>" alt="" class="img-responsive"></a>
                                        <div>
                                            <a href="CountViewsServlet?recipeId=<%=r.getRecipeId()%>&&views=<%= r.getRecipeViews()+1%>"><h3><%=r.getRecipeName()%></h3></a>
                                            <p>
                                                <span>Công thức bởi: <%= r.getRecipeAuthor()%></span> <br>
                                                <span>Lượt xem:<%=r.getRecipeViews()%></span>
                                            </p>
                                        </div>
                                        <span class="offer-price" style="font-size: 20px;"><%=r.getRecipeCalories()%>kcal</span>
                                    </div>
                                </div>
                                   <%}%>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="reserve-book-btn text-center">
                                       <a href="Recipe.jsp?categoryid=1"><button class="hvr-underline-from-center" type="button"  id="submit">Xem thêm </button></a> 
                                    </div>
                                </div>
                                <!-- end col -->
                            </div>
                             <div>
                                <%
                                    for(Recipe r: recipeGet.getList4RecipeByCategory(2)){
                                        %>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
                                    <div class="offer-item">
                                        <a href="CountViewsServlet?recipeId=<%=r.getRecipeId()%>&&views=<%= r.getRecipeViews()+1%>"><img src="images/<%=r.getRecipeImage()%>" alt="" class="img-responsive"></a>
                                        <div>
                                            <a href="CountViewsServlet?recipeId=<%=r.getRecipeId()%>&&views=<%= r.getRecipeViews()+1%>"><h3><%=r.getRecipeName()%></h3></a>
                                            <p>
                                                <span>Công thức bởi: <%= r.getRecipeAuthor()%></span> <br>
                                                <span>Lượt xem:<%=r.getRecipeViews()%></span>
                                            </p>
                                        </div>
                                        <span class="offer-price" style="font-size: 20px;"><%=r.getRecipeCalories()%>kcal</span>
                                    </div>
                                </div>
                                   <%}%>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="reserve-book-btn text-center">
                                       <a href="Recipe.jsp?categoryid=2"><button class="hvr-underline-from-center" type="button"  id="submit">Xem thêm </button></a> 
                                    </div>
                                </div>
                                <!-- end col -->
                            </div>
                           <div>
                                <%
                                    for(Recipe r: recipeGet.getList4RecipeByCategory(3)){
                                        %>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
                                    <div class="offer-item">
                                        <a href="CountViewsServlet?recipeId=<%=r.getRecipeId()%>&&views=<%= r.getRecipeViews()+1%>"><img src="images/<%=r.getRecipeImage()%>" alt="" class="img-responsive"></a>
                                        <div>
                                            <a href="CountViewsServlet?recipeId=<%=r.getRecipeId()%>&&views=<%= r.getRecipeViews()+1%>"><h3><%=r.getRecipeName()%></h3></a>
                                            <p>
                                                <span>Công thức bởi: <%= r.getRecipeAuthor()%></span> <br>
                                                <span>Lượt xem:<%=r.getRecipeViews()%></span>
                                            </p>
                                        </div>
                                        <span class="offer-price" style="font-size: 20px;"><%=r.getRecipeCalories()%>kcal</span>
                                    </div>
                                </div>
                                   <%}%>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="reserve-book-btn text-center">
                                       <a href="Recipe.jsp?categoryid=3"><button class="hvr-underline-from-center" type="button"  id="submit">Xem thêm </button></a> 
                                    </div>
                                </div>
                                <!-- end col -->
                            </div>
                           <div>
                                <%
                                    for(Recipe r: recipeGet.getList4RecipeByCategory(4)){
                                        %>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
                                    <div class="offer-item">
                                        <a href="CountViewsServlet?recipeId=<%=r.getRecipeId()%>&&views=<%= r.getRecipeViews()+1%>"><img src="images/<%=r.getRecipeImage()%>" alt="" class="img-responsive"></a>
                                        <div>
                                            <a href="CountViewsServlet?recipeId=<%=r.getRecipeId()%>&&views=<%= r.getRecipeViews()+1%>"><h3><%=r.getRecipeName()%></h3></a>
                                            <p>
                                                <span>Công thức bởi: <%= r.getRecipeAuthor()%></span> <br>
                                                <span>Lượt xem:<%=r.getRecipeViews()%></span>
                                            </p>
                                        </div>
                                        <span class="offer-price" style="font-size: 20px;"><%=r.getRecipeCalories()%>kcal</span>
                                    </div>
                                </div>
                                   <%}%>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="reserve-book-btn text-center">
                                       <a href="Recipe.jsp?categoryid=4"><button class="hvr-underline-from-center" type="button"  id="submit">Xem thêm </button></a> 
                                    </div>
                                </div>
                                <!-- end col -->
                            </div>
                        </div>
                    </div>
                    <!-- end tab-menu -->
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end menu -->


    <div id="our_team" class="team-main pad-top-100 pad-bottom-100 parallax">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                        <h2 class="block-title text-center">
						THÀNH VIÊN 	
					</h2>
                        <p class="title-caption text-center">Nhóm chúng tôi gồm 5 thành viên - những chàng trai bản lĩnh, tự tin. </p>
                    </div>
                    <div class="team-box">

                        <div class="row">
                            <div class="col-xs-2 col-half-offset">
                                <div class="sf-team">
                                    <div class="thumb">
                                        <a href="#"><img src="images/Anh.jpg" width="100px" height="250px" alt=""></a>
                                    </div>
                                    <div class="text-col">
                                        <h3>Trần Tiến Anh</h3>
                                        <p>Khoa: Khoa học và kỹ thuật thông tin</p>
                                        <p>Nơi sinh: Bình Phước</p>
                                       
                                        <ul class="team-social">
                                            <li><a href="https://facebook.com/tienanh424"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                            <li><a href="https://linkedin/tienanh424"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- end col -->
                            <div class="col-xs-2 col-half-offset">
                                <div class="sf-team">
                                    <div class="thumb">
                                        <a href="#"><img src="images/Duy.jpg" width="100px" height="250px" alt=""></a>
                                    </div>
                                    <div class="text-col">
                                        <h3>Phạm Nhật Duy</h3>
                                        <p>Khoa: Khoa học và kỹ thuật thông tin</p>
                                        <p>Nơi sinh: Kiên Giang</p>
                                        <ul class="team-social">
                                            <li><a href="https://www.facebook.com/profile.php?id=100006300347905"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- end col -->
                            <div class="col-xs-2 col-half-offset">
                                <div class="sf-team">
                                    <div class="thumb">
                                        <a href="#"><img src="images/an1.jpg" width="100px" height="250px" alt=""></a>
                                    </div>
                                    <div class="text-col">
                                        <h3>Phạm Thuận An</h3>
                                        <p>Khoa: Khoa học và kỹ thuật thông tin</p>
                                        <p>Nơi sinh: Bình Thuận</p>
                                        <ul class="team-social">
                                            <li><a href="https://www.facebook.com/profile.php?id=100012177284557"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- end col -->
                            <div class="col-xs-2 col-half-offset">
                                <div class="sf-team">
                                    <div class="thumb">
                                        <a href="#"><img src="images/duong2.jpg" width="100px" height="250px" alt=""></a>
                                    </div>
                                    <div class="text-col">
                                        <h3>Nguyễn Hữu Dương</h3>
                                        <p>Khoa: Khoa học và kỹ thuật thông tin</p>
                                        <p>Nơi sinh: Vĩnh Phúc</p>
                                        <ul class="team-social">
                                            <li><a href="https://www.facebook.com/profile.php?id=100008391554261"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- end col -->
                            <div class="col-xs-2 col-half-offset">
                                <div class="sf-team">
                                    <div class="thumb">
                                        <a href="#"><img src="images/hao1.jpg" width="100px" height="250px" alt=""></a>
                                    </div>
                                    <div class="text-col">
                                        <h3>Nguyễn Mạnh Hào</h3>
                                        <p>Khoa: Khoa học và kỹ thuật thông tin</p>
                                        <p>Nơi sinh: Đắk Lắk </p>
                                        <ul class="team-social">
                                            <li><a href="https://www.facebook.com/hao34"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div> 
                                </div>
                            </div>
                            <!-- end col -->
                        </div>
                        <!-- end row -->

                    </div>
                    <!-- end team-box -->

                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end team-main -->

    <div id="gallery" class="gallery-main pad-top-100 pad-bottom-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                        <h2 class="block-title text-center">
						Bộ sưu tập	
					</h2>
                        <p class="title-caption text-center"> Tham quan các món ăn đã được thực hiện trong cộng đồng. </p>
                    </div>
                    <div class="gal-container clearfix">
                        <div class="col-md-8 col-sm-12 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#1">
                                    <img src="images/gallery_01.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="1" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="images/gallery_01.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4>Bánh Pizza kiểu Ý.</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#2">
                                    <img src="images/gallery_02.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="2" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="images/gallery_02.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4>Cá hồi kho ngũ quả.</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#3">
                                    <img src="images/gallery_03.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="3" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="images/gallery_03.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4>Lẩu cá kiểu Thái.</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#4">
                                    <img src="images/gallery_04.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="4" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="images/gallery_04.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4>Salad cá ngừ.</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#5">
                                    <img src="images/gallery_05.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="5" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="images/gallery_05.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4>Thực phẩm ăn nhẹ cho buổi tối.</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#9">
                                    <img src="images/gallery_06.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="9" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="images/gallery_06.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4>Món tráng miệng nhà hàng.</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8 col-sm-12 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#10">
                                    <img src="images/gallery_07.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="10" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="images/gallery_07.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4>Cà phê Chanchamayo.</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#11">
                                    <img src="images/gallery_08.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="11" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="images/gallery_08.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4>Hamburger New Zealand.</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#12">
                                    <img src="images/gallery_09.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="12" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="images/gallery_09.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4>Hamburger nhân thịt nướng.</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#13">
                                    <img src="images/gallery_10.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="13" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="images/gallery_10.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4>Cơm thập cẩm Paella - Barcelona.</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end gal-container -->
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end gallery-main -->

    <div id="blog" class="blog-main pad-top-100 pad-bottom-100 parallax">
        <div class="container">
          <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
              <h2 class="block-title text-center">
                Khóa học nấu ăn
              </h2>
              <div class="blog-box clearfix">
                  <%
                      CourseGet courseGet = new CourseGet();
                      ChefGet chefGet = new ChefGet();
                      CategoryCourseGet categoryCourseGet = new CategoryCourseGet();
                      
                      for(Course c: courseGet.getList4Course()){
                          Chef chef= chefGet.getChef(c.getTeacherId());
                          CategoryCourse categoryCourse = categoryCourseGet.getCategoryCourse(c.getCategoryCourseId());
                          %>
                    <div
                  class="wow fadeIn"
                  data-wow-duration="1s"
                  data-wow-delay="0.1s"
                >
                  <div class="col-md-6 col-sm-6">
                    <div class="blog-block">
                      <div class="blog-img-box1">
                          <img src="images/<%=c.getCourseImages()%>" alt="" />
                        <div class="overlay">
                            <a href="CourseDetail.jsp?courseId=<%=c.getCourseId()%>"
                            ><i class="fa fa-link" aria-hidden="true"></i
                          ></a>
                        </div>
                      </div>
                      <div class="blog-dit1">
                          <p><span><%=categoryCourse.getCategoryCourseName()%></span></p>
                        <div class="Khoa-hoc">
                            <h1><%=c.getCourseName()%></h1>
                          <div class="infor">
                              <h4 class="gv">Đầu bếp: <%=chef.getChefName()%></h4>
                              <h4 class="time"><img src="images/time.png" style=" width: 16px; height: 16px;"alt=""> Ngày bắt đầu: <%=c.getCoursesTimeStart()%>  <img src="images/clock.png" style=" width: 16px; height: 16px;"alt=""> <%=c.getTime()%></h4>
                              <h4 class="time"><img src="images/address.png" style=" width: 16px; height: 16px;"alt=""> Địa chỉ: <%=c.getCourseAddress()%></h4>
                           
                          </div>
                        </div>
                        <h5>
                            <%=c.getIntroduce()%>
                        </h5>
                        <a href="CourseDetail.jsp?courseId=<%=c.getCourseId()%>"><button class="buttonsignup" >Đăng ký</button></a>
                      </div>
                    </div>
                  </div>
                  <!-- end col -->
                </div>  
                      <%}%> 
                
                
               
              </div>
              <!-- end blog-box -->
  
              <div class="blog-btn-v">
                <a class="hvr-underline-from-center" href="course.jsp">Xem thêm</a>
              </div>
            </div>
            <!-- end col -->
          </div>
          <!-- end row -->
        </div>
        <!-- end container -->
      </div>
      <!-- end blog-main -->
    <div id="footer" class="footer-main">
        <div class="footer-news pad-top-100 pad-bottom-70 parallax">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                            <h2 class="ft-title color-white text-center"> Góp ý </h2>
                            <p> Mọi thông tin chi tiết và góp ý xin vui lòng gửi thư về địa chỉ E-Mail: help.chuancommenau@gmail.com </p>
                        </div>
                        <form action="mailto:Nhatduy19254@gmail.com" method="post" enctype="text/plain">
                            <input type="email" placeholder="Nhập địa chỉ E-Mail của bạn">
                            <a href="mailto:Nhatduy19254@gmail.com" class="orange-btn"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></a>
                        </form>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end footer-news -->
    </div>    
</body>
</html>
