<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hướng Dẫn Sử Dụng Tool</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/BOOK_STORE/webPage/trangChu/CSS/index.css">
<link rel="stylesheet"
	href="/BOOK_STORE/webPage/trangChu/CSS/header.css">
<link rel="stylesheet"
	href="/BOOK_STORE/webPage/trangChu/CSS/footer.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
	<div class="container mt-5">
		<h1 class="mb-4 text-primary">Hướng Dẫn Sử Dụng Tool</h1>

		<!-- 1. Giới Thiệu -->
		<h2 class="mt-4">1. Giới thiệu</h2>
		<p>Tool này giúp bạn mã hoá đoạn thông tin lấy trên web bán sách
			của chúng sau đó tiến hành thực hiện ký hoá đơn . Dễ sử dụng, nhanh
			chóng và hiệu quả cho người dùng phổ thông.</p>

		<!-- 2. Cách Cài Đặt -->
		<h2 class="mt-4">2. Cách Cài Đặt</h2>
		<ol class="list-group list-group-numbered mb-3">
			<li class="list-group-item">Tải tool tại: <a href="/BOOK_STORE/download">Link
					tải tool</a></li>
			<li class="list-group-item">Sau khi tải sẽ có được file .zip</li>
			<div>
				<img src="webPage/use_tool/images/download_zip.png"
					class="img-fluid rounded shadow-sm">
			</div>
			<li class="list-group-item">Tiến hành giải nén file <strong>tool.zip</strong>
				và mở thư mục giải nén sẽ có một file tên là <strong>Tool_Encrypt.exe</strong></li>
			<div>
				<img src="webPage/use_tool/images/tool_after_unzip.png"
					class="img-fluid rounded shadow-sm">
			</div>
			<li class="list-group-item">Tiến hành chạy file <strong>Tool_Encrypt.exe</strong>.
				Sau khi hoàn tất sẽ có giao diện như sau:
			</li>
			<div>
				<img src="webPage/use_tool/images/main_frame.png" class="img-fluid rounded shadow-sm">
			</div>
		</ol>

		<!-- 3. Cách Sử Dụng -->
		<h2 class="mt-4">3. Cách Sử Dụng</h2>
		<ol class="list-group list-group-numbered mb-3">
			<li class="list-group-item">Mở tool</li>
			<li class="list-group-item">Tạo khoá: có thể chọn kích thước
				khoá khuyến nghị dùng <strong>(2048 hoặc 4096)</strong> để tăng
				cường bảo mật
				<p class="alert-warning alert ">Lưu ý*: Đối với lần đầu chạy
					phải tạo khoá, nhưng ở lần tiếp theo khi chạy tool nó sẽ động lấy
					lại khoá đã tạo trước đó</p>
			</li>
			<div>
				<img src="webPage/use_tool/images/step_gen_key.png"
					class="img-fluid rounded shadow-sm">
			</div>
			<p>Khoá khởi tạo thành công</p>
			<div>
				<img src="webPage/use_tool/images/gen_key_success.png"
					class="img-fluid rounded shadow-sm">
			</div>
			<li class="list-group-item">Nhập đoạn thông tin được hash khi
				lấy trên web site vào ô <strong>Văn bản gốc</strong>
			</li>
			<div>
				<img src="webPage/use_tool/images/input.png" class="img-fluid rounded shadow-sm">
			</div>
			<li class="list-group-item">Nhấn nút <strong>Mã hoá</strong> và
				xem kết quả
			</li>
			<div>
				<img src="webPage/use_tool/images/encrypt.png" class="img-fluid rounded shadow-sm">
			</div>
			<li class="list-group-item">Nhấn nút <strong>Sao chép</strong>
				để copy kết quả mã hoá và ghi vào web để ký thông tin hoá đơn.
			</li>
		</ol>
	</div>
	<div id="footer-placeholder">
		<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
	</div>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="webPage/trangChu/js/footer.js"></script>
	 
</body>

</html>