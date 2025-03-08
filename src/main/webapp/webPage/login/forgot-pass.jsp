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
		<div class="alert alert-danger text-center alert-css" role="alert">
			<fmt:message key="${mess}" />
		</div>
	</c:if>
	<div class="loader-container" style="display: none" id="loader">
		<div class="loader"></div>
	</div>
	<div class="main">
		<section class="signup" style="padding-top: 50px;">
			<div class="container">
				<div class="signup-content border">
					<form method="POST" id="signin" class="signup-form"
						action="forgotPass">
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

	<!-- JS -->
	<script src="webPage/login/vendor/jquery/jquery.min.js"></script>
	<script src="webPage/login/js/main.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
<script type="text/javascript">
	
	async function getCode() {
		var messages = {
			wait : "<fmt:message key='waiting_message'/>",
			systemError : "<fmt:message key='system_error'/>",
			typemail : "<fmt:message key='type_email'/>"
		};
		const email = document.getElementById("email").value;
		const existingMessage = document.querySelector(".alert-css");
		if (existingMessage) {
			existingMessage.remove();
		}

		const container = document.body;
		const mes = document.createElement("div");
		mes.classList.add("alert", "text-center", "alert-css", 'alert-success');
		mes.innerText = messages.wait;
		container.appendChild(mes);
		if (!email) {
			mes.innerText = messages.typemail;
			container.appendChild(mes);
		} else {
			var loader = document.getElementById("loader");
			loader.style.display = "flex";
			try {
				const existingMessage1 = document.querySelector(".alert-css");
				if (existingMessage) {
					existingMessage1.remove();
				}
				var encodedEmail = "getCode?email=";
				encodedEmail += email;
				const response = await
				fetch(encodedEmail, {
					method : 'GET',
					headers : {
						Accept : 'application/json',
						'Content-Type' : 'application/json',
					},
				});

				const result = await
				response.json(); // Wait for the response
				const message = result.message;

				if (result.status === "success") {
					mes.classList.add('alert-success');
				} else {
					mes.classList.add('alert-danger');
				}

				/* mes.innerText = messages.systemError; */
				mes.innerText = message;
				container.appendChild(mes);
			} catch (error) {
				mes.classList.add('alert-danger');
				mes.innerText = message
				container.appendChild(mes);
			} finally {
				loader.style.display = "none";
			}
		}
	}
</script>

</html>