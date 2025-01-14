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
<link rel="stylesheet"
	href="webPage/login/fonts/material-icon/css/material-design-iconic-font.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Main css -->
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
<link href="webPage/login/css/style.css" rel="stylesheet">
<title>Thêm sách</title>
</head>
<body>
	<div id="header-placeholder"><jsp:include
			page="/webPage/trangChu/re-header.jsp"></jsp:include></div>
	<c:if test="${mess != null}">
		<div class="alert alert-warning text-center alert-css" role="alert">${mess}</div>
	</c:if>
	<section class="signup">
		<div class="container">
			<div class="signup-content border">
				<form method="POST" id="" class="signup-form" action="addProduct"
					enctype="multipart/form-data">
					<h2 class="form-title"><fmt:message key="add_book" /></h2>
					<div class="form-group">
						<label><fmt:message key="title" />:</label> <input type="text" class="form-input"
							name="title"  placeholder="Tiêu đề" required />
					</div>
					<div class="form-group">
						<label><fmt:message key="price" />:</label> <input type="number" class="form-input"
							name="price" placeholder="Giá" required />
					</div>
					<div class="form-group">
						<label><fmt:message key="category" />:</label> <input type="text" class="form-input"
							name="type" placeholder="Loại" required />
					</div>
					<div class="form-group">
						<label><fmt:message key="description" />:</label> <input type="text" class="form-input"
							name="description"  placeholder="Mô tả sách" required />
					</div>
					<div class="form-group">
						<label><fmt:message key="quantity" />:</label> <input type="number" class="form-input"
							name="quantity" placeholder="Số lượng" required />
					</div>
					<div class="form-group">
						<label><fmt:message key="file" />(.jpg, .png)</label> <input type="file"
							class="form-input" name="file" id="myFile" placeholder="File" required/>
					</div>
					<div class="form-group">
						<input type="submit" name="submit" id="submit" class="form-submit"
							value="cập nhật" />
					</div>
				</form>
			</div>
		</div>
	</section>
	<div id="footer-placeholder">
		<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
	</div>
	<script src="webPage/login/vendor/jquery/jquery.min.js"></script>
	<script src="webPage/login/js/main.js"></script>
</body>
</html>