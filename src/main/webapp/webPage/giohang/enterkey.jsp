<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Nhập public key mới</title>
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
<link rel="stylesheet"
	href="/BOOK_STORE/webPage/giohang/css/enterkey.css">
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
     <div class="container">
        <h2>Nhập khóa mới</h2>
        <form action="submitNewKey" method="post">
            <div class="form-group">
                <label for="newPublicKey">
                   Public key mới:
                </label>
                <textarea 
                    name="newPublicKey" 
                    id="newPublicKey"
                    placeholder="Nhập public key của bạn vào đây..."
                    required
                ></textarea>
            </div>
            <button type="submit" class="submit-btn">
                Cập nhật khóa
            </button>
        </form>
    </div>
    <footer>
		<div id="footer-placeholder">
			<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
		</div>
	</footer>

	<script src="webPage/trangChu/js/footer.js"></script>
	<!-- Thêm file JavaScript cho footer -->
	<script src="webPage/trangChu/js/header.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>