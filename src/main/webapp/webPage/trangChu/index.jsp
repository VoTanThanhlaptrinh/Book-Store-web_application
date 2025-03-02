<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
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
<link rel="stylesheet" href="webPage/trangChu/CSS/index.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
<title>Trang chủ</title>
</head>
<body>
    <c:if test="${user != null}">
        <div id="header-placeholder"><jsp:include page="/webPage/trangChu/re-header.jsp"></jsp:include></div>
    </c:if>
    <c:if test="${user == null}">
        <div id="header-placeholder"><jsp:include page="/webPage/trangChu/header.jsp"></jsp:include></div>
    </c:if>

    <div>
        <img alt="" src="webPage/trangChu/images/banner1.png">
    </div>
    
    <div style="height: 50px; padding-top: 60px;">
        <!-- Nội dung trang giả lập -->
    </div>
    <div class="topic">
        <h2 class="danhmuc"><fmt:message key="random" /></h2> <!-- Updated -->
        <div class="bookshelf">
            <c:forEach var="product" items="${randomList}">
                <a href="chi-tiet-sach?id=${product.getProductId()}" class="giasoc-button"> 
                    <img class="item-img" src="getImage?img_id=${product.getImgId()}" alt="">
                    <p class="book-title">${product.getTitle()}</p>
                    ${product.getPrice()}đ
                </a>
            </c:forEach>
        </div>
    </div>
    
    <div style="height: 50px; padding-top: 60px;">
        <!-- Nội dung trang giả lập -->
    </div>
    
    <div class="topic">
        <h2 class="giasoc">
            <i class="fa-solid fa-cart-shopping" style="color: #ffffff; background-color: rgb(255, 85, 59); margin-right: 10px; margin-left: 10px;"></i>
            <fmt:message key="new_product" /> <!-- Updated -->
        </h2>
        <div class="button-list">
            <c:forEach var="product" items="${topRecentList}">
                <a href="chi-tiet-sach?id=${product.getProductId()}" class="giasoc-button"> 
                    <img class="item-img" src="getImage?img_id=${product.getImgId()}" alt="">
                    <p class="book-title">${product.getTitle()}</p>
                    ${product.getPrice()}đ
                </a>
            </c:forEach>
        </div>
    </div>
    
    <a><button class="xem-them"><fmt:message key="see_more" /></button></a> <!-- Updated -->

    <div style="height: 50px; padding-top: 60px;">
        <!-- Nội dung trang giả lập -->
    </div>
    
    <div class="topic">
        <h2 class="danhmuc"><fmt:message key="novel" /></h2> <!-- Updated -->
        <div class="bookshelf">
            <c:forEach var="tieuthuyet" items="${tieuthuyet}">
                <a href="chi-tiet-sach?id=${tieuthuyet.getProductId()}" class="giasoc-button"> 
                    <img class="item-img" src="getImage?img_id=${tieuthuyet.getImgId()}" alt="">
                    <p class="book-title">${tieuthuyet.getTitle()}</p>
                    ${tieuthuyet.getPrice()}đ
                </a>
            </c:forEach>
        </div>
    </div>

    <div style="height: 50px; padding-top: 60px;">
        <!-- Nội dung trang giả lập -->
    </div>
    
    <div class="categories-container">
        <div class="category">
            <h3><fmt:message key="domestic_literature" /></h3> <!-- Updated -->
            <div class="banner">
                <span><fmt:message key="domestic_literature" /></span> <img src="webPage/trangChu/images/bookbanner.jpg" alt="Văn học banner">
            </div>
            <div class="books">
                <img src="webPage/trangChu/images/sach1.webp" alt="Book 1"> 
                <img src="webPage/trangChu/images/sach2.webp" alt="Book 2"> 
                <img src="webPage/trangChu/images/sach3.webp" alt="Book 3"> 
                <img src="webPage/trangChu/images/sach4.webp" alt="Book 4">
            </div>
        </div>
        <!-- More categories here with <fmt:message key="domestic_literature" /> -->
    </div>

    <!-- Footer will be included here -->
    <div id="footer-placeholder">
        <jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
    </div>
    <script src="webPage/trangChu/js/footer.js"></script>
    <script src="webPage/trangChu/js/header.js"></script>
</body>
</html>
</html>