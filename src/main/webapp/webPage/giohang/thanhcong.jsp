<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thanh Toán Thành Công</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
</head>
<body class="bg-light">
	<c:if test="${user != null}">
		<div id="header-placeholder"><jsp:include
				page="/webPage/trangChu/re-header.jsp"></jsp:include></div>
	</c:if>
	<c:if test="${user == null}">
		<div id="header-placeholder"><jsp:include
				page="/webPage/trangChu/header.jsp"></jsp:include></div>
	</c:if>
	<div class="container py-5" style="padding-top: 50px;">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center">
				<!-- Hiển thị thông báo thành công -->
				<div class="alert alert-success" role="alert">
					<h4 class="alert-heading">${mess}</h4>
				</div>

				<!-- Nút trở về trang chủ -->
				<a href="home" class="btn btn-primary"> Về Trang Chủ </a>
			</div>
		</div>
	</div>
	<footer>
		<div id="footer-placeholder">
			<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
		</div>
	</footer>

	<script src="webPage/trangChu/js/footer.js"></script>
	<!-- Thêm file JavaScript cho footer -->
	<script src="webPage/trangChu/js/header.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
