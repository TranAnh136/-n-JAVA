<%-- 
    Document   : InsertRecipe
    Created on : Jun 9, 2020, 9:44:34 PM
    Author     : Pham An
--%>

<%@page import="model.User"%>
<%@page import="model.Category"%>
<%@page import="get.CategoryGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký công thức </title>
        <link rel="stylesheet" href="css/styleformcreaterecipe.css">
        <script>
            if(<%=request.getParameter("check")%>!=null){
                alert("Cảm ơn bạn đã đăng công thức! Công thức của bạn sẽ phải mất vài ngày để được kiểm duyệt!");
            }
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div style="padding-top: 160px;">
        <h1 align="center"><b>THÊM CÔNG THỨC MỚI</b></h1>
        <%
                  if(session.getAttribute("user")!=null){
                      User users = (User)session.getAttribute("user");%>
        <div style="margin: auto;padding: auto;width: 40%;">
          <form method="post" action="InsertRecipeByUserServlet?userId=<%=users.getUserId()%>"  enctype="multipart/form-data">  
              <input type="text" name="nameRecipe" size="50" required placeholder="Nhập tên công thức..." class="inputrecipe"/><br>
            <label for=""><b>Chọn loại công thức</b></label><br>
            <select name="catogoryId" class="typerecipe">
                <%
                    CategoryGet categoryGet = new CategoryGet();
                    for(Category c : categoryGet.getListCategory()){ 

                %>
                <option value="<%=c.getCategoryId()%>">
                    <%=c.getCategoryName()%>

                </option>
                <%}%>
            </select><br>
            <label for="imagesRecipe"><b>Chọn ảnh đại diện cho công thức</b></label><br>     
            <input type="file" name="imagesRecipe" required /><br>
            <input type="text" placeholder="Nhập lượng Calo. VD: 100" name="calo" size="10" required class="inputrecipe"/><br><br>
            <input type="text" placeholder="Nhập tên tác giả công thức" name="author" size="50" required class="inputrecipe"/><br><br>
            <textarea rows="6" cols="60" placeholder="Nhập thành phần nguyên liệu. Gợi ý: 100gr thịt heo-50gr tỏi băm-..." name="ingredients" required class="inforrecipe"></textarea><br>
            <p><b>Ghi chú: </b>Cách thành phần cách nhau bởi dấu "-"</p>
            <textarea rows="6" cols="60" placeholder="Nhập thành phần dinh dưỡng của công thức. Gợi ý: đạm, chất sơ,..." name="nutritions" required class="inforrecipe"></textarea><br>
            <textarea rows="6" cols="60" placeholder="Nhập các bước làm. Gợi ý : Rửa rau củ quả-Cho dầu vào chảo-..." name="making" required class="inforrecipe"></textarea><br>
            <p><b>Ghi chú: </b>Từng bước làm cách nhau bởi dấu "-"</p>
            <textarea rows="6" cols="60" placeholder="Mô tả ngắn gọn về công thức" name="descriptionRecipe" required class="inforrecipe"></textarea><br>                    
            <label for="imagesRecipe"><b>Video hướng dẫn</b></label><br>  
            <input type="text" placeholder="BcYJHReYZJU" name="video" size="50" required class="inputrecipe"/><br>
            <b>Ghi chú: </b>
            <ul>
                <li>https://youtu.be/<b>BcYJHReYZJU</b></li>
                <li>https://www.youtube.com/watch?v=<b>BcYJHReYZJU</b></li>
                <li><b>BcYJHReYZJU</b></li>
            </ul>
            <button type="submit" class="buttoncreaterecipe">Thêm công thức</button>
            
              <%    }
                else{%>
                <h2>VUI LÒNG ĐĂNG NHẬP ĐỂ ĐĂNG CÔNG THỨC</h2>
                <%}
              %>
             
                </form>  
              </div>
              <div class="infornot">
            
                <h2>Bỏ qua những bước trên ???</h2>

                <div class="text-gray">Nếu bạn muốn gửi đăng tải công thức của mình trực tiếp. Cách thức này thời gian duyệt sẽ chậm hơn và không được tích lũy điểm khi công thức được hiển thị</div>

                    <p>&nbsp;</p>

                    <div>
                    <p>Gửi cho chúng tôi qua email <a class="text-highlight" href="mailto:help.chuancommenau@gmail.com" target="_self"><em>help.chuancommenau@gmail.com</em></a>.</p>

                    <p>Tiêu đề:[Tài khoản chuancommenau nếu có]-[Tên công thức]. Ví dụ: masterchef/masterchef@gmail.com - Cách nấu canh rong biển thịt bò</p>

                    <p>Nội dung: [Mô tả ngắn] hoặc [Mô tả đầy đủ các bước thực hiện].</p>

                    <p>Tập tin hướng dẫn đính kèm: tâp tin phải là định dạng <em class="text-gray">*.doc, *.docx, *.pdf, *.jpg, *.png, *.jpeg</em></p>
                </div>
            </div>
            <div class="description">

                    <h2 class="center">Quyền lợi khi đăng tải công thức</h2>

                <div class="text-gray">Mức độ nỗi tiếng của mỗi đầu bếp được dựa trên số lượt công thức đã chia sẻ, và số lượng người theo dõi. Mức độ hấp dẫn và thông tin chính xác của công thức sẽ dựa trên số lượt xem và đánh giá từ các thành viên khác.</div>

                <p>&nbsp;</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Mỗi công thức bạn đăng lên là thuộc quyền sở hữu của bạn.</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Công thức được đăng thành công sẽ được hiển thị trên trang chủ của Cooky.vn ở mục công thức mới.</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Công thức của bạn đăng lên được xem như 1 chia sẻ kinh nghiệm nấu nướng của bạn tới các thành viên, có hơn <strong>32K thành viên</strong> sẽ xem công thức mà bạn hướng dẫn làm.</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Mỗi công thức được đăng thành công sẽ được tích lũy điểm <b>+10CP</b>, <b>+1CP</b> cho mỗi hình ảnh đính kèm, <span class="text-gray">xem thêm</span> <a class="text-highlight" href="/tro-giup/chinh-sach-diem-thuong" target="_self"><em>chính sách tích điểm</em></a>. Bạn có thể sử dụng CP để đổi những phần quà hấp dẫn tại trang <a class="text-highlight" href="/doi-thuong" target="_self"><em>đổi thưởng</em></a></p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> <strong>Tích lũy điểm và tăng cấp thành viên</strong>. Khi bạn đạt được chức danh là đầu bếp, bạn sẽ được watermark tên mình trên hình ảnh. Hình ảnh này sẽ được hiển thị khi thành viên khác chia sẻ lại công thức của bạn</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Có cơ hội nhận những phần quà có giá trị hoặc voucher, khi công thức của bạn hữu ích và được nhiều lượt xem, chia sẻ từ thành viên. Chính sách này có thể thay đổi theo từng giai đoạn mà không cần phải báo trước</p>

                <h2 class="center">Cam kết quyền sở hữu</h2>

                <div class="text-gray center">Xem thêm chi tiết <a class="text-highlight" href="/privacy" target="_self"><em>chính sách và qui định</em></a></div>

                <p>&nbsp;</p>

                <div>
                <p><span class="fa fa-check text-highlight">&nbsp;</span> Bạn phải chịu hoàn toàn trách nhiệm về nội dung mình đã đăng tải.</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Công thức sẽ bị tháo gỡ hoàn toàn nội dung liên quan nếu có xảy ra tranh chấp về quyền tác giả và sở hữu nội dung.</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Bạn có toàn quyền sử dụng công thức của mình cho bất kỳ mục đích nào.</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Cooky.vn có quyền sử dụng công thức của bạn cho mục đích chia sẻ cộng đồng</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Cooky.vn sẽ không sử dụng công thức của tác giả cho bất kỳ mục đích kinh doanh nào mà không có thỏa thuận và đồng ý của tác giả</p>
                </div>

                <h2 class="center">Qui trình duyệt công thức</h2>

                <div class="text-gray">Mỗi công thức đăng tải sẽ được kiểm duyệt lại trước khi được hiển thị và cho phép thành viên tìm kiếm. Qui trình gửi và kiểm duyệt sẽ qua 3 bước sau</div>

                <p>&nbsp;</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Bước 1: Thành viên gửi công thức</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Bước 2: Bộ phận kiểm duyệt nội dung đưa công thức vào hàng đợi duyệt</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Bước 3: Tiến hành duyệt và phân loại công thức. Gồm các bước duyệt hình ảnh, nguyên liệu, nội dung: tên công thức, nội dung hướng dẫn thực hiện, phân loại</p>


                <h2 class="center">Những lưu ý khi gửi công thức</h2>

                <div class="text-gray">Thời gian duyệt sẽ tùy vào nội dung và hình ảnh của mỗi công thức, nội dung càng rõ ràng thời gian duyệt càng nhanh</div>

                <p>&nbsp;</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Người khác sẽ không xem được công thức của bạn khi công thức đang ở trạng thái chưa duyệt</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Thời gian duyệt công thức chậm nhất là 12 giờ làm việc.</p>

                <p><span class="fa fa-check text-highlight">&nbsp;</span> Thông tin công thức đầy đủ, rõ ràng sẽ giúp cho việc duyệt và hiển thị công thức của bạn nhanh hơn</p>

                <h2 class="center">Vi phạm những tiêu chí sau sẽ bị từ chối duyệt.</h2>

                <div class="text-gray center">Bạn có thể chỉnh sửa và gửi lại khi công thức chưa được duyệt</div>

                <p>&nbsp;</p>

                <div>
                <p><span class="fa fa-minus-circle">&nbsp;</span> Nội dung không liên quan tới công thức món ăn, làm đẹp, pha chế, mẹo vặt nhà bếp</p>

                <p><span class="fa fa-minus-circle">&nbsp;</span> Tiêu đề không rõ ràng.</p>

                <p><span class="fa fa-minus-circle">&nbsp;</span> Tiêu đề không bắt đầu là tên món ăn. <strong>Ví dụ tiêu đề sai</strong>: Giảm cân tuyệt vời với công thức salad trái cây, <strong>ví dụ tiêu đề đúng</strong>: Salad trái cây, hoặc Salad trái cây cho giảm cân</p>

                <p><span class="fa fa-minus-circle">&nbsp;</span> Hình ảnh không rõ ràng, hình ảnh mờ, size hình quá nhỏ hoặc quá lớn (Size chuẩn: 640x400 hoặc 1280x800)</p>

                <p><span class="fa fa-minus-circle">&nbsp;</span> Nội dung là copy và không ghi rõ nguồn gốc</p>

                <p><span class="fa fa-minus-circle">&nbsp;</span> Thông tin không đầy đủ, các bước thực hiện thiếu thông tin</p>
                </div>

                <h2 class="center">Và hãy cùng chia sẻ kinh nghiệm nấu nướng của bạn nhé</h2>

                <div class="center text-gray">Chia sẻ của bạn sẽ giúp rất nhiều người tự tin vào bếp</div>

                <p>&nbsp;</p>

                <div>
                <p>Chuẩn cơm mẹ nấu xây dụng công cụ gửi công thức nấu ăn này hy vọng sẽ giúp cho việc chia sẻ công thức của các đầu bếp trở nên dễ hơn. Nếu trong quá trình đăng tải gặp vấn đề về lỗi, khó khăn. Cooky rất mong nhận được sự phản hồi và đóng góp ý kiến để cải thiện chất lượng và tối ưu tiện lợi hơn</p>

                <p> Báo lỗi và đóng góp ý kiến bằng cách<span class="text-gray">hoặc</span> gửi email cho chúng tôi <a class="text-highlight" href="mailto:help.chuancommenau@gmail.com" target="_self"><em>help.chuancommenau@gmail.com</em></a></p>
                </div>
            </div>
        </div>
       
        <jsp:include page="footer.jsp"></jsp:include>
           <script src="js/all.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
    </body>
</html>
