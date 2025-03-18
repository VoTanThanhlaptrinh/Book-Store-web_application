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
