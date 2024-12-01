<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>

</head>
<body>
	<div class="background-div">
		<header class="header">
			<a href="#" class="logo">BookStore</a>
			<nav class="nav-links">
				<a href="#home">Trang chủ</a>
				<div class="dropdown">
					<a href="#categories">Thể loại</a>
					<ul class="dropdown-menu">
						<li><a href="#fiction">giả tưởng</a></li>
						<li><a href="#non-fiction">phiêu lưu</a></li>
						<li><a href="#science">Khoa học</a></li>
						<li><a href="#history">lịch sử</a></li>
					</ul>
				</div>
				<a href="#contact">Liên hệ</a>
				<a href="#cart" class="cart-button">Giỏ hàng</a>
				<div class="dropdown">
					<a href="#categories">${user.getUsername()}</a>
					<ul class="dropdown-menu">
						<li><a href="infor">Thông tin</a></li>
						<li><a href="logout">Đăng xuất</a></li>
					</ul>
				</div>
			</nav>
		</header>
	</div>