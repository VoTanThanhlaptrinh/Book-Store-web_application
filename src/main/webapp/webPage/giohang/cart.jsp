<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>

<!DOCTYPE html>
<html lang="en">

<fmt:setLocale
	value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}" />
<fmt:setBundle basename="messages" />
<c:if test="${param.lang != null}">
	<c:set var="lang" value="${param.lang}" scope="session" />
</c:if>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giỏ hàng</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="webPage\giohang\css\base.css">
<link rel="stylesheet" href="webPage\giohang\css\cart.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">
</head>

<body>
	<div class="app">
		<div class="container">
			<c:if test="${not empty cartProduct}">
				<!--tieu de  -->
				<div class="cart_table">
					<ul class="left">
						<li>
							Sản phẩm</li>
					</ul>
					<ul class="right">
						<li>Đơn giá</li>
						<li>Số lượng</li>
						<li>Số tiền</li>
						<li>Thao tác</li>
					</ul>
				</div>
				<c:forEach var="item" items="${cartProduct}">

					<!-- khung hien thi san pham -->
					<div class="cart_product">
						<div class="cart_product_info">
							<div class="list">
								<ul>
									<li><input type="checkbox" class="cart_list-checkbox" data-product-id="${item.getProductId()}" data-cart-id="${item.getCartItemId()}"></li>
									<li><img src="getImage?img_id=${item.getImgId()}" alt=""
										class="img"></li>
									<li class="productname">${item.getName()}</li>
								</ul>
								<ul class="right">
									<li class="item">${item.getPrice()}</li>
									<li class="item quantity">
										<button class="btn-quantity minus quantity_item">-</button> <input
										type="text" class="input-quantity quantity_item"
										value="${item.getQuantity()}" min="1">
										<button class="btn-quantity plus quantity_item">+</button>
									</li>

									<li class="item total">${item.getQuantity() * item.getPrice()}</li>
									<a class="del item" href="delete?id=${item.getCartItemId()}">Xóa</a>
								</ul>
							</div>
						</div>
						<div class="cart_product_ship">
							<div class="left list">
								<i class="fa-solid fa-truck-fast item icon "></i> <span
									class="item">Giảm ₫500.000 phí vận chuyển đơn tối thiểu
									₫0 </span>
							</div>
							<div class="right list">
								<i class="fa-solid fa-ticket item icon " style="color: #ee4d2d;"></i>
								<span class="item">Nhận voucher giảm giá lên đến đ100.000
								</span>
							</div>
						</div>
					</div>
				</c:forEach>

				<!-- dat hang -->
				<div class="cart_table cart_order">
					<ul class="left">
						<li><input type="checkbox" class="cart_list-checkbox" data-product-id="${item.getProductId()}"></li>
						<li>Chọn tất cả</li>
					</ul>
					<ul class="right">
						<li>Tổng tiền: </li>
						<li>
            <form id="orderForm" action="order" method="post">
               <input type="hidden" name="orderData" id="orderData">
                <button type="submit" class="order">Mua hàng</button>
            </form>
        </li>
					</ul>
				</div>
		</div>
		</c:if>
		<!-- gio hang rong -->
		<c:if test="${empty cartProduct}">
			<div class="empty">
				<div>
					<img class="item img" src="webPage/giohang/	img/empty.png" alt="">
					<div class="item">Giỏ hàng của bạn còn trống</div>
					<div class="item">
						<a href="home" class="btn btn-primary"><span class='buy'>Mua
								ngay</span></a>
					</div>
				</div>
			</div>
		</c:if>
		<footer class="footer"> </footer>
	</div>
	
	<!--script -->
	<script src="webPage/giohang/js/cart.js"></script>
	
</body>

</html>
