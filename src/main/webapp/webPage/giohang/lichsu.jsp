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
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đơn hàng của tôi</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="webPage/categoryAndSingle/css/star.css" rel="stylesheet">
<link href="webPage/giohang/css/history.css" rel="stylesheet">

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
	<input type="hidden" id="user" value="${user.getUserId()}">
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-3 sidebar">
				<div class="profile-info">
					<h4>${user.getUsername()}</h4>
					<p>Thành viên Bạc</p>
					<p>F-Point tích lũy: 0</p>
					<p>Thêm 30.000 đ để nâng hạng Vàng</p>
				</div>
				<ul>
					<li>Thông tin tài khoản</li>
					<li><strong>🛒 Đơn hàng của tôi</strong></li>
					<li>🎟️ Ví voucher</li>
					<li>💰 Tài Khoản F-Point / Freeship</li>
					<li>🔔 Thông Báo</li>
					<li>❤️ Sản phẩm yêu thích</li>
					<li>★ Nhận xét của tôi</li>
				</ul>
				
			<div class="container mt-4">
			    <form action="reportLostKey" method="post" id="lostKeyForm" onsubmit="return handleLostKeyReport(event)">
			        <input type="hidden" name="userId" value="${sessionScope.user.userId}" />
			        <button type="submit" class="btn btn-danger" id="lostKeyBtn">
			            Báo mất khóa
			        </button>
			    </form>
			
			    <!-- Div thông báo -->
			    <div id="notification" class="alert alert-success mt-3 d-none" role="alert">
			        <h5 class="alert-heading">Đã gửi email xác thực thành công!</h5>
			        <p>Vui lòng kiểm tra hộp thư của bạn và làm theo hướng dẫn để tạo khóa mới.</p>
			    </div>
			</div>

    
			</div>
			<div class="col-md-9 content">
				<div class="order-status">
					<span style="font-size: 20px; font-weight: bold;">Lịch sử
						mua hàng</span>

				</div>

				<c:forEach var="order" items="${orders}">
    <div class="order-summary card mb-3">
        <div class="card-header d-flex justify-content-between align-items-center">
            <div>
                <strong>Hoa don #${order.orderId}</strong> - 
                <span>Ngay dat: ${order.createDate}</span>
            </div>
            <div>
                <span class="badge 
                    <c:choose>
                        <c:when test="${order.signatureStatus == 'Chua ky'}">bg-warning</c:when>
                        <c:when test="${order.signatureStatus == 'Da ky - Toan ven'}">bg-success</c:when>
                        <c:otherwise>bg-danger</c:otherwise>
                    </c:choose>">
                    ${order.signatureStatus}
                </span>
                <button class="btn btn-sm btn-outline-primary ms-2" onclick="toggleOrderDetails('${order.orderId}')">
                    Chi tiet
                </button>
                <c:if test="${order.signatureStatus == 'Chua ky'}">
                   <a href="/BOOK_STORE/reorder?orderId=${order.orderId}" class="btn btn-sm btn-secondary">Ký lại</a>
                </c:if>
            </div>
        </div>
        <div class="card-body">
            <p>Tong tien: <strong>${order.totalFormatted}</strong></p>
            <p>So luong san pham: <strong>${fn:length(history[order.orderId])}</strong></p>
        </div>
        
        <div class="order-items px-3 pb-3" id="details-${order.orderId}" style="display: none;">
            <c:forEach var="item" items="${history[order.orderId]}">
                <div class="d-flex align-items-center border-top pt-2 mt-2">
                    <img src="getImage?img_id=${item.imgId}" class="img-thumbnail me-3" style="width: 80px; height: 80px;" />
                    <div>
                        <p class="mb-1">${item.productName}</p>
                        <p class="mb-0">So luong: ${item.quantity}</p>
                        <p class="mb-0">Gia: ${item.price} đ</p>
                    </div>
                    <div class="ms-auto">
                        <a href="chi-tiet-sach?id=${item.productId}" class="btn btn-sm btn-secondary">Mua lai</a>
                        <c:if test="${item.canCancel}">
                            <button class="btn btn-sm btn-danger ms-1" onclick="cancelOrder('${item.orderId}')">Huy don</button>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</c:forEach>
			</div>
		</div>
	</div>
	<div class="text-center mt-3">
		<a href="home" class="btn btn-warning">Về trang chủ</a>
	</div>
	<div id="footer-placeholder mt-3">
		<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
	</div>
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
    

    //hủy đơn hàng
   function cancelOrder(orderId) {
	    if (confirm("Bạn có chắc chắn muốn hủy đơn hàng không?")) {
	        fetch("/BOOK_STORE/cancelOrder", {
	            method: "POST",
	            headers: {
	                "Content-Type": "application/x-www-form-urlencoded"
	            },
	            body: "orderId=" + encodeURIComponent(orderId)
	        })
	        .then(response => {
	            if (!response.ok) throw new Error("Lỗi từ server");
	            return response.json();
	        })
	        .then(data => {
	            if (data.success) {
	                // 1. Cập nhật trạng thái hiển thị
	                const statusBadge = document.getElementById('badge');
	                if (statusBadge) {
	                    statusBadge.className = "badge bg-danger";
	                    statusBadge.textContent = "deleted";
	                }
	                
	                // 2. Ẩn nút hủy đơn
	                const cancelButton = document.getElementById('remove');
	                if (cancelButton) {
	                    cancelButton.remove();
	                }
	                
	                alert("Đã hủy đơn hàng thành công!");
	            } else {
	                alert("Hủy đơn hàng thất bại: " + (data.message || "Lỗi không xác định"));
	            }
	        })
	        .catch(error => {
	            console.error("Lỗi: ", error);
	            alert("Hủy đơn hàng thất bại!");
	        });
	    }
	}
    
   function toggleOrderDetails(orderId) {
       const details = document.getElementById('details-' + orderId);
       if (details.style.display === 'none') {
           details.style.display = 'block';
       } else {
           details.style.display = 'none';
       }
   }
   function handleLostKeyReport(event) {
	    event.preventDefault();
	    const form = document.getElementById("lostKeyForm");
	    const notification = document.getElementById("notification");

	    // Hiển thị ngay thông báo (dự đoán thành công)
	    notification.classList.remove("d-none");
	    notification.classList.remove("alert-danger");
	    notification.classList.add("alert-success");
	    notification.innerHTML = `
	        <h5 class="alert-heading">Đang xử lý yêu cầu...</h5>
	        <p>Vui lòng đợi trong giây lát.</p>
	    `;

	    fetch(form.action, {
	        method: "POST",
	        body: new FormData(form)
	    })
	    .then(res => {
	        if (res.ok) {
	            notification.innerHTML = `
	                <h5 class="alert-heading">Đã gửi email xác thực thành công!</h5>
	                <p>Vui lòng kiểm tra hộp thư của bạn và làm theo hướng dẫn để tạo khóa mới.</p>
	            `;
	        } else {
	            throw new Error("Phản hồi không hợp lệ");
	        }
	    })
	    .catch(err => {
	        notification.classList.remove("alert-success");
	        notification.classList.add("alert-danger");
	        notification.innerHTML = `
	            <h5 class="alert-heading">Có lỗi xảy ra!</h5>
	            <p>Vui lòng thử lại hoặc kiểm tra kết nối mạng.</p>
	        `;
	        console.error(err);
	    });

	    return false;
	}

    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>