<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/BOOK_STORE/webPage/trangChu/CSS/header.css">

<fmt:setLocale value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}"  />
<fmt:setBundle basename="messages" />
<c:if test="${param.lang != null}">
    <c:set var="lang" value="${param.lang}" scope="session" />
</c:if>
<div class="background-div">
    <header class="header">
        <a href="home" class="logo"><fmt:message key="logo" /></a>
        <nav class="nav-links">
            <a href="home"><fmt:message key="home" /></a>
            <div class="dropdown">
                <a href="tim-sach"><fmt:message key="find_books" /></a>
                <ul class="dropdown-menu">
                    <li><a href="#fiction"><fmt:message key="fiction" /></a></li>
                    <li><a href="#non-fiction"><fmt:message key="non_fiction" /></a></li>
                    <li><a href="#science"><fmt:message key="science" /></a></li>
                    <li><a href="#history"><fmt:message key="history" /></a></li>
                </ul>
            </div>
            <a href="about"><fmt:message key="contact" /></a> 
            <a href="cart" class="cart-button"><fmt:message key="cart" /></a>
            <div class="dropdown">
                <a href="#categories">${user.getUsername()} <c:if test="${ admin != null }"> (Admin)</c:if></a>
                <ul class="dropdown-menu">
                    <li><a href="infor"><fmt:message key="info" /></a></li>
                    <li><a href="history"><fmt:message key="buy_history" /></a></li>
                    <c:if test="${ admin != null }">
                        <li><a href="addProduct"><fmt:message key="add_book" /></a></li>
                    </c:if>
                    <li><a href="reset"><fmt:message key="ch_pass" /></a></li>
                    <li><a href="logout"><fmt:message key="logout" /></a></li>
                </ul>
            </div>
        </nav>
        <!-- Ngôn ngữ -->
        <div class="language-switcher"  style="color: white;">
        <a href="?lang=en" style="color: white;">English</a> | <a href="?lang=vi" style="color: white;" >Tiếng Việt</a>
             <!-- <a href="" onclick="changeToEn();">English</a> | <a href="" onclick="changeToVI();">Tiếng Việt</a> -->
        </div>
    </header>
    <!-- <script>
    	async function changeToEn(){
    		await fetch("c?lang=en");
    		location.reload();
    	}
		async function changeToVI(){
			await fetch("c?lang=vi");
			location.reload();	
    	}
    </script> -->
</div>