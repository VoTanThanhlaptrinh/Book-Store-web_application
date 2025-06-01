/**
 * 
 */
toastr.options = {
    "closeButton": true,           // Hiển thị nút đóng thông báo
    "progressBar": true,           // Hiển thị thanh tiến trình
    "timeOut": "5000",             // Thời gian thông báo tự động biến mất sau 5 giây
    "extendedTimeOut": "1000",     // Thời gian kéo dài khi hover chuột lên thông báo
    "positionClass": "toast-top-right", // Vị trí hiển thị của thông báo (có thể thay đổi tùy vào giao diện)
    "preventDuplicates": true,     // Ngăn không cho hiển thị thông báo trùng lặp
    "closeHtml": "<button type='button' class='toast-close-button'>×</button>", // Tùy chỉnh nút đóng
    "newestOnTop": true,           // Đảm bảo thông báo mới luôn nằm trên cùng
    "showEasing": "swing",         // Hiệu ứng khi hiển thị
    "hideEasing": "linear",        // Hiệu ứng khi ẩn thông báo
    "showMethod": "fadeIn",        // Hiệu ứng khi xuất hiện
    "hideMethod": "fadeOut"        // Hiệu ứng khi ẩn đi
};


function showSuccess(message) {
    toastr.success(message);
}
function showError(message){
	toastr.error(message);
}

function showWarning(message){
	toastr.warning(message)
}