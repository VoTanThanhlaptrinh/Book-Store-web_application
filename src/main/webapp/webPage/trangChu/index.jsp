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
<link rel="stylesheet" href="/BOOK_STORE/webPage/trangChu/CSS/index.css">
<link rel="stylesheet" href="/BOOK_STORE/webPage/trangChu/CSS/header.css">
<link rel="stylesheet" href="/BOOK_STORE/webPage/trangChu/CSS/footer.css">
<script src="https://cdn.lordicon.com/lordicon.js"></script>
    <script src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs" type="module"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<title>Trang chủ</title>
</head>
<body>

    <c:if test="${user != null}">
        <div id="header-placeholder"><jsp:include page="/webPage/trangChu/re-header.jsp"></jsp:include></div>
    </c:if>
    <c:if test="${user == null}">
        <div id="header-placeholder"><jsp:include page="/webPage/trangChu/header.jsp"></jsp:include></div>
    </c:if>
    
     <div class="banner_div">
          <div class="slider" id="slider">
            <div class="slides" id="slideContainer">
              <img src="https://cdn1.fahasa.com/media/magentothem/banner7/ThaiHa_Bac_Resize_840x320.png" alt="Slide 1" loading="lazy">
              <img src="https://cdn1.fahasa.com/media/wysiwyg/Thang-03-2025/LichSuVanHoa_Mainbanner_1920x600.png" alt="Slide 2" loading="lazy">
              <img src="https://cdn1.fahasa.com/media/magentothem/banner7/TrangThuBongT2g_840x320.jpg" alt="Slide 3" loading="lazy">
            </div>
          
            <button class="nav-button prev" onclick="prevSlide()">❮</button>
            <button class="nav-button next" onclick="nextSlide()">❯</button>
          </div>
            <div class="banner_list_1">
                <img src="https://cdn1.fahasa.com/media/wysiwyg/Thang-03-2025/Subpark_Way.png" alt="" loading="lazy">
                <img src="https://cdn1.fahasa.com/media/wysiwyg/Thang-03-2025/Fahasa_OnineT3_392x156_1.jpg" alt="" loading="lazy">
                <img src="https://cdn1.fahasa.com/media/magentothem/banner7/TrangThuBongT2g_840x320.jpg" alt="" loading="lazy">
            </div>
    </div>

    <div class="content_div_1">
        <div class="content_div_1_element">
            <img src="https://img.freepik.com/free-vector/gradient-hyper-pink-ice-cream-illustration_52683-140811.jpg?t=st=1741852927~exp=1741856527~hmac=cad0f8ba692f706a3223065eee7afaac8182e628e5a9f9429ee25daa1d8d9923&w=1380"
             alt="" >
            <p> Sách tham khảo</p>

        </div>

        <div class="content_div_1_element">
            <img src="https://img.freepik.com/premium-vector/golden-tet-sale-banner-2025-with-red-envelopes-vouchers_196898-3336.jpg?w=900" alt="">
            <p>Sách nhập vai </p>
        </div>

        
        <div class="content_div_1_element">
            <img src="https://img.freepik.com/premium-vector/special-shopping-day-sale-discount-deals-with-blue-gradient-trapezium-label-badge-banner-vector_171508-2505.jpg?w=900" alt="">
            <p>Sách nhập vai </p>
        </div>

        <div class="content_div_1_element">
            <img src="https://img.freepik.com/free-vector/gradient-hyper-pink-ice-cream-illustration_52683-140811.jpg?t=st=1741852927~exp=1741856527~hmac=cad0f8ba692f706a3223065eee7afaac8182e628e5a9f9429ee25daa1d8d9923&w=1380"
             alt="" >
            <p> Sách tham khảo</p>

        </div>

        <div class="content_div_1_element">
            <img src="https://img.freepik.com/premium-vector/golden-tet-sale-banner-2025-with-red-envelopes-vouchers_196898-3336.jpg?w=900" alt="">
            <p>Sách nhập vai </p>
        </div>

        
        <div class="content_div_1_element">
            <img src="https://img.freepik.com/premium-vector/special-shopping-day-sale-discount-deals-with-blue-gradient-trapezium-label-badge-banner-vector_171508-2505.jpg?w=900" alt="">
            <p>Sách nhập vai </p>
        </div>

        <div class="content_div_1_element">
            <img src="https://img.freepik.com/free-vector/gradient-hyper-pink-ice-cream-illustration_52683-140811.jpg?t=st=1741852927~exp=1741856527~hmac=cad0f8ba692f706a3223065eee7afaac8182e628e5a9f9429ee25daa1d8d9923&w=1380"
             alt="" >
            <p> Sách tham khảo</p>

        </div>

        <div class="content_div_1_element">
            <img src="https://img.freepik.com/premium-vector/golden-tet-sale-banner-2025-with-red-envelopes-vouchers_196898-3336.jpg?w=900" alt="">
            <p>Sách nhập vai </p>
        </div>

    </div>

    <div class="sale-content">
  

        <div class="content">
            <div class="content-left">
            <img src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/flashsale/label-flashsale.svg?q=" alt="">

            <div class="countdown-container">
                Kết thúc trong 
                <div class="countdown-box" id="hours">00</div> 
                <span class="separator">:</span> 
                <div class="countdown-box" id="minutes">00</div> 
                <span class="separator">:</span> 
                <div class="countdown-box" id="seconds">00</div>
            </div>
        </div>
            <div class="content-right">
               <a href="#">Xem tất cả ></a>   
            </div>
        </div>

          <div class="sale-books">
            <div class="sale-books-element">
                <img src="https://cdn1.fahasa.com/media/catalog/product/8/9/8935212361910.jpg" alt="">
                <p>Những câu chuyện tò mò của bé</p>
                <h4>136.000 đ</h4>
                <h6>150.000 đ</h6>
                <h5>20%</h5>
            </div>
            <div class="sale-books-element">
                <img src="https://cdn1.fahasa.com/media/catalog/product/8/9/8935246943663.jpg" alt="">
                <p>Sổ tay vật lý cấp 3- ALL in One</p>
                <h4>50.000 đ</h4>
                <h6>100.000 đ</h6>
                <h5>50%</h5>
            </div>
            <div class="sale-books-element">
                <img src="https://cdn1.fahasa.com/media/catalog/product/8/9/8935235243163.jpg" alt="">
                <p>Khi mọi điều không như ý </p>
                <h4>241.000 đ</h4>
                <h6>300.000 đ</h6>
                <h5>36%</h5>
            </div>
            <div class="sale-books-element">
                <img src="https://cdn1.fahasa.com/media/catalog/product/9/7/9786044049007.jpg" alt="">
                <p>Đánh giá năng lực Dhqg- THPHCM, tổng ôn phần tư duy logic</p>
                <h4>50.000 đ</h4>
                <h6>100.000 đ</h6>
                <h5>50%</h5>
            </div>
            <div class="sale-books-element">
                <img src="https://cdn1.fahasa.com/media/catalog/product/8/9/8935235243163.jpg" alt="">
                <p>Khi mọi điều không như ý </p>
                <h4>241.000 đ</h4>
                <h6>300.000 đ</h6>
                <h5>36%</h5>
            </div>
          </div>  

          
    </div>
    
    <div class="danh-muc-sp">
            <h1>Danh mục sản phẩm</h1>
                <hr style="margin-top: 20px; color: rgb(197, 197, 197);">
            <div class="danh-muc-sp-element">
                <a href="#">
                <div class="danh-muc-sp-element-1"> 
                        <img src="https://cdn1.fahasa.com/media/wysiwyg/Duy-VHDT/Danh-muc-san-pham/2502/8936066695107.jpg" alt="">
                        <p>Kinh tế</p>
                </div>
            </a>
            <a href="#">
                <div class="danh-muc-sp-element-1">
                    <img src="https://cdn1.fahasa.com/media/wysiwyg/Duy-VHDT/Danh-muc-san-pham/8935244874389.jpg" alt="">
                    <p>Văn học</p>
                </div>
            </a>
            <a href="#">
                <div class="danh-muc-sp-element-1">
                    <img src="https://cdn1.fahasa.com/media/wysiwyg/Duy-VHDT/Danh-muc-san-pham/bup-sen-xanh-100x100.png" alt="">
                    <p>Thiếu nhi</p>
                </div>
            </a>
            <a href="#">
                <div class="danh-muc-sp-element-1">
                    <img src="https://cdn1.fahasa.com/media/wysiwyg/Duy-VHDT/Danh-muc-san-pham/240715/atomichabit100x100.jpg" alt="">
                    <p>Tâm lý</p>
                </div>
            </a>


            <a href="#">
                <div class="danh-muc-sp-element-1"> 
                        <img src="https://cdn1.fahasa.com/media/wysiwyg/Duy-VHDT/Danh-muc-san-pham/2502/8936066695107.jpg" alt="">
                        <p>Kinh tế</p>
                </div>
            </a>
            <a href="#">
                <div class="danh-muc-sp-element-1">
                    <img src="https://cdn1.fahasa.com/media/wysiwyg/Duy-VHDT/Danh-muc-san-pham/8935244874389.jpg" alt="">
                    <p>Văn học</p>
                </div>
            </a>
            <a href="#">
                <div class="danh-muc-sp-element-1">
                    <img src="https://cdn1.fahasa.com/media/wysiwyg/Duy-VHDT/Danh-muc-san-pham/bup-sen-xanh-100x100.png" alt="">
                    <p>Thiếu nhi</p>
                </div>
            </a>
            <a href="#">
                <div class="danh-muc-sp-element-1">
                    <img src="https://cdn1.fahasa.com/media/wysiwyg/Duy-VHDT/Danh-muc-san-pham/240715/atomichabit100x100.jpg" alt="">
                    <p>Tâm lý</p>
                </div>
            </a>
            <a href="#">
                <div class="danh-muc-sp-element-1">
                    <img src="https://cdn1.fahasa.com/media/wysiwyg/Duy-VHDT/Danh-muc-san-pham/bup-sen-xanh-100x100.png" alt="">
                    <p>Thiếu nhi</p>
                </div>
            </a>
    
                    </div>
              
 </div>
 <div class="xu_huong_mua_sam">
        <div class="xu_huong_mua_sam_header">
            <img src="https://cdn-icons-png.freepik.com/512/5469/5469166.png?uid=R98667800&ga=GA1.1.8040849.1740927601"
                alt="">
            <h1>Xu Hướng Mua Sắm</h1>
        </div>
		   <div class="display-list-grid">
			<c:forEach var="product" items="${homepageBooks}" varStatus="status">
			    <a href="chi-tiet-sach?id=${product.getProductId()}">
			        <div class="sale-books-element product-item ${status.index >= 10 ? 'hidden-item' : ''}">
			            <img src="getImage?img_id=${product.getImgId()}" alt="${product.getTitle()}" loading="lazy">
			            <p>${product.getTitle()}</p>
			            <h4>${product.getPrice()}</h4>
			            <p>Đã bán: ${1000 - product.getQuantity()}</p>
			        </div>
			    </a>
			</c:forEach>
		</div>
		
		<!-- Nút Xem thêm -->
		<div style="text-align: center; margin-top: 20px;">
		    <button id="loadMoreBtn">Xem thêm</button>
		</div>
    </div>
   	<div style="margin-top: 200px"></div>
                
   	<div id="footer-placeholder"><jsp:include page="/webPage/trangChu/footer.jsp"></jsp:include></div>
    <script>
        let totalSeconds = 9000; // 1 giờ 24 phút 15 giây

        function updateCountdown() {
            let hours = Math.floor(totalSeconds / 3600);
            let minutes = Math.floor((totalSeconds % 3600) / 60);
            let seconds = totalSeconds % 60;

            document.getElementById("hours").innerText = String(hours).padStart(2, '0');
            document.getElementById("minutes").innerText = String(minutes).padStart(2, '0');
            document.getElementById("seconds").innerText = String(seconds).padStart(2, '0');
        }

        function startCountdown() {
            updateCountdown();
            let countdown = setInterval(() => {
                if (totalSeconds > 0) {
                    totalSeconds--;
                    updateCountdown();
                } else {
                    clearInterval(countdown);
                    alert("Hết giờ!");
                }
            }, 1000);
        }

        startCountdown();

   
    </script>
	<script >
		    document.getElementById("loadMoreBtn").addEventListener("click", function () {
		        const hiddenItems = document.querySelectorAll(".hidden-item");
		        hiddenItems.forEach(item => item.classList.remove("hidden-item"));
		        this.style.display = "none"; // Ẩn nút sau khi bấm
		    });
	    
	     const slides = document.getElementById('slideContainer');
	        const totalSlides = slides.children.length;
	        let currentIndex = 0;
	      
	        function updateSlide() {
	        	slides.style.transform = 'translateX(-' + (currentIndex * 100) + '%)';
	        }
	      
	        function nextSlide() {
	          currentIndex = (currentIndex + 1) % totalSlides;
	          updateSlide();
	        }
	      
	        function prevSlide() {
	          currentIndex = (currentIndex - 1 + totalSlides) % totalSlides;
	          updateSlide();
	        }
	      
	        setInterval(nextSlide, 3000); // Tự động chuyển mỗi 3 giây
	    
	</script>
</body>
</html>
