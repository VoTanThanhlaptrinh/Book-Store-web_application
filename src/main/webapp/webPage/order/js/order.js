
// Hàm cho panel địa chỉ
function openPanel() {
    // Mở panel địa chỉ bằng cách thêm class 'active'
    document.getElementById('addressPanel').classList.add('active');
}

function closePanel() {
    // Đóng panel địa chỉ bằng cách xóa class 'active'
    document.getElementById('addressPanel').classList.remove('active');
}

function openNewAddressForm() {
    // Mở popup form thêm địa chỉ mới
    document.getElementById('overlay').style.display = 'block';
    document.getElementById('newAddressForm').style.display = 'block';
    document.getElementById('addressPanel').classList.remove('active');
}

function cancelNewAddress() {
    // Đóng popup form và overlay, không hiện lại panel địa chỉ
    document.getElementById('overlay').style.display = 'none';
    document.getElementById('newAddressForm').style.display = 'none';
    // Không mở lại #addressPanel
}

function saveNewAddress() {
    // Đóng popup form và overlay, không hiện lại panel địa chỉ
    document.getElementById('overlay').style.display = 'none';
    document.getElementById('newAddressForm').style.display = 'none';
    // Không mở lại #addressPanel
    // Thêm logic lưu địa chỉ nếu cần
}

// Hàm cho panel phương thức thanh toán
function openPaymentPanel() {
    // Mở panel phương thức thanh toán
    document.getElementById('paymentPanel').classList.add('active');
}

function closePaymentPanel() {
    // Đóng panel phương thức thanh toán
    document.getElementById('paymentPanel').classList.remove('active');
}
