<%-- 
    Document   : contact
    Created on : May 15, 2020, 9:14:14 PM
    Author     : Nhat Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Liên hệ</title>
        <link rel="stylesheet" href="css/contact/main.css">
        <link rel="stylesheet" href="css/contact/form.css">
        <link rel="stylesheet" href="css/contact/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        
        <!-- Modernizer -->
        <script src="js/modernizer.js"></script>
    </head>
    <body>
        
        <jsp:include page="header.jsp"></jsp:include>
        
        <main role="main">
            <div>
              <div class="hero hero--map">
                <div class="hero__wrapper">
                    <div class="contact1" style="background-image: url(css/contact/images/contact-bg.jpg); opacity: 1; margin-top: 100px; background-size: cover;">
                        <form class="contact1-form validate-form" action="ContactServlet" method="post">
                        <h2 class="contact1-form-title" style="color: #e75b1e; font-family: Lobster; font-size: 36px; padding-top: 30px;">
                          Liên hệ
                        </h2>

                        <div class="wrap-input1 validate-input" data-validate = "Name is required">
                          <input class="input1" type="text" name="name" placeholder="Họ và tên">
                          <span class="shadow-input1"></span>
                        </div>

                        <div class="wrap-input1 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                          <input class="input1" type="text" name="email" placeholder="Email">
                          <span class="shadow-input1"></span>
                        </div>

                        <div class="wrap-input1 validate-input" data-validate = "Subject is required">
                          <input class="input1" type="text" name="subject" placeholder="Chủ đề">
                          <span class="shadow-input1"></span>
                        </div>

                        <div class="wrap-input1 validate-input" data-validate = "Message is required">
                          <textarea class="input1" name="message" placeholder="Nội dung"></textarea>
                          <span class="shadow-input1"></span>
                        </div>

                        <div class="container-contact1-form-btn">
                            <button class="contact1-form-btn" type="submit">
                            <span>
                              GỬI NGAY
                              <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                            </span>
                          </button>
                        </div>
                      </form>
                    </div>
                  <!-- End Form -->
                </div>
              </div>
            </div>

            <div class="wrapper" style="margin-top: 4em;">
              <div class="hang">
                <div class="column">
                  <span id="hs_cos_wrapper_right_column" class="hs_cos_wrapper hs_cos_wrapper_widget hs_cos_wrapper_type_rich_text" data-hs-cos-general-type="widget" data-hs-cos-type="rich_text">
                    <h2 class="h2style" style="margin-top: 10px; text-align: center; color: #e75b1e; font-weight: bold; font-family: Lobster;">Chuẩn Cơm Mẹ Nấu
                    </h2>

                    <h2 class="h2style" style="text-align: center; margin-top: 13px; font-weight: bold; font-family: Lobster; color: #255388 !important;">Chất lượng từ sự đơn giản</h2>

                    <p style="text-align: justify; margin: 20px 0px 16px; color: #333; font-size: 18px;">Bạn dành quá nhiều thời gian cho việc lựa chọn các món ăn. Bạn băn khoăn tìm kiếm nơi hướng dẫn cách thức nấu ăn ngon, đơn giản đồng thời đảm bảo dinh dưỡng cho sức khỏe. Hãy đến ngay với Chuẩn Cơm Mẹ Nấu. Chúng tôi sẽ giúp bạn mang đến cho gia đình những bữa cơm thực sự tuyệt vời!</p>
                  </span>
                </div>

                <div class="column column-contact">
                  <span id="hs_cos_wrapper_contact_column" class="hs_cos_wrapper hs_cos_wrapper_widget hs_cos_wrapper_type_rich_text" data-hs-cos-general-type="widget" data-hs-cos-type="rich_text">
                      <h3 class="h3style" style="font-weight: bold; font-family: Lobster;">Địa chỉ</h3>
                      <p style="color: #333; font-size: 18px; margin: 0px 0px 16px;">
                          <i class="fa fa-map-signs" aria-hidden="true"></i>
                          <span>Ký túc xá khu A, Đại học quốc gia Thành phố Hồ Chí Minh</span>
                            <br>
                            <span style="padding-left: 23.5px;">Khu phố 6, phường Linh Trung, quận Thủ Đức, Hồ Chí Minh</span>
                      </p>

                    <h3 class="h3style" style="font-family: Lobster; font-weight: bold;">Thông tin liên hệ</h3>
                    
                    <span style="font-size: 20px; padding-right: 5px;"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                    <span><a href="mailto:support@chuancommenau.com" style="color: #255388; font-size: 18px;">help.chuancommenau@gmail.com</a></span>
                    
                    <br>
                    <span style="font-size: 20px; padding-left: 5px; padding-right: 10px;"><i class="fa fa-mobile" aria-hidden="true"></i></span>
                    <span><a href="tel:0123456789" style="color: #255388; font-size: 18px;">(+84) 123-456-789</a></span>
                  </span>

                  <h3 class="h3style" style="margin-top: 15px; margin-bottom: 7px; font-family: Lobster; font-weight: bold;">
                    Mạng xã hội
                  </h3>
                  <!-- <div class="footer-contact footer-contact-social"> -->
                  <div class="contact-social">
                    <ul class="socials-box footer-socials pull-left" style="margin: 0px 0px 0px -7px; padding-left: 0px; color: #255388;">
                      <li>
                          <a href="#">
                              <div class="social-circle-border" style="color: #255388;"><i class="fa  fa-facebook"></i></div>
                          </a>
                      </li>
                      <li>
                          <a href="#">
                              <div class="social-circle-border" style="color: red;"><i class="fa fa-google-plus"></i></div>
                          </a>
                      </li>
                      <li>
                          <a href="#">
                              <div class="social-circle-border" style="color: #255388;"><i class="fa fa-twitter"></i></div>
                          </a>
                      </li>
                      <li>
                          <a href="#">
                              <div class="social-circle-border" style="color: red;"><i class="fa fa-pinterest"></i></div>
                          </a>
                      </li>
                      <li>
                          <a href="#">
                              <div class="social-circle-border" style="color: #255388;"><i class="fa fa-linkedin"></i></div>
                          </a>
                      </li>
                    </ul>
                  </div>

                </div>
              </div>
            </div>

          <!-- Blog listing -->
            <div class="wrapper blog-listing-2019" style="margin-top: 4em; margin-bottom: 2.5em;">
              <div id="hs_cos_wrapper_module_158213585785312" class="hs_cos_wrapper hs_cos_wrapper_widget hs_cos_wrapper_type_module" style="" data-hs-cos-general-type="widget" data-hs-cos-type="module">
                <div class="blog-grid">

                  <article class="blog-grid-item blog-grid-item__post">
                    <a href="signup-signin.jsp">
                      <div class="post-image__container">
                        <div class="post-image background" style="background-image:url(css/contact/images/guest-blogging-image-1-1-1-1-1.png)"></div>
                      </div>
                      <div class="post-content__container">
                          <h2 class="resrouce-title" style=" font-size: 24px;">Đăng bài hướng dẫn?</h2>
                        <p class="custom-topic resource-subtitle">Chia sẻ kinh nghiệm nấu ăn với mọi người.</p>
                      </div>
                        <span class="hs-button legitRipple" style=" font-size: 20px; color: #fff;">
                        ĐĂNG KÝ
                      </span>
                    </a>
                  </article>

                  <article class="blog-grid-item blog-grid-item__post">
                    <a href="Recipe.jsp">
                      <div class="post-image__container">
                        <div class="post-image background" style="background-image:url(css/contact/images/job-application-image-1-1.png)"></div>
                      </div>
                      <div class="post-content__container">
                          <h2 class="resrouce-title" style=" font-size: 24px;">Tìm kiếm công thức?</h2>
                        <p class="custom-topic resource-subtitle">Tìm kiếm các công thức món ăn được cung cấp.</p>
                      </div>
                        <span class="hs-button legitRipple" style=" font-size: 20px; color: #fff;">
                        TÌM KIẾM
                      </span>
                    </a>
                  </article>

                  <article class="blog-grid-item blog-grid-item__post">
                    <a href="course.jsp">
                      <div class="post-image__container">
                        <div class="post-image background" style="background-image:url(css/contact/images/project-work-image-1.png)"></div>
                      </div>
                      <div class="post-content__container">
                          <h2 class="resrouce-title" style=" font-size: 24px;">Học nấu ăn?</h2>
                        <p class="custom-topic resource-subtitle">Đăng ký tham gia các khóa học nấu ăn hiện đang có.</p>
                      </div>
                        <span class="hs-button legitRipple" style=" font-size: 20px; color: #fff;">
                        THAM GIA
                      </span>
                    </a>
                  </article>

                </div>
              </div>
            </div>
          <!-- End Blog listing --> 

        </main>

        <jsp:include page="footer.jsp"></jsp:include>
        
        <a href="#" class="scrollup" style="display: none;">Scroll</a>
        
        <!-- ALL JS FILES -->
        <script src="js/all.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
