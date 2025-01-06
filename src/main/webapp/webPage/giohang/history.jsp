<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch Sử Mua Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
<link href="webPage/categoryAndSingle/css/style.css" rel="stylesheet">
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
    <div class="container mt-5">
        <h2 class="text-center">Lịch Sử Mua Hàng</h2>
        <hr>
        <c:choose>
            <c:when test="${empty history}">
                <div class="alert alert-info text-center">
                    Bạn chưa có lịch sử mua hàng nào.
                </div>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered table-striped">
                    <thead class="table-primary">
                        <tr>
                            <th>#</th>
                            <th>Hình Ảnh</th>
                            <th>Mã Sản Phẩm</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Số Lượng</th>
                            <th>Ngày Tạo</th>
                            <th>Giá Tiền</th>
                            <th>Bình Luận</th>
                            <th>Mua lại</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${history}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>
                                    <img src="/images/${item.getImgId()}.jpg" alt="${item.getName()}" class="img-thumbnail" style="width: 100px; height: 100px;">
                                </td>
                                <td>${item.getProductId()}</td>
                                <td>${item.getName()}</td>
                                <td>${item.getQuantity()}</td>
                                <td>${item.getCreateDate()}</td>
                                
                                <td>${item.getPrice()}</td>
                                <td> <a href="#"> bình luận </a> </td>
                                <td> <a href="chi-tiet-sach?id=${item.getProductId()} "> mua lại </a> </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
        <div class="text-center mt-4">
            <a href="home" class="btn btn-primary">Quay Lại Trang Chủ</a>
        </div>
    <div id="footer-placeholder">
		<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
	</div>
	</div>
	<script src="webPage/trangChu/js/footer.js"></script>
	<!-- Thêm file JavaScript cho footer -->
	<script src="webPage/trangChu/js/header.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
