<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>

<%-- 
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
<link href="webPage/categoryAndSingle/css/style.css" rel="stylesheet">



    
    <form action="checkout" method="post">
        <c:if test="${not empty cartProduct}">
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th><fmt:message key="cart_select" /></th>
                        <th><fmt:message key="cart_image" /></th>
                        <th><fmt:message key="cart_product_id" /></th>
                        <th><fmt:message key="cart_product_name" /></th>
                        <th><fmt:message key="cart_quantity" /></th>
                        <th><fmt:message key="cart_date_added" /></th>
                        <th><fmt:message key="cart_price" /></th>
                        <th><fmt:message key="cart_total_price" /></th>
                        <th><fmt:message key="cart_action" /></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${cartProduct}">
                        <tr>
                            <td>
                                <input type="checkbox" name="selectedItems" value="${item.getCartItemId()},${item.getQuantity()},${item.getProductId()}" class="form-check-input">
                            </td>
                            <td>
                                <img src="getImage?img_id=${item.getImgId()}" alt="<fmt:message key='cart_product' />" style="width: 50px; height: 50px;">
                            </td>
                            <td>${item.getProductId()}</td>
                            <td>${item.getName()}</td>
                            <td>${item.getQuantity()}</td>
                            <td>${item.getCreateDate()}</td>
                            <td>${item.getPrice()}</td>
                            <td>${item.getQuantity() * item.getPrice()}</td>
                            <td>
                                <a href="delete?id=${item.getCartItemId()}"><fmt:message key="cart_delete" /></a>
                            </td>
                        </tr>
                    </c:forEach>
                    
                </tbody>
            </table>
            <div class="text-end mt-3">
                <div>
                    <strong><fmt:message key="cart_total" />: </strong>
                    <span>${sumCart}</span>
                </div>
                <button type="submit" class="btn btn-success"><fmt:message key="cart_checkout" /></button>
                <a href="home" class="btn btn-primary"><fmt:message key="cart_continue_shopping" /></a>
            </div>
        </c:if>
        
        <c:if test="${empty cartProduct}">
            <div class="alert alert-warning text-center" role="alert">
                <fmt:message key="cart_empty" />
            </div>
            <div class="text-center mt-3">
                <a href="home" class="btn btn-primary"><fmt:message key="cart_back_to_products" /></a>
            </div>
        </c:if>
    </form>
</div>

<div id="footer-placeholder">
    <jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
</div>
<script src="webPage/trangChu/js/footer.js"></script>
<script src="webPage/trangChu/js/header.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>

</body>
 --%>
</html>

<!DOCTYPE html>
<html lang="en">

<fmt:setLocale
	value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}" />
<fmt:setBundle basename="messages" />
<c:if test="${param.lang != null}">
	<c:set var="lang" value="${param.lang}" scope="session" />
</c:if>

<html lang="en"><head>
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
				<div class="cart_table">
					<ul class="cart_list">
						<input type="checkbox" class="cart_list-checkbox">
						<li class="cart_list-item">Sản phẩm</li>
					</ul>
					<ul class="cart_list cart_list1">
						<li class="cart_list-item">Đơn giá</li>
						<li class="cart_list-item">Số lượng</li>
						<li class="cart_list-item">Số tiền</li>
						<li class="cart_list-item">Thao tác</li>
					</ul>
				</div>
				<c:forEach var="item" items="${cartProduct}">
					<div class="cart_product">
						<div class="cart_product_brand">
							<ul class="cart_product_brand_list">
								<input type="checkbox" name="" id="" class="cart_list-checkbox">
								<li class="cart_product_brand_item cart_product_brand_like">
									Yêu thích</li>
								<div class="cart_product_brand_item">
									<li class="cart_product_brand_item_name">Topick Global</li> <i
										class="fas fa-comments cart_product_brand_item_icon"></i>
								</div>
							</ul>
						</div>
						<div class="cart_product_info">
							<div class="cart_product_info_list">
								<ul class="cart_product_info_list_item">
									<input type="checkbox" name="" id="" class="cart_list-checkbox">
									<img src="getImage?img_id=${item.getImgId()}" alt=""
										class="cart_product_info_list_img">
									<li class="cart_product_info_list_productname">
										${item.getName()}</li>
								</ul>
								<ul
									class="cart_product_info_list_item cart_product_info_list_item1">
									<li class="cart_product_info_item_item">${item.getPrice()}</li>
									<div class="cart_product_info_item_item quantity">
										<button class="btn-quantity minus quantity_item">-</button>
										<input type="text" class="input-quantity quantity_item"
											value="${item.getQuantity()}" min="1">
										<button class="btn-quantity plus quantity_item">+</button>
									</div>

									<li class="cart_product_info_item_item">${item.getQuantity() * item.getPrice()}</li>
									<a
										class="cart_product_info_item_item_delete cart_product_info_item_item"
										href="delete?id=${item.getCartItemId()}">Xóa</a>
								</ul>
							</div>
						</div>
						<div class="cart_procuct_ship">
							<div class="cart_procuct_ship_list">
								<i
									class="fa-solid fa-truck-fast cart_procuct_ship_item cart_procuct_ship_item_icon "></i>
								<span class="cart_procuct_ship_item">Giảm ₫500.000 phí
									vận chuyển đơn tối thiểu ₫0 </span>
							</div>
							<div class="cart_procuct_ship_list">
								<i
									class="fa-solid fa-ticket cart_procuct_ship_item cart_procuct_ship_item_icon "
									style="color: #ee4d2d;"></i> <span
									class="cart_procuct_ship_item">Nhận voucher giảm giá lên
									đến đ100.000 </span>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="cart_table cart_order">
					<ul class="cart_order_list cart_order_list1">
						<input type="checkbox" class="cart_list-checkbox">
						<li class="cart_order_list_item">Chọn tất cả</li>
					</ul>
					<ul class="cart_order_list cart_order_list2">
						<li class="cart_order_list_item ">Tổng tiền: ${sumCart}</li>
						<li class="cart_order_list_item_order">Mua hàng</li>
					</ul>
				</div>
		</div>
		</c:if>
		<c:if test="${empty cartProduct}">
			<div class="empty">
				<div class="empty_list">
					<img class="empty_list_item img"
						src="webPage/giohang/	img/empty.png" alt="">
					<div class="empty_list_item text">Giỏ hàng của bạn còn trống
					</div>
					<div class="empty_list_item">
						<a href="home" class="btn btn-primary"><span class='buy'>Mua
								ngay</span></a>
					</div>
				</div>
			</div>
		</c:if>
		<footer class="footer"> </footer>
	</div>
</body>

</html>