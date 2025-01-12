<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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
	<c:if test="${not empty usmess}">
        <div class="alert alert-success" role="alert">
            ${usmess}
        </div>
    </c:if>
    <div class="container my-5">
        <h1 class="text-center mb-4">Giỏ Hàng Của Bạn</h1>
        
        <form action="checkout" method="post">
            <c:if test="${not empty cartProduct}">
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Chọn</th>
                            <th>Hình Ảnh</th>
                            <th>ID Sản Phẩm</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Số Lượng</th>
                            <th>Ngày Thêm</th>
                            <th>Giá</th>
                            <th>Tổng Giá</th>
                             <th>Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cartProduct}">
                            <tr>
                                <!-- Checkbox để chọn sản phẩm -->
                                <td>
                                	
                                    <input type="checkbox" name="selectedItems" value="${item.getCartItemId()},${item.getQuantity()},${item.getProductId()}" class="form-check-input">
                                </td>
                                <!-- Hiển thị hình ảnh -->
                                <td>
                                    <img src="images/${item.getImgId()}.jpg" alt="Sản Phẩm" style="width: 50px; height: 50px;">
                                </td>
                                <td>${item.getProductId()}</td>
                                <td>${item.getName()}</td>
                                <td>${item.getQuantity()}</td>
                                <td>${item.getCreateDate()}</td>
                                <td>${item.getPrice()}</td>
                                <td>${item.getQuantity() * item.getPrice()}</td>
                                  <td>
			                   			<a href="delete?id=${item.getCartItemId()}"> xóa </a>
              					  </td>
                           </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="text-end mt-3">
                      <div>
				           <strong>Tổng Hàng: </strong>
				           <span>${sumCart}</span>
				      </div>
                    <button type="submit" class="btn btn-success">Thanh Toán Các Sản Phẩm Đã Chọn</button>
                    
                    <a href="home" class="btn btn-primary">Tiếp Tục Mua Sắm</a>
                </div>
            </c:if>
            
            <c:if test="${empty cartProduct}">
                <div class="alert alert-warning text-center" role="alert">
                    Giỏ hàng của bạn đang trống.
                </div>
                <div class="text-center mt-3">
                    <a href="home" class="btn btn-primary">Quay lại trang sản phẩm</a>
                </div>
            </c:if>
        </form>
    </div>
    	<div id="footer-placeholder">
		<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
	</div>
	<script src="webPage/trangChu/js/footer.js"></script>
	<!-- Thêm file JavaScript cho footer -->
	<script src="webPage/trangChu/js/header.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>