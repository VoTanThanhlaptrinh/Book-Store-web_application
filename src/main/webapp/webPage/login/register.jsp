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
<title>Đăng ký</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="webPage/login/fonts/material-icon/css/material-design-iconic-font.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Main css -->
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
<link href="webPage/login/css/style.css" rel="stylesheet">
<link
	href="webPage/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>

<body>
	<div id="header-placeholder"><jsp:include
			page="/webPage/trangChu/header.jsp"></jsp:include></div>
	<c:if test="${mess != null}">
		<div class="alert alert-warning text-center alert-css" role="alert">
			<fmt:message key="${mess}" />
		</div>
	</c:if>
	<div class="main" style="margin-top: 50px">
		<section class="signup">
			<div class="container">
				<div class="signup-content border">
					<form method="POST" id="signup-form" class="signup-form"
						action="register">
						<h2 class="form-title">
							<fmt:message key="create_account" />
						</h2>
						<div class="form-group">
							<input type="text" class="form-input" name="username" id="name"
								placeholder="Tên tài khoản" required maxlength="100" />
						</div>
						<div class="form-group">
							<input type="email" class="form-input" name="email" id="email"
								placeholder="Email" required maxlength="255" />
						</div>
						<div class="form-group">
							<input type="password" class="form-input" name="password"
								id="password" placeholder="Mật khẩu" required maxlength="255" />
							<span toggle="#password"
								class="zmdi zmdi-eye-off field-icon toggle-password"></span>
						</div>
						<div class="form-group">
							<input type="password" class="form-input" name="rePassword"
								id="re_password" placeholder="Nhập lại mật khẩu" maxlength="255"
								required /> <span toggle="#password"
								class="zmdi zmdi-eye-off field-icon toggle-password"></span>
						</div>
						<div class="form-group">
							<input type="checkbox" name="agreeTerm" id="agree-term"
								class="agree-term" required /> <label for="agree-term"
								class="label-agree-term"><span><span></span></span>
							<fmt:message key="agree_all" /><a href="#" class="term-service"><fmt:message
										key="dieukhoan" /></a></label>
						</div>
						<div class="form-group">
							<input type="submit" name="submit" id="submit"
								class="form-submit" value="<fmt:message key="regis" /> " />
						</div>
						<p class="loginhere">
							<fmt:message key="already_have_account" />
							? <a href="login" class="loginhere-link"> <fmt:message
									key="login_here" /></a>
						</p>
					</form>

				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="webPage/login/vendor/jquery/jquery.min.js"></script>
	<script src="webPage/login/js/main.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>