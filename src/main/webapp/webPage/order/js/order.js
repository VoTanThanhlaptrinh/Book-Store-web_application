
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

function saveSelectedAddress() {
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


//Load danh sách tỉnh thành
$(document).ready(function() {
    // Khởi tạo Select2 cho các dropdown
    $('#tinh, #quan, #phuong').select2({
        width: '100%',
        dropdownCssClass: 'custom-dropdown', 
        minimumResultsForSearch: Infinity
    });


    const GHN_TOKEN = '1cdb0f24-1830-11f0-bf01-723c4de9ff57'; 
    // Lấy danh sách tỉnh thành
    $.ajax({
        url: 'https://online-gateway.ghn.vn/shiip/public-api/master-data/province',
        type: 'GET',
        headers: {
            'Token': GHN_TOKEN
        },
        success: function(data) {
            if (data.code === 200) {
                $.each(data.data, function(key, val) {
                    $("#tinh").append('<option value="' + val.ProvinceID + '">' + val.ProvinceName + '</option>');
                });

                // Khi chọn tỉnh thành
                $("#tinh").change(function() {
                    var provinceId = $(this).val();
                    // Lấy danh sách quận huyện
                    $.ajax({
                        url: 'https://online-gateway.ghn.vn/shiip/public-api/master-data/district',
                        type: 'POST',
                        headers: {
                            'Token': GHN_TOKEN
                        },
                        data: JSON.stringify({ "province_id": parseInt(provinceId) }),
                        contentType: 'application/json',
                        success: function(data_quan) {
                            if (data_quan.code === 200) {
                                $.each(data_quan.data, function(key_quan, val_quan) {
                                    $("#quan").append('<option value="' + val_quan.DistrictID + '">' + val_quan.DistrictName + '</option>');
                                });
                                // Cập nhật Select2 sau khi thêm option
                                $("#quan").trigger('change.select2');
                                $("#phuong").trigger('change.select2');

                                // Khi chọn quận huyện
                                $("#quan").change(function() {
                                    var districtId = $(this).val();
                                    // Lấy danh sách phường xã
                                    $.ajax({
                                        url: 'https://online-gateway.ghn.vn/shiip/public-api/master-data/ward',
                                        type: 'POST',
                                        headers: {
                                            'Token': GHN_TOKEN
                                        },
                                        data: JSON.stringify({ "district_id": parseInt(districtId) }),
                                        contentType: 'application/json',
                                        success: function(data_phuong) {
                                            if (data_phuong.code === 200) {                                           
                                                $.each(data_phuong.data, function(key_phuong, val_phuong) {
                                                    $("#phuong").append('<option value="' + val_phuong.WardCode + '">' + val_phuong.WardName + '</option>');
                                                });
                                                // Cập nhật Select2 sau khi thêm option
                                                $("#phuong").trigger('change.select2');
                                            }
                                        }
                                    });
                                });
                            }
                        }
                    });
                });
            }
        }
    });
});


// Load danh sách địa chỉ khi trang được load
document.addEventListener('DOMContentLoaded', loadAddresses);

// Hàm load danh sách địa chỉ
function loadAddresses() {
    fetch('/BOOK_STORE/GetAddressesServlet', {
        method: 'GET',
        headers: {
            'Accept': 'application/json'
        }
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Lỗi mạng: ' + response.status);
            }
            return response.json();
        })
        .then(data => {
            console.log('Dữ liệu địa chỉ:', data);
            const addressList = document.getElementById('addressList');
            addressList.innerHTML = '';

            data.forEach(address => {
                const addressItem = `
                    <div class="row d-flex align-items-center border p-3 rounded mb-3">
                        <div class="col-11">
                            <div class="fw-bold mb-2">${address.full_name || 'Không xác định'} ${address.phone || ''}</div>
                            <div>
                                <span class="badge badge-warning mr-2">${address.address_type || 'Không xác định'}</span>
                                ${address.address_detail || 'Không có địa chỉ'}
                            </div>
                            <div class="text-muted small mt-1">Mã vùng: ${address.districtID || 'Không xác định'} - ${address.ward_code || 'Không xác định'}</div>
                        </div>
                        <div class="col-1">
                            <input type="radio" name="address" value="${address.addressID}" id="addr_${address.addressID}" class="custom-radio">
                            <label for="addr_${address.addressID}" class="custom-radio-label"><i class="fa-solid fa-check"></i></label>
                        </div>
                    </div>
                `;
                addressList.insertAdjacentHTML('beforeend', addressItem);
            });
        })
        .catch(error => {
            console.error('Lỗi khi load địa chỉ:', error);
            alert('Không thể tải danh sách địa chỉ: ' + error.message);
        });
}

/*lấy dữ liệu trong form đưa qua servlet*/
document.getElementById("newAddressForm").addEventListener("submit",function(e){
	e.preventDefault();
	
	let full_name = document.querySelector("input[name='full_name']").value;
	let phone = document.querySelector("input[name='phone']").value;
	let address_detail = document.querySelector("input[name='address_detail']").value;
	let district_id = document.querySelector("select[name='district_id']").value;
	let ward_code = document.querySelector("select[name='ward_code']").value;
	let address_type = document.querySelector("input[name='address_type']:checked").value;
	
	const addressData = {full_name, phone, address_detail, district_id, ward_code, address_type};
	fetch("/BOOK_STORE/saveAddress",{
		method: "POST",
		headers: {	
			"Content-Type":"application/json"
		},
		body:JSON.stringify(addressData)
	})
	.then(response => response.json())
	.then(data => {
		
	    alert("Lưu địa chỉ thành công!");
		cancelNewAddress();
		openPanel();
	})
	.catch(error => {             
	    alert("Có lỗi xảy ra khi lưu địa chỉ." + error);
	});

});




// Hàm lưu địa chỉ được chọn
function saveSelectedAddress() {
    const selectedAddress = document.querySelector('input[name="address"]:checked');
    if (!selectedAddress) {
        alert('Vui lòng chọn một địa chỉ!');
        return;
    }

    const addressId = selectedAddress.value;
    console.log('Địa chỉ được chọn, ID:', addressId);

    fetch('/BOOK_STORE/selectAddress', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Accept': 'application/json'
        },
        body: new URLSearchParams({ address_id: addressId })
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Lỗi mạng: ' + response.status);
            }
            return response.json();
        })
        .then(data => {
            console.log('Phản hồi từ server:', data);
            if (data.status === 'success') {
                alert('Đã lưu địa chỉ với ID: ' + addressId);
                closePanel();
            } else {
                alert('Lưu địa chỉ thất bại: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Lỗi khi lưu địa chỉ:', error);
            alert('Có lỗi xảy ra khi lưu địa chỉ: ' + error.message);
        });
}



