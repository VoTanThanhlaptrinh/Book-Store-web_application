<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<fmt:setLocale value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}"  />
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
<title>Thay đổi mật khẩu</title>

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
	<div class="main" style="margin-top: 50px">
		<section class="signup">
			<div class="container">
				<div class="signup-content border">
					<form method="POST" action="changePass" id="signin" class="signup-form">
						<h2 class="form-title"><fmt:message key="ch_pass" /></h2>
						<div class="form-group">
							<input type="password" class="form-input" name="oldPass" id="name"
								placeholder="Mật khẩu cũ" maxlength="255" />
								<span
								toggle="#password"
								class="zmdi zmdi-eye-off field-icon toggle-password"></span>
						</div>
						<div class="form-group">
							<input type="password" class="form-input" name="pass" id="name"
								placeholder="Mật khẩu mới" maxlength="255" />
								<span
								toggle="#password"
								class="zmdi zmdi-eye-off field-icon toggle-password"></span>
						</div>
						<div class="form-group">
							<input type="password" class="form-input" name="rePass"
								id="password" placeholder="Nhập lại mật khẩu mới" maxlength="255" />
							<span
								toggle="#password"
								class="zmdi zmdi-eye-off field-icon toggle-password"></span>
						</div>
						<div class="form-group">
							<input type="submit" name="submit" id="submit"
								class="form-submit" value=" <fmt:message key="ch_pass" />"  />
							
						</div>
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