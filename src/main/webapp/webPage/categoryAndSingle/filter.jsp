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
                    <div class="current-category">
                            <h4>Sách Tiếng việt</h4>
                            <div class="category-filter-li">
                                <li class="displayli"><a href="#">Thiếu nhi</a></li>
                                <li class="displayli"><a href="#">Giáo Khoa, Tham Khảo</a></li>
                                <li class="displayli"><a href="#">Văn Học</a></li>
                                <li class="displayli"><a href="#">Tâm Lý, Kỹ Năng Sống</a></li>
                                <li class="displayli"><a href="#">Manga-Comic</a></li>
                                <li class="hidden"><a href="#">Sách Học Ngoại Ngữ</a></li>
                                <li class="hidden"><a href="#">Kinh tế</a></li>
                                <li class="hidden"><a href="#">Khoa học kỹ thuật</a></li>
                                <li class="hidden"><a href="#">Nuôi dạy con</a></li>
                                <li class="hidden"><a href="#">chính trị, Pháp lý</a></li>
                                <li class="hidden"><a href="#">Tiểu sử hồi ký</a></li>
                                <li class="hidden"><a href="#">Văn học, Nghệ Thuật, Du lịch</a></li>
                                <div class="see-more" onclick="toggleMore()">
                                    Xem Thêm <span class="arrow">▼</span>
                                  </div>
                            </div>
                    </div>
                    <div class="line"></div>
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

            <div class = "item-filter">
                <div class="item-filter-img">
                    <img src="https://cdn1.fahasa.com/media/magentothem/banner7/CanhCutThanToc_840x320.png" alt="">
                    </div>
                <div class="item-filter-sort-type">
                    <h4>Sắp xếp theo: </h4>
                    <div class="item-filter-dropdown">
                        <button class="item-filter-dropdown-button">
                          Bán Chạy Tuần <span class="arrow">▼</span>
                        </button>
                        <ul class="item-filter-dropdown-menu">
                          <li>Bán Chạy Ngày</li>
                          <li>Bán Chạy Tháng</li>
                          <li>Bán Chạy Năm</li>
                        </ul>
                      </div>
                    <div class="san-pham">24 Sản Phẩm</div>
                </div>
                <div class="line"></div>


                <div class="xu_huong_mua_sam">
                    <div class="display-list-grid">
                        <div class="sale-books-element">
                            <img src="https://cdn1.fahasa.com/media/catalog/product/n/d/ndivia-co-may-tu-duy-vi-dai--full------t2-2025----outline-02.jpg"
                                alt="">
                            <p class="text-limited">NVIDIA-Cỗ máy tư duy vĩ đại</p>
                            <div class="gia-tien-giam">
                                <h4>186.000</h4>
                                <h5>36%</h5>
                                </div>
                                <h6>200.000</h6>
         
                        </div>
                        <div class="sale-books-element">
                            <img src="https://cdn1.fahasa.com/media/catalog/product/n/d/ndivia-co-may-tu-duy-vi-dai--full------t2-2025----outline-02.jpg"
                                alt="">
                                <p class="text-limited">NVIDIA-Cỗ máy tư duy vĩ đại</p>
                            <div class="gia-tien-giam">
                                <h4>186.000</h4>
                                <h5>36%</h5>
                                </div>
                                <h6>200.000</h6>
                 
                        </div>
            
                        <div class="sale-books-element">
                            <img src="https://cdn1.fahasa.com/media/catalog/product/n/d/ndivia-co-may-tu-duy-vi-dai--full------t2-2025----outline-02.jpg"
                                alt="">
                                <p class="text-limited">NVIDIA-Cỗ máy tư duy vĩ đại</p>
                            <div class="gia-tien-giam">
                                <h4>186.000</h4>
                                <h5>36%</h5>
                                </div>
                                <h6>200.000</h6>
                         
                        </div>
                        <div class="sale-books-element">
                            <img src="https://cdn1.fahasa.com/media/catalog/product/n/d/ndivia-co-may-tu-duy-vi-dai--full------t2-2025----outline-02.jpg"
                                alt="">
                                <p class="text-limited">NVIDIA-Cỗ máy tư duy vĩ đại</p>
                            <div class="gia-tien-giam">
                                <h4>186.000</h4>
                                <h5>36%</h5>
                                </div>
                                <h6>200.000</h6>
                           
                        </div>
             
                        <div class="sale-books-element">
                            <img src="https://cdn1.fahasa.com/media/catalog/product/n/d/ndivia-co-may-tu-duy-vi-dai--full------t2-2025----outline-02.jpg"
                                alt="">
                                <p class="text-limited">NVIDIA-Cỗ máy tư duy vĩ đại</p>
                            <div class="gia-tien-giam">
                                <h4>186.000</h4>
                                <h5>36%</h5>
                                </div>
                                <h6>200.000</h6>
                              
                        </div>
                        <div class="sale-books-element">
                            <img src="https://cdn1.fahasa.com/media/catalog/product/n/d/ndivia-co-may-tu-duy-vi-dai--full------t2-2025----outline-02.jpg"
                                alt="">
                                <p class="text-limited">NVIDIA-Cỗ máy tư duy vĩ đại</p>
                            <div class="gia-tien-giam">
                                <h4>186.000</h4>
                                <h5>36%</h5>
                                </div>
                                <h6>200.000</h6>
                                
                        </div>
                        
                        <div class="sale-books-element">
                            <img src="https://cdn1.fahasa.com/media/catalog/product/n/d/ndivia-co-may-tu-duy-vi-dai--full------t2-2025----outline-02.jpg"
                                alt="">
                                <p class="text-limited">NVIDIA-Cỗ máy tư duy vĩ đại</p>
                            <div class="gia-tien-giam">
                                <h4>186.000</h4>
                                <h5>36%</h5>
                                </div>
                                <h6>200.000</h6>
                                
                        </div>
                        <div class="sale-books-element">
                            <img src="https://cdn1.fahasa.com/media/catalog/product/n/d/ndivia-co-may-tu-duy-vi-dai--full------t2-2025----outline-02.jpg"
                                alt="">
                                <p class="text-limited">NVIDIA-Cỗ máy tư duy vĩ đại</p>
                            <div class="gia-tien-giam">
                                <h4>186.000</h4>
                                <h5>36%</h5>
                                </div>
                                <h6>200.000</h6>
                              
                        </div>    
                           
                    </div>
            
                
                </div>

                <div class="pagination">
                    <button class="prev-btn">&lt;</button>
                    <span class="page-number">1</span>
                    <span>...</span>
                    <span class="page-number">3</span>
                    <span class="page-number">4</span>
                    <span class="page-number active">5</span>
                    <span class="page-number">6</span>
                    <span class="page-number">7</span>
                    <span>...</span>
                    <span class="page-number">10</span>
                    <button class="next-btn">&gt;</button>
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
    <script>
        function toggleMore() {
        const hiddenItems = document.querySelectorAll('.hidden');
        const seeMore = document.querySelector('.see-more');
        
        hiddenItems.forEach(item => {
          // Hiển thị hoặc ẩn các mục
          item.style.display = item.style.display === 'block' ? 'none' : 'block';
        });
      
        // Thêm hoặc bỏ class "active" để xoay mũi tên
        seeMore.classList.toggle('active');
      }</script>

      <script>
        document.addEventListener("DOMContentLoaded", function () {
            const dropdown = document.querySelector(".item-filter-dropdown");
            const button = dropdown.querySelector(".item-filter-dropdown-button");
           const menu = dropdown.querySelector(".item-filter-dropdown-menu")
            button.addEventListener("click", function () {
                button.style.borderBottom = "none"; // Xóa border
                menu.style.borderTop = "none"
              dropdown.classList.toggle("open");
              
                
               
        
            });
          
            // Close dropdown when clicking outside
            document.addEventListener("click", function (e) {
              if (!dropdown.contains(e.target)) {
                  button.style.borderBottom = "1px solid #cccccc"; // Xóa border
                menu.style.borderTop = "1px solid #CCCCCC"
                dropdown.classList.remove("open");
               
              }
            });
          }); 
        </script>

        <script>
            document.querySelectorAll(".page-number").forEach((page) => {
                page.addEventListener("click", function () {
                  // Xóa class 'active' khỏi tất cả các trang
                  document.querySelectorAll(".page-number").forEach((p) => {
                    p.classList.remove("active");
                  });
              
                  // Thêm class 'active' vào trang được nhấn
                  page.classList.add("active");
                });
              });
        </script>
</body>
</html>