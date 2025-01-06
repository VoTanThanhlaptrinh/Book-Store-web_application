<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<link href="webPage/categoryAndSingle/css/style.css" rel="stylesheet">
<title>Kho sách</title>
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
	<main class="container">
	   <!-- Thông báo thêm thành công -->
    <c:if test="${not empty message}">
        <div class="alert alert-success" role="alert">
            ${message}
        </div>
    </c:if>
   
		<form class="container d-flex align-items-center gap-2 mt-5 mb-5 pd-top" action="tim-sach" method="get">
		    <select class="form-select" name="category" style="width: auto;">
		        <option value="${category}">${category}</option>
		        <option value="Khoa học - Tương lai">Khoa học - Tương lai</option>
		        <option value="Lịch sử - Quân sự">Lịch sử - Quân sự</option>
		        <option value="Kinh tế - Tài chính">Kinh tế - Tài chính</option>
		        <option value="Quản trị - Lãnh đạo">Quản trị - Lãnh đạo</option>
		        <option value="Phát triển bản thân">Phát triển bản thân</option>
		        <option value="Tâm lý học">Tâm lý học</option>
		        <option value="Truyện ngắn">Truyện ngắn</option>
		    </select> 
		    <input class="form-control" name="search" placeholder="search">
		    <button class="btn btn-primary d-flex align-items-center" type="submit">
		        <span class="material-symbols-outlined">search</span>
		    </button>
</form>
	<c:if test="${empty products}">
    <div class="row justify-content-center">
        <div class="col-md-6 text-center">
            <h3>Không có sách cần tìm</h3>
        </div>
    </div>
</c:if>
<c:if test="${not empty products}">
   <c:forEach var="i" begin="0" end="${row}">
    <c:choose>
        <c:when test="${i < row}">
            <div class="row justify-content-center">
                <c:forEach var="j" begin="0" end="3">
                    <div class="col-md-3">
                        <!-- Link bao quanh thẻ card -->
                        <a href="chi-tiet-sach?id=${products.get(j + (i * 3) + i).getProductId()}" class="card-link text-decoration-none">
                            <div class="card hover-card">
                                <img src="getImage?img_id=${products.get(j + (i * 3) + i).getImgId()}" 
                                     class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">${products.get(j + (i * 3) + i).getTitle()}</h5>
                                    <p class="card-text">Giá: ${products.get(j + (i * 3) + i).getPrice()}</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:when test="${i == row}">
            <div class="row justify-content-center">
                <c:forEach var="j" begin="0" end="${lastRow - 1}">
                    <div class="col-md-3">
                        <!-- Link bao quanh thẻ card -->
                        <a href="chi-tiet-sach?id=${products.get(j + (i * 3) + i).getProductId()}" class="card-link text-decoration-none">
                            <div class="card hover-card">
                                <img src="getImage?img_id=${products.get(j + (i * 3) + i).getImgId()}" 
                                     class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">${products.get(j + (i * 3) + i).getTitle()}</h5>
                                    <p class="card-text">Giá: ${products.get(j + (i * 3) + i).getPrice()}</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </c:when>
    </c:choose>
</c:forEach>

</c:if>


<!-- Phân trang -->
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