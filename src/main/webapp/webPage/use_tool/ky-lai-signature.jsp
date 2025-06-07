<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Chữ Ký Điện Tử Đơn Hàng</title>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
</head>

<body class="bg-gray-100 min-h-screen flex items-center justify-center font-sans text-gray-800">

  <div class="bg-white/80 backdrop-blur-md shadow-xl rounded-3xl p-8 w-full max-w-2xl space-y-6 border border-gray-200">

    <h1 class="text-3xl font-bold text-center text-gray-700">Xác Thực Đơn Hàng</h1>

    <!-- Order Information -->
    <div class="bg-white rounded-xl p-4 shadow-sm border border-gray-100">
      <h2 class="text-base font-semibold text-gray-700 mb-2 flex items-center">
        <svg class="h-4 w-4 mr-1 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7h18M3 12h18M3 17h18" />
        </svg>
        Thông Tin Đơn Hàng
      </h2>
      <ul class="text-sm pl-4 space-y-1">
        <li><strong>Ma don hang:</strong> <span id="orderId">${sessionScope.reorder_orderId}</span></li>
		<li><strong>Khach hang:</strong> <span id="customerName">${sessionScope.reorder_customerName}</span></li>
		<li><strong>Ngay dat:</strong> <span id="orderDate">${sessionScope.reorder_orderDate}</span></li>

	<li><strong>Tong tien:</strong> <span id="totalAmount"></span></li>
        <li><strong>Tổng tiền:</strong> <span id="totalAmount"><fmt:formatNumber
											value="${sessionScope.reorder_total}"
											type="number" groupingUsed="true" />đ</span></li>
      </ul>
    </div>

    <!-- Hash -->
    <div class="bg-white rounded-xl p-4 shadow-sm border border-gray-100">
      <h2 class="text-base font-semibold text-gray-700 mb-2 flex items-center">
        <svg class="h-4 w-4 mr-1 text-purple-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12H8m8 0l-4-4m4 4l-4 4" />
        </svg>
        Mã Hash Đơn Hàng
      </h2>
      <div class="flex">
        <input id="hashValue" type="text" readonly class="flex-1 p-2 border border-gray-300 rounded-l-lg bg-gray-50 focus:outline-none" />
        <button id="copyHash" class="bg-purple-500 text-white px-4 py-2 rounded-r-lg hover:bg-purple-600 transition font-medium">Sao Chép</button>
      </div>
      <p class="text-xs text-gray-500 mt-1">Sao chép mã hash để sử dụng trong chữ ký điện tử.</p>
    </div>

    <!-- Signature -->
    <div class="bg-white rounded-xl p-4 shadow-sm border border-gray-100">
      <h2 class="text-base font-semibold text-gray-700 mb-2 flex items-center">
        <svg class="h-4 w-4 mr-1 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-3-3v6" />
        </svg>
        Xác Nhận Chữ Ký Điện Tử
      </h2>
      <textarea id="signatureInput" rows="4" placeholder="Dán chữ ký điện tử vào đây" class="w-full p-2 border border-gray-300 rounded-lg bg-gray-50 focus:outline-none"></textarea>
      <div class="flex justify-between items-center mt-3">
        <a href="guide" target="_blank" class="text-sm text-blue-600 hover:underline">Hướng dẫn sử dụng</a>
        <button id="verifySignature" class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-600 transition font-medium">Xác Nhận</button>
      </div>
    </div>

    <!-- Footer -->
    <div class="text-center">
      <a href="/BOOK_STORE/download" target="_blank" class="inline-block bg-blue-500 text-white px-4 py-2 rounded-full hover:bg-blue-600 transition font-semibold shadow-sm">Tải Tool Mã Hóa</a>
    </div>
  </div>

  <script>
  // lấy dữ liệu tạo má hash
    const orderData = {
      orderId: document.getElementById("orderId").textContent,
      customerName: document.getElementById("customerName").textContent,
      orderDate: document.getElementById("orderDate").textContent,
      products: document.getElementById("products").textContent,
      totalAmount:document.getElementById("totalAmount").textContent
    };

//tạo mã hash và gán lại
    const hash = CryptoJS.SHA256(JSON.stringify(orderData)).toString();
    document.getElementById("hashValue").value = hash;

    document.getElementById("copyHash").addEventListener("click", () => {
      const hashInput = document.getElementById("hashValue");
      hashInput.select();
      document.execCommand("copy");
      alert("Đã sao chép mã hash!");
    });

    
    
    
    //gửi dữ liệu
    document.getElementById("verifySignature").addEventListener("click", () => {
      const signature = document.getElementById("signatureInput").value.trim();
     const orderID = document.getElementById("orderId").textContent;
      if (!signature) {
        alert("Vui lòng nhập chữ ký điện tử!");
        return;
      }
  
      // Gửi dữ liệu đến Servlet
      const formData = new URLSearchParams();
	  formData.append("orderID", orderID);
	  formData.append("signature",signature)

	  fetch('/BOOK_STORE/updateOrder', {
	    method: "POST",
	    headers: {
	      "Content-Type": "application/x-www-form-urlencoded"
	    },
	    body: formData
	  })
	  .then(response => {
	    if (response.ok) {
	      alert("Xác nhận chữ ký thành công!");
	      window.location.href = "/BOOK_STORE/success";
	    } else {
	      alert("Lỗi xác nhận chữ ký!");
	    }
	  })
	  .catch(error => {
	    console.error("Lỗi:", error);
	    alert("Có lỗi xảy ra!");
	  });
	  
	  
	});

  </script>
</body>
</html>