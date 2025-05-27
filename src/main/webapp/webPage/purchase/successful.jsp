<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đặt Hàng Thành Công</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet" href="webPage\login\css\toastr.css">
<link rel="stylesheet" href="webPage\purchase\css\successful.css">
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />


</head>


<body>
	<div class="shopee-container">
		<i class="fas fa-check-circle success-icon mb-3"></i>
		<h2 class="shopee-title">Đặt hàng thành công!</h2>
		<p class="shopee-text">Cảm ơn bạn đã mua sắm! Đơn hàng của bạn đã
			được ghi nhận. Bạn sẽ nhận được email xác nhận chi tiết đơn hàng.</p>

<!-- 		<div class="order-info">
			<p>
				<strong>Mã đơn hàng:</strong> #SP123456789
			</p>
			<p>
				<strong>Ngày đặt hàng:</strong> 13/05/2025
			</p>
			<p>
				<strong>Phương thức thanh toán:</strong> Thanh toán khi nhận hàng
				(COD)
			</p>
			<p>
				<strong>Địa chỉ giao hàng:</strong> 123 Đường Láng, Đống Đa, Hà Nội
			</p>
		</div> -->

		<div class="d-flex justify-content-center gap-3">
			<a href="#" class="btn btn-shopee">Lịch sử mua hàng</a> 
			<a href="home"
				class="btn btn-outline-shopee">Tiếp tục mua sắm</a>
		</div>
	</div>

	<!-- Bootstrap JS và Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
	<script src="webPage/login/vendor/jquery/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<script src="webPage/login/js/toastr.js"></script>
</body>
</html>