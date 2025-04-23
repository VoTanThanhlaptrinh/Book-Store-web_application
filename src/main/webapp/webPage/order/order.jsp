<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Thanh toán</title>
<link rel="stylesheet" href="webPage\order\css\order.css">
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />
</head>

<body>
	<div class="wrapper">
		<!-- Overlay: Lớp phủ mờ nền khi mở popup -->
		<div class="overlay overlay-element" id="overlay"></div>

		<!-- Phần chính: Thông tin địa chỉ và thanh toán -->
		<section class="section-one">
			<div class="container">
				<div class="row">
					<!-- Phần địa chỉ giao hàng -->
					<div class="col-8 mx-auto pr-2 address">
						<!-- Khung hiển thị địa chỉ -->
						<div class="border rounded bg-white p-4 mb-4 shadow-sm">
							<div
								class="d-flex justify-content-between align-items-center mb-4">
								<span class="fw-semibold">Địa chỉ giao hàng</span> <a href="#"
									onclick="openPanel();return false;"
									class="text-primary fw-medium">Chỉnh sửa</a>
							</div>
							<div class="d-flex flex-wrap align-items-center mb-3">
								<span class="customer"><strong>Người nhận:</strong> Trịnh
									Quốc Huy</span> <span><strong>SĐT:</strong> 0867008717</span>
							</div>
							<div class="d-flex align-items-center flex-wrap mb-3">
								<span
									class="badge rounded-pill bg-warning text-dark me-3 px-3 py-2">NHÀ
									RIÊNG</span> <span>Trường Đại học Nông Lâm TP. Hồ Chí Minh, KTX
									khu C, Phường Linh Trung, TP. Thủ Đức, HCM</span>
							</div>
						</div>

						<!-- Kiện hàng theo giao diện trong ảnh -->
						<div class="border rounded p-3 mb-4 bg-white product-detail">
							<div class="row d-flex">
								<p class="col-6 fw-bold">Sản phẩm</p>
								<p class="col-2 fw-bold text-center">Đơn giá</p>
								<p class="col-2 fw-bold text-center">Số lượng</p>
								<p class="col-2 fw-bold text-center">Thành tiền</p>
							</div>

							<c:forEach var="item" items="${sessionScope.cDetails}">
								<div class="row align-items-center border-top pt-3">
									<!-- Cột: Hình ảnh và Thông tin sản phẩm -->
									<div class="col-6 d-flex align-items-center">
										<div class="col-3 mb-3" style="padding: 0;">

											<img src="getImage?img_id=${item.getImgId()}" alt="sp"
												class="img-thumbnail" style="width: 70%;">
										</div>
										<div class="col-9 ps-3">
											<div class="text-truncate fw-semibold"
												style="max-width: 100%;">${item.getName()}</div>
										</div>
									</div>

									<!-- Cột: Đơn giá -->
									<div class="col-2 text-center" style="word-wrap: break-word;">
										<span class="fw-bold">${item.getPrice()}₫</span>
									</div>

									<!-- Cột: Số lượng -->
									<div class="col-2 text-center" style="word-wrap: break-word;">
										${item.getQuantity()}</div>

									<!-- Cột: Thành tiền -->
									<div class="col-2 text-center" style="word-wrap: break-word;">
										<span class="fw-bold text-dark">${item.getQuantity() *item.getPrice()}₫</span>
									</div>
								</div>
							</c:forEach>
							<!-- Voucher -->
							<div
								class="d-flex justify-content-between align-items-center pt-3">
								<div class="d-flex align-items-center text-danger">
									<i class="bi bi-ticket-perforated me-2"></i> Voucher của Shop
								</div>
								<a href="#" class="text-primary text-decoration-none">Chọn
									Voucher</a>
							</div>
						</div>
					</div>

					<!-- Phần thanh toán -->
					<div class="col-4 pl-2 abate">
						<div class="border rounded p-3 shadow-sm bg-white">
							<!-- Tiêu đề và nút mở panel phương thức thanh toán -->
							<div class="d-flex justify-content-between">
								<h5 class="mb-3 fw-semibold">Chọn phương thức thanh toán</h5>
								<a href="#" onclick="openPaymentPanel();return false;"
									class="text-primary">Xem tất cả</a>
							</div>

							<!-- Phương thức thanh toán mặc định: COD -->
							<div
								class="border rounded p-3 mb-2 d-flex align-items-center justify-content-between">
								<div>
									<div class="fw-medium p-2">Thanh toán khi nhận hàng</div>
									<small class="text-muted p-2">Thanh toán khi nhận hàng</small>
								</div>
								<input type="radio" name="payment" id="cod" class="custom-radio"
									checked> <label for="cod" class="custom-radio-label"><i
									class="fa-solid fa-check"></i></label>
							</div>
							<!-- Phương thức thanh toán: Ví MoMo -->
							<div
								class="border rounded p-3 mb-3 d-flex align-items-center justify-content-between">
								<div>
									<div class="fw-medium p-2">Ví MoMo</div>
									<small class="text-muted p-2">Liên kết ví MoMo</small>
								</div>
								<input type="radio" name="payment" id="momo"
									class="custom-radio"> <label for="momo"
									class="custom-radio-label"><i class="fa-solid fa-check"></i></label>
							</div>
							<!-- Nhập mã voucher -->
							<div class="mb-3 pt-4">
								<h5 class="form-label fw-medium pb-3">Voucher</h5>
								<div class="input-group">
									<input type="text" class="form-control" style="height: 40px;"
										placeholder="Nhập mã voucher">
									<button class="btn btn-info text-white fw-bold"
										style="font-size: 14px;">Sử dụng</button>
								</div>
							</div>
							<!-- Thông tin đơn hàng -->
							<div class="border-top pt-3 mt-3">
								<h5 class="fw-semibold">Thông tin đơn hàng</h5>
								<div class="d-flex justify-content-between">
									<span class="text-muted">Tạm tính
										(${sessionScope.cDetailsSize} sản phẩm)</span> <span>${sessionScope.total}
										₫</span>
								</div>
								<div class="d-flex justify-content-between mb-2">
									<span class="text-muted">Phí vận chuyển</span> <span>37.200
										₫</span>
								</div>
								<div
									class="d-flex justify-content-between fw-bold text-danger mt-2 mb-2"
									style="font-size: 20px;">
									<span>Tổng cộng:</span> <span>245.200 ₫</span>
								</div>
								<!-- Nút đặt hàng -->
								<button class="btn btn-orange text-white w-100">ĐẶT
									HÀNG</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Panel địa chỉ: Hiển thị danh sách địa chỉ và form thêm địa chỉ mới -->
		<div id="addressPanel" class="side-panel shadow">
			<div
				class="panel-header d-flex justify-content-between align-items-center text-center ml-3 mt-3 mr-3">
				<p class="mb-0">Địa chỉ nhận hàng</p>
				<button onclick="openNewAddressForm()"
					class="btn btn-sm btn-outline-primary">Thêm địa chỉ mới</button>
			</div>
			
			
			
			<!-- Danh sách địa chỉ mặc định -->
			<div class="p-3 default-address">
			  <div id="addressList"></div>
			  
			  
			  
			  
			  
			  
			  
			  
			<!--   
				<div class="border p-3 rounded mb-3">
					<div class="fw-bold mb-2">Trịnh Quốc Huy 0867008717</div>
					<div>
						<span class="badge badge-warning mr-2">NHÀ RIÊNG</span>Trường Đại
						học Nông Lâm TP. Hồ Chí Minh ktx khu C
					</div>
					<div class="text-muted small mt-1">Mã vùng: Hồ Chí Minh -
						Thành Phố Thủ Đức - Phường Linh Trung</div>
					<div class="mt-3">
				
						<button class="btn btn-outline-info btn-sm">Địa chỉ nhận
							hàng mặc định</button>
						<button class="btn btn-outline-info btn-sm">Địa chỉ thanh
							toán mặc định</button>
					</div>
				</div> -->



				<div class="text-center mt-4">
					<button class="btn btn-secondary mr-2" onclick="closePanel()">Hủy</button>
					<button class="btn btn-info text-white" onclick="saveNewAddress()">Lưu</button>
				</div>
			</div>







			<!-- Popup form: Thêm địa chỉ mới -->
			<div id="newAddressForm" class="popup-form overlay-element"
				style="display: none;">
				<h2>Thêm địa chỉ nhận hàng mới</h2>
				<form id="addressForm" action="SaveAddressServlet" method="post">
					<div class="row">
						<div class="col-6">
							<label>Họ tên</label> <input type="text"
								class="form-control mb-4" name="full_name" placeholder="Họ tên"
								required> <label>Số điện thoại</label> <input
								type="text" class="form-control mb-4" name="phone"
								placeholder="Nhập số điện thoại" required>
						</div>
						<div class="col-6">
							<label>Địa chỉ chi tiết</label> <input type="text"
								class="form-control mb-4" name="address_detail"
								placeholder="Số nhà, tên đường" required> <label>Tỉnh/Thành
								phố</label> <select class="form-control mb-4" id="tinh" required>
								<option value="">Chọn tỉnh/thành phố</option>
							</select> <label>Quận/Huyện</label> <select class="form-control mb-4"
								id="quan" name="district_id" required>
								<option value="">Chọn quận/huyện</option>
							</select> <label>Phường/Xã</label> <select class="form-control mb-4"
								id="phuong" name="ward_code" required>
								<option value="">Chọn phường/xã</option>
							</select>
						</div>
					</div>
					<div class="mb-3">
						<label>Lựa chọn tên cho địa chỉ thường dùng:</label><br> <input
							type="radio" name="address_type" value="NHÀ RIÊNG" id="home"
							required> <label for="home"
							class="btn btn-outline-danger">NHÀ RIÊNG</label> <input
							type="radio" name="address_type" value="VĂN PHÒNG" id="office">
						<label for="office" class="btn btn-outline-info">VĂN PHÒNG</label>
					</div>
					<div class="text-center">
						<button type="button"
							class="btn btn-secondary mr-2 pl-4 pr-4 pt-3 pb-3"
							onclick="cancelNewAddress()">Hủy</button>
						<button type="submit"
							class="btn btn-info text-white pl-4 pr-4 pt-3 pb-3">Lưu</button>
					</div>
				</form>
			</div>









			<!-- Panel phương thức thanh toán: Hiển thị danh sách các phương thức thanh toán -->
			<div id="paymentPanel" class="side-panel shadow">
				<div
					class="panel-header d-flex justify-content-between align-items-center mt-3">
					<h3 class="mb-0 ml-3">Phương thức thanh toán</h3>
				</div>
				<hr>

				<div class="p-3">
					<!-- Danh sách phương thức thanh toán -->
					<div
						class="border rounded p-3 mb-2 d-flex align-items-center justify-content-between">
						<div>
							<div class="fw-medium">Thanh toán khi nhận hàng</div>
							<small class="text-muted">Thanh toán khi nhận hàng</small>
						</div>
						<input type="radio" name="payment" id="p1" class="custom-radio"
							checked> <label for="p1" class="custom-radio-label"><i
							class="fa-solid fa-check"></i></label>
					</div>
					<div
						class="border rounded p-3 mb-2 d-flex align-items-center justify-content-between">
						<div>
							<div class="fw-medium">Ví MoMo</div>
							<small class="text-muted">Vui lòng kích hoạt tài khoản
								MoMo để tiếp tục</small>
						</div>
						<input type="radio" name="payment" id="p2" class="custom-radio"
							checked> <label for="p2" class="custom-radio-label"><i
							class="fa-solid fa-check"></i></label>
					</div>
					<div
						class="border rounded p-3 mb-2 d-flex align-items-center justify-content-between">
						<div>
							<div class="fw-medium">Thẻ tín dụng/Thẻ ghi nợ</div>
							<small class="text-muted">Thẻ tín dụng/Thẻ ghi nợ</small>
						</div>
						<input type="radio" name="payment" id="p3" class="custom-radio"
							checked> <label for="p3" class="custom-radio-label"><i
							class="fa-solid fa-check"></i></label>
					</div>
					<div class="text-center mt-4">
						<button onclick="closePaymentPanel()"
							class="btn btn-sm btn-secondary mr-3">Đóng</button>
						<button class="btn btn-info text-white"
							onclick="closePaymentPanel()">Lưu</button>

					</div>
				</div>
			</div>

		</div>
		<!-- Script: Thư viện và logic JavaScript -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
			crossorigin="anonymous"></script>
		<script src="webPage/order/js/order.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</body>

</html>