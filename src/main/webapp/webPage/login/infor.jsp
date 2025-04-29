<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/webPage/lib/tag.jsp"%>
<!-- Lấy tham số lang từ URL và thiết lập Locale -->
<fmt:setLocale value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}"  />
<fmt:setBundle basename="messages" />
<c:if test="${param.lang != null}">
	<c:set var="lang" value="${param.lang}" scope="session" />
</c:if>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang thông tin cá nhân</title>

<link href="webPage/login/css/infor.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="webPage/trangChu/CSS/footer.css">

	
</head>

<body>
	<header>
		<div id="header-placeholder"><jsp:include
				page="/webPage/trangChu/re-header.jsp"></jsp:include></div>
	</header>

	<div class="info-body">
	<div class="container bg-white rounded-4 shadow-lg p-0" style="max-width: 80%;">
	  <div class="row g-0 flex-md-row flex-column">
	    
	    <!-- Sidebar -->
	    <div class="col-md-3 bg-light p-4 sidebar d-flex flex-column">
	      <h5 class="mb-4 fw-bold">Cài đặt</h5>
	      <a href="#" class="text-decoration-none active" data-form="overview">Thông tin cá nhân</a>
	      <a href="#" class="text-decoration-none" data-form="password">Đổi mật khẩu</a>
	    </div>
	
	    <!-- Content -->
	    <section class="col-md-9 p-5">
	      
	      <!-- Overview Form -->
	      <div id="overview" class="form-box active">
	        <h3 class="mb-4 fw-bold">Thông tin cá nhân</h3>
	        <form id="details-form">
	          <div class="form-row">
	            <!-- Bên trái: Các input ban đầu -->
	            <div class="col-md-6">
	              <div class="form-floating mb-3">
	                <input type="text" class="form-control shadow-sm" id="fullname" name="fullname" placeholder="Họ và Tên" value="${infor.getName()}" maxlength="100" required>
	                <label for="fullname"><fmt:message key="fullName" /></label>
	              </div>
	              <div class="form-floating mb-3">
	                <input type="email" class="form-control shadow-sm" id="email" name="email" placeholder="Email" value="${infor.getEmail()}" maxlength="255" required>
	                <label for="email">Email</label>
	              </div>
	              <div class="form-floating mb-3">
	                <input type="text" class="form-control shadow-sm" id="phone" name="phone" placeholder="Số điện thoại" value="${infor.getPhoneNumber()}" maxlength="11" required>
	                <label for="phone"><fmt:message key="phone_number" /></label>
	              </div>
	              <div class="form-floating mb-3">
	                <select class="form-control shadow-sm" id="gender" name="gender">
	                  <option value="male"><fmt:message key="male" /></option>
	                  <option value="female"><fmt:message key="female" /></option>
	                  <option value="other"><fmt:message key="other" /></option>
	                </select>
	                <label for="gender"><fmt:message key="gender" /></label>
	              </div>
	              <div class="form-floating mb-3">
	                <input type="date" class="form-control shadow-sm" id="birthday" name="birthday" placeholder="Ngày sinh" value="${infor.getBirth()}">
	                <label for="birthday"><fmt:message key="birthday" /></label>
	              </div>
	            </div>
	
	            <!-- Gạch dọc chia input và ảnh -->
	            <div class="divider-vertical"></div>
	
	            <!-- Bên phải: Input ảnh và hiển thị ảnh -->
	            <div class="col-md-6">
	              <div class="profile-image-container">
	                <img id="profile-image" src="${accountImg}" alt="Ảnh đại diện">
	                <div class="form-floating mb-3">
	                  <button type="button" class="btn btn-secondary shadow-sm" onclick="document.getElementById('image-upload').click()">Chọn ảnh</button>
	                  <input type="file" class="form-control shadow-sm" id="image-upload" name="file" accept="image/*" onchange="previewImage(event)" style="display: none;">
	                </div>
	              </div>
	            </div>
	
	          </div>
	          <button type="submit" class="btn btn-primary w-100 py-2 mt-4"><fmt:message key="confirm" /></button>
	        </form>
	      </div>
		
	     
      <div id="password" class="form-box">
        <h3 class="mb-4 fw-bold">Đổi mật khẩu</h3>
        <form>
          <div class="form-floating mb-3 position-relative">
            <input type="password" class="form-control shadow-sm" id="current-password" name="current-password" placeholder="Mật khẩu hiện tại">
            <label for="current-password">Mật khẩu hiện tại</label>
            <span class="toggle-password" onclick="togglePasswordVisibility('current-password')">
              <i id="current-password-icon" class="bi bi-eye-slash"></i> <!-- Biểu tượng mắt -->
            </span>
          </div>
          <div class="form-floating mb-3 position-relative">
            <input type="password" class="form-control shadow-sm" id="new-password" name="new-password" placeholder="Mật khẩu mới">
            <label for="new-password">Mật khẩu mới</label>
            <span class="toggle-password" onclick="togglePasswordVisibility('new-password')">
              <i id="new-password-icon" class="bi bi-eye-slash"></i> <!-- Biểu tượng mắt -->
            </span>
          </div>
          <div class="form-floating mb-4 position-relative">
            <input type="password" class="form-control shadow-sm" id="confirm-password" name="confirm-password" placeholder="Xác nhận mật khẩu mới">
            <label for="confirm-password">Xác nhận mật khẩu mới</label>
            <span class="toggle-password" onclick="togglePasswordVisibility('confirm-password')">
              <i id="confirm-password-icon" class="bi bi-eye-slash"></i> <!-- Biểu tượng mắt -->
            </span>
          </div>
          <button type="submit" class="btn btn-primary w-100 py-2">Đổi mật khẩu</button>
        </form>
      </div>
				
	    </section>
	  </div>
	</div>
	</div>
	<div id="footer-placeholder">
		<jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include>
	</div>
	<script src="webPage/login/vendor/jquery/jquery.min.js"></script>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- Thêm toastr JS từ CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<script src="webPage/login/js/toastr.js"></script>
	<script src="webPage/login/js/main.js"></script>
	<script src="webPage/login/js/main_v1.js"></script>
</body>

</html>
