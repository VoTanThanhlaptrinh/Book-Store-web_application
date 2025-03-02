<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!-- Lấy tham số lang từ URL và thiết lập Locale -->
<fmt:setLocale value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}"  />
<fmt:setBundle basename="messages" />
<c:if test="${param.lang != null}">
    <c:set var="lang" value="${param.lang}" scope="session" />
</c:if>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
<link href="webPage/categoryAndSingle/css/style.css" rel="stylesheet">
<link href="webPage/categoryAndSingle/css/star.css" rel="stylesheet">
<title>Book Detail</title>
</head>

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
	<c:if test="${not empty failedMess}">
		<div class="alert alert-danger" role="alert"><fmt:message key="${failedMess}" /></div>
	</c:if>

	<c:if test="${not empty noMess}">
		<div class="alert alert-danger" role="alert"><fmt:message key="${noMess}" /></div>
	</c:if>
	<main
		class="d-flex container align-items-center justify-content-center">
		<section class="container-sm mt-3 card shadow-0 border">
			<!-- Product Title -->
			<h3>${product.getTitle()}</h3>
			<div class="row">
				<!-- Image Column -->
				<div class="col-5">
					<img src="getImage?img_id=${product.getImgId()}" alt="Book Image"
						class="img-fluid">
				</div>

				<!-- Product Details Column -->
				<div class="col-7">
					<!-- Product Description -->
					<p>
						<strong><fmt:message key="detail" />:</strong>
						${product.getDescription()}
					</p>

					<!-- Product Remaining Quantity -->
					<p>
						<strong><fmt:message key="remain_quantity" />:</strong>
						${product.getQuantity()}
					</p>

					<!-- Quantity Input -->
					<div class="input-group mb-3">
						<label for="amount" class="form-label me-2"> <strong><fmt:message
									key="cart_quantity" />:</strong>
						</label> <input type="number" id="amount" name="amount"
							placeholder="Amount" value="1" class="form-control">
					</div>

					<!-- Button Group -->
					<div class="button-group">
						<!-- Add to Cart Button -->
						<form action="add-to-cart" method="post"
							onsubmit="cartUpdateHiddenAmount(event)">
							<input type="hidden" name="id" value="${product.getProductId()}">
							<input type="hidden" id="hiddenAmount1" name="amount" value="1">
							<input type="hidden" name="pdQuantity"
								value="${product.getQuantity()}"> <input type="hidden"
								name="title" value="${product.getTitle()}">
							<button class="btn btn-primary w-100 mb-2" type="submit">
								<span class="material-symbols-outlined me-2">shopping_cart</span>
								<fmt:message key="atk" />
							</button>
						</form>

						<!-- Checkout Button -->
						<form action="checkout" method="post"
							onsubmit="CheckOutUpdateHiddenAmount(event)">
							<input type="hidden" name="id" value="${product.getProductId()}">
							<input type="hidden" id="hiddenAmount2" name="amount" value="1">
							<input type="hidden" name="pdQuantity"
								value="${product.getQuantity()}"> <input type="hidden"
								name="title" value="${product.getTitle()}">
							<button class="btn btn-success w-100" type="submit">
								<span class="material-symbols-outlined me-2">attach_money</span>
								<fmt:message key="checkout" />
							</button>
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>
	<div class="container pt-5">
		<div class="row d-flex justify-content-center">
			<div class="col-md-8 col-lg-10">
				<div class="card sm shadow-0 border">
					<h3 class="p-3"><fmt:message key="evaluate" />:</h3>
					<div class="card-body p-4">
						<div class="navbar-nav-scroll">
							<c:if test="${evaluates.size() > 0}">
								<c:forEach var="i" begin="0" end="${evaluates.size()-1}">
									<div class="card mb-4">
										<div class="card-body">
											<div
												class="d-flex justify-content-between align-items-center mb-3">
												<div class="d-flex align-items-center">
													<img src="getImage?img_id=${imgIds.get(i)}" alt="avatar"
														class="rounded-circle" width="40" height="40" />
													<p class="small mb-0 ms-3 fw-bold">${usernames.get(i)}</p>
												</div>
												<div class="d-flex align-items-center">
													<p class="small text-muted mb-0">
														<span class="text-warning fw-bold">★</span>
														${comments.get(i).getRating()}
													</p>
												</div>
											</div>
											<div class="mt-3">
												<p class="mb-0 text-secondary">${comments.get(i).getContent()}</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		function cartUpdateHiddenAmount(event) {
			// Lấy giá trị từ ô số lượng
			const amount = document.getElementById('amount').value;
			// Cập nhật giá trị cho thẻ hidden
			document.getElementById('hiddenAmount1').value = amount;
		}

		function CheckOutUpdateHiddenAmount(event) {
			// Lấy giá trị từ ô số lượng
			const amount = document.getElementById('amount').value;
			// Cập nhật giá trị cho thẻ hidden
			document.getElementById('hiddenAmount2').value = amount;
		}
	</script>
</body>

</html>