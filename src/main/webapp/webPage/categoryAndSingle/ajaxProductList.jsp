<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/webPage/lib/tag.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

			<div class="item-filter-img">
				<img
					src="https://cdn1.fahasa.com/media/magentothem/banner7/CanhCutThanToc_840x320.png"
					alt="">
			</div>
			<div class="item-filter-sort-type">
				<h4>Sắp xếp theo:</h4>
				<div class="item-filter-dropdown">
					<button class="item-filter-dropdown-button">
						Bán Chạy Tuần <span class="arrow">▼</span>
					</button>
					<ul class="item-filter-dropdown-menu">
						<li>Bán Chạy Ngày</li>
						<li>Bán Chạy Tháng</li>
						<li>Bán Chạy Năm</li>
					</ul>
				</div>
				<div class="san-pham">8 Sản Phẩm</div>
			</div>
			<div class="line"></div>


			<div class="xu_huong_mua_sam">
				<div class="display-list-grid" >
					<c:forEach var="product" items="${products}">
						<div class="sale-books-element">
							<img src="getImage?img_id=${product.getImgId()}"
								alt="${product.title}">
							<p class="text-limited">${product.title}</p>
							<div class="gia-tien-giam">
								<h4>${product.price}VND</h4>
								<h5>36%</h5>
								<!-- Giảm giá cố định -->
							</div>
							<h6>200.000 VND</h6>
							<!-- Giá gốc giả định -->
						</div>
					</c:forEach>
				</div>
				<input type="hidden" id="parent-category" value="${parentcategory}">
				<input type="hidden" id="sub-category" value="${subcategory}">		
			</div>

			<!-- Phân trang -->
			<div class="pagination">
				<!-- Nút "<" -->
				<c:if test="${currentPage > 1}">
					<button onclick="loadFilteredPageProducts(1,event)"><<</button>
					<button onclick="loadFilteredPageProducts(${currentPage - 1},event)"><</button>
				</c:if>

				<!-- Hiển thị các trang gần đây -->
				<c:set var="startPage"
					value="${currentPage - 2 > 0 ? currentPage - 2 : 1}" />
				<c:set var="endPage"
					value="${currentPage + 2 < totalPages ? currentPage + 2 : totalPages}" />

				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span class="page-number" onclick="loadFilteredPageProducts(${i},event)">${i}</span>
				</c:forEach>

				<!-- Nút ">" -->
				<c:if test="${currentPage < totalPages}">
					<button class="next-btn"
						onclick="loadFilteredPageProducts(${currentPage + 1},event)">></button>
					<button class="next-btn"
						onclick="loadFilteredPageProducts(${totalPages},event)">>></button>
				</c:if>
			</div>


</html>