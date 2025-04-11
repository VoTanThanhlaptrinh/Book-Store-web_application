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
				<p class="all-cate" onclick="loadParentCategory()">ALL
					CATEGORIES</p>

				<div class="category-filter-li" id="category-parent-list">
					<!-- Danh sách thể loại nhỏ sẽ được cập nhật động -->

					<div class="category-filter-child-list" id="category-list1">
					</div>
				</div>

				<div class="see-more" onclick="toggleMore()">
					Xem Thêm <span class="arrow">▼</span>
				</div>
			</div>
			<div class="line"></div>
			  <div class="price-range-container">
		        <label for="range-slider">Hoặc chọn mức giá phù hợp</label>
		        <div class="input-group">
		            <input type="number" id="min-price" value="0" placeholder="0 đ">
		            <span>-</span>
		            <input type="number" id="max-price" value="1000000" placeholder="0 đ">
		        </div>
		        <div class="slider-container">
		            <div class="slider-track">
		                <div class="slider-fill"></div>
		                <input type="range" id="range-slider-min" min="0" max="1000000" step="1000" value="0">
		                <input type="range" id="range-slider-max" min="0" max="1000000" step="1000" value="1000000">
		            </div>
		        </div>
		        <div class="result-message">
		            Không có sản phẩm 0 đ - 0 đ
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
                    <div class="san-pham">8 Sản Phẩm</div>
                </div>
                <div class="line"></div>


              <div class="xu_huong_mua_sam">
        <div class="display-list-grid">
            <!-- Hiển thị danh sách sản phẩm -->
            <c:forEach var="product" items="${products}">
                <div class="sale-books-element">
                    <img src="getImage?img_id=${product.getImgId()}" alt="${product.title}">
                    <p class="text-limited">${product.title}</p>
                    <div class="gia-tien-giam">
                        <h4>${product.price} VND</h4>
                        <h5>36%</h5> <!-- Giả sử giảm giá cố định -->
                    </div>
                    <h6>200.000 VND</h6> <!-- Giá gốc giả định -->
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Phân trang -->
    <div class="pagination">
        <!-- Nút "<" -->
        <c:if test="${currentPage > 1}">
            <button onclick="location.href='FilterServlet?page=1'"><<</button>
            <button onclick="location.href='FilterServlet?page=${currentPage - 1}'"><</button>
        </c:if>

		      <!-- Hiển thị các trang gần đây -->
		<c:set var="startPage" value="${currentPage - 2 > 0 ? currentPage - 2 : 1}" />
		<c:set var="endPage" value="${currentPage + 2 < totalPages ? currentPage + 2 : totalPages}" />
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
		    <c:choose>
		        <c:when test="${i == currentPage}">
		            <span class="page-number active">${i}</span>
		        </c:when>
		        <c:otherwise>
		            <span  class="page-number" onclick="location.href='FilterServlet?page=${i}'">${i}</span>
		        </c:otherwise>
		    </c:choose>
		</c:forEach>

        <!-- Nút ">" -->
        <c:if test="${currentPage < totalPages}">
            <button class="next-btn" onclick="location.href='FilterServlet?page=${currentPage + 1}'">></button>
            <button class="next-btn" onclick="location.href='FilterServlet?page=${totalPages}'">>></button>
        </c:if>
    </div>
     </div>       
	 </div>  
    <script>
    
    
	    document.addEventListener("DOMContentLoaded", function () {
	        loadParentCategory(); // Tự động gọi hàm khi trang tải xong
	    });
    
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
        fetch('header.jsp')
        .then(response => response.text())
        .then(data => {
            document.getElementById('header').innerHTML = data;
            // Khởi tạo sự kiện sau khi nội dung được tải
            initializeDropdown();
        })
        .catch(error => console.error('Error loading header:', error));
  
    document.addEventListener('DOMContentLoaded', () => {
        const minPriceInput = document.getElementById('min-price');
        const maxPriceInput = document.getElementById('max-price');
        const rangeSliderMin = document.getElementById('range-slider-min');
        const rangeSliderMax = document.getElementById('range-slider-max');
        const sliderFill = document.querySelector('.slider-fill');
        const resultMessage = document.querySelector('.result-message');

        function updateInputs() {
            minPriceInput.value = rangeSliderMin.value;
            maxPriceInput.value = rangeSliderMax.value;

            // Cập nhật thông báo kết quả
            updateResultMessage();

            // Cập nhật phần tô màu giữa hai nút
            updateSliderFill();
        }

        function updateSliders() {
            rangeSliderMin.value = minPriceInput.value;
            rangeSliderMax.value = maxPriceInput.value;

            // Cập nhật thông báo kết quả
            updateResultMessage();

            // Cập nhật phần tô màu giữa hai nút
            updateSliderFill();
        }

        function updateResultMessage() {
            const minValue = parseInt(minPriceInput.value) || 0;
            const maxValue = parseInt(maxPriceInput.value) || 0;

            resultMessage.textContent = 'Không có sản phẩm ' + minValue + ' đ - ' + maxValue + ' đ';
        }

        function updateSliderFill() {
            const minPercent = (rangeSliderMin.value - rangeSliderMin.min) / (rangeSliderMin.max - rangeSliderMin.min) * 100;
            const maxPercent = (rangeSliderMax.value - rangeSliderMax.min) / (rangeSliderMax.max - rangeSliderMax.min) * 100;

            sliderFill.style.left = `${minPercent}%`;
            sliderFill.style.right = `${100 - maxPercent}%`;
        }

        // Ngăn chặn việc nút Min vượt quá Max và ngược lại
        rangeSliderMin.addEventListener('input', () => {
            if (parseInt(rangeSliderMin.value) > parseInt(rangeSliderMax.value)) {
                rangeSliderMin.value = rangeSliderMax.value;
            }
            updateInputs();
        });

        rangeSliderMax.addEventListener('input', () => {
            if (parseInt(rangeSliderMax.value) < parseInt(rangeSliderMin.value)) {
                rangeSliderMax.value = rangeSliderMin.value;
            }
            updateInputs();
        });

        // Đồng bộ hóa từ ô nhập liệu sang thanh trượt
        minPriceInput.addEventListener('input', () => {
            if (parseInt(minPriceInput.value) > parseInt(maxPriceInput.value)) {
                minPriceInput.value = maxPriceInput.value;
            }
            updateSliders();
        });

        maxPriceInput.addEventListener('input', () => {
            if (parseInt(maxPriceInput.value) < parseInt(minPriceInput.value)) {
                maxPriceInput.value = minPriceInput.value;
            }
            updateSliders();
        });

        // Khởi tạo ban đầu
        updateInputs();
    });
  // Hàm tải danh sách thể loại nhỏ

  function loadParentCategory() {
	  const xhr = new XMLHttpRequest();
	  xhr.open("GET", "AjaxCategoryServlet?categoryParentId=" + 0, true);
	  xhr.onload = function () {
		    if (xhr.status === 200) {
		      const subCategories = JSON.parse(xhr.responseText);
		      console.log("Dữ liệu từ server:", subCategories); // Debug dữ liệu
		      
		      // Khai báo biến categoryListElement
		      const categoryListElement = document.getElementById("category-parent-list");
		      if (!categoryListElement) {
		        console.error("Thẻ category-parent-list không tồn tại!");
		        return;
		      }
		      var html = "";
		      
		      subCategories.forEach((category, index) => {
		    	    // Không cần JSON.stringify và JSON.parse nếu category đã là object
		    	  const {id, name} = category;
		    	  console.log(name); 
					console.log(id);  
		  
				    html += '<li class="' + (index >= 3 ? 'hidden' : 'displayli') + '">' +
		            '<button onclick="loadSubCategories(' + id + ')">' + name + '</button>' +
		            '</li>' +
		            '<div id="category-list' + id + '"></div>'; // Thêm div với id động

		    	});
		      // Sử dụng biến categoryListElement
		      categoryListElement.innerHTML = html;
		    } else {
		      console.error("Lỗi khi tải dữ liệu từ server.");
		    }
		  };
		  
		  xhr.send();
  }
  
	function loadSubCategories(categoryParentId) {
	  const xhr = new XMLHttpRequest();
	  const minPriceInput = document.getElementById('min-price');
      const maxPriceInput = document.getElementById('max-price');
      xhr.open("GET", "AjaxCategoryServlet?categoryParentId=" + categoryParentId 
              + "&minPrice=" + minPriceInput.value 
              + "&maxPrice=" + maxPriceInput.value , true);
	  
	  xhr.onload = function () {
	    if (xhr.status === 200) {
	      const subCategories = JSON.parse(xhr.responseText);
	      console.log("Dữ liệu từ server:", subCategories); // Debug dữ liệu
	      
	      // Khai báo biến categoryListElement
	          const categoryListElement = document.getElementById("category-list" + categoryParentId);
	      if (!categoryListElement) {
	        console.error("Thẻ category-list không tồn tại!");
	        return;
	      }
	      var html = "";
	      
	      subCategories.forEach((category, index) => {
	    	    // Không cần JSON.stringify và JSON.parse nếu category đã là object
	    	  const {id, name} = category;
	    	  console.log(name); 
				console.log(id);  
	  
				html += '<li class="' + (index >= 3 ? 'hidden' : 'displayli') + '">' +
		        '<a href="#" onclick="filterByCategory(' + id + ')">' + name + '</a>' +
		        '</li>';
				 console.log(html);
	
	    	});
	      // Sử dụng biến categoryListElement
	      categoryListElement.innerHTML = html;
	    } else {
	      console.error("Lỗi khi tải dữ liệu từ server.");
	    }
	  };
	  
	  xhr.send();
	
	}

	
	// Hàm lọc sản phẩm
	function filterByCategory(categoryId) {
		const minPriceInput = document.getElementById('min-price');
	    const maxPriceInput = document.getElementById('max-price');   
	    window.location.href = "FilterServlet?page=1&categoryId=" + categoryId + "&minPrice=" +
	    		minPriceInput.value + "&maxPrice=" + maxPriceInput.value;
	}


  // Hàm xử lý sự kiện "Xem Thêm"
  function toggleMore() {
      const hiddenItems = document.querySelectorAll(".hidden");
      const seeMoreButton = document.querySelector(".see-more .arrow");

      hiddenItems.forEach(item => {
          item.classList.toggle("displayli");
          item.classList.toggle("hidden");
      });

      // Đổi mũi tên
      if (seeMoreButton.textContent === "▼") {
          seeMoreButton.textContent = "▲";
      } else {
          seeMoreButton.textContent = "▼";
      }
  }


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