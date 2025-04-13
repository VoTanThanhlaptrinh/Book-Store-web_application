document.addEventListener("DOMContentLoaded", function () {
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
        input.addEventListener('input', function () {
            if (this.value < 1 || isNaN(this.value)) {
                this.value = 1; // Đảm bảo số lượng tối thiểu là 1
            }
            updateTotalPrice();

            // Cập nhật số tiền của sản phẩm
            const productRow = this.closest('.cart_product');
            const price = parseFloat(
                productRow.querySelector('.right .item:nth-child(1)').textContent
            );
            const totalProductPrice = price * this.value;
            productRow.querySelector('.right .item:nth-child(3)').textContent =
                `₫${totalProductPrice.toLocaleString()}`;
        });
    });

    // Xử lý checkbox "Chọn tất cả"
    if (selectAllCheckbox) {
        selectAllCheckbox.addEventListener('change', function () {
            productCheckboxes.forEach((checkbox) => {
                checkbox.checked = this.checked;
            });
            updateTotalPrice();
        });
    }

    // Xử lý checkbox từng sản phẩm
    productCheckboxes.forEach((checkbox) => {
        checkbox.addEventListener('change', function () {
            const allChecked = Array.from(productCheckboxes).every((cb) => cb.checked);
            if (selectAllCheckbox) {
                selectAllCheckbox.checked = allChecked;
            }
            updateTotalPrice();
        });
    });

    // Xử lý nút tăng/giảm số lượng
    quantityButtons.forEach((button) => {
        button.addEventListener('click', function () {
            const input = this.parentElement.querySelector('.input-quantity');
            let quantity = parseInt(input.value) || 1;

            if (this.classList.contains('plus')) {
                quantity++;
            } else if (this.classList.contains('minus') && quantity > 1) {
                quantity--;
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
        });
    });

	// Xử lý form submit để gửi thông tin đầy đủ
	const orderForm = document.getElementById('orderForm');
	if (orderForm) {
	    orderForm.addEventListener('submit', function (event) {
	        const orderData = [];
	        let totalOrderPrice = 0;

	        productCheckboxes.forEach((checkbox, index) => {
	            if (checkbox.checked) {
	                const productRow = checkbox.closest('.cart_product');
	                const priceText = productRow.querySelector('.right .item:nth-child(1)').textContent;
	                const totalPriceText = productRow.querySelector('.right .item:nth-child(3)').textContent;
	                
	                const data = {
	                    cartId: checkbox.getAttribute('data-cart-id'),
	                    productId: checkbox.getAttribute('data-product-id'),
	                    quantity: parseInt(quantityInputs[index].value) || 1,
	                    name: productRow.querySelector('.productname').textContent,
	                    price: parseFloat(priceText.replace(/,/g, '').replace('₫', '')),
	                    totalPrice: parseFloat(totalPriceText.replace(/,/g, '').replace('₫', '')),
	                    imgId: productRow.querySelector('.img').getAttribute('data-img-id')
	                };
	                orderData.push(data);
	                totalOrderPrice += data.totalPrice;
	            }
	        });

	        if (orderData.length === 0) {
	            event.preventDefault();
	            alert('Vui lòng chọn ít nhất một sản phẩm để mua hàng!');
	            return;
	        }

	        document.getElementById('orderData').value = JSON.stringify({ items: orderData, totalOrderPrice: totalOrderPrice });
	    });
	}
	    updateTotalPrice();
});