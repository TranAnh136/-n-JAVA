<%-- 
    Document   : signup
    Created on : May 13, 2020, 7:34:59 AM
    Author     : Tien Anh
--%>


<%@page import="get.UserGet"%>
<%@page import="model.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connect.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <link rel="stylesheet" href="css/signup-signin.css">
        <title>Đăng nhập - Đăng ký</title>
        
       
        <script>
           function validate()
        { 
            var username = document.getElementById("name").value;
            var password = document.getElementById("pass").value;
            var confirm= document.getElementById("confirm").value;
     
            if(username.length > 10)
            {
                alert("Username không quá 10 kí tự");
            }
        if(password.length<6)
        { 
            alert("Mật khẩu phải hơn 6 kí tự."); 
            return false; 
        } 
        else if (password!=confirm)
        { 
            alert("Nhập lại mật khẩu sai"); 
            return false; 
        } 
        password.onchange = validate;
        confirm.onkeyup = validate;
 } 
</script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>

<script type="text/javascript">
      $(document).ready(function () {
           var x_timer;
           $("#email").keyup(function (e) {
                clearTimeout(x_timer);
                var user_email = $(this).val();
                x_timer = setTimeout(function () {
                    check_username_ajax(user_email);
                }, 1000);
                });
       
  
  
           function check_username_ajax(email) {
                $("#result").html('<img src="images/ajax-loader.gif" />');
                $.post('CheckEmailServlet', {'email': email}, function (data) {
                    $("#result").html(data);
                 });
           }
           
        
       });
</script>
 <script>
            if(<%=request.getParameter("email")%>!=null){
                alert("Bạn đã đăng ký thành công. Vui lòng đăng nhập !");
            }
        </script>
    </head>
    <body onload='document.form1.pass.focus()'>
                 <%
            UserGet user = new UserGet();
             String error="";
             if(request.getParameter("error")!=null){
                 error = (String)request.getParameter("error");
             }
             
        %>
               
        <div class="container" id="container">
            <div class="form-container sign-up-container">
		<form action="UserServlet" method = "POST" name="form1">
                   <!-- Đăng ký-->
			<h1>Đăng ký</h1>
                        <input type="text" placeholder="Tên đăng nhập" name="name" id="name" required/>
                        <input type="email" placeholder="Email" name="email" id="email" required/>
                        <span class="red-text accent-4" id="result"></span>
                        <input type="password" placeholder="Mật khẩu" name="pass" id="pass" required/>
                         <script>
                         
                             $('#pass').on('keyup', function() {
                                  var t = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
                                    if ($('#pass').val().match(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/)){
                                        $('#message1').html('Mật khẩu hợp lệ').css('color', 'green');
                                    } 
                                    else {
                                         $('#message1').html('Mật khẩu phải hơn 6 kí tự và gồm số, chữ thường và chữ hoa').css('color', 'red');
                                    }
                                       
                                });
                                        
                           </script>
                         <span></span><span id='message1'></span>
                        <input type="password" placeholder="Nhập lại mật khẩu" id="confirm" name="confirm" required />
                          <script>$('#pass, #confirm').on('keyup', function () {
                                    if ($('#pass').val() == $('#confirm').val()) {
                                        $('#message').html('Trùng khớp').css('color', 'green');
                                    } else 
                                        $('#message').html('Không trùng khớp').css('color', 'red');
                                });
                                        
                           </script>
                             <span id='message'></span>
                        <input type="text" placeholder="Số điện thoại" name="phone" required/>
                        <input type="text" placeholder="Địa chỉ" name="address" required/>
                        
                        <button onclick="validate()" value="insert" name="command" >Đăng ký</button>
		</form>
	</div>
	<div class="form-container sign-in-container">
           <!--Đăng nhập -->
		<form action="UserServlet" method="POST">
                    <%if(request.getParameter("error")!=null){%>
                    <div>
                        <p style="color:red"><%=request.getParameter("error")%></p>
                    </div>
                        <% } %>
			<h1 style="margin-bottom:10px">Đăng nhập</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<span>hoặc sử dụng tài khoản của bạn</span>
                        <input type="text" placeholder="Email" name="email" id="email" required/>
                        <input type="password" placeholder="Mật khẩu" name="pass" id="pass" required/>
                        <a href="#">Quên mật khẩu?</a>
                        <button value="login" name="command">Đăng nhập</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Chào mừng bạn đến với Chuẩn cơm mẹ nấu !</h1>
				<p>Bạn đã có tài khoản ? Đăng nhập ngay !</p>
				<button class="ghost" id="signIn">Đăng nhập</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Xin chào bạn!</h1>
				<p>Bạn chưa có tài khoản ? Đăng ký ngay !</p>
				<button class="ghost" id="signUp">Đăng ký</button>
			</div>
		</div>
	</div>
</div>
        <script src="js/signup-signin.js">
            
        </script>
 
    </body>
</html>
