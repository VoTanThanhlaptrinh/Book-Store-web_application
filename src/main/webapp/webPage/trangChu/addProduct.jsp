<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>

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
					<h2 class="form-title">Thêm Sách</h2>
					<div class="form-group">
						<label>Tiêu đề</label> <input type="text" class="form-input"
							name="title"  placeholder="Tiêu đề" required />
					</div>
					<div class="form-group">
						<label>Giá</label> <input type="number" class="form-input"
							name="price" placeholder="Giá" required />
					</div>
					<div class="form-group">
						<label>Loại</label> <input type="text" class="form-input"
							name="type" placeholder="Loại" required />
					</div>
					<div class="form-group">
						<label>Mô tả sách</label> <input type="text" class="form-input"
							name="description"  placeholder="Mô tả sách" required />
					</div>
					<div class="form-group">
						<label>Số lượng</label> <input type="number" class="form-input"
							name="quantity" placeholder="Số lượng" required />
					</div>
					<div class="form-group">
						<label>File ảnh sách(.jpg, .png)</label> <input type="file"
							class="form-input" name="file" id="myFile" placeholder="File" />
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