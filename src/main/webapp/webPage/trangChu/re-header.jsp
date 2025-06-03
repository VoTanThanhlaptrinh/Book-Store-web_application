<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<link rel="stylesheet"
	href="/BOOK_STORE/webPage/trangChu/CSS/header.css">

<fmt:setLocale
	value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}" />
<fmt:setBundle basename="messages" />

<c:if test="${param.lang != null}">
	<c:set var="lang" value="${param.lang}" scope="session" />
</c:if>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<body>
	<header>

        <div class="top-header">
            <a class="logo" href="home">Bookstore</a>
            
           <div class="search-bar">
              <select>
                <option>All Categories</option>
              </select>
                  <form class="search-form" action="search" method="get" >
					  <input type="text" name="query" placeholder="Enter Search Products">
					  <button type="submit">🔍</button>
					</form>
            </div>
          
            <div class="top-right">
                <div class="top-right-icon">👤</div>
              <div class="user-info-main">
            
                  <div class="user-info-main-login-regis" onclick="openLogin()">${user.getUsername()}</div>
                 
              </div>
                <div class="dropdown-user">
                <div class="dropdown-user-category">
                 
                  <p>Thông tin</p>
                </div>
                <div class="dropdown-user-category">
                 
                  <p>Giỏ hàng</p>
                </div>
                <div class="dropdown-user-category">
                  
                  <p>Thanh toán</p>
                </div>
                <div class="dropdown-user-category">
                 
                  <p>Đăng xuất</p>
                </div>

              </div>
            </div>
          
            <div class="mobile-menu-icon">☰</div>
          </div>
          
		<!-- Yellow Menu Bar -->
		<div class="yellow-bar">
			<div class="logo-hidden">Bookstore</div>
			<div class="left-menu">
				<button class="left-menu-button"
					onclick="window.location.href='FilterServlet'">☰ Products
					Category</button>
				<div class="dropdown">
					<a class="dropdown-category"
						href="FilterServlet?page=1&categoryParentId=1"> <img
						src="https://img.cand.com.vn/resize/800x800/NewFiles/Images/2023/03/09/image001-1678344452723.jpg"
						alt="">
						<p>Văn học</p>
					</a> <a class="dropdown-category"
						href="FilterServlet?page=1&categoryParentId=2"> <img
						src="https://phenikaa-uni.edu.vn:3600/fidt/vi/posts/kinh-te-so-2331054.png"
						alt="">
						<p>Kinh tế</p>
					</a> <a class="dropdown-category"
						href="FilterServlet?page=1&categoryParentId=3"> <img
						src="https://lcv.com.vn/wp-content/uploads/2023/06/phat-trien-ban-than-la-gi.jpg"
						alt="">
						<p>Phát triển bản thân</p>
					</a> <a class="dropdown-category"
						href="FilterServlet?page=1&categoryParentId=4"> <img
						src="https://huongnghiep.hocmai.vn/wp-content/uploads/2021/12/150-1200x701.png"
						alt="">
						<p>Tâm lý kỹ năng</p>
					</a> <a class="dropdown-category"
						href="FilterServlet?page=1&categoryParentId=5"> <img
						src="https://hockiquandoi.net/wp-content/uploads/2020/10/20200728_072002_716551_nuoi-day-con-dung-c.max-1800x1800.jpg"
						alt="">
						<p>Nuôi dạy con</p>
					</a>
				</div>
			</div>
			<div class="main-menu-link">
				    <a onclick="window.location.href='home'">Home</a>
              <a onclick="window.location.href='home'">Shop</a>
              <a href="/BOOK_STORE/webPage/trangChu/aboutus.jsp">About Us</a>
            
              <a href="/BOOK_STORE/webPage/trangChu/contact.jsp">Contact</a>
			</div>
			<div class="main-menu-cart">
				<a href="#"><i class="fa-solid fa-heart fa-xl"
					style="color: #000000;"></i></a> <a href="#"> </a> <a href="#"><i
					class="fa-solid fa-cart-shopping fa-xl" style="color: #000000;"></i></a>
			</div>
			<!-- Khi mobile -->
			<div class="yellow-right">
				<div class="menu-after">
					<div class="user-info">

						<div class="user-info-div" onclick="window.location.href='login'">${user.getUsername()}</div>

					</div>
					<div class="search-bar-container">
						<div class="search-bar">
							<form action="search" method="get">
								<input type="text" name="query"
									placeholder="Enter Search Products">
								<button type="submit">🔍</button>
							</form>
						</div>
					</div>

					<div class="m-button">
						<button onclick="">Thông tin</button>
						<button>Sản phẩm</button>
					</div>

					<div class="user-des">
						<div class="user-des-item">

							<div>👤</div>
							<h3>Thông tin</h3>
						</div>
						<div class="user-des-item">

							<div>🛒</div>
							<h3>Giỏ hàng</h3>
						</div>

						<div class="user-des-item">

							<div>⭐</div>
							<h3>Thanh toán</h3>
						</div>
					</div>

					<div class="product-des">

						<div class="product-des-item"></div>


					</div>

				</div>
				<div class="mobile-menu-icon" onclick="openMenu()">☰</div>
			</div>
		</div>

	</header>
	<script>
        function openMenu() {
            const menu = document.querySelector('.menu-after');
            menu.classList.toggle('active');
          }
          Function 
       function toggleSubmenu(item) {
            let icon = item.querySelector('span');
            if (icon) {
              icon.classList.toggle('rotate');
            }
          }
          let timeoutId;

          const leftMenu = document.querySelector('.left-menu');
          const top_right = document.querySelector('.top-right');
          const dropdown = leftMenu.querySelector('.dropdown');
          const dropdown_user = top_right.querySelector('.dropdown-user');
          leftMenu.addEventListener('mouseenter', () => {
            clearTimeout(timeoutId); // Hủy ẩn nếu đang đếm ngược
            dropdown.style.maxHeight = '500px';
            dropdown.style.opacity = '1';
          });
          leftMenu.addEventListener('mouseleave', () => {
            timeoutId = setTimeout(() => {
              dropdown.style.maxHeight = '0';
              dropdown.style.opacity = '0';
            }, 1000); // Delay ẩn 300ms
          });
            top_right.addEventListener('mouseenter', () => {
            clearTimeout(timeoutId); // Hủy ẩn nếu đang đếm ngược
            dropdown_user.style.maxHeight = '500px';
            dropdown_user.style.opacity = '1';
          });
           top_right.addEventListener('mouseleave', () => {
            timeoutId = setTimeout(() => {
              dropdown_user.style.maxHeight = '0';
              dropdropdown_userdown.style.opacity = '0';
            }, 1000); // Delay ẩn 300ms
          });
    </script>
</body>

