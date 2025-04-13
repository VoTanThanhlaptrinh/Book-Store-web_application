<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

	
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<link rel="stylesheet" href="webPage\order\css\order.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Thanh toán</title>
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
                <div class="col-8 mx-auto pr-1 address">	
                    <!-- Khung hiển thị địa chỉ -->
                    <div class="border rounded bg-white p-4 mb-2 shadow-sm">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="fw-semibold">Địa chỉ giao hàng</h5>
                            <a href="#" onclick="openPanel();return false;" class="text-primary fw-medium text-decoration-none">Chỉnh
                                sửa</a>
                        </div>
                        <div class="d-flex flex-wrap align-items-center mb-3">
                            <span class="customer"><strong>Người nhận:</strong> Trịnh Quốc Huy</span>
                            <span><strong>SĐT:</strong> 0867008717</span>
                        </div>
                        <div class="d-flex align-items-center flex-wrap mb-3">
                            <span class="badge rounded-pill bg-warning text-dark me-3 px-3 py-2">NHÀ RIÊNG</span>
                            <span>Trường Đại học Nông Lâm TP. Hồ Chí Minh, KTX khu C, Phường Linh Trung, TP. Thủ Đức,
                                HCM</span>
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
                        <div class="row align-items-center border-top pt-3">
                            <!-- Cột: Hình ảnh và Thông tin sản phẩm -->
                            <div class="col-6 d-flex align-items-center">
                                <div class="col-3" style="padding: 0;">
                                    <img src="./img/download.jpg"
                                        alt="sp" class="img-thumbnail" style="width: 70%;">
                                </div>
                                <div class="col-9 ps-3">
                                    <div class="text-truncate fw-semibold" style="max-width: 100%;">
                                        Chuột máy tính chơi game Sidotech Inphic PB1P Đen
                                    </div>
                                    <small class="text-muted">Loại: Chuột PB1P Đen</small>
                                </div>
                            </div>
                    
                            <!-- Cột: Đơn giá -->
                            <div class="col-2 text-center" style="word-wrap: break-word;">
                                <span class="fw-bold">₫117.000</span>
                            </div>
                    
                            <!-- Cột: Số lượng -->
                            <div class="col-2 text-center" style="word-wrap: break-word;">
                                1
                            </div>
                    
                            <!-- Cột: Thành tiền -->
                            <div class="col-2 text-center" style="word-wrap: break-word;">
                                <span class="fw-bold text-dark">₫117.000</span>
                            </div>
                        </div>             
                        <!-- Voucher -->
                        <div class="d-flex justify-content-between align-items-center pt-3">
                            <div class="d-flex align-items-center text-danger">
                                <i class="bi bi-ticket-perforated me-2"></i> Voucher của Shop
                            </div>
                            <a href="#" class="text-primary text-decoration-none">Chọn Voucher</a>
                        </div>
                    </div>
                </div>

                <!-- Phần thanh toán -->
                <div class="col-4 pl-1 abate">
                    <div class="border rounded p-3 shadow-sm bg-white">
                        <!-- Tiêu đề và nút mở panel phương thức thanh toán -->
                         <div class="d-flex justify-content-between">
                            <h5 class="mb-3 fw-semibold">Chọn phương thức thanh toán</h5>
                            <a href="#" onclick="openPaymentPanel();return false;"
                            class="text-primary text-decoration-none">Xem tất cả</a>
                         </div>
                    
                        <!-- Phương thức thanh toán mặc định: COD -->
                        <div class="border rounded p-3 mb-2 d-flex align-items-center justify-content-between">
                            <div>
                                <div class="fw-medium p-2">Thanh toán khi nhận hàng</div>
                                <small class="text-muted p-2">Thanh toán khi nhận hàng</small>
                            </div>
                            <input type="radio" name="payment" id="cod" class="custom-radio" checked>
                            <label for="cod" class="custom-radio-label"><i class="fa-solid fa-check"></i></label>
                        </div>
                        <!-- Phương thức thanh toán: Ví MoMo -->
                        <div class="border rounded p-3 mb-3 d-flex align-items-center justify-content-between">
                            <div>
                                <div class="fw-medium p-2">Ví MoMo</div>
                                <small class="text-muted p-2">Liên kết ví MoMo</small>
                            </div>
                            <input type="radio" name="payment" id="momo" class="custom-radio">
                            <label for="momo" class="custom-radio-label"><i class="fa-solid fa-check"></i></label>
                        </div>
                        <!-- Nhập mã voucher -->
                        <div class="mb-3 pt-4">
                            <h5 class="form-label fw-medium">Voucher</h5>
                            <div class="input-group">
                                <input type="text" class="form-control" style="height: 40px;" placeholder="Nhập mã voucher">
                                <button class="btn btn-info text-white fw-bold" style="font-size: 14px;">Sử dụng</button>
                            </div>
                        </div>
                        <!-- Thông tin đơn hàng -->
                        <div class="border-top pt-3 mt-3">
                            <h5 class="fw-semibold">Thông tin đơn hàng</h5>
                            <div class="d-flex justify-content-between">
                                <span class="text-muted">Tạm tính (3 sản phẩm)</span>
                                <span>208.000 ₫</span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span class="text-muted">Phí vận chuyển</span>
                                <span>37.200 ₫</span>
                            </div>
                            <div class="d-flex justify-content-between fw-bold text-danger mt-2 mb-2"style="font-size:20px;">
                                <span>Tổng cộng:</span>
                                <span>245.200 ₫</span>
                            </div>
                            <!-- Nút đặt hàng -->
                            <button class="btn btn-orange text-white w-100">ĐẶT HÀNG</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

  <!--  -->
<!--  -->
</div>
    <!-- Script: Thư viện và logic JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
    <script src="webPage/order/js/order.js"></script>
</body>

</html>