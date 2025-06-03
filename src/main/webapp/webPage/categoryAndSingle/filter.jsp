<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>

<fmt:setLocale
	value="${param.lang != null ? param.lang : (sessionScope.lang != null ? sessionScope.lang : 'vi')}" />
<fmt:setBundle basename="messages" />
<c:if test="${param.lang != null}">
	<c:set var="lang" value="${param.lang}" scope="session" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="/BOOK_STORE/webPage/categoryAndSingle/css/filter.css">
<script src="https://cdn.lordicon.com/lordicon.js"></script>
<script
	src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs"
	type="module"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<title>Filter</title>
</head>
<body>
	<c:if test="${user != null}">
		<div id="header-placeholder"><jsp:include
				page="/webPage/trangChu/re-header.jsp"></jsp:include></div>
	</c:if>
	<c:if test="${user == null}">
		<div id="header-placeholder"><jsp:include
				page="/webPage/trangChu/header.jsp"></jsp:include></div>
	</c:if>
	<div class="return-to-index">
		<div class="returun-to-index-a">
			<a href="/index.html">Trang chủ</a>
		</div>
		<p>> Danh mục sản phẩm</p>
	</div>

	<div class="banner-filter">
		<img
			src="https://cdn1.fahasa.com/media/wysiwyg/Thang-02-2025/CT_T3_tag9.png"
			alt="">
	</div>


	<div class="container">

		<div class="category-filter">
			<div class="current-category">
				<p class="all-cate" onclick="window.location.href='FilterServlet'">ALL
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
					<span>-</span> <input type="number" id="max-price" value="1000000"
						placeholder="0 đ">
				</div>
				<div class="slider-container">
					<div class="slider-track">
				
						<input type="range" id="range-slider-min" min="0" max="1000000"
							step="1000" value="0"> 
					<input type="range"
								id="range-slider-max" min="0" max="1000000" step="1000"
							value="1000000">
					</div>
					
				</div>
			    <!-- Nút xác nhận -->
				    <div class="price-confirm-container">
				        <button type="button" id="confirm-price-btn" onclick="loadFilteredPageProducts(1, event)">Áp dụng mức giá</button>
				    </div>
			</div>
        <div class="line"></div>
                    <div class="year-filter-container">
                        <label>Năm sản xuất</label>
                        <div class="checkbox-group">
                          <label class="custom-checkbox">
                            <input type="checkbox" name="yearFilter" value="after2020"  class="year-checkbox" onclick="loadYear()">
                            <span class="square"></span> Sau 2020
                          </label>
                          <label class="custom-checkbox">
                            <input type="checkbox" name="yearFilter" value="2010to2020"  class="year-checkbox" onclick="loadYear()">
                            <span class="square"></span> Từ 2010 đến 2020
                          </label>
                          <label class="custom-checkbox">
                            <input type="checkbox" name="yearFilter" value="2000to2010"  class="year-checkbox" onclick="loadYear()">
                            <span class="square"></span> Từ 2000 đến 2010
                          </label>
                          <label class="custom-checkbox">
                            <input type="checkbox" name="yearFilter" value="before2000"  class="year-checkbox" onclick="loadYear()">
                            <span class="square"></span> Trước 2000
                          </label>
                        </div>
                      </div>
		</div>

		<div class="item-filter" id="product-list">
			<div class="item-filter-img">
				<img
					src="https://cdn1.fahasa.com/media/magentothem/banner7/CanhCutThanToc_840x320.png"
					alt="">
			</div>
			<div class="item-filter-sort-type">
				<h4>Sắp xếp theo:</h4>
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
			<div id="active-filters" style="margin-top: 10px;">
			    <c:if test="${not empty filterTagsList}">
			        <c:forEach var="tag" items="${filterTagsList}">
			            <div class="filter-tag">
			                ${tag}
			                <span class="remove-filter" onclick="removeFilterByText('${fn:escapeXml(tag)}')">✖</span>
			            </div>
			        </c:forEach>
			    </c:if>
			</div>

			<div class="line"></div>


			<div class="xu_huong_mua_sam">
				<div class="display-list-grid" >
					<c:forEach var="product" items="${products}">
						<a class="sale-books-element" href="chi-tiet-sach?id=${product.getProductId()}">
							<img src="getImage?img_id=${product.getImgId()}"
								alt="${product.title}">
							<p class="text-limited">${product.title}</p>
							<div class="gia-tien-giam">
								<h4>${product.price}VND</h4>
								<h5>36%</h5>
								<!-- Giảm giá cố định -->
							</div>
							<h6>200.000 VND</h6>
							<!-- Giá gốc giả định -->
						</a>
					</c:forEach>
				</div>
					<input type="hidden" id="yearFilters" value="${yearFilters}">
				<input type="hidden" id="parent-category" value="${parentcategory}">
				<input type="hidden" id="sub-category" value="${subcategory}">	
				<input type="hidden" id="parent-category-name" value="${parentcategoryName}">
				<input type="hidden" id="sub-category-name" value="${subcategoryName}">	
				<input type="hidden" id="filter-tags-list" value="${filterTagsList}">	
			</div>

			<!-- Phân trang -->
			<div class="pagination">
				<!-- Nút "<" -->
				<c:if test="${currentPage > 1}">
					<button onclick="loadFilteredPageProducts(1, event)"><<</button>
					<button onclick="loadFilteredPageProducts(${currentPage - 1}, event)"><</button>
				</c:if>

				<!-- Hiển thị các trang gần đây -->
				<c:set var="startPage"
					value="${currentPage - 2 > 0 ? currentPage - 2 : 1}" />
				<c:set var="endPage"
					value="${currentPage + 2 < totalPages ? currentPage + 2 : totalPages}" />

				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span class="page-number" onclick="loadFilteredPageProducts(${i}, event)">${i}</span>
				</c:forEach>

				<!-- Nút ">" -->
				<c:if test="${currentPage < totalPages}">
					<button class="next-btn"
						onclick="loadFilteredPageProducts(${currentPage + 1},event)">></button>
					<button class="next-btn"
						onclick="loadFilteredPageProducts(${totalPages}, event)">>></button>
				</c:if>
			</div>
		</div>
	</div>
	<script>
    
    
	    document.addEventListener("DOMContentLoaded", function () {
	        loadParentCategory(); // Tự động gọi hàm khi trang tải xong
	        loadFilterTags();
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

            resultMessage.textContent = 'Khoảng giá ' + minValue + ' đ - ' + maxValue + ' đ';
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
    function loadYear() {
        const minPrice = document.getElementById('min-price').value;
        const maxPrice = document.getElementById('max-price').value;
        const parent = document.getElementById('parent-category')?.value;
        const sub = document.getElementById('sub-category')?.value;
        const parentName = document.getElementById('parent-category-name')?.value;
        const subName = document.getElementById('sub-category-name')?.value;
        // B1: Lấy tất cả checkbox năm
        const checkboxes = document.querySelectorAll('.year-checkbox');
        let selectedYears = [];

        checkboxes.forEach(checkbox => {
            if (checkbox.checked) {
                selectedYears.push(checkbox.value);
            }
        });

        // B2: Tạo query string từ mảng năm
        const yearParams = selectedYears.map(y => "yearFilter=" + encodeURIComponent(y)).join("&");

        // B3: Gửi AJAX GET
        const xhr = new XMLHttpRequest();
        let url = "FilterServlet?page=1"
            + "&categoryParentId=" + parent
            + "&categoryId=" + sub
            + "&minPrice=" + minPrice
            + "&maxPrice=" + maxPrice
            + "&parentcategoryName=" + parentName
            + "&subcategoryName=" + subName;
        if (yearParams.length > 0) {
            url += "&" + yearParams;
        }

        history.pushState(null, '', url);

        xhr.open("GET", url, true);
        xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");

        xhr.onload = function () {
            if (xhr.status === 200) {
                // B4: Hiển thị danh sách sản phẩm
                document.getElementById("product-list").innerHTML = xhr.responseText;
                loadFilterTags();
            } else {
                console.error("Lỗi khi gọi FilterServlet:", xhr.statusText);
            }
        };
        
        xhr.send();
    }
    function getYearLabel(value) {
        switch (value) {
            case "after2020": return "Sau 2020";
            case "2010-2020": return "2010-2020";
            case "2000-2010": return "2000-2010";
            case "before2000": return "Trước 2000";
            default: return value;
        }
    }

    function removeYearFilter(value) {
    	const checkbox = document.querySelector('.year-checkbox[value="' + value + '"]');

        if (checkbox) {
            checkbox.checked = false;
            loadYear(); // Gọi lại để cập nhật lọc
        }
    }

    
    
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
		  
				    html += '<li var="' + id + '"class="' + (index >= 3 ? 'hidden' : 'displayli') + '">' +
				    '<button onclick="loadSubCategories(\'' + name + '\', ' + id + ')">' + name + '</button>' +
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
  
  function loadSubCategories(cateName ,categoryParentId) {
	  const xhr = new XMLHttpRequest();
	  const minPriceInput = document.getElementById('min-price');
	  const maxPriceInput = document.getElementById('max-price');
	
	    document.querySelectorAll('#category-parent-list li').forEach((li) => {
	        li.classList.remove('active');
	    });

	    // Thêm lớp active vào thể loại cha đã chọn
	    event.target.closest('li').classList.add('active');
	  // 1. Load sub-categories
	  xhr.open("GET", "AjaxCategoryServlet?categoryParentId=" + categoryParentId 
	            + "&minPrice=" + minPriceInput.value 
	            + "&maxPrice=" + maxPriceInput.value, true);

	  xhr.onload = function () {
	    if (xhr.status === 200) {
	      const subCategories = JSON.parse(xhr.responseText);
	      const categoryListElement = document.getElementById("category-list" + categoryParentId);
	      loadFilterTags();
	      if (!categoryListElement) return;

	      let html = "";
	      subCategories.forEach((category, index) => {
	        const { id, name } = category;
	        html += '<li var="' + id + '"class="' + (index >= 3 ? 'hidden' : 'displayli') + '" >' +
	        '<a href="#"  onclick="loadFilteredSubProducts( \'' + cateName + '\',\'' + name + '\', ' + id + ', event)">' + name + '</a>' +
	        '</li>';
	      });
	      
	      categoryListElement.innerHTML = html;

	      // 2. Load sản phẩm lọc bằng AJAX khác
	      loadFilteredParentProducts(categoryParentId, cateName);
	    }
	  };
	  xhr.send();

     
	}

  function removeParentFilter(categoryParentId) {
	    const tag = document.querySelector('.filter-tag[data-id="' + categoryParentId + '"]');
	    if (tag) tag.remove();

	    // Thực hiện reload lại sản phẩm nếu cần thiết
	    // loadFilteredParentProducts(...) có thể gọi lại tùy bạn
  }
  
  function loadFilteredParentProducts(categoryParentId, cateName) {
		const minPrice = document.getElementById('min-price').value;
		const maxPrice = document.getElementById('max-price').value;
		const years = document.getElementById('yearFilters')?.value;
		const parentName = document.getElementById('parent-category-name')?.value;
	    const subName = document.getElementById('sub-category-name')?.value;
		const xhr = new XMLHttpRequest();
		
		const url = "FilterServlet?page=" + 1
		          + "&categoryParentId=" + categoryParentId	 
		    	  +"&parentcategoryName="+ cateName 
   			      + "&subcategoryName=" + subName
		          + "&minPrice=" + minPrice
		          + "&maxPrice=" + maxPrice;
	   			 + "&yearFilter=" + years;
		history.pushState(null, '', url);
		xhr.open("GET", "FilterServlet?page=1&categoryParentId=" + categoryParentId + "&parentcategoryName=" + cateName +  "&minPrice=" + minPrice + "&maxPrice=" + maxPrice     + "&yearFilter=" + years, true);
		xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest"); 

		xhr.onload = function () {
			if (xhr.status === 200) {
				document.getElementById("product-list").innerHTML = xhr.responseText;
				  loadFilterTags();
			}
		};

		xhr.send();
	}

   function loadFilteredSubProducts(cateParentName,cateName,categoryId, event) {
	   event.preventDefault();
	   const years = document.getElementById('yearFilters')?.value;
		const minPrice = document.getElementById('min-price').value;
		const maxPrice = document.getElementById('max-price').value;
		const parentName = document.getElementById('parent-category-name')?.value;
	      const subName = document.getElementById('sub-category-name')?.value;
		const url = "FilterServlet?page=" + 1
				+ "&categoryId=" + categoryId
		      + "&minPrice=" + minPrice 
			  +"&parentcategoryName="+ cateParentName 
			      + "&subcategoryName=" + cateName
		      + "&maxPrice=" + maxPrice;
			    + "&yearFilter=" + years;
			    
		history.pushState(null, '', url);
		
		const xhr = new XMLHttpRequest();
		xhr.open("GET", "FilterServlet?page=1&categoryId=" + categoryId + "&parentcategoryName=" + cateParentName + "&subcategoryName=" + cateName  + "&minPrice=" + minPrice + "&maxPrice=" + maxPrice     + "&yearFilter=" + years, true);
		xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");

		xhr.onload = function () {
			if (xhr.status === 200) {
				document.getElementById("product-list").innerHTML = xhr.responseText;
				  loadFilterTags();
			}
		};

		xhr.send();
	}
   function loadFilteredPageProducts(currentPage, event) {
	    event.preventDefault();
	    const years = document.getElementById('yearFilters')?.value;
	    const parent = document.getElementById('parent-category')?.value;
	    const sub = document.getElementById('sub-category')?.value;
		    // Lấy giá trị minPrice và maxPrice từ input
	    const minPrice = document.getElementById('min-price').value;
	    const maxPrice = document.getElementById('max-price').value;
	    const parentName = document.getElementById('parent-category-name')?.value;
	      const subName = document.getElementById('sub-category-name')?.value;
		let url = "FilterServlet?page=" + currentPage 
					+ "&categoryParentId=" + parent
					+ "&categoryId=" + sub
					  +"&parentcategoryName="+ parentName 
				      + "&subcategoryName=" + subName
			      + "&minPrice=" + minPrice 
			      + "&maxPrice=" + maxPrice
			      + "&yearFilter=" + years;
		history.pushState(null, '', url);
	
	    const xhr = new XMLHttpRequest();
	    xhr.open("GET", "FilterServlet?page=" + currentPage 
	    				+ "&categoryParentId=" + parent
	    				+ "&categoryId=" + sub
	    			  +"&parentcategoryName="+ parentName 
	   			      + "&subcategoryName=" + subName
	                  + "&minPrice=" + minPrice 
	                  + "&maxPrice=" + maxPrice
	                  + "&yearFilter=" + years, true);
	    xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest"); 

	    xhr.onload = function () {
	        if (xhr.status === 200) {
	         
	            document.getElementById("product-list").innerHTML = xhr.responseText;
	            loadFilterTags();
	        }
	    };

	    xhr.send();
	}


  function toggleMore() {
      const hiddenItems = document.querySelectorAll(".hidden");
      const seeMoreButton = document.querySelector(".see-more .arrow");

      hiddenItems.forEach(item => {
          item.classList.toggle("displayli");
          item.classList.toggle("hidden");
      });

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
                button.style.borderBottom = "none"; 
                menu.style.borderTop = "none"
              dropdown.classList.toggle("open");
            });
          
           
            document.addEventListener("click", function (e) {
              if (!dropdown.contains(e.target)) {
                  button.style.borderBottom = "1px solid #cccccc"; 
                menu.style.borderTop = "1px solid #CCCCCC"
                dropdown.classList.remove("open");
               
              }
            });
          }); 

        function loadFilterTags() {
        	 const filterTagsRaw = document.getElementById("filter-tags-list")?.value;
        	    if (filterTagsRaw) {
        	        // Clear container trước khi load
        	        const container = document.getElementById("active-filters");
        	        container.innerHTML = '';
        	        
        	        let clean = filterTagsRaw.replace(/^\[|\]$/g, ""); 
        	        let tagArray = clean.split(/\s*,\s*/); 

        	        tagArray.forEach(text => {
        	            if (text && text.trim() !== "") {
        	                const tag = document.createElement("div");
        	                tag.className = "filter-tag";
        	                tag.setAttribute('data-filter-text', text.trim());
        	                
        	                const span = document.createElement("span");
        	                span.className = "remove-filter";
        	                span.innerHTML = "X";
        	                span.onclick = function() {
        	                    removeFilterByText(text.trim());
        	                };
        	                
        	                tag.textContent = text.trim() + " ";
        	                tag.appendChild(span);
        	                container.appendChild(tag);
        	            }
        	        });
        	   }
        }
        function removeFilterByText(text) {
            // 1. Xóa filter tag khỏi giao diện
            const tags = document.querySelectorAll('#active-filters .filter-tag');
            tags.forEach(tag => {
                if (tag.textContent.trim().startsWith(text)) {
                    tag.remove();
                }
            });
            
            // 2. Xác định loại filter và thực hiện hành động tương ứng
            
            // Xử lý filter năm sản xuất
            if (text.includes('2010') || text.includes('2000') || text.includes('2020') || text.includes('after')) {
                removeYearFilterByText(text);
                return;
            }
            
            // Xử lý filter giá (nếu có format đặc biệt cho price range)
            if (text.includes(' to ')) {
            	
                removePriceFilter();
                return;
            }
            
            // Xử lý filter danh mục
            if (isCategotyFilter(text)) {
                removeCategoryFilter(text);
                return;
            }
            
            // Mặc định: reload lại tất cả sản phẩm
            reloadAllProducts();
        }

        // Hàm hỗ trợ xóa filter năm
        function removeYearFilterByText(text) {
            let value = '';
            
            // Xác định value tương ứng với text
            if (text.includes('after2020')) {
                value = 'after2020';
            } else if (text.includes('2010') && text.includes('2020')) {
                value = '2010to2020';
            } else if (text.includes('2000') && text.includes('2010')) {
                value = '2000to2010';
            } else if (text.includes('before2000')) {
                value = 'before2000';
            }
            
            // Bỏ check checkbox tương ứng
            const checkbox = document.querySelector('.year-checkbox[value="' + value + '"]');
            if (checkbox) {
                checkbox.checked = false;
            }
            
            // Gọi lại hàm loadYear để cập nhật
            loadYear();
        }

        // Hàm hỗ trợ xóa filter giá
        function removePriceFilter() {
            // Reset giá về mặc định
            document.getElementById('min-price').value = 0;
            document.getElementById('max-price').value = 1000000;
            document.getElementById('range-slider-min').value = 0;
            document.getElementById('range-slider-max').value = 1000000;
            
            // Gọi lại hàm lọc với giá mặc định - sử dụng hàm riêng
            reloadProductsAfterPriceRemoval();
        }

        // Hàm kiểm tra xem có phải filter danh mục không
        function isCategotyFilter(text) {
            return !text.includes('to') && 
                   !text.includes('2020') && !text.includes('2010') && !text.includes('2000');
        }

        // Hàm xóa filter danh mục
        function removeCategoryFilter(text) {
            // Reset các hidden input về trạng thái mặc định
            const parentCategoryInput = document.getElementById('parent-category');
            const subCategoryInput = document.getElementById('sub-category');
            const parentCategoryNameInput = document.getElementById('parent-category-name');
            const subCategoryNameInput = document.getElementById('sub-category-name');
            
            // Kiểm tra xem text này là parent category hay sub category
            // và reset tương ứng
            if (parentCategoryNameInput && parentCategoryNameInput.value === text) {
                if (parentCategoryInput) parentCategoryInput.value = '';
                if (parentCategoryNameInput) parentCategoryNameInput.value = '';
            }
            
            if (subCategoryNameInput && subCategoryNameInput.value === text) {
                if (subCategoryInput) subCategoryInput.value = '';
                if (subCategoryNameInput) subCategoryNameInput.value = '';
            }
            
            // Xóa active class khỏi các button category
            document.querySelectorAll('#category-parent-list li').forEach((li) => {
                li.classList.remove('active');
            });
            
            // Reload sản phẩm với hàm riêng không có lỗi cateName
            reloadProductsAfterCategoryRemoval();
        }

        // Hàm reload tất cả sản phẩm về trạng thái ban đầu
        function reloadAllProducts() {
            // Reset tất cả filters về mặc định
            
            // Reset giá
            document.getElementById('min-price').value = 0;
            document.getElementById('max-price').value = 1000000;
            document.getElementById('range-slider-min').value = 0;
            document.getElementById('range-slider-max').value = 1000000;
            
            // Reset năm
            document.querySelectorAll('.year-checkbox').forEach(checkbox => {
                checkbox.checked = false;
            });
            
            // Reset danh mục
            const parentCategoryInput = document.getElementById('parent-category');
            const subCategoryInput = document.getElementById('sub-category');
            const parentCategoryNameInput = document.getElementById('parent-category-name');
            const subCategoryNameInput = document.getElementById('sub-category-name');
            
            if (parentCategoryInput) parentCategoryInput.value = '';
            if (subCategoryInput) subCategoryInput.value = '';
            if (parentCategoryNameInput) parentCategoryNameInput.value = '';
            if (subCategoryNameInput) subCategoryNameInput.value = '';
            
            // Xóa active class
            document.querySelectorAll('#category-parent-list li').forEach((li) => {
                li.classList.remove('active');
            });
            
            // Gọi FilterServlet với tất cả tham số rỗng
            const xhr = new XMLHttpRequest();
            const url = "FilterServlet?page=1";
            
            history.pushState(null, '', url);
            xhr.open("GET", url, true);
            xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
            
            xhr.onload = function () {
                if (xhr.status === 200) {
                    document.getElementById("product-list").innerHTML = xhr.responseText;
                    // Clear tất cả filter tags
                    document.getElementById("active-filters").innerHTML = '';
                }
            };
            
            xhr.send();
        }

        // Hàm reload sản phẩm sau khi xóa category filter
        function reloadProductsAfterCategoryRemoval() {
            const minPrice = document.getElementById('min-price').value || 0;
            const maxPrice = document.getElementById('max-price').value || 1000000;
            const parent = document.getElementById('parent-category')?.value || '';
            const sub = document.getElementById('sub-category')?.value || '';
            const parentName = document.getElementById('parent-category-name')?.value || '';
            const subName = document.getElementById('sub-category-name')?.value || '';
            
            // Lấy năm đã chọn
            const checkboxes = document.querySelectorAll('.year-checkbox');
            let selectedYears = [];
            checkboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    selectedYears.push(checkbox.value);
                }
            });
            const yearParams = selectedYears.map(y => "yearFilter=" + encodeURIComponent(y)).join("&");
            
            const xhr = new XMLHttpRequest();
            let url = "FilterServlet?page=1"
                + "&categoryParentId=" + parent
                + "&categoryId=" + sub
                + "&minPrice=" + minPrice
                + "&maxPrice=" + maxPrice
                + "&parentcategoryName=" + encodeURIComponent(parentName)
                + "&subcategoryName=" + encodeURIComponent(subName);
            
            if (yearParams.length > 0) {
                url += "&" + yearParams;
            }
            
            history.pushState(null, '', url);
            xhr.open("GET", url, true);
            xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
            
            xhr.onload = function () {
                if (xhr.status === 200) {
                    document.getElementById("product-list").innerHTML = xhr.responseText;
                    loadFilterTags();
                }
            };
            
            xhr.send();
        }

        // Hàm reload sản phẩm sau khi xóa price filter
        function reloadProductsAfterPriceRemoval() {
            const minPrice = document.getElementById('min-price').value || 0;
            const maxPrice = document.getElementById('max-price').value || 1000000;
            const parent = document.getElementById('parent-category')?.value || '';
            const sub = document.getElementById('sub-category')?.value || '';
            const parentName = document.getElementById('parent-category-name')?.value || '';
            const subName = document.getElementById('sub-category-name')?.value || '';
            
            // Lấy năm đã chọn
            const checkboxes = document.querySelectorAll('.year-checkbox');
            let selectedYears = [];
            checkboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    selectedYears.push(checkbox.value);
                }
            });
            const yearParams = selectedYears.map(y => "yearFilter=" + encodeURIComponent(y)).join("&");
            
            const xhr = new XMLHttpRequest();
            let url = "FilterServlet?page=1"
                + "&categoryParentId=" + parent
                + "&categoryId=" + sub
                + "&minPrice=" + minPrice
                + "&maxPrice=" + maxPrice
                + "&parentcategoryName=" + encodeURIComponent(parentName)
                + "&subcategoryName=" + encodeURIComponent(subName);
            
            if (yearParams.length > 0) {
                url += "&" + yearParams;
            }
            
            history.pushState(null, '', url);
            xhr.open("GET", url, true);
            xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
            
            xhr.onload = function () {
                if (xhr.status === 200) {
                    document.getElementById("product-list").innerHTML = xhr.responseText;
                    loadFilterTags();
                }
            };
            
            xhr.send();
        }

        </script>
</body>
</html>