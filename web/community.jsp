<%-- 
    Document   : community
    Created on : May 15, 2020, 7:47:26 PM
    Author     : Nhat Duy
--%>

<%@page import="java.util.StringTokenizer"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="model.Review"%>
<%@page import="get.ReviewGet"%>
<%@page import="model.Recipe"%>
<%@page import="get.RecipeGet"%>
<%@page import="model.User"%>
<%@page import="get.UserGet"%>
<%@page import="model.Post"%>
<%@page import="get.PostGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">

        <!-- Site Metas -->
        <title>Cộng Đồng</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Site Icons -->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Site CSS -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- color -->
        <link id="changeable-colors" rel="stylesheet" href="css/colors/orange.css" />
            <!-- Cộng Đồng CSS -->
        <link rel="stylesheet" href="css/community.css">

        <!-- Modernizer -->
        <script src="js/modernizer.js"></script>

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <div id="gallery" class="gallery-main pad-top-100 pad-bottom-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                        <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s" style="margin-top: 100px">
                            <h2 class="block-title text-center">Cộng Đồng</h2>
                            <p class="title-caption text-center">Nơi chia sẻ và lan tỏa yêu thương</p>
                        </div>

                        <div class=" special-menu">
                            <div class="gal-container clearfix" >
                                <div class="fake-form ">
                                    <div class="offer-item2">
                                        <img src="images/menu-item-thumbnail-01.jpg" alt="" class="img-responsive" style="width: 80px">
                                        <div class="profile " data-toggle="modal" data-target="#myModal">
                                            Chia sẻ món ngon của bạn với cộng đồng ...
                                        </div>
                                    </div>
                                    <div class="blog-btn-v">
                                        <div style="padding: 5px 50px; width: 100%;">
                                             <div style="width: 50%; float: left;">
                                                    <a href="InsertRecipe.jsp" class="hvr-underline-from-center" >Đăng công thức </a>
                                             </div>
                                            <div>
                                                <button class="hvr-underline-from-center" type="button" data-toggle="modal" data-target="#myModal">Đăng hình thực hiện</button>
                                            </div>
                                                
                                        </div>
                                        
                                    </div>
                                </div> 
                            </div>
                            
                            <div class="srf-community modal" id="myModal" style="width: 800px; margin: 60px auto; padding-right: 0;min-height: auto">
                                <div class="modal-header"> 
                                    <div class="modal-title"> 
                                        Chia sẻ công thức & bình luận
                                    </div>
                                    <a class="btn-close" data-dismiss="modal"><img src="images/cancel.png" alt="" class="ico-20"></a>
                                </div>
                                <div class="modal-body">
                                    <div>
                                        <%
                                            UserGet  userGets = new UserGet();
                                            if(session.getAttribute("user")!=null){
                                                User u = (User)session.getAttribute("user");
                                                User us =userGets.getUser(u.getUserId());
                                        %>
                                        <div class="user">
                                            <img src="images/<%=us.getUserAvatar()%>" alt="" class="avt" style="width: 75px; height: 75px">
                                        </div>
                                        
                                        <form action="InsertPostServlet?userId=<%=us.getUserId()%>" method="post" enctype="multipart/form-data">
                                        
                                        <div class="form">
                                            <div class="form-group" style="margin-bottom: 5px">
                                                <div class="attached-recipe">
                                                    <select style="text-align: center; padding: 10px 175px; border: none; font-size: 25px; max-height: 350px; cursor: pointer" name="recipeId">
                                                        <option  value="congthuc">Chọn công thức thực hiện</option>
                                                        <% RecipeGet recipeGets = new RecipeGet();
                                                            for(Recipe r: recipeGets.getListRecipe()){%>
                                                            <option  value="<%=r.getRecipeId()%>"><%=r.getRecipeName()%></option>       
                                                        <%    }
                                                        
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group" style="margin-bottom: 10px">
                                                     <input class="gray-box" name ="postname" placeholder="Tên công thức">
                                            </div>
<!--                                            <div class="form-group" style="margin-bottom: 5px">
                                                <div class="attached-recipe">
                                                    <input type="text" name ="postname" placeholder="Nhập tên bài post">
                                                </div>
                                            </div>-->
                                            
                                            <div class="form-row">
                                                <div style="clear: both" class="attached-photos-container">
<!--                                                    <ul class="sort-able">
                                                        <li>
                                                            <div class="attached-photo">
                                                                <div><img src="images/menu-item-thumbnail-01.jpg" style="width: 77px; height: 77px;">
                                                                </div>
                                                                <a class="remove">+</a>
                                                            </div>
                                                        </li>
                                                    </ul>-->
                                                    <div class=" attached-photo">
                                                            <div class="review-img-upload-box-item" >
                                                                <label for="file" style="margin-bottom: 0">
                                                                    <img src="images/camera3.png" id="preview" style="width: 77px; height: 77px; border-radius: 12px; border: 1px dashed #ddd;">
                                                                </label> 
                                                                <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
                                                                <script>
                                                                    function previewImage() {
                                                                        var file = document.getElementById("file").files;
                                                                        if (file.length > 0) {
                                                                            var fileReader = new FileReader();

                                                                            fileReader.onload = function (event) {
                                                                                document.getElementById("preview").setAttribute("src", event.target.result);
                                                                            };

                                                                            fileReader.readAsDataURL(file[0]);
                                                                        }
                                                                    }
                                                                    
                                                                    function ShowImage(){
                                                                        document.getElementById('x').style.visibility = "visible";
                                                                        
                                                                    }
                                                                </script>   
                                                                <input id="file" name="file" type="file" style="max-height: 0px" accept="image/*" onchange="previewImage();" onclick="ShowImage();"/>
                                                            </div>
                                                            <div class="review-img-upload-box-item" style="background: none">
                                                                <label for="file2" style="margin-bottom: 0">
                                                                    <img id="x" src="images/camera3.png"  style="visibility: hidden; width: 77px;height: 77px; border-radius: 12px; border: 1px dashed #ddd;" />
                                                                </label> 
                                                                <script>
                                                                    function previewImage2() {
                                                                        var file = document.getElementById("file2").files;
                                                                        if (file.length > 0) {
                                                                            var fileReader = new FileReader();

                                                                            fileReader.onload = function (event) {
                                                                                document.getElementById("x").setAttribute("src", event.target.result);
                                                                            };

                                                                            fileReader.readAsDataURL(file[0]);
                                                                        }
                                                                    }
                                                                    
                                                                    
                                                                </script>   
                                                                <input id="file2" name="file2" type="file" style="max-height: 0px" accept="image/*" onchange="previewImage2();" />
                                                            </div>
                                                        </div>
<!--                                                    <div class=" attached-photo">
                                                        <div class="review-img-upload-box-item" >
                                                            <label for="file-input" style="margin-bottom: 0">
                                                                <img src="images/camera2.png" class="img-64">
                                                            </label>
                                                             <input type="file" name="photo" id="file-input" accept="image/*" >
                                                             
                                                        </div>
                                                         <div class="review-img-upload-box-item" >
                                                            <label for="file-input" style="margin-bottom: 0">
                                                                <img src="images/camera2.png" class="img-64">
                                                            </label>
                                                             <input type="file" name="photo1" id="file-input" accept="image/*" >
                                                             
                                                        </div>
                                                    </div>-->
                                                </div>
                                            </div>
                                            <div style="padding-bottom: 10px;">
                                                <div style="display: inline-block;font-size: 12px;padding: 4px 10px;" >
                                                    <select style="padding: 8px 12px;border: 1px dashed #ddd;background: #f6f6f6;border-radius: 12px;" name="servings"> 
                                                        <option value="">Phần ăn</option>
                                                        <option value="1 Phần">1 Phần</option>
                                                        <option value="2 Phần">2 Phần</option>
                                                        <option value="3 Phần">3 Phần</option>
                                                        <option value="4 Phần">4 Phần</option>
                                                        <option value="5 Phần">5 Phần</option>
                                                        <option value="6 Phần">6 Phần</option>
                                                        <option value="7 Phần">7 Phần</option>
                                                        <option value="8 Phần">8 Phần</option>
                                                        <option value="9 Phần">9 Phần</option>
                                                        <option value="10 Phần">10 Phần</option>
                                                        <option value="+10 Phần">+10 Phần</option>
                                                    </select>
                                                </div>
                                                <div style="display: inline-block;font-size: 12px;padding: 4px 10px;">
                                                    <select style="padding: 8px 12px;border: 1px dashed #ddd;background: #f6f6f6;border-radius: 12px;" name="cost">
                                                        <option value="">Chi phí</option>
                                                        <option value="+20.000 đ">+20.000 đ</option>
                                                        <option value="+50.000 đ">+50.000 đ</option>
                                                        <option value="+50.000 đ">+100.000 đ</option>
                                                        <option value="+200.000 đ">+200.000 đ</option>
                                                        <option value="+300.000 đ">+300.000 đ</option>
                                                        <option value="+500.000 đ">+500.000 đ</option>
                                                        <option value="+1.000.000 đ">+1.000.000 đ</option>
                                                    </select>
                                                </div>
                                                <div style="display: inline-block;font-size: 12px;padding: 4px 10px;">
                                                    <select style="padding: 8px 12px;border: 1px dashed #ddd;background: #f6f6f6;border-radius: 12px;" name="level">
                                                        <option value="">Độ khó</option>
                                                        <option value="Dễ">Dễ</option>
                                                        <option value="Trung bình">Trung bình</option>
                                                        <option value="Khó">Khó</option>
                                                        <option value="Rất khó">Rất khó</option>
                                                    </select>
                                                </div>
                                                <div style="display: inline-block;font-size: 12px;padding: 4px 10px;">
                                                    <select style="padding: 8px 12px;border: 1px dashed #ddd;background: #f6f6f6;border-radius: 12px;" name="success">
                                                        <option value="">Mức độ thành công</option>
                                                        <option value="Thất bại">Thất bại</option>
                                                        <option value="Xém thành công">Xém thành công</option>
                                                        <option value="Thành công">Thành công</option>
                                                        <option value="Thành công mỹ mãn">Thành công mỹ mãn</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <textarea class="review-txt gray-box" placeholder="Nội dung bình luận" name="infomationComment"></textarea>
                                            </div>
                                            <div class="acts">
                                                <button class="btn-submit-review" type="submit">Chia sẻ công thức & bình luận</button>
                                            </div>
                                        </div>
                                        </form>        
                                       <%     }
                                        else{%>
                                        <h2>Vui lòng đăng nhập </h2>
                                      <%  }
                                        %>
                                        
                                    </div>
                                </div>
                            </div>
                            <script>
                                            function changeImage() {
                                              var image = document.getElementById('heart');
                                              if (image.src.match("noheart")) {
                                                image.src = "images/heartfull.png";
                                                
                                              } else {
                                                image.src = "images/noheart.png";
                                                
                                              }
                                            }
                                            </script>
                            <div class="gal-container clearfix">
                            <%
                            RecipeGet recipeGet = new RecipeGet();
                            UserGet userGet = new UserGet();
                            PostGet postGet = new PostGet();
                            for(Post post: postGet.getListPost()){
                            User user = userGet.getUser(post.getUserId());
                            Recipe recipe = recipeGet.getRecipe(post.getRecipeId());
                            %>
                            <div class="fake-form">
                                    <div class="offer-item2" style="height: 100px">
                                        <img src="images/<%=user.getUserAvatar()%>" alt="" class="img-responsive" style="width: 80px">
                                        <div class="profile">								
                                            <span>
                                                <b><%=user.getUserName()%></b>
                                            </span>
                                        </div>
                                        <div class="rating">
                                            <span class="date-time rated-date">
                                                <a href="#">
                                                    <cooky-time created-on="1588834422" created-on-text="07/05/2020 13:53:42">
                                                        <p><%=post.getDatePost()%></p>
                                                    </cooky-time>
                                                </a>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6" style="width: 100%">
                                        <div class="blog-block pitem">
                                            <div class="blog-img-box " style="width: 120px">
                                                <img  src="images/<%=recipe.getRecipeImage()%>" alt="" style="border-radius: 12px"/>
                                                <div class="overlay">
                                                    <a href="CountViewsServlet?recipeId=<%=recipe.getRecipeId()%>&&views=<%= recipe.getRecipeViews()+1%>"><i class="fa fa-link" aria-hidden="true"></i></a>
                                                </div>
                                            </div>
                                            <div class="blog-dit2" >
                                                <a class="name" href="CountViewsServlet?recipeId=<%=recipe.getRecipeId()%>&&views=<%= recipe.getRecipeViews()+1%>" target="_blank" title="<%=recipe.getRecipeName()%>"><b><%=recipe.getRecipeName()%></b></a>
                                                <div class="stats">
                                                    <span class="stats-item">
                                                        <span class="stats-count abbr"><%=recipe.getRecipeViews()%></span> lượt xem
                                                    </span>                         
                                                </div>
                                                <div class="desc">
                                                   
                                                    <p style="text-align:justify"><%=recipe.getDescriptionRecipe()%></p>
                                                    <div style="all: unset;">&nbsp;</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="pr-opts ">
                                            <div class="opt2"><span class="text">Chi phí:</span> <%=post.getCost()%></div>
                                            <div class="opt2"><span class="text">Phần ăn:</span> <%=post.getServings()%></div>
                                            <div class="opt2"><span class="text">Độ khó:</span> <%=post.getLevel()%></div>
                                            <div class="opt2"><span class="text">Khả năng thành công:</span> <%=post.getLevelOfSuccess()%></div>
                                        </div>
                                        <div class="content">
                                            <div>
                                                <a  href="#"><h3><b><%=post.getPostName()%></b></h3></a>
                                            </div>
                                            <div>
                                                <%=post.getDescription_post()%>
                                            </div>
                                        </div>
                                        <div class="photos">
                                            <%
                                                String imgPost = post.getPostImages();
                                                StringTokenizer token = new StringTokenizer(imgPost, "*");
                                                while (token.hasMoreTokens()) {

                                             %>  
                                                <div class="pt-image">
                                                    <img src="images/<%=token.nextToken()%>" alt="" style="width: 100%; border-radius: 12px;">
                                                </div>
                                                <%}%>
                                        </div>
                                        <div class="review-acts">
                                            
                                            <%
                                            Post post1 = postGet.getPost(post.getPostId());
                                            %>
                                            
                                            <img class="btn-act" src="images/noheart.png" title="Yêu thích" id="heart" onclick="changeImage()" > <span id="countHeart" style="margin-right: 10px;"><%=post1.getPostHeart()%></span>
                                            <%-- nút chia sẻ facebooknút chia sẻ facebook --%>
                                            
                                            <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v7.0" nonce="gA3WWYWT"></script>

                                            <div class="fb-share-button" data-href="https://www.cooky.vn/cong-thuc/mi-lanh-somen-kieu-nhat-10429/danh-gia/146477?fbclid=IwAR24ZXMFujLoucVyS5qsH3tPh5ljDYSNY8cbgrWjow-h17agtAGUOzNXhPg" data-layout="button" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>
                                            
                                        </div>
                                        <%
                                        ReviewGet reviewGet = new ReviewGet();
                                        for(Review review : reviewGet.getListReviewByPostId(post.getPostId())){
                                        User userreview = userGet.getUser(review.getUserIdReview());
                                        %>
                                        <div class="comment">
                                            <div >
                                                <img src="images/<%=userreview.getUserAvatar()%>" alt="" class="avt2">
                                            </div>
                                            <div class="comment-content">
                                                <div class="comment-head">
                                                    <a href="#"><%=userreview.getUserName()%></a>
                                                    <div  class="date-time time" >
                                                        
                                                        <cooky-time ><%=review.getReviewDate()%></cooky-time>
                                                    </div>
                                                </div>
                                                    <div class="comment2"><%=review.getReviewMessenges()%>
                                                </div>
                                                <div class="review-acts" style="float: left; margin-top: 65px; margin-left: -155px">
                                                </div>
                                            </div>
                                        </div>    
                                        <%}
                                        %>
                                        
                                        <div class="comment3">
                                            <%
                                                UserGet uGet= new UserGet();
                                                if( session.getAttribute("user")!=null){
                                                User users = (User)session.getAttribute("user");
                                                User u = uGet.getUser(users.getUserId());
                                            %>
                                                  <div>
                                                  <img src="images/<%=u.getUserAvatar()%>" alt="" class="avt2" style="margin-right: 6px">
                                                  </div>
                                                  <form action="ReviewServlet?recipeId=<%=recipe.getRecipeId()%>&&userId=<%=u.getUserId()%>&&postId=<%=post.getPostId()%>" method ="post">
                                                  <div>
                                                  <input type="hidden" name="typereview" value="commentPost">
                                                  <input class="d4w79 d129h" type="text" placeholder="Viết bình luận..." required="" name ="text-comment">
                                                  </div>  
                                                  </form>
                                            <%   }
                                            %>
                                           
                                        </div>
                                    </div>
                                </div>    
                           <% }
                            %>
                                
                                
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

        
        <jsp:include page="footer.jsp"></jsp:include>

        <a href="#" class="scrollup" style="display: none;">Scroll</a>

        <!-- ALL JS FILES -->
        <script src="js/all.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- ALL PLUGINS -->
        <script src="js/custom.js"></script>
    </body>
</html>