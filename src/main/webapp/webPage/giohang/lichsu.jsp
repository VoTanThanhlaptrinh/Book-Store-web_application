<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<fmt:setLocale value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}" />
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
}

.sidebar {
    background-color: #fff;
    border-right: 1px solid #dee2e6;
    padding: 20px;
    height: 100vh;
}

.sidebar .profile-info {
    text-align: center; /* Căn giữa nội dung */
}

.sidebar h4 {
    font-size: 1.25rem;
    font-weight: bold;
    margin-bottom: 5px;
}

.sidebar p {
    margin: 5px 0;
    color: #6c757d;
}

.sidebar ul {
    list-style: none;
    padding: 0;
    margin-top: 20px; /* Tạo khoảng cách với phần thông tin */
}

.sidebar ul li {
    padding: 10px 0;
    color: #495057;
}

.sidebar ul li::before {
    margin-right: 5px;
}

.alert {
    background-color: #fff3cd;
    color: #856404;
    border: none;
}

.order-status {
    display: flex;
    justify-content: space-between;
    background-color: #fff;
    border: 1px solid #dee2e6;
    border-radius: 5px;
    padding: 10px;
    margin: 0 0 10px 0;
}

.order-status span {
    flex: 1;
    text-align: center;
    border-right: 1px solid #dee2e6;
    color: #495057;
}

.order-status span:last-child {
    border-right: none;
}

.order-details {
    background-color: #fff;
    border: 1px solid #dee2e6;
    border-radius: 5px;
    padding: 15px;
    margin-bottom: 20px;
}

.order-details img {
    max-width: 80px;
    margin-right: 10px;
}

.total {
    text-align: right;
}

.btn-cancel {
    background-color: #dc3545;
    border: none;
}

.btn-rebuy {
    background-color: #F57224;
    color: white;
    border: none;
    transition: background-color 0.3s ease; /* Thêm hiệu ứng chuyển đổi mượt mà */
}

.btn-rebuy:hover {
  color: white;
    background-color: #e65c00; /* Màu đậm hơn khi hover */
}
.sidebar ul li{
cursor: pointer;}
</style>
</head>
<body>

    <c:choose>
        <c:when test="${not empty user}">
            <div id="header-placeholder"><jsp:include page="/webPage/trangChu/re-header.jsp"></jsp:include></div>
        </c:when>
        <c:otherwise>
            <div id="header-placeholder"><jsp:include page="/webPage/trangChu/header.jsp"></jsp:include></div>
        </c:otherwise>
    </c:choose>
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
            </div>
            <div class="col-md-9 content">
                <div class="order-status">
                    <span style="font-size: 20px; font-weight: bold;">Lịch sử mua hàng</span>

                </div>
                
                <c:forEach var="item" items="${history}" varStatus="status">
                <div class="order-details">
                    <div class="order-info" style="display: flex; justify-content: space-between; align-items: center;">
                        <span>#${item.getProductId()}</span> <span>${item.getCreateDate()}</span>
                    </div>

                    <div class="d-flex align-items-center">
                        <img src="getImage?img_id=${item.getImgId()}" alt="${item.getName()}" class="img-thumbnail" style="width: 100px; height: 100px;">
                        <div>
                            <p class="mb-1">${item.getName()}</p>
                            <p class="mb-0">Số lượng: ${item.getQuantity()}</p>
                            <p class="mb-0">Giá: ${item.getPrice()}</p>
                        </div>
                    </div>
                    <div class="total">
                        <p>Tổng tiền: ${item.getQuantity()*item.getPrice()} đ</p>
                        
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${item.getProductId()}">
                            <c:if test="${!evaluate.checkProductHasBeenEvaluated(item.getProductId(),user.getUserId())}">
                                đánh giá
                            </c:if>
                            <c:if test="${evaluate.checkProductHasBeenEvaluated(item.getProductId(),user.getUserId())}">
                                đánh giá lại
                            </c:if>
                        </button>
                        <div class="modal fade" id="exampleModal${item.getProductId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel${item.getProductId()}" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel${item.getProductId()}">
                                            <fmt:message key="orderHistory.commentModalTitle" />
                                        </h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div style="display: flex;">
                                            <label class="rating-label" title="text"><fmt:message key="orderHistory.rating" />:</label>
                                            <div class="rate">
                                                <input type="radio" id="star5_${item.getProductId()}" name="rate_${item.getProductId()}" value="5" /> <label for="star5_${item.getProductId()}" title="text">5 stars</label>
                                                <input type="radio" id="star4_${item.getProductId()}" name="rate_${item.getProductId()}" value="4" /> <label for="star4_${item.getProductId()}" title="text">4 stars</label>
                                                <input type="radio" id="star3_${item.getProductId()}" name="rate_${item.getProductId()}" value="3" /> <label for="star3_${item.getProductId()}" title="text">3 stars</label>
                                                <input type="radio" id="star2_${item.getProductId()}" name="rate_${item.getProductId()}" value="2" /> <label for="star2_${item.getProductId()}" title="text">2 stars</label>
                                                <input type="radio" id="star1_${item.getProductId()}" name="rate_${item.getProductId()}" value="1" /> <label for="star1_${item.getProductId()}" title="text">1 star</label>
                                            </div>
                                        </div>

                                        <div data-mdb-input-init class="form-outline mb-4 input-group">
                                            <input type="text" id="addNote${item.getProductId()}" class="form-control" placeholder="<fmt:message key='orderHistory.contentPlaceholder' />" name="content" required maxlength="255" />
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" onclick="addComment('${item.getProductId()}');">
                                            <fmt:message key="orderHistory.save" />
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="chi-tiet-sach?id=${item.getProductId()}">
                            <button class="btn btn-rebuy">Mua lại</button>
                        </a>
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
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>