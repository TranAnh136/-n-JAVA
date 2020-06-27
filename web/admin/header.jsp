<%-- 
    Document   : header
    Created on : May 16, 2020, 8:57:16 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Admin"%>
<%@page import="model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/mos-style.css" rel="stylesheet" />
           
        <title>header</title>
    </head>
    <body>
        <%
        Admin useradmin = null;
        if(session.getAttribute("useradmin") != null){
            useradmin = (Admin) session.getAttribute("useradmin");
        }
        %>
        <div id="header">
            <div class="inHeader">
                <div class="mosAdmin" style="text-align: right;padding-right: 20px">
                     <%if(useradmin!=null){ %>
                    Chào <%=useradmin.getAdminName()%> <br>
                    <% } %>
                    <a href="" style="text-align: left;padding-left: 20px;">Chuẩn cơm mẹ nấu</a> |  <a href="/chuancommenau/LogoutAdminServlet">Đăng Xuất</a>
                </div>
                <div class="clear"></div>
            </div>
        </div> 

    </body>
</html>
