<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="webPage/login/css/infor.css" rel="stylesheet">
<title>Thông tin cá nhân</title>
</head>
<body>
	<div id="header-placeholder"><jsp:include
			page="/webPage/trangChu/re-header.jsp"></jsp:include></div>
	<div class="container border">
		<div class="row">
			<div class="col-3">
				<img src="${accountImg}" alt="" class="img">
			</div>
			<div class="col-9">
				<div>
					<p>
						<strong>Tên:</strong> ${infor.getName()}
					</p>
				</div>
				<div>
					<p>
						<strong>Địa chỉ: </strong> ${infor.getAddress()}
					</p>
				</div>
				<div>
					<p>
						<strong>Ngày sinh: </strong> ${infor.getBirth() }
					</p>
				</div>
				<div>
					<p>
						<strong>Số Điện thoại: </strong> ${infor.getPhoneNumber() }
					</p>
				</div>
				<div>
					<p>
						<strong>Căn cước công dân: </strong> ${infor.getCccd() }
					</p>
				</div>
				<div>
					<p>
						<strong>Email: </strong> ${infor.getEmail()}
					</p>
				</div>
			</div>
		</div>
		<div class="text-end">
			<a href="upload"><button class="btn-submit btn">Cập nhật</button></a>
		</div>
	</div>
	<script src="webPage/login/vendor/jquery/jquery.min.js"></script>
	<script src="webPage/login/js/main.js"></script>
</body>

</html>