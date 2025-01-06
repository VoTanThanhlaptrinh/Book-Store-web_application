<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">
<link href="webPage/categoryAndSingle/css/style.css" rel="stylesheet">
<title>Document</title>
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
	<c:if test="${not empty failedMess}">
        <div class="alert alert-danger" role="alert">
            ${failedMess}
        </div>
    </c:if>
    
    	<c:if test="${not empty noMess}">
        <div class="alert alert-danger" role="alert">
            ${noMess}
        </div>
    </c:if>
	<main class="d-flex d-inline-block container align-items-center justify-content-center">
<section class="container-sm mt-3 card shadow-0 border"> 
    <h3>${product.getTitle()}</h3>
    <div class="row">
        <!-- Cột chứa hình ảnh -->
        <div class="col-5">
            <img src="getImage?img_id=${product.getImgId()}" alt="Book Image" class="img-fluid">
        </div>
        <!-- Cột chứa thông tin chi tiết -->
        <div class="col-7">
            <h3>${product.getTitle()}</h3>
            <p>Details: ${product.getDescription()}</p>
              <!-- Hiển thị số lượng sản phẩm hiện có -->
            <p><strong>Số lượng còn lại:</strong> ${product.getQuantity()}</p>
            
            <div class="input-group">
                <label for="amount">Amount: </label>
                <!-- Thêm name="amount" -->
                <input type="number" id="amount" name="amount" placeholder="Amount" value="1" class="form-control mx-auto mb-3">
            </div>

            <!-- Group nút chức năng -->
            <div class="button-group">
                <!-- Nút thêm vào giỏ hàng -->
                <form action="add-to-cart" method="post" onsubmit="cartUpdateHiddenAmount(event)">
                    <input type="hidden" name="id" value="${product.getProductId()}">    
                    <input type="hidden" id="hiddenAmount1" name="amount" value="1">
                    	 <input type="hidden" name="pdQuantity" value="${product.getQuantity()}">   
                    <input type="hidden" name="title" value="${product.getTitle()}">
                    <button class="btn btn-primary w-100" type="submit">
                        Cart<span class="material-symbols-outlined">shopping_cart</span>
                    </button>
                </form>
                <!-- Nút thanh toán -->
                <form action="checkout" method="post" onsubmit="CheckOutUpdateHiddenAmount(event)">
                     <input type="hidden" name="id" value="${product.getProductId()}">    
                    <input type="hidden" id="hiddenAmount2" name="amount" value="1">
  					 <input type="hidden" name="pdQuantity" value="${product.getQuantity()}">   
                    <input type="hidden" name="title" value="${product.getTitle()}">
                    <button class="btn btn-primary w-100" type="submit">
                        Thanh toán<span class="material-symbols-outlined">attach_money</span>
                    </button>
                </form>
            </div>
        </div>
    </div>
</section>

<script>
    function cartUpdateHiddenAmount(event) {
        // Lấy giá trị từ ô số lượng
        const amount = document.getElementById('amount').value;
        // Cập nhật giá trị cho thẻ hidden
        document.getElementById('hiddenAmount1').value = amount;
    }
    
    function CheckOutUpdateHiddenAmount(event) {
        // Lấy giá trị từ ô số lượng
        const amount = document.getElementById('amount').value;
        // Cập nhật giá trị cho thẻ hidden
        document.getElementById('hiddenAmount2').value = amount;
    }
</script>

</main>

	<div class="container pt-5 ">
		<div class="row d-flex justify-content-center">
			<div class="col-md-8 col-lg-10">
				<div class="card shadow-0 border">
					<h3>Đánh giá sản phẩm</h3>
					<div class="card-body p-4">
						<div data-mdb-input-init class="form-outline mb-4 input-group">
							<input type="text" id="addANote" class="form-control"
								placeholder="Type comment..." />
							<button class="btn btn-primary">Publish</button>
						</div>
						<div class="navbar-nav-scroll">
							<div class="card mb-4 ">
								<div class="card-body">
									<p>Type your note, and hit enter to add it</p>

									<div class="d-flex justify-content-between">
										<div class="d-flex flex-row align-items-center">
											<img
												src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(32).webp"
												alt="avatar" width="25" height="25" />
											<p class="small mb-0 ms-2">Johny</p>
										</div>
										<div class="d-flex flex-row align-items-center">
											<a class="small text-muted mb-0">Like</a> <i
												class="far fa-thumbs-up mx-2 fa-xs text-body"
												style="margin-top: -0.16rem;"></i>
											<p class="small text-muted mb-0">4</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>