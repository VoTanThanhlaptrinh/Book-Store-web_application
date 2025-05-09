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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Đăng nhập</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="webPage/login/fonts/material-icon/css/material-design-iconic-font.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<!-- Main css -->
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
<link href="webPage/login/css/style.css" rel="stylesheet">
<link
	href="webPage/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
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
	<c:if test="${mess != null}">
		<input type="hidden" id="server-message"
			value="<fmt:message key='${mess}' />" data-type="error" />
	</c:if>
	<c:if test="${loginMessage != null}">
		<input type="hidden" id="server-message"
			value="<fmt:message key='${loginMessage}' />" data-type="error" />
	</c:if>

	<div class="main" style="margin: 50px;">
		<section class="signup">
			<div class="container">
				<div class="signup-content border">
					<form method="POST" id="signin" class="signup-form" action="login">
						<input type="hidden" name="productId" value="${productId}">
						<h2 class="form-title">
							<fmt:message key="login" />
						</h2>
						<div class="form-group">
							<input type="text" class="form-input" name="username" id="name"
								placeholder="Tên tài khoản" required />
						</div>
						<div class="form-group">
							<input type="password" class="form-input" name="password"
								id="password" placeholder="Mật khẩu" required /> <span
								toggle="#password"
								class="zmdi zmdi-eye-off field-icon toggle-password"></span>
						</div>
						<div class="form-group">

							<input type="submit" name="submit" id="submit"
								class="form-submit" value="<fmt:message key="login" />" />
						</div>
					</form>
					<div class="row">
						<div class="col">
							<a href="forgotPass"><fmt:message key="forgot_password" /></a>
						</div>
						<div class="col text-end">
							<a href="register"><fmt:message key="regis" /></a>
						</div>
					</div>

					<div class="d-flex gap-3 mt-5">
						<a class="btn-google m-b-20" href="googleLoginRedirect"> <img
							src="webPage/login/images/icon-google.png" alt="GOOGLE">
							Google
						</a> <a class="btn-face m-b-20" href="facebookRedirect"> <i
							class="fa fa-facebook-official"></i> Facebook
						</a>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div id="footer-placeholder">
		<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
	</div>
	<!-- JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<!-- JQuery -->
	<script src="webPage/login/vendor/jquery/jquery.min.js"></script>

	<!-- Thêm toastr JS từ CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<script src="webPage/login/js/toastr.js"></script>

	<script src="webPage/login/js/main.js"></script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>