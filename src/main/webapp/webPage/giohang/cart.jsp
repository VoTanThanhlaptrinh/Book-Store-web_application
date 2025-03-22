
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  --%>

<!DOCTYPE html>
<%@ include file="/webPage/lib/tag.jsp"%>

<!-- Lấy tham số lang từ URL và thiết lập Locale -->
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
<title>Gio hang</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
<link href="webPage/categoryAndSingle/css/style.css" rel="stylesheet">
<link href="webPage/giohang/css/cart.css" rel="stylesheet">
</head>
<body>
<body>

	<c:choose>
		<c:when test="${not empty user}">
			<div id="header-placeholder"><jsp:include
					page="/webPage/trangChu/re-header.jsp"></jsp:include></div>
		</c:when>
		<c:otherwise>
			<div id="header-placeholder"><jsp:include
					page="/webPage/trangChu/header.jsp"></jsp:include></div>
		</c:otherwise>
	</c:choose>

	<c:if test="${not empty usmess}">
		<div class="alert alert-success" role="alert">
			<fmt:message key="${usmess}" />
		</div>
	</c:if>

	<div class="container my-5">
		<h1 class="text-center mb-4">
			<fmt:message key="cart_header" />
		</h1>


		<form action="checkout" method="post">
			<c:if test="${not empty cartProduct}">



				<div class="cart-container">
					<div class="cart-header">
						<div>
							<fmt:message key="cart_product_name" />
						</div>
						<div>
							<fmt:message key="cart_price" />
						</div>
						<div>
							<fmt:message key="cart_quantity" />
						</div>
						<div>
							<fmt:message key="cart_total_price" />
						</div>
						<div>
							<fmt:message key="cart_action" />
						</div>
					</div>
				</div>





				<c:forEach var="item" items="${cartProduct}">
					<div class="cart-container">
						<div class="product-row">
							<div class="product-info">
								<input type="checkbox" name="selectedItems"
									value="${item.getCartItemId()},${item.getQuantity()},${item.getProductId()}"
									class="form-check-input"> <img
									src="getImage?img_id=${item.getImgId()}"
									alt="<fmt:message key='cart_product' />"
									style="width: 70px; height: 70px;">
								<div class="product-details">
									<p>
										<strong>${item.getName()}</strong>
									</p>
								</div>
							</div>
							<div class="price">${item.getPrice()}</div>



							<div class="quantity-control">
								<button type="button" class="btn-decrease"
									data-id="${item.getCartItemId()}">-</button>
								<input type="text" value="${item.getQuantity()}"
									class="quantity-input" data-price="${item.getPrice()}"
									style="width: 40px; text-align: center;" readonly>
								<button type="button" class="btn-increase"
									data-id="${item.getCartItemId()}">+</button>
							</div>
							<div class="total-price" data-id="${item.getCartItemId()}">${item.getQuantity() * item.getPrice()}</div>



							<div class="remove-action">
								<a href="delete?id=${item.getCartItemId()}"><fmt:message
										key="cart_delete" /></a>
							</div>
						</div>
					</div>
				</c:forEach>









				<div class="cart-container">
					<div class="cart-footer">
						<div class="footer-left">
							<input type="checkbox" name="selectedItems"
								value="${item.getCartItemId()},${item.getQuantity()},${item.getProductId()}"
								class="form-check-input"> <label for="select-all"><fmt:message
									key="all" /></label>
						</div>
						<div class="footer-right">
							<div>
								<span class="total-price"><fmt:message key="cart_total" />
									(${sumCart} <fmt:message key="cart_product" />): <span
									id="totalAmount">0</span></span>
							</div>
							<button type="submit" class="btn btn-success">
								<fmt:message key="checkout" />
							</button>
							<a href="home" class="btn btn-primary"><fmt:message
									key="cart_continue_shopping" /></a>
						</div>
					</div>


				</div>












			</c:if>


			<c:if test="${empty cartProduct}">
				<div class="alert alert-warning text-center" role="alert">
					<fmt:message key="cart_empty" />
				</div>
				<div class="text-center mt-3">
					<a href="home" class="btn btn-primary"><fmt:message
							key="cart_back_to_products" /></a>
				</div>
			</c:if>

		</form>
	</div>

	<div id="footer-placeholder">
		<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
	</div>
	<script src="webPage/giohang/js/cart.js"></script>
	<script src="webPage/trangChu/js/footer.js"></script>
	<script src="webPage/trangChu/js/header.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</body>
</html>