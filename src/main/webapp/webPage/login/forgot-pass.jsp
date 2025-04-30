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
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Quên mật khẩu</title>

<!-- Font Icon -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<!-- Main css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link href="webPage/login/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
</head>
<style>
.signup-content {
	width: 100%;
	max-width: 35rem;
	padding: 30px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}
</style>
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
	<div class="main" style="margin: 3rem">
		<section class="signup">
			<div class="container">
				<div class="signup-content border">
					<form method="POST" id="forgotPass" class="signup-form" action="forgotPass">
						<h2 class="form-title">
							<fmt:message key="email_verification" />
						</h2>
						<div class="form-group">
							<input type="email" class="form-input" name="email" id="email"
								placeholder="<fmt:message key='email_placeholder' />" required
								maxlength="255" />
						</div>
						<div class="form-group row">
							<div class="col-8">
								<input type="text" class="form-input" name="code" id="text"
									placeholder="<fmt:message key='enter_code' />" required />
							</div>
							<div class="col-4">
								<button type="button" class="form-submit" onclick="getCode()">
									<fmt:message key="get_code" />
								</button>
							</div>
						</div>
						<div class="form-group">
							<input type="submit" name="submit" id="submit"
								class="form-submit" value="<fmt:message key='confirm' />" />
						</div>
					</form>
				</div>
			</div>
		</section>
	</div>
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
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
<script type="text/javascript">
function getCode() {
	const email = document.getElementById("email").value;
	const encodedEmail = "/BOOK_STORE/getCode?email=" + encodeURIComponent(email);
	 axios.get(encodedEmail, {
	     }).then(response => {
	            if (response.data.status === 'success') {
	                toastr.success(response.data.message, "Thông báo");
	            } else {
	                toastr.warning(response.data.message, "Thông báo");
	            }
	        })
	        .catch(error => {
	           toastr.error(error)
	  });
}
	 
	   
</script>

</html>