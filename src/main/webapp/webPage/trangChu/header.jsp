<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/webPage/lib/tag.jsp" %>
<link rel="stylesheet" href="/BOOK_STORE/webPage/trangChu/CSS/header.css">

<fmt:setLocale value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}" />
<fmt:setBundle basename="messages" />

<c:if test="${param.lang != null}">
    <c:set var="lang" value="${param.lang}" scope="session" />
</c:if>

<script src="https://cdn.lordicon.com/lordicon.js"></script>
<script src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs" type="module"></script>

<body>
    <header>
        <div class="web-ad">
                <p class="web-ad1">Hotline</p>
                <p class="web-ad2"> 0968 193 432 - 097 418 8429</p>
                <p class="web-ad1">Địa chỉ:</p>
                <p class="web-ad2"> CS1: 83-85 Thái Hà - Đống Đa - Hà Nội</p>
                <p class="web-ad1">CS2:</p>
                <p class="web-ad2"> 83A Cửu Long - Q10 - TP.HCM</p>
                
        </div>
        <div class="header-1">
        <div class="logo"><h2>BOOKSTORE</h2></div>
        <div class="center_header">
           
        <div class="search-container">
        <div class="search-box">
            <input type="text" placeholder="Tìm kiếm..." id="search-input" >
            <div class="dropdown-list" id="dropdown-list">
                <div class="dropdown-item">Item 1</div>
                <div class="dropdown-item">Item 2</div>
                <div class="dropdown-item">Item 3</div>
            </div>
            <button><lord-icon
                src="https://cdn.lordicon.com/wjyqkiew.json"
                trigger="hover"
                colors="primary:#000000,secondary:#1b1091"
                style="width:25px;height:25px">
            </lord-icon></button>
        </div>
    </div> 
        <!-- Lớp phủ -->
        <div class="overlay" id="overlay"></div>
        <div class="choose_lan_box">

        </div>

    </div>
    
        <div class="icons">
            <div class="language-selector">
                <img id="main_lang"  src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/default.svg" alt="Tiếng việt">
                <img  src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/icon_seemore_gray.svg" alt="">
                <div class="language-popup">
                    <ul id="language-list">
                        <li data-src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/default.svg"><img  src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/default.svg" alt="Tiếng việt">
                            </li>
                        
                            <li data-src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/store/english.svg"><img   src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/store/english.svg" alt="Tiếng Anh">
                              </li>
                    </ul>
                </div>
            </div>
            <div class="login_div" onclick="openLogin()">
            <div class="login_div_icon" >  <lord-icon
                src="https://cdn.lordicon.com/kdduutaw.json"
                trigger="hover"
                state="hover-looking-around"
                colors="primary:#000000,secondary:#1b1091"
                style="width:35px;height:45px">
            </lord-icon>
        </div>
            <div class="login_div_text">
                <a href="login" class="login_div_text_1">Đăng nhập/Đăng kí</a>
                <p class = "login_div_text_2">Tài khoản của tôi</p>
            </div>
            
        </div>
        <div class= "cart_div"> 
          <div class="cart_div_icon" onclick="openLogin()">
            <lord-icon
            src="https://cdn.lordicon.com/ggirntso.json"
            trigger="hover"
            colors="primary:#000000,secondary:#1b1091"
            style="width:35px;height:45px">
        </lord-icon>
            </div>
            <div class="cart_div_text">
                <p class = "cart_div_text_1">Giỏ hàng</p>
                <p class = "cart_div_text_2">Có xx sản phẩm</p>
            </div>
        </div>
        </div>
    </div>
    <div class="header-2">
        <div class="filter_div">     
            <p>Danh mục sản phẩm</p>
            <dotlottie-player
            src="https://lottie.host/6dee1dd0-e7ff-4182-87fd-c62df8c1ac33/n269AzLlRg.lottie"
            background="transparent"
            speed="1"
            style="width: 35px; height: 40px"
            loop
            autoplay
          ></dotlottie-player>
          <div class="dropdown">
            <h2>Sách trong nước</h2>
            <div class="vertical-line"></div>
            <div class="drd_line">
            <div class="drd_line_1">
            <div class="link_dropdown_1"><a class="link_dropdown_1_a1" href="#">Văn học</a>
                <a class="link_dropdown_1_a2" href="#">Tiểu thuyết</a>
                <a class="link_dropdown_1_a2" href="#">Truyện ngắn</a>
                <a class="link_dropdown_1_a2" href="#">Light-novel</a>
                <a class="link_dropdown_1_a2" href="#">Ngôn tình</a>
                <a class="link_dropdown_1_a3" href="#">Xem tất cả</a>
            </div>
            <div class="link_dropdown_1"><a class="link_dropdown_1_a1" href="#">Kinh tế</a>
                <a class="link_dropdown_1_a2" href="#">Nhân Vật - Bài Học Kinh Doanh</a>
                <a class="link_dropdown_1_a2" href="#">Quản Trị - Lãnh Đạo</a>
                <a class="link_dropdown_1_a2" href="#">Light-novel</a>
                <a class="link_dropdown_1_a2" href="#">Marketing - Bán Hàng</a>
                <a class="link_dropdown_1_a3" href="#">Xem tất cả</a>
            </div>      
            <div class="link_dropdown_1"><a class="link_dropdown_1_a1" href="#">Tâm Lý - Kĩ Năng Sống</a>
                <a class="link_dropdown_1_a2" href="#">Kỹ Năng Sống</a>
                <a class="link_dropdown_1_a2" href="#">Rèn Luyện Nhân Cách</a>
                <a class="link_dropdown_1_a2" href="#">Tâm Lý</a>
                <a class="link_dropdown_1_a2" href="#">Sách Cho Tuổi Mới Lớn</a>
                <a class="link_dropdown_1_a3" href="#">Xem tất cả</a>
            </div>
        </div>    
    
        
        <div class="drd_line_1">
            <div class="link_dropdown_1"><a class="link_dropdown_1_a1" href="#">Nuôi Dạy Con</a>
                <a class="link_dropdown_1_a2" href="#">Cẩm Nang Làm Cha Mẹ</a>
                <a class="link_dropdown_1_a2" href="#">Phương Pháp Giáo Dục Trẻ</a>
                <a class="link_dropdown_1_a2" href="#">Phát Triển Trí Tuệ Cho Trẻ</a>
                <a class="link_dropdown_1_a2" href="#">Phát Triển Kỹ Năng Cho Trẻ</a>
                <a class="link_dropdown_1_a3" href="#">Xem tất cả</a>
            </div>
            <div class="link_dropdown_1"><a class="link_dropdown_1_a1" href="#">Sách Thiếu Nhi</a>
                <a class="link_dropdown_1_a2" href="#">Manga - Comic</a>
                <a class="link_dropdown_1_a2" href="#">Kiến Thức Bách Khoa</a>
                <a class="link_dropdown_1_a2" href="#">Sách Tranh Kỹ Năng Sống</a>
                <a class="link_dropdown_1_a2" href="#">Vừa Học - Vừa Chơi</a>
                <a class="link_dropdown_1_a3" href="#">Xem tất cả</a>
            </div>      
            <div class="link_dropdown_1"><a class="link_dropdown_1_a1" href="#">Tiểu Sử - Hồi Ký</a>
                <a class="link_dropdown_1_a2" href="#">Câu Chuyện Cuộc Đời</a>
                <a class="link_dropdown_1_a2" href="#">Chính Trị</a>
                <a class="link_dropdown_1_a2" href="#">Kinh Tế</a>
                <a class="link_dropdown_1_a2" href="#">Nghệ Thuật - Giải Trí</a>
                <a class="link_dropdown_1_a3" href="#">Xem tất cả</a>
            </div>
        </div>  
        </div>    
    </div>               
         </div>  
         <div class="box-policy">
            <ul>
                <li class="box-item">
                    <div class="box-icon">
                        <img src="//theme.hstatic.net/1000288298/1001020793/14/header_03_policy_1_ico.png?v=1422" alt="Chất lượng đảm bảo">
                    </div>
                    <div class="box-text">Chất lượng đảm bảo</div>
                </li>
                <li class="box-item">
                    <div class="box-icon">
                        <img src="//theme.hstatic.net/1000288298/1001020793/14/header_03_policy_2_ico.png?v=1422" alt="Vận chuyển siêu tốc">
                    </div>
                    <div class="box-text">Vận chuyển siêu tốc</div>
                </li>
                <li class="box-item">
                    <div class="box-icon">
                        <img src="//theme.hstatic.net/1000288298/1001020793/14/header_03_policy_3_ico.png?v=1422" alt="Tư vấn Build PC: 0986552233">
                    </div>
                    <div class="box-text">Tư vấn Build PC: 0986552233</div>
                </li>
            </ul>
        </div>
    </div>
    </header>
    <script>
            
      // Lấy các phần tử DOM
            const searchInput = document.getElementById('search-input');
            const dropdownList = document.getElementById('dropdown-list');

            // Hiển thị dropdown khi focus vào ô tìm kiếm
            searchInput.addEventListener('focus', () => {
                dropdownList.style.display = 'block';
            });

            // Ẩn dropdown khi mất focus khỏi ô tìm kiếm
            searchInput.addEventListener('blur', () => {
                setTimeout(() => {
                    dropdownList.style.display = 'none';
                }, 200); // Delay để đảm bảo người dùng có thể chọn item trước khi ẩn
            });
    
    </script>
</body>

    