
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



$(document).ready(function() {
    // Khởi tạo Select2 cho các dropdown
    $('#tinh, #quan, #phuong').select2({
        width: '100%', // Đảm bảo dropdown chiếm toàn bộ chiều rộng
        dropdownCssClass: 'custom-dropdown', // Class tùy chỉnh cho dropdown
        minimumResultsForSearch: Infinity // Tắt thanh tìm kiếm trong dropdown
    });

    // Lấy danh sách tỉnh thành
    $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function(data_tinh) {
        if (data_tinh.error == 0) {
            $("#tinh").append('<option value="0">Vui lòng chọn tỉnh/thành phố</option>');
            $.each(data_tinh.data, function(key_tinh, val_tinh) {
                $("#tinh").append('<option value="' + val_tinh.id + '">' + val_tinh.full_name + '</option>');
            });

            // Khi chọn tỉnh thành
            $("#tinh").change(function() {
                var idtinh = $(this).val();
                // Lấy danh sách quận huyện
                $.getJSON('https://esgoo.net/api-tinhthanh/2/' + idtinh + '.htm', function(data_quan) {
                    if (data_quan.error == 0) {
                        $("#quan").html('<option value="0">Vui lòng chọn quận/huyện</option>');
                        $("#phuong").html('<option value="0">Vui lòng chọn phường/xã</option>');
                        $.each(data_quan.data, function(key_quan, val_quan) {
                            $("#quan").append('<option value="' + val_quan.id + '">' + val_quan.full_name + '</option>');
                        });
                        // Cập nhật Select2 sau khi thêm option
                        $("#quan").trigger('change.select2');
                        $("#phuong").trigger('change.select2');

                        // Khi chọn quận huyện
                        $("#quan").change(function() {
                            var idquan = $(this).val();
                            // Lấy danh sách phường xã
                            $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function(data_phuong) {
                                if (data_phuong.error == 0) {
                                    $("#phuong").html('<option value="0">Vui lòng chọn phường/xã</option>');
                                    $.each(data_phuong.data, function(key_phuong, val_phuong) {
                                        $("#phuong").append('<option value="' + val_phuong.id + '">' + val_phuong.full_name + '</option>');
                                    });
                                    // Cập nhật Select2 sau khi thêm option
                                    $("#phuong").trigger('change.select2');
                                }
                            });
                        });
                    }
                });
            });
        }
    });
});