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
    <div class="logo"><h1>BOOKSTORE</h1></div>
    <div class="center_header">
        <div class="filter_div">     
            <p>Danh mục sản phẩm</p>
            <dotlottie-player
                src="https://lottie.host/6dee1dd0-e7ff-4182-87fd-c62df8c1ac33/n269AzLlRg.lottie"
                background="transparent"
                speed="1"
                style="width: 35px; height: 40px"
                loop
                autoplay>
            </dotlottie-player>
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
     
        
        <div class="search-box">
            <input type="text" placeholder="Tìm kiếm...">
            <button>
                <lord-icon
                    src="https://cdn.lordicon.com/wjyqkiew.json"
                    trigger="hover"
                    colors="primary:#000000,secondary:#1b1091"
                    style="width:25px;height:25px">
                </lord-icon>
            </button>
        </div>
        
        <div class="choose_lan_box"></div>
        
        <div class="language-selector">
            <img id="main_lang" style="width: 40px; height: 40px;"  src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/default.svg" alt="Tiếng việt">
            <img style="width: 40px; height: 40px;"  src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/icon_seemore_gray.svg" alt="">
            <div class="language-popup">
                <ul id="language-list">
                    <li data-src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/default.svg">
                        <img style="width: 40px; height: 40px;" src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/default.svg" alt="Tiếng việt">
                    </li>
                    <li data-src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/store/english.svg">
                        <img style="width: 40px; height: 40px;"  src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/store/english.svg" alt="Tiếng Anh">
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="icons">
        <div class="login_div" onclick="openLogin()">
            <div class="login_div_icon">
                <lord-icon
                    src="https://cdn.lordicon.com/kdduutaw.json"
                    trigger="hover"
                    state="hover-looking-around"
                    colors="primary:#000000,secondary:#1b1091"
                    style="width:35px;height:45px">
                </lord-icon>
            </div>
            <div class="login_div_text">
                <p class="login_div_text_1">Đăng nhập/Đăng kí</p>
                <p class="login_div_text_2">Tài khoản của tôi</p>
            </div>
        </div>
        
        <div class="cart_div"> 
            <div class="cart_div_icon" onclick="openLogin()">
                <lord-icon
                    src="https://cdn.lordicon.com/ggirntso.json"
                    trigger="hover"
                    colors="primary:#000000,secondary:#1b1091"
                    style="width:35px;height:45px">
                </lord-icon>
            </div>
            <div class="cart_div_text">
                <p class="cart_div_text_1">Giỏ hàng</p>
                <p class="cart_div_text_2">Có xx sản phẩm</p>
            </div>
        </div>
    </div>
</header>
</body>
