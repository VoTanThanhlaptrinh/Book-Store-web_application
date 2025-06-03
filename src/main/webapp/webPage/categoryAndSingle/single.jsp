<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!-- Lấy tham số lang từ URL và thiết lập Locale -->
<fmt:setLocale
	value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}" />
<fmt:setBundle basename="messages" />
<c:if test="${param.lang != null}">
	<c:set var="lang" value="${param.lang}" scope="session" />
</c:if>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link href="webPage/categoryAndSingle/css/style.css" rel="stylesheet">
<link href="webPage/categoryAndSingle/css/star.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>
<link href="webPage/categoryAndSingle/css/single.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://fonts.cdnfonts.com/css/cofo-sans" rel="stylesheet">
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
<title>Chi tiết sách</title>
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
		<div class="alert alert-danger" role="alert">
			<fmt:message key="${failedMess}" />
		</div>
	</c:if>

	<c:if test="${not empty noMess}">
		<div class="alert alert-danger" role="alert">
			<fmt:message key="${noMess}" />
		</div>
	</c:if>
	<%-- <section class="container my-5 detail-product">
		<div class="row">
			<!-- Hình ảnh sản phẩm -->
			<div class="col-lg-5 col-md-12">
				<img src="getImage?img_id=${product.getImgId()}" alt=""
					class="img-fluid rounded">
			</div>

			<!-- Thông tin sản phẩm -->
			<div class="col-lg-6 col-md-12">
				<h6 class="text-muted">Trang chủ / Chi tiết sách</h6>
				<h3 class="py-3 fw-bold">${product.getTitle()}</h3>
				<h2 class="text-danger fw-bold">${product.price}đ</h2>

				<!-- Nhập số lượng -->
				<div class="d-flex align-items-center gap-2 mt-3">
					<label for="amount" class="fw-semibold">Số lượng:</label> <input
						type="number" class="form-control w-25 text-center" value="1"
						id="amount" name="amount" min="1">
				</div>

				<!-- Nút thêm vào giỏ & Mua ngay -->
				<div class="btn-group mt-4">
					<form action="add-to-cart" method="post"
						onsubmit="cartUpdateHiddenAmount(event)">
						<input type="hidden" name="id" value="${product.getProductId()}">
						<input type="hidden" id="hiddenAmount1" name="amount" value="1">
						<input type="hidden" name="pdQuantity"
							value="${product.getQuantity()}"> <input type="hidden"
							name="title" value="${product.getTitle()}">
						<button type="submit" class="btn card-btn fw-bold px-4 py-2">
							<fmt:message key="atk" />
						</button>
					</form>
					<form action="checkout" method="post"
						onsubmit="CheckOutUpdateHiddenAmount(event)">
						<input type="hidden" name="id" value="${product.getProductId()}">
						<input type="hidden" id="hiddenAmount2" name="amount" value="1">
						<input type="hidden" name="pdQuantity"
							value="${product.getQuantity()}"> <input type="hidden"
							name="title" value="${product.getTitle()}">
						<button type="submit" class="btn buy-btn fw-bold px-4 py-2 ms-2">
							<fmt:message key="checkout" />
						</button>
					</form>
				</div>

				<!-- Số lượng tồn kho -->
				<div class="d-flex align-items-center mt-3">
					<h5 class="mb-0 fw-bold text-muted">
						<fmt:message key="remain_quantity" />
						:
					</h5>
					<span class="ms-2 fw-semibold">${product.getQuantity()}</span>
				</div>

				<!-- Mô tả sản phẩm -->
				<h4 class="mt-4 mb-3 fw-bold">
					<fmt:message key="detail" />
					:
				</h4>
				<p class="text-muted">${product.getDescription()}</p>
			</div>
		</div>
	</section> --%>
	<!-- Chi tiết sách mới   -->
	<section class="container-fluid product-background pt-5 pb-5">
		<div class="row justify-content-center gap-5 ms-6">
			<div class="col-12 col-lg-3">
				<img src="getImage?img_id=${product.getImgId()}"
					class="img-fluid box-shadow w-100"
					style="height: 450px; object-fit: cover;">
			</div>
			<div class="col-12 col-lg-4">
				<h1 class="bold">${product.getTitle()}</h1>
				<h4>Tác giả: ${product.getAuthor()}</h4>
				<div class="d-flex gap-3">
					<div class="rating-box">
						<div class="stars">
							<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
						</div>
					</div>
					<span class="rating-text">0 đánh giá trên hệ thống</span>
				</div>
				<div class="d-flex icon gap-3 py-4 align-items-center">
					<img src="webPage/categoryAndSingle/img/2168281.png"
						class="img-fluid"> <img
						src="webPage/categoryAndSingle/img/4494468.png" class="img-fluid">
					<img src="webPage/categoryAndSingle/img/4494465.png"
						class="img-fluid"> <img
						src="webPage/categoryAndSingle/img/download.png" class="img-fluid">
				</div>
				<h6>${product.getDescription()}</h6>
				<hr>
				<div class="row">
					<div class="col-12 col-sm-6">
						<div class="row align-items-center mb-2">
							<div class="col-6 bold">
								<h6>Quantity</h6>
							</div>
							<div class="col-6">
								<p class="fst-italic mb-0">${product.getQuantity()}</p>
							</div>
						</div>
						<div class="row align-items-center mb-2">
							<div class="col-6 bold">
								<h6>Size/Pages</h6>
							</div>
							<div class="col-6">
								<p class="fst-italic mb-0">${product.getPage()}</p>
							</div>
						</div>
					</div>
					<div class="col-12 col-sm-6">
						<div class="row align-items-center mb-2">
							<div class="col-6 bold">
								<h6>Language</h6>
							</div>
							<div class="col-6">
								<p class="fst-italic mb-0">${product.getLanguage()}</p>
							</div>
						</div>
						<div class="row align-items-center mb-2">
							<div class="col-6 bold">
								<h6>Publish Year</h6>
							</div>
							<div class="col-6">
								<p class="fst-italic mb-0">${product.getPublishYear()}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-lg-3 mt-5">

				<div class="d-flex align-items-center gap-2">
					<h1 class="money-text">${product.price}đ</h1>
					<h5 class="ms-5  fst-italic">Online</h5>
				</div>
				<div class="d-flex align-items-center gap-1">
					<h2 class="money-text">${product.price* 0.8}đ</h2>
					<span class="money-detail ">-20%</span>
					<h5 class="ms-4 fst-italic">Tại shop</h5>
				</div>
				<hr class="py-2">
				<div class="d-flex align-items-center gap-3">
					<img src="webPage/categoryAndSingle/img/dropbox.png"
						class="img-fluid dropbox-img"></img>
					<h6>Miễn phí giao với đơn trên 500000.0đ</h6>
				</div>
				<div class="d-flex align-items-center gap-3 mt-3">
					<img src="webPage/categoryAndSingle/img/check.png"
						class="img-fluid dropbox-img"></img>
					<h6>Có sẵn, giao hàng trong 2 ngày</h6>
				</div>
				<div class="d-flex align-items-center gap-3 mt-3">
					<img src="webPage/categoryAndSingle/img/shopping-store.png"
						class="img-fluid dropbox-img"></img>
					<h6>Có sẵn tại tất cả các cửa hàng</h6>
				</div>
				<form action="add-to-cart" method="post"
					onsubmit="cartUpdateHiddenAmount(event)">
					<input type="hidden" name="id" value="${product.getProductId()}">
					<input type="hidden" id="hiddenAmount1" name="amount" value="1">
					<input type="hidden" name="pdQuantity"
						value="${product.getQuantity()}"> <input type="hidden"
						name="title" value="${product.getTitle()}">
					<button class="card-btn mt-4" type="submit" id="card-btn">
						<strong><fmt:message key="atk" /> </strong>
					</button>
				</form>
				<form action="checkout" method="post"
					onsubmit="CheckOutUpdateHiddenAmount(event)">
					<input type="hidden" name="id" value="${product.getProductId()}">
					<input type="hidden" id="hiddenAmount2" name="amount" value="1">
					<input type="hidden" name="pdQuantity"
						value="${product.getQuantity()}"> <input type="hidden"
						name="title" value="${product.getTitle()}">
					<button class="buy-btn mt-2" type="submit" id="buy-btn">
						<strong> <fmt:message key="checkout" /></strong>
					</button>
				</form>
			</div>
		</div>
	</section>

	<section class="container pt-5">
		<div class="row d-flex justify-content-center">
			<div class="col-md-8 col-lg-10">
				<div class="card sm shadow-0 border section-comment ">
					<h3 class="p-3">
						<fmt:message key="evaluate" />
						:
					</h3>
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
	</section>

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