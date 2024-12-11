<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=search" />
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
<link href="webPage/categoryAndSingle/style.css" rel="stylesheet">
<title>Kho sách</title>
</head>

<body>
	<div id="header-placeholder"><jsp:include
			page="/webPage/trangChu/header.jsp"></jsp:include></div>
	<main class="container">
		<form
			class="container d-flex align-items-center gap-2 mt-5  mb-5">
			<select class="form-select" style="width: auto;">
				<option>Option A Option A</option>
			</select> <input class="form-control" placeholder="search">
			<button class="btn btn-primary d-flex align-items-center">
				<span class="material-symbols-outlined">search</span>
			</button>
		</form>
		<c:forEach var="i" begin="0" end="${row}">
			<c:choose>
				<c:when test="${i < row}">
					<div class="row justify-content-center">
						<c:forEach var="j" begin="0" end="3">
							<div class="col-md-3">
								<div class="card">
									<img
										src="getImage?img_id=${products.get(j +(i * 3)+ i).getImgId()}"
										class="card-img-top " alt="...">
									<div class="card-body">
										<h5 class="card-title">${products.get(j +(i * 3) +i).getTitle()}</h5>
										<p class="card-text">Giá: ${products.get(j +(i * 3) +i).getPrice()}</p>
										<a href="#" class="btn btn-primary">Add to cart</a> <a
											href="#" class="btn btn-primary">Buy</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:when>
				<c:when test="${i == row}">
					<div class="row justify-content">
						<c:forEach var="j" begin="0" end="${lastRow-1}">
							<div class="col-md-3">
								<div class="card">
									<img
										src="getImage?img_id=${products.get(j +(i * 3)+i).getImgId()}"
										class="card-img-top " alt="...">
									<div class="card-body">
										<h5 class="card-title">${products.get(j +(i * 3)+i).getTitle()}</h5>
										<p class="card-text">Giá: ${products.get(j +(i * 3)+i).getPrice()}</p>
										<a href="#" class="btn btn-primary">Add to cart</a> <a
											href="#" class="btn btn-primary">Buy</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:when>
			</c:choose>
		</c:forEach>
		<nav aria-label="Page navigation example" class="mt-3 mb-3">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1" aria-disabled="true">Previous</a></li>
				<li class="page-item"><a class="page-link"
					href="tim-sach?pageNum=1">1</a></li>
				<li class="page-item"><a class="page-link"
					href="tim-sach?pageNum=2">2</a></li>
				<li class="page-item"><a class="page-link"
					href="tim-sach?pageNum=3">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</main>
	<div id="footer-placeholder">
		<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
	</div>
	<script src="webPage/trangChu/js/footer.js"></script>
	<!-- Thêm file JavaScript cho footer -->
	<script src="webPage/trangChu/js/header.js"></script>
</body>

</html>