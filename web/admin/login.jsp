<%-- 
    Document   : login
    Created on : May 16, 2020, 9:21:06 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng Nhập</title>

<!--    <c:set var="root" value="${pageContext.request.contextPath}"/>-->
    <link  rel="stylesheet" href="css/mo-style.css" />

</head>
<body>

    <div id="header">
        <div class="inHeaderLogin"></div>
    </div>

    <div id="loginForm">
        <div class="headLoginForm">
            Đăng nhập Admin
        </div>
        <div class="fieldLogin">
            <form action="/chuancommenau/AdminServlet" method="post">
                <%if(request.getParameter("error")!=null){%>
                    <div>
                        <p style="color:red"><%=request.getParameter("error")%></p>
                    </div>
                        <% } %>
                <label>Tài khoản</label><br>
                <input type="text" class="login" name="emailadmin"><br>
                <label>Mật khẩu</label><br>
                <input type="password" class="login" name="passadmin"><br>
                <input type="hidden" value="login" name="commandadmin">
                <input type="submit" class="button" value="Đăng Nhập">
            </form>
        </div>
    </div>

</body>
