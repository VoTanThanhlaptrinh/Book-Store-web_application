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
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lịch Sử Mua Hàng</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
<link href="webPage/categoryAndSingle/css/style.css" rel="stylesheet">
<link href="webPage/categoryAndSingle/css/star.css" rel="stylesheet">
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
	<div class="container mt-5">
		<h2 class="text-center">
			<fmt:message key="orderHistory.title" />
		</h2>
		<hr>
		<c:choose>
			<c:when test="${empty history}">
				<div class="alert alert-info text-center">
					<fmt:message key="orderHistory.noHistory" />
				</div>
			</c:when>
			<c:otherwise>
				<input type="hidden" id="user" value="${user.getUserId()}">
				<table class="table table-bordered table-striped">
					<thead class="table-primary">
						<tr>
							<th>#</th>
							<th><fmt:message key="orderHistory.image" /></th>
							<th><fmt:message key="orderHistory.productCode" /></th>
							<th><fmt:message key="orderHistory.productName" /></th>
							<th><fmt:message key="orderHistory.quantity" /></th>
							<th><fmt:message key="orderHistory.creationDate" /></th>
							<th><fmt:message key="orderHistory.price" /></th>
							<th><fmt:message key="orderHistory.review" /></th>
							<th><fmt:message key="orderHistory.reorder" /></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${history}" varStatus="status">
							<tr>
								<td>${status.index + 1}</td>
								<td><img src="getImage?img_id=${item.getImgId()}"
									alt="${item.getName()}" class="img-thumbnail"
									style="width: 100px; height: 100px;"></td>
								<td>${item.getProductId()}</td>
								<td>${item.getName()}</td>
								<td>${item.getQuantity()}</td>
								<td>${item.getCreateDate()}</td>
								<td>${item.getPrice()}</td>
								<td>
									<button type="button" class="btn btn-primary"
										data-bs-toggle="modal"
										data-bs-target="#exampleModal${item.getProductId()}">
										<c:if
											test="${!evaluate.checkProductHasBeenEvaluated(item.getProductId(),user.getUserId())}">
											<fmt:message key="orderHistory.comment" />
										</c:if>
										<c:if
											test="${evaluate.checkProductHasBeenEvaluated(item.getProductId(),user.getUserId())}">
											<fmt:message key="orderHistory.recomment" />
										</c:if>
									</button>
									<div class="modal fade" id="exampleModal${item.getProductId()}"
										tabindex="-1" role="dialog"
										aria-labelledby="exampleModalLabel${item.getProductId()}"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title"
														id="exampleModalLabel${item.getProductId()}">
														<fmt:message key="orderHistory.commentModalTitle" />
													</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<div style="display: flex;">
														<label class="rating-label" title="text"><fmt:message
																key="orderHistory.rating" />:</label>
														<div class="rate">
															<input type="radio" id="star5_${item.getProductId()}"
																name="rate_${item.getProductId()}" value="5" /> <label
																for="star5_${item.getProductId()}" title="text">5
																stars</label> <input type="radio"
																id="star4_${item.getProductId()}"
																name="rate_${item.getProductId()}" value="4" /> <label
																for="star4_${item.getProductId()}" title="text">4
																stars</label> <input type="radio"
																id="star3_${item.getProductId()}"
																name="rate_${item.getProductId()}" value="3" /> <label
																for="star3_${item.getProductId()}" title="text">3
																stars</label> <input type="radio"
																id="star2_${item.getProductId()}"
																name="rate_${item.getProductId()}" value="2" /> <label
																for="star2_${item.getProductId()}" title="text">2
																stars</label> <input type="radio"
																id="star1_${item.getProductId()}"
																name="rate_${item.getProductId()}" value="1" /> <label
																for="star1_${item.getProductId()}" title="text">1
																star</label>
														</div>
													</div>

													<div data-mdb-input-init
														class="form-outline mb-4 input-group">
														<input type="text" id="addNote${item.getProductId()}"
															class="form-control"
															placeholder="<fmt:message key='orderHistory.contentPlaceholder' />"
															name="content" required maxlength="255" />
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary"
														onclick="addComment('${item.getProductId()}');">
														<fmt:message key="orderHistory.save" />
													</button>
												</div>
											</div>
										</div>
									</div>
								</td>
								<td><a href="chi-tiet-sach?id=${item.getProductId()} ">
										<button type="button" class="btn btn-primary">
											<fmt:message key="orderHistory.reorder" />
										</button>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>

		<div class="text-center mt-4">
			<a href="home" class="btn btn-primary"><fmt:message
					key="orderHistory.backToHome" /></a>
		</div>

	</div>
	<div id="footer-placeholder">
		<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
	</div>
	<script src="webPage/trangChu/js/footer.js"></script>
	<script src="webPage/trangChu/js/header.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		async function addComment(productId){
			const selectedRate = document.getElementsByName("rate_"+productId);
			
			var rating = 0;
			selectedRate.forEach(rate =>{ if(rate.checked){
				rating = rate.value;
			}});
			if(selectedRate === null){
				console.log("<fmt:message key='error.noRating' />");
				return;
			}
			const content = document.getElementById("addNote"+productId);
			if(content.value === null){
				console.log("<fmt:message key='error.noContent' />");
				return;
			}
		 try {
			var url = ("comment?productId="+productId);
			url += ("&rating=" + rating);
			url += ("&content=" + content.value);
			await fetch(url, {
				method: 'GET',
			});
			content.value = "";
	        selectedRate.forEach(rate => rate.checked = false);
	        const modalElement = document.getElementById("exampleModal"+productId);
	        const modalInstance = bootstrap.Modal.getInstance(modalElement);
	        modalInstance.hide();
			alert("<fmt:message key='orderHistory.commentSuccess' />");
			
		} catch (e) {
			console.log(e.message);
		} 
	}
	</script>
</body>

</body>
</html>
