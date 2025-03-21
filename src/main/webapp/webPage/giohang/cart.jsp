<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<%@ include file="/webPage/lib/tag.jsp"%>
<!-- Lấy tham số lang từ URL và thiết lập Locale -->
<fmt:setLocale
	value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}" />
<fmt:setBundle basename="messages" />
<c:if test="${param.lang != null}">
	<c:set var="lang" value="${param.lang}" scope="session" />
</c:if>
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
       <fmt:message key="${usmess}" />
    </div>
</c:if>

<div class="container my-5">
    <h1 class="text-center mb-4"><fmt:message key="cart_header" /></h1>
    
    <form action="checkout" method="post">
        <c:if test="${not empty cartProduct}">
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th><fmt:message key="cart_select" /></th>
                        <th><fmt:message key="cart_image" /></th>
                        <th><fmt:message key="cart_product_id" /></th>
                        <th><fmt:message key="cart_product_name" /></th>
                        <th><fmt:message key="cart_quantity" /></th>
                        <th><fmt:message key="cart_date_added" /></th>
                        <th><fmt:message key="cart_price" /></th>
                        <th><fmt:message key="cart_total_price" /></th>
                        <th><fmt:message key="cart_action" /></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${cartProduct}">
                        <tr>
                            <td>
                                <input type="checkbox" name="selectedItems" value="${item.getCartItemId()},${item.getQuantity()},${item.getProductId()}" class="form-check-input">
                            </td>
                            <td>
                                <img src="getImage?img_id=${item.getImgId()}" alt="<fmt:message key='cart_product' />" style="width: 50px; height: 50px;">
                            </td>
                            <td>${item.getProductId()}</td>
                            <td>${item.getName()}</td>
                            <td>${item.getQuantity()}</td>
                            <td>${item.getCreateDate()}</td>
                            <td>${item.getPrice()}</td>
                            <td>${item.getQuantity() * item.getPrice()}</td>
                            <td>
                                <a href="delete?id=${item.getCartItemId()}"><fmt:message key="cart_delete" /></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="text-end mt-3">
                <div>
                    <strong><fmt:message key="cart_total" />: </strong>
                    <span>${sumCart}</span>
                </div>
                <button type="submit" class="btn btn-success"><fmt:message key="cart_checkout" /></button>
                <a href="home" class="btn btn-primary"><fmt:message key="cart_continue_shopping" /></a>
            </div>
        </c:if>
        
        <c:if test="${empty cartProduct}">
            <div class="alert alert-warning text-center" role="alert">
                <fmt:message key="cart_empty" />
            </div>
            <div class="text-center mt-3">
                <a href="home" class="btn btn-primary"><fmt:message key="cart_back_to_products" /></a>
            </div>
        </c:if>
    </form>
</div>

<div id="footer-placeholder">
    <jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
</div>
<script src="webPage/trangChu/js/footer.js"></script>
<script src="webPage/trangChu/js/header.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>

</body>
</html>