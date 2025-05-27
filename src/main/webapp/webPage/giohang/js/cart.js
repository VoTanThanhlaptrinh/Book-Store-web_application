document.addEventListener("DOMContentLoaded", function() {
	// Lấy các phần tử DOM
	const selectAllCheckbox = document.querySelector('.cart_order .cart_list-checkbox');
	const productCheckboxes = document.querySelectorAll('.cart_product .cart_list-checkbox');
	const totalPriceElement = document.querySelector('.cart_order .right li:first-child');
	const quantityButtons = document.querySelectorAll('.btn-quantity');
	const quantityInputs = document.querySelectorAll('.input-quantity');

	// Hàm tính tổng tiền
	function updateTotalPrice() {
		let total = 0;
		productCheckboxes.forEach((checkbox, index) => {
			if (checkbox.checked) {
				const price = parseFloat(
					checkbox
						.closest('.cart_product')
						.querySelector('.right .item:nth-child(1)')
						.textContent
				);
				const quantity = parseInt(quantityInputs[index].value) || 1;
				total += price * quantity;
			}
		});
		totalPriceElement.textContent = `Tổng tiền: ₫${total.toLocaleString()}`;
	}

	// Xử lý thay đổi số lượng qua input
	quantityInputs.forEach((input) => {
		input.addEventListener('input', function() {
			const input = this.parentElement.querySelector('.input-quantity');
			let quantity = parseInt(input.value) || 1;
			const inputId = input.id;
			const productId = inputId.split('-')[1];
			if (this.value < 1 || isNaN(this.value)) {
				showWarning('số lượng phải lớn hơn 0')
				this.value = 1;
			}
			checkStock(productId, quantity).then(result => {
						if (!result.isValid) {
							quantity = result.available;
						}
						input.value = quantity;

						// Cập nhật số tiền của sản phẩm
						const productRow = this.closest('.cart_product');
						const price = parseFloat(
							productRow.querySelector('.right .item:nth-child(1)').textContent
						);
						const totalProductPrice = price * quantity;
						productRow.querySelector('.right .item:nth-child(3)').textContent =
							`₫${totalProductPrice.toLocaleString()}`;

						// Cập nhật tổng tiền
						updateTotalPrice();

					}).catch(error => {
						console.error("Lỗi khi kiểm tra tồn kho", error);
					});
		});
	});




	// Xử lý checkbox "Chọn tất cả"
	if (selectAllCheckbox) {
		selectAllCheckbox.addEventListener('change', function() {
			productCheckboxes.forEach((checkbox) => {
				checkbox.checked = this.checked;
			});
			updateTotalPrice();
		});
	}

	// Xử lý checkbox từng sản phẩm
	productCheckboxes.forEach((checkbox) => {
		checkbox.addEventListener('change', function() {
			const allChecked = Array.from(productCheckboxes).every((cb) => cb.checked);
			if (selectAllCheckbox) {
				selectAllCheckbox.checked = allChecked;
			}
			updateTotalPrice();
		});
	});

	// Xử lý nút tăng/giảm số lượng
	quantityButtons.forEach((button) => {
		button.addEventListener('click', function() {
			const input = this.parentElement.querySelector('.input-quantity');
			let quantity = parseInt(input.value) || 1;
			const inputId = input.id;
			const productId = inputId.split('-')[1];
			if (this.classList.contains('plus')) {
				quantity++;
			} else if (this.classList.contains('minus')) {
				quantity--;
				if (quantity < 1) {
					showWarning('số lượng phải lớn hơn 0')
					quantity = 1;
				}
			}

			checkStock(productId, quantity).then(result => {
				if (!result.isValid) {
					quantity = result.available;
				}
				input.value = quantity;

				// Cập nhật số tiền của sản phẩm
				const productRow = this.closest('.cart_product');
				const price = parseFloat(
					productRow.querySelector('.right .item:nth-child(1)').textContent
				);
				const totalProductPrice = price * quantity;
				productRow.querySelector('.right .item:nth-child(3)').textContent =
					`₫${totalProductPrice.toLocaleString()}`;

				// Cập nhật tổng tiền
				updateTotalPrice();

			}).catch(error => {
				console.error("Lỗi khi kiểm tra tồn kho", error);
			});





		});
	});



	// Xử lý form submit để gửi thông tin đầy đủ
	const orderForm = document.getElementById('orderForm');
	if (orderForm) {
		orderForm.addEventListener('submit', function(event) {
			event.preventDefault();
			const orderData = [];
			let totalOrderPrice = 0;
			productCheckboxes.forEach((checkbox, index) => {
				if (checkbox.checked) {
					const productRow = checkbox.closest('.cart_product');
					const priceText = productRow.querySelector('.right .item:nth-child(1)').textContent;
					const quantity = parseInt(quantityInputs[index].value) || 1;
					const price = parseFloat(priceText.replace(/,/g, '').replace('₫', ''));

					const data = {
						cartItemId: checkbox.getAttribute('data-cart-id'),
						productId: checkbox.getAttribute('data-product-id'),
						quantity: quantity,
						name: productRow.querySelector('.productname').textContent,
						price: price,
						imgId: productRow.querySelector('.img').getAttribute('data-img-id')
					};
					orderData.push(data);
					totalOrderPrice += (price * quantity);
				}
			});

			if (orderData.length === 0) {
				event.preventDefault();
				showWarning('Vui lòng chọn ít nhất một sản phẩm để mua hàng!');
				return;
			}
			document.getElementById('orderData').value = JSON.stringify({ items: orderData, totalOrderPrice: totalOrderPrice });
			this.submit();
		});
	}
	updateTotalPrice();
});


// 1. Hàm kiểm tra tồn kho
function checkStock(productId, quantity) {
	return new Promise((resolve, reject) => {
		// Tạo form data để gửi đi
		const formData = new URLSearchParams();
		formData.append('productId', productId);
		formData.append('quantity', quantity);

		fetch('/BOOK_STORE/APIcart', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded',
				'Accept': 'application/json'
			},
			body: formData
		})
			.then(response => {
				console.log(response.status)
				if (!response.ok) {
					throw new Error('Network response was not ok');
				}
				return response.json();
			})
			.then(data => {
				if (!data.isValid) {
					toastr.warning(`Sản phẩm chỉ còn ${data.available} sản phẩm`);
					document.querySelector(`#quantity-${productId}`).value = data.available;
				}
				resolve(data);
			})
			.catch(error => {
				toastr.error('Lỗi kiểm tra tồn kho');
				reject(error);
			});
	});

}



