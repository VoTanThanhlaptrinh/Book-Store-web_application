<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
<!-- Title Meta -->
<meta charset="utf-8" />
<title>Sign In | Larkon - Responsive Admin Dashboard Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="A fully responsive premium admin dashboard template" />
<meta name="author" content="Techzaa" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- App favicon -->
<link rel="shortcut icon"
	href="../webPage/admin/assets/images/favicon.ico">

<!-- Vendor css (Require in all Page) -->
<link href="../webPage/admin/assets/css/app.min.css" rel="stylesheet"
	type="text/css" />

<!-- Icons css (Require in all Page) -->
<link href="../webPage/admin/assets/css/icons.min.css" rel="stylesheet"
	type="text/css" />

<!-- App css (Require in all Page) -->
<link href="../webPage/admin/assets/css/app.min.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<!-- Theme Config js (Require in all Page) -->
<script src="../webPage/admin/assets/js/config.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</head>

<body class="h-100">
<c:if test="${mess != null}">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            toastr.warning("${fn:escapeXml(mess)}", "Thông báo");
        });
    </script>
</c:if>
	<div class="d-flex flex-column h-100 p-3">
		<div class="d-flex flex-column flex-grow-1">
			<div class="row h-100">
				<div class="col-xxl-7">
					<div class="row justify-content-center h-100">
						
						<div class="col-lg-6 py-lg-5">
							<div class="d-flex flex-column h-100 justify-content-center">
								<div class="auth-logo mb-4">
									<a href="../admin/home" class="logo-dark"> <img
										src="../webPage/admin/assets/images/logo-dark.png" height="24"
										alt="logo dark">
									</a> <a href="../admin/home" class="logo-light"> <img
										src="../webPage/admin/assets/images/logo-light.png"
										height="24" alt="logo light">
									</a>
								</div>

								<h2 class="fw-bold fs-24">Sign In</h2>

								<p class="text-muted mt-1 mb-4">Enter your email address and
									password to access admin panel.</p>

								<div class="mb-5">
									<form method="post"
										action="${pageContext.request.contextPath}/admin/login"
										class="authentication-form">
										
										<div class="mb-3">
											<label class="form-label" for="example-email">Email</label> <input
												type="text" id="example-email" name="username"
												class="form-control bg-" placeholder="Enter your username" required>
										</div>
										<div class="mb-3">
											<label class="form-label" for="example-password">Password</label>
											<input type="password" id="example-password"
												class="form-control" name="password"
												placeholder="Enter your password" required>

										</div>
										<div class="mb-3">
											<div class="form-check">
												<input type="checkbox" class="form-check-input"
													id="checkbox-signin"> <label
													class="form-check-label" for="checkbox-signin">Remember
													me</label>
											</div>
										</div>

										<div class="mb-1 text-center d-grid">
											<button class="btn btn-soft-primary" type="submit">Sign
												In</button>
										</div>
									</form>




								</div>


							</div>
						</div>
					</div>
				</div>

				<div class="col-xxl-5 d-none d-xxl-flex">
					<div class="card h-100 mb-0 overflow-hidden">
						<div class="d-flex flex-column h-100">
							<img src="../webPage/admin/assets/images/small/img-10.jpg" alt=""
								class="w-100 h-100">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- Thêm toastr JS từ CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<!-- App Javascript (Require in all Page) -->
	<script src="../webPage/admin/assets/js/app.js"></script>

</body>
</html>