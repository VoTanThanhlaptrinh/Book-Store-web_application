<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Register</title>

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
</head>

<body>
	<div id="header-placeholder"><jsp:include
			page="/webPage/trangChu/header.jsp"></jsp:include></div>
	<c:if test="${mess != null}">
		<div class="alert alert-danger text-center alert-css" role="alert">${mess}</div>
	</c:if>
	<div class="main">
		<section class="signup">
			<div class="container">
				<div class="signup-content border">
					<form method="POST" id="signup-form" class="signup-form"
						action="register">
						<h2 class="form-title">Tạo tài khoản</h2>
						<div class="form-group">
							<input type="text" class="form-input" name="username" id="name"
								placeholder="Tên tài khoản" required />
						</div>
						<div class="form-group">
							<input type="email" class="form-input" name="email" id="email"
								placeholder="Email" required />
						</div>
						<div class="form-group">
							<input type="password" class="form-input" name="password"
								id="password" placeholder="Mật khẩu" required /> <span
								toggle="#password"
								class="zmdi zmdi-eye-off field-icon toggle-password"></span>
						</div>
						<div class="form-group">
							<input type="password" class="form-input" name="rePassword"
								id="re_password" placeholder="Nhập lại mật khẩu" required /> <span
								toggle="#password"
								class="zmdi zmdi-eye-off field-icon toggle-password"></span>
						</div>
						<div class="form-group">
							<input type="checkbox" name="agreeTerm" id="agree-term"
								class="agree-term" required/> <label for="agree-term"
								class="label-agree-term"><span><span></span></span>Tôi
								đồng ý tất cả <a href="#" class="term-service">Điều khoản</a></label>
						</div>
						<div class="form-group">
							<input type="submit" name="submit" id="submit"
								class="form-submit" value="Đăng ký" />
						</div>
					</form>
					<p class="loginhere">
						Bạn đã có tài khoản ? <a href="login" class="loginhere-link">Đăng
							nhập ở đây</a>
					</p>
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