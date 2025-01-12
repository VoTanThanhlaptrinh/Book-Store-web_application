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
<link href="webPage/login/css/style.css" rel="stylesheet">
<title>Cập nhật thông tin</title>
</head>
<body>
	<div id="header-placeholder"><jsp:include
			page="/webPage/trangChu/re-header.jsp"></jsp:include></div>
	<section class="signup">
		<div class="container">
			<div class="signup-content border">
				<form method="POST" id="" class="signup-form" action="upload"
					enctype="multipart/form-data">
					<h2 class="form-title">Cập nhật thông tin</h2>
					<div class="form-group">
						<label>Họ và tên</label> <input type="text" class="form-input"
							name="name" id="" placeholder="Họ và tên" required maxlength="50" />
					</div>
					<div class="form-group">
						<label>Địa chỉ</label> <input type="text" class="form-input"
							name="address" id="" placeholder="Địa chỉ" required  maxlength="255"/>
					</div>
					<div class="form-group">
						<label>Số điện thoại</label> <input type="number"
							class="form-input" name="phone" id="" placeholder="Số điện thoại"
							required maxlength="11"/>
					</div>
					<div class="form-group">
						<label>Căn cước</label> <input type="number" class="form-input"
							name="cccd" id="" placeholder="Căn cước công dân" required  maxlength="16"/>
					</div>
					<div class="form-group">
						<label>Sinh nhật</label> <input type="date" class="form-input"
							name="birth" id="" placeholder="Sinh nhật" required />
					</div>
					<div class="form-group">
						<label>Email</label> <input type="text" class="form-input"
							name="email" id="" placeholder="Email" required
							value="${user.getEmail()}" maxlength="255" />
					</div>
					<div class="form-group">
						<label>File ảnh(.jpg, .png)</label> <input type="file"
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
	<script src="webPage/login/vendor/jquery/jquery.min.js"></script>
	<script src="webPage/login/js/main.js"></script>
</body>
</html>