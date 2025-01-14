<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/webPage/lib/tag.jsp"%>
<!-- Lấy tham số lang từ URL và thiết lập Locale -->
<fmt:setLocale value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}"  />
<fmt:setBundle basename="messages" />
<c:if test="${param.lang != null}">
	<c:set var="lang" value="${param.lang}" scope="session" />
</c:if>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Information detail</title>

<link href="webPage/login/css/infor.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
</head>

<body class="body-infor">
	<header>
		<div id="header-placeholder"><jsp:include
				page="/webPage/trangChu/re-header.jsp"></jsp:include></div>
	</header>

	<div class="page-content-infor page-container-infor " id="page-content"
		style="padding-top: 50px;">
		<div class="padding-infor">
			<div class="row d-flex justify-content-center ">
				<div class="col-xl-6 col-md-12 border card">
					<div class="card-infor user-card-full-infor">
						<div class="row m-l-0-infor m-r-0-infor">
							<div class="col-sm-4 bg-c-lite-green-infor user-profile-infor">
								<div class="card-block-infor text-center">
									<div class="m-b-25-infor">
										<img src="${accountImg}" class="img-radius-infor"
											alt="User-Profile-Image">
									</div>
									<h6 class="f-w-600-infor"></h6>
									<p>${infor.getName()}</p>
									<i
										class="mdi mdi-square-edit-outline feather icon-edit m-t-10-infor f-16-infor"></i>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="card-block-infor">
									<h6
										class="m-b-20-infor p-b-5-infor b-b-default-infor f-w-600-infor"></h6>
									<div class="row">
										<div class="col-sm-6">
											<p class="m-b-10-infor f-w-600-infor">Email:</p>
											<h6 class="text-muted-infor f-w-400-infor">${infor.getEmail()}</h6>
										</div>
										<div class="col-sm-6">
											<p class="m-b-10-infor f-w-600-infor"><fmt:message key="phone_number" />:</p>
											<h6 class="text-muted-infor f-w-400-infor">${infor.getPhoneNumber()}</h6>
										</div>
									</div>
									<h6
										class="m-b-20-infor m-t-40-infor p-b-5-infor b-b-default-infor f-w-600-infor"></h6>
									<div class="row">
										<div class="col-sm-6">
											<p class="m-b-10-infor f-w-600-infor"><fmt:message key="birthday" />:</p>
											<h6 class="text-muted-infor f-w-400-infor">${infor.getBirth()}</h6>
										</div>
										<div class="col-sm-6">
											<p class="m-b-10-infor f-w-600-infor"><fmt:message key="address" />:</p>
											<h6 class="text-muted-infor f-w-400-infor">${infor.getAddress()}</h6>
										</div>
									</div>

									<h6
										class="m-b-20-infor m-t-40-infor p-b-5-infor b-b-default-infor f-w-600-infor"></h6>
									<div class="row">
										<div class="col-sm-6">
											<p class="m-b-10-infor f-w-600-infor"><fmt:message key="id_card" />:</p>
											<h6 class="text-muted-infor f-w-400-infor">${infor.getCccd()}</h6>
										</div>
									</div>
									<ul
										class="social-link-infor list-unstyled m-t-40-infor m-b-10-infor">
										<li><a href="#!" data-toggle="tooltip"
											data-placement="bottom" title=""
											data-original-title="facebook" data-abc="true"><i
												class="mdi mdi-facebook feather icon-facebook facebook"
												aria-hidden="true"></i></a></li>
										<li><a href="#!" data-toggle="tooltip"
											data-placement="bottom" title=""
											data-original-title="twitter" data-abc="true"><i
												class="mdi mdi-twitter feather icon-twitter twitter"
												aria-hidden="true"></i></a></li>
										<li><a href="#!" data-toggle="tooltip"
											data-placement="bottom" title=""
											data-original-title="instagram" data-abc="true"><i
												class="mdi mdi-instagram feather icon-instagram instagram"
												aria-hidden="true"></i></a></li>
									</ul>
									<div class="text-end ">
										<a href="upload"><button type="button" 
												class="btn btn-primary"><fmt:message key="confirm" /></button></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer-placeholder">
		<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
	</div>
	<script src="webPage/login/vendor/jquery/jquery.min.js"></script>
	<script src="webPage/login/js/main.js"></script>
</body>

</html>
