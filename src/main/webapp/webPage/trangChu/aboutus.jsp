<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<fmt:setLocale
	value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}" />
<fmt:setBundle basename="messages" />
<c:if test="${param.lang != null}">
	<c:set var="lang" value="${param.lang}" scope="session" />
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us</title>
<link rel="stylesheet" href="/BOOK_STORE/webPage/trangChu/CSS/aboutus.css">
<link rel="stylesheet" href="/BOOK_STORE/webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="/BOOK_STORE/webPage/trangChu/CSS/footer.css">
</head>
<body>
	<c:if test="${user != null}">
		<div id="header-placeholder"><jsp:include
				page="/webPage/trangChu/re-header.jsp"></jsp:include></div>
	</c:if>
	<c:if test="${user == null}">
		<div id="header-placeholder"><jsp:include
				page="/webPage/trangChu/header.jsp"></jsp:include></div>
	</c:if>

  <div class="about-us-container">
    <!-- Phần văn bản -->
    <div class="text-section">
      <h1>About Us</h1>
      <p>
       Về Chúng Tôi

        Chào mừng bạn đến với BOOKSTORE – không gian dành cho những người yêu sách!

        Chúng tôi tin rằng mỗi cuốn sách đều mở ra một thế giới mới. 
        Với mong muốn lan tỏa tri thức và nuôi dưỡng đam mê đọc sách trong cộng đồng, BOOKSTORE được thành lập như một điểm đến tin cậy cho độc giả ở mọi lứa tuổi.

        Tại đây, bạn sẽ tìm thấy hàng ngàn đầu sách đa dạng từ văn học, kinh tế, 
        kỹ năng sống cho đến sách thiếu nhi và sách học thuật. Chúng tôi luôn cập nhật những tựa sách mới nhất và chọn lọc kỹ lưỡng để đảm bảo chất lượng cho từng cuốn sách đến tay bạn.
      </p>
      <button  id="learn-more-btn">LEARN MORE</button>
    </div>

    <!-- Phần hình ảnh -->
    <div class="image-section">
      <img src="https://basmo.app/wp-content/uploads/2021/12/different-types-of-readers.webp" alt="Woman on phone", loading="lazy">
    </div>

    <!-- Phần nền màu cam -->
    <div class="background-pink"></div>
  </div>
  	<div style="margin-top: 200px"></div>
                
   	<div id="footer-placeholder"><jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include></div>
  <script >

    document.addEventListener('DOMContentLoaded', () => {
  const textElement = document.querySelector('.text-section p');
  const learnMoreBtn = document.getElementById('learn-more-btn');

  // Khi nhấn nút "Learn More"
  learnMoreBtn.addEventListener('click', () => {
    alert('You clicked "Learn More"!');
    // Bạn có thể thêm logic chuyển hướng hoặc hiển thị nội dung khác ở đây
  });
});
  </script>

</body>
</html>
