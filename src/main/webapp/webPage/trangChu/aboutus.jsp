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
<link rel="stylesheet" href="webPage/trangChu/CSS/aboutus.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
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

	<section class="about-section">
		<div class="content">
			<h2>Our Mission</h2>
			<p>Our mission is to provide exceptional services and products to
				customers, while fostering innovation, sustainability, and a sense
				of community.</p>
		</div>
		<div class="content">
			<h2>Our Team</h2>
			<p>We are a diverse and passionate team, driven to achieve
				excellence in all that we do. Collaboration and creativity are at
				the heart of our success.</p>
		</div>
		<div class="content">
			<h2>Our Values</h2>
			<ul>
				<li>Integrity</li>
				<li>Customer Focus</li>
				<li>Innovation</li>
				<li>Teamwork</li>
				<li>Sustainability</li>
			</ul>
		</div>
	</section>
	<div id="footer-placeholder">
		<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
	</div>
	<script src="webPage/trangChu/js/footer.js"></script>
	<script src="webPage/trangChu/js/header.js"></script>
</body>
</html>
