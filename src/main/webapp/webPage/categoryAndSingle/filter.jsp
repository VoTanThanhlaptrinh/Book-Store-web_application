<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/webPage/lib/tag.jsp"%>

<fmt:setLocale value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}"  />
<fmt:setBundle basename="messages" />
<c:if test="${param.lang != null}">
    <c:set var="lang" value="${param.lang}" scope="session" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/BOOK_STORE/webPage/categoryAndSingle/css/filter.css">
    <script src="https://cdn.lordicon.com/lordicon.js"></script>
    <script src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs" type="module"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <title>Filter</title>
</head>
<body>
        <c:if test="${user != null}">
        <div id="header-placeholder"><jsp:include page="/webPage/trangChu/re-header.jsp"></jsp:include></div>
    </c:if>
    <c:if test="${user == null}">
        <div id="header-placeholder"><jsp:include page="/webPage/trangChu/header.jsp"></jsp:include></div>
    </c:if>
    
    <div class="return-to-index">
        <div class="returun-to-index-a">
           <a href="/index.html">Trang chủ</a>
        </div>
            <p> > Danh mục sản phẩm </p>
    </div>

    <div class="banner-filter">
            <img src="https://cdn1.fahasa.com/media/wysiwyg/Thang-02-2025/CT_T3_tag9.png" alt=""> </div>


     <div class="container">

            <div class="category-filter">
                    <h4>Nhóm sản phẩn</h4>
                    <div class="current-category">
                            <h4>Sách Tiếng việt</h4>
                            <div class="category-filter-li">
                                <li><a href="#">Thiếu nhi</a></li>
                                <li><a href="#">Giáo Khoa, Tham Khảo</a></li>
                                <li><a href="#">Văn Học</a></li>
                                <li><a href="#">Tâm Lý, Kỹ Năng Sống</a></li>
                                <li><a href="#">Manga-Comic</a></li>
                                <li><a href="#">Sách Học Ngoại Ngữ</a></li>
                                <li><a href="#">Kinh tế</a></li>
                                <li><a href="#">Khoa học kỹ thuật</a></li>
                                <li><a href="#">Nuôi dạy con</a></li>
                                <li><a href="#">chính trị, Pháp lý</a></li>
                                <li><a href="#">Tiểu sử hồi ký</a></li>
                                <li><a href="#">Văn học, Nghệ Thuật, Du lịch</a></li>
                            </div>
                    </div>

                    <div class="price-filter">
                        <h4>GIÁ</h4>
                        <div class="category-filter-li">
                        <label><input type="checkbox" value="0-150000"> 0đ - 150,000đ</label>
                        <label><input type="checkbox" value="150000-300000"> 150,000đ - 300,000đ</label>
                        <label><input type="checkbox" value="300000-500000"> 300,000đ - 500,000đ</label>
                        <label><input type="checkbox" value="500000-700000"> 500,000đ - 700,000đ</label>
                        <label><input type="checkbox" value="700000+"> 700,000đ - Trở Lên</label>
                    </div>
                    </div>



                     </div>


     </div>       
    <script>
        function initializeDropdown() {
            const searchInput = document.getElementById('search-input');
            const dropdownList = document.getElementById('dropdown-list');
    
            if (searchInput && dropdownList) {
                searchInput.addEventListener('focus', () => {
                    dropdownList.style.display = 'block';
                });
    
                searchInput.addEventListener('blur', () => {
                    setTimeout(() => {
                        dropdownList.style.display = 'none';
                    }, 200);
                });
            }
        }
        fetch('header.html')
        .then(response => response.text())
        .then(data => {
            document.getElementById('header').innerHTML = data;
            // Khởi tạo sự kiện sau khi nội dung được tải
            initializeDropdown();
        })
        .catch(error => console.error('Error loading header:', error));
    </script>
</body>
</html>