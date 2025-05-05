<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/webPage/lib/tag.jsp" %>
<link rel="stylesheet" href="/BOOK_STORE/webPage/trangChu/CSS/header.css">

<fmt:setLocale value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}" />
<fmt:setBundle basename="messages" />

<c:if test="${param.lang != null}">
    <c:set var="lang" value="${param.lang}" scope="session" />
</c:if>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<body>
    <header>

        <div class="top-header">
            <a class="logo" href="home">Bookstore</a>
            
            <div class="search-bar">
              <select>
                <option>All Categories</option>
              </select>
              <input type="text" placeholder="Enter Search Products">
              <button>🔍</button>
            </div>
          
            <div class="top-right">
                <div class="top-right-icon">👤</div>
              <div class="user-info-main">
            
                  <a href="#">Đăng nhập </a>
                  <p> | </p>
                  <a href="#">Đăng ký</a>
              </div>
              
            </div>
          
            <div class="mobile-menu-icon">☰</div>
          </div>
          
          <!-- Yellow Menu Bar -->
          <div class="yellow-bar">
            <div class="logo-hidden">Bookstore</div>
            <div class="left-menu">
              <button class="left-menu-button">☰ Products Category</button>
           <div class="dropdown">
			  <a class="dropdown-category" href="FilterServlet?page=1&categoryParentId=1">
			    <img src="https://img.cand.com.vn/resize/800x800/NewFiles/Images/2023/03/09/image001-1678344452723.jpg" alt=""> 
			    <p>Văn học</p>
			  </a>
			  <a class="dropdown-category" href="FilterServlet?page=1&categoryParentId=2">
			    <img src="https://phenikaa-uni.edu.vn:3600/fidt/vi/posts/kinh-te-so-2331054.png" alt=""> 
			    <p>Kinh tế</p>
			  </a>
			  <a class="dropdown-category" href="FilterServlet?page=1&categoryParentId=3">
			    <img src="https://lcv.com.vn/wp-content/uploads/2023/06/phat-trien-ban-than-la-gi.jpg" alt=""> 
			    <p>Phát triển bản thân</p>
			  </a>
			  <a class="dropdown-category" href="FilterServlet?page=1&categoryParentId=4">
			    <img src="https://huongnghiep.hocmai.vn/wp-content/uploads/2021/12/150-1200x701.png" alt=""> 
			    <p>Tâm lý kỹ năng</p>
			  </a>
			  <a class="dropdown-category" href="FilterServlet?page=1&categoryParentId=5">
			    <img src="https://hockiquandoi.net/wp-content/uploads/2020/10/20200728_072002_716551_nuoi-day-con-dung-c.max-1800x1800.jpg" alt=""> 
			    <p>Nuôi dạy con</p>
			  </a>
			</div>
            </div>
            <div class="main-menu-link">
              <a href="#">Home</a>
              <a href="#">Shop</a>
              <a href="#">Blog</a>
              <a href="#">Pages</a>
              <a href="#">Contact</a>
            </div>
            <div class="main-menu-cart">
              <a href="#"><i class="fa-solid fa-heart fa-xl" style="color: #000000;"></i></a>
              <a href="#"> </a>
              <a href="#"><i class="fa-solid fa-cart-shopping fa-xl" style="color: #000000;"></i></a>
            </div>
            <!-- Khi mobile -->
            <div class="yellow-right">
                <div class="menu-after">
                    <div class="user-info"  onclick="openLogin()">
            
                        <a href="#">Đăng nhập </a>
                        <p> | </p>
                        <a href="#">Đăng ký</a>
                    </div>
                    <div class="search-bar-container">
                    <div class="search-bar">
                        <input type="text" placeholder="Enter Search Products">
                        <button>🔍</button>
                      </div>
                    </div>

                    <div class="m-button">
                        <button onclick="">Thông tin</button>
                        <button >Sản phẩm</button>
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

                        <div class="product-des-item">

                            

                        </div>


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

    </script>
</body>

    