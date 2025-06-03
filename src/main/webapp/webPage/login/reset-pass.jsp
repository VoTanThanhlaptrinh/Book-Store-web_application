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
<title>Cập nhật mật khẩu</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="webPage/login/fonts/material-icon/css/material-design-iconic-font.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<!-- Main css -->
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
<link href="webPage/login/css/style.css" rel="stylesheet">
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
	<div class="main" style="margin: 50px">
		<section class="signup">
			<div class="container">
				<div class="signup-content border">
					<form id="resetPass" class="signup-form">
						<h2 class="form-title">
							<fmt:message key="ch_pass" />
						</h2>
						<div class="form-group">
							<input type="password" class="form-input" name="pass" id="name"
								placeholder="Mật khẩu mới" minlength="8" maxlength="255"
								required /> <span toggle="#password"
								class="zmdi zmdi-eye-off field-icon toggle-password"></span>
						</div>
						<div class="form-group">
							<input type="password" class="form-input" name="rePass"
								id="password" placeholder="Nhập lại mật khẩu mới" minlength="8"
								maxlength="255" required /> <span toggle="#password"
								class="zmdi zmdi-eye-off field-icon toggle-password"></span>
						</div>
						<div class="form-group">
							<input type="submit" name="submit" id="submit"
								class="form-submit" value=" <fmt:message key="ch_pass" />" />

						</div>
					</form>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<div id="footer-placeholder">
		<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
	</div>
	<!-- JS -->
	<script src="webPage/login/vendor/jquery/jquery.min.js"></script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<!-- Thêm toastr JS từ CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<script src="webPage/login/js/toastr.js"></script>
	<script src="webPage/login/vendor/jquery/jquery.min.js"></script>
	<script src="webPage/login/js/main.js"></script>
	<script>
	window.addEventListener('DOMContentLoaded', (event) => {
		resetPass();
	});
	function resetPass() {
		let form = document.getElementById('resetPass');
	    form.addEventListener("submit", (event) => {
	        event.preventDefault();
			
	        const formData = new FormData(form);
	        axios.post('/BOOK_STORE/reset', formData, {
	            headers: {
	                "Content-Type": "application/json"
	            }
	        })
	        .then(response => {
	            if (response.data.status === 'success') {
	                toastr.success(response.data.message, "Thông báo");
	                setTimeout(function() {
	                    window.location.href = "home";
	                  }, 1000);
	            } else {
	                toastr.warning(response.data.message, "Thông báo");
	            }
	        })
	        .catch(error => {
	           toastr.error(error)
	        });
	    });
	}
	</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>