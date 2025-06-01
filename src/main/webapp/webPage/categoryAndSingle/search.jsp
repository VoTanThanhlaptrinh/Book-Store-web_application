<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
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
<link rel="stylesheet"
	href="/BOOK_STORE/webPage/categoryAndSingle/css/search.css">
<script src="https://cdn.lordicon.com/lordicon.js"></script>
<script
	src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs"
	type="module"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<title>Search</title>
</head>
<body>
   	<c:if test="${user != null}">
		<div id="header-placeholder"><jsp:include
				page="/webPage/trangChu/re-header.jsp"></jsp:include></div>
	</c:if>
	<c:if test="${user == null}">
		<div id="header-placeholder"><jsp:include
				page="/webPage/trangChu/header.jsp"></jsp:include></div>
	</c:if>
    
    <div class="return-to-index">
        <div class="returun-to-index-a">
           <a href="#">Trang chủ</a>
        </div>
            <p> > Danh mục sản phẩm </p>
    </div>



     <div class="container">
            <div class = "item-filter">

                <div class="search-result-log">
                        <h3>KẾT QUẢ TÌM KIẾM CỦA:</h3>
                        <h3>${query}</h3>
                         </div>

                <div class="item-filter-sort-type">
                    <h4>có: </h4>
                    <div class="san-pham">${prtotal} sản phẩm</div>
                </div>
                <div id="active-filters" style="margin-bottom: 20px;"></div>
                <div class="line"></div>
                <div class="line"></div>
			<div class="xu_huong_mua_sam">
				<div class="display-list-grid" >
					<c:forEach var="product" items="${products}">
						<a class="sale-books-element" href="chi-tiet-sach?id=${product.getProductId()}">
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
						</a>
					</c:forEach>
				</div>
			</div>
                <!-- Phân trang -->
			<div class="pagination">
				<!-- Nút "<" -->
				<c:if test="${currentPage > 1}">
					<button class="prev-btn" onclick="loadFilteredPageProducts(1, event)"><<</button>
					<button class="prev-btn" onclick="loadFilteredPageProducts(${currentPage - 1}, event)"><</button>
				</c:if>

				<!-- Hiển thị các trang gần đây -->
				<c:set var="startPage"
					value="${currentPage - 2 > 0 ? currentPage - 2 : 1}" />
				<c:set var="endPage"
					value="${currentPage + 2 < totalPages ? currentPage + 2 : totalPages}" />

				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span class="page-number" onclick="loadFilteredPageProducts(${i}, event)">${i}</span>
				</c:forEach>

				<!-- Nút ">" -->
				<c:if test="${currentPage < totalPages}">
					<button class="next-btn"
						onclick="loadFilteredPageProducts(${currentPage + 1},event)">></button>
					<button class="next-btn"
						onclick="loadFilteredPageProducts(${totalPages}, event)">>></button>
				</c:if>
			</div>
            </div>
     </div>       

    <script>
		    document.querySelectorAll(".page-number").forEach((page) => {
		        page.addEventListener("click", function () {
		          // Xóa class 'active' khỏi tất cả các trang
		          document.querySelectorAll(".page-number").forEach((p) => {
		            p.classList.remove("active");
		          });
		      
		          // Thêm class 'active' vào trang được nhấn
		          page.classList.add("active");
		        });
		      });
		    function loadFilteredPageProducts(page, event) {
		        event.preventDefault();
		        var urlParams = new URLSearchParams(window.location.search);
		        var query = urlParams.get("query") || "";

		        window.location.href = "search?query=" + encodeURIComponent(query) + "&page=" + page;
		    }
        </script>
</body>
</html>