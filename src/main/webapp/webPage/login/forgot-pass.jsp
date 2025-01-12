<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Quên mật khẩu</title>

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
		<section class="signup" style="padding-top: 50px;">
			<div class="container">
				<div class="signup-content border">
					<form method="POST" id="signin" class="signup-form"
						action="forgotPass">
						<h2 class="form-title">Quên mật khẩu</h2>
						<div class="form-group">
							<input type="email" class="form-input" name="email" id="email"
								placeholder="Email" required maxlength="255"/>
								
						</div>
						<div class="form-group row">
							<div class="col-8">
								<input type="text" class="form-input" name="code" id="text"
									placeholder="Nhập mã" required />
							</div>
							<div class="col-4">
								<!-- <input type="button" name="submit" id="submit"
									class="form-submit" value="Lấy mã" /> -->
								<button type="button" class="form-submit" onclick="getCode()">Lấy
									mã</button>
								
							</div>

						</div>
						<div class="form-group">
							<input type="submit" name="submit" id="submit"
								class="form-submit" value="Xác nhận" />
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
<script type="text/javascript">
	async function getCode() {
		const email = document.getElementById("email").value;
		const existingMessage = document.querySelector(".alert-css");
		if (existingMessage) {
			existingMessage.remove();
		}
		
		const container = document.body;
		const mes = document.createElement("div");
		mes.classList.add("alert", "text-center", "alert-css", 'alert-success');
		mes.innerText = "Chờ trong giây lát";
		container.appendChild(mes);
		if (!email) {
			mes.innerText = "Hãy nhập email";
			container.appendChild(mes);
		} else {
			try {
				const existingMessage1 = document.querySelector(".alert-css");
				if (existingMessage) {
					existingMessage1.remove();
				}
				var encodedEmail = "getCode?email=";
					encodedEmail += email;
				const response = await fetch(encodedEmail, {
					method: 'GET',
					headers: {
						Accept: 'application/json',
						'Content-Type': 'application/json',
					},
				});
				
				const result = await response.json(); // Wait for the response
				const message = result.message;
				
				if (result.status === "success") {
					mes.classList.add('alert-success');
				} else {
					mes.classList.add('alert-danger');
				}
				
				mes.innerText = message;
				container.appendChild(mes);
			} catch (error) {
				mes.classList.add('alert-danger');
				mes.innerText = "Lỗi hệ thống";
				container.appendChild(mes);
			}
		}
	}
</script>

</html>