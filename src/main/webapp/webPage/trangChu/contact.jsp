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
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/BOOK_STORE/webPage/trangChu/CSS/contact.css">
<link rel="stylesheet" href="/BOOK_STORE/webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="/BOOK_STORE/webPage/trangChu/CSS/footer.css">
<title>Insert title here</title>
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
  <div class="contact-container">
   
    <div class="contact-info">
      <h2>Contact Information</h2>
      <div class="info-item">
        <i class="fas fa-map-marker-alt"></i>
        <p><strong>Address:</strong></p>
        <p>Sunset, NRP 12<br>Birmingham 08</p>
      </div>
      <div class="info-item">
        <i class="fas fa-phone"></i>
        <p><strong>Phone:</strong></p>
        <p>+0096 0883 5647<br>+0096 3434 5678</p>
      </div>
      <div class="info-item">
        <i class="fas fa-envelope"></i>
        <p><strong>Email:</strong></p>
        <p>codinglab@gmail.com<br>info.codinglab@gmail.com</p>
      </div>
    </div>

    <div class="contact-form">
      <h2>Send us a message</h2>
      <p>If you have any work from me or any types of queries related to my tutorial, you can send me a message from here. It's my pleasure to help you.</p>
      <form id="contact-form">
        <input type="text" placeholder="Enter your name" required>
        <input type="email" placeholder="Enter your email" required>
        <textarea placeholder="Enter your message" required></textarea>
        <button type="submit">Send Now</button>
      </form>
    </div>
  </div>
    	<div style="margin-top: 200px"></div>
                
   	<div id="footer-placeholder"><jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include></div>
</body>
</html>