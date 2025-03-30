/*document.addEventListener("DOMContentLoaded", function () {
    const quantityControls = document.querySelectorAll(".quantity-control");
    const selectAllCheckbox = document.querySelector(".footer-left input[type='checkbox']");
    const totalPriceDisplay = document.querySelector(".total-price span");

    function updateTotalPrice() {
        let total = 0;
        document.querySelectorAll(".product-row").forEach(row => {
            const checkbox = row.querySelector("input[type='checkbox']");
            if (checkbox.checked) {
                const quantity = parseInt(row.querySelector(".quantity-input").value);
                const price = parseFloat(row.querySelector(".quantity-input").dataset.price);
                total += quantity * price;
            }
        });
        totalPriceDisplay.textContent = `${total.toLocaleString()} VND`;
    }

    quantityControls.forEach(control => {
        const decreaseBtn = control.querySelector(".btn-decrease");
        const increaseBtn = control.querySelector(".btn-increase");
        const quantityInput = control.querySelector(".quantity-input");
        const totalPriceElement = control.closest(".product-row").querySelector(".total-price");

        function updatePrice() {
            let quantity = parseInt(quantityInput.value);
            let price = parseFloat(quantityInput.dataset.price);
            totalPriceElement.textContent = (quantity * price).toLocaleString() + " VND";
            updateTotalPrice();
        }

        decreaseBtn.addEventListener("click", function () {
            let quantity = parseInt(quantityInput.value);
            if (quantity > 1) {
                quantityInput.value = quantity - 1;
                updatePrice();
            }
        });

        increaseBtn.addEventListener("click", function () {
            let quantity = parseInt(quantityInput.value);
            quantityInput.value = quantity + 1;
            updatePrice();
        });
    });

    // Chọn tất cả sản phẩm
    selectAllCheckbox.addEventListener("change", function () {
        const checkboxes = document.querySelectorAll(".product-row input[type='checkbox']");
        checkboxes.forEach(checkbox => checkbox.checked = selectAllCheckbox.checked);
        updateTotalPrice();
    });

    // Cập nhật tổng tiền khi chọn sản phẩm
    document.querySelectorAll(".product-row input[type='checkbox']").forEach(checkbox => {
        checkbox.addEventListener("change", updateTotalPrice);
    });

});


*/

document.addEventListener("DOMContentLoaded", function () {
    const quantityControls = document.querySelectorAll(".quantity-control");
    const selectAllCheckbox = document.querySelector(".footer-left input[type='checkbox']");
    const totalPriceDisplay = document.querySelector(".total-price span");

    function updateTotalPrice() {
        let total = 0;
        document.querySelectorAll(".product-row").forEach(row => {
            const checkbox = row.querySelector("input[type='checkbox']");
            if (checkbox.checked) {
                const quantity = parseInt(row.querySelector(".quantity-input").value);
                const price = parseFloat(row.querySelector(".quantity-input").dataset.price);
                total += quantity * price;
            }
        });
        totalPriceDisplay.textContent = `${total.toLocaleString()} VND`;
    }

    quantityControls.forEach(control => {
        const decreaseBtn = control.querySelector(".btn-decrease");
        const increaseBtn = control.querySelector(".btn-increase");
        const quantityInput = control.querySelector(".quantity-input");
        const totalPriceElement = control.closest(".product-row").querySelector(".total-price");

        function updatePrice() {
            let quantity = parseInt(quantityInput.value);
            let price = parseFloat(quantityInput.dataset.price);
            totalPriceElement.textContent = (quantity * price).toLocaleString() + " VND";
            updateTotalPrice();
        }

        decreaseBtn.addEventListener("click", function (event) {
            event.stopPropagation(); // Ngăn chặn click lan ra container
            let quantity = parseInt(quantityInput.value);
            if (quantity > 1) {
                quantityInput.value = quantity - 1;
                updatePrice();
            }
        });

        increaseBtn.addEventListener("click", function (event) {
            event.stopPropagation();
            let quantity = parseInt(quantityInput.value);
            quantityInput.value = quantity + 1;
            updatePrice();
        });
    });

    // Chọn tất cả sản phẩm
    selectAllCheckbox.addEventListener("change", function () {
        const checkboxes = document.querySelectorAll(".product-row input[type='checkbox']");
        checkboxes.forEach(checkbox => checkbox.checked = selectAllCheckbox.checked);
        updateTotalPrice();
    });

    // Cập nhật tổng tiền khi chọn sản phẩm
    document.querySelectorAll(".product-row input[type='checkbox']").forEach(checkbox => {
        checkbox.addEventListener("change", updateTotalPrice);
    });

    // Khi click vào container thì tự động tích/bỏ tích checkbox
    document.querySelectorAll(".product-row").forEach(row => {
        row.addEventListener("click", function (event) {
            if (!event.target.matches("input, button")) { 
                const checkbox = row.querySelector("input[type='checkbox']");
                checkbox.checked = !checkbox.checked;
                updateTotalPrice();
            }
        });
    });

});
