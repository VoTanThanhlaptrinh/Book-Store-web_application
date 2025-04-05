
/*
Cấu hình cho toastr
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
/**
 * 
 */
const form = document.getElementById('myAwesomeDropzone');
const subject = document.getElementById('product-subject')
form.addEventListener("submit", (event) => update(event));
function update(event) {
	event.preventDefault();
	const file = document.getElementById("file")
	const name = document.getElementById("product-name");
	const category = document.getElementById("product-categories");
	const subCategory = document.getElementById("product-subject");
	const author = document.getElementById("product-author");
	const language = document.getElementById("product-language");
	const page = document.getElementById("product-page");
	const py = document.getElementById("product-py");
	const description = document.getElementById("description");
	const id = document.getElementById("product-id");
	const quantity = document.getElementById("product-stock");
	const price = document.getElementById("product-price");

	/*Check số không được âm*/
	checkNegative(page, "Số trang");
	checkNegative(py, "Năm xuất bản");
	checkNegative(id, "ID sản phẩm");
	checkNegative(quantity, "Số lượng");
	checkNegative(category, "Id loại");
	checkNegative(subCategory, "Id chủ đề");
	checkNegative(price, "Giá");
	
	/*check số không được là số thập phân trừ giá tiền*/
	checkNegative(page, "Số trang");
	checkNegative(py, "Năm xuất bản");
	checkNegative(id, "ID sản phẩm");
	checkNegative(quantity, "Số lượng");
	checkNegative(category, "Id loại");
	checkNegative(subCategory, "Id chủ đề");
	
	// tạo form data dễ sử lý dữ liệu
	const formData = new FormData();
	formData.append("name", name.value);
	formData.append("category", category.value);
	formData.append("subject", subCategory.value);
	formData.append("author", author.value);
	formData.append("language", language.value);
	formData.append("description", description.value);
	formData.append("page", parseInt(page.value));
	formData.append("py", parseInt(py.value));
	formData.append("id", parseInt(id.value));
	formData.append("quantity", parseInt(quantity.value));
	formData.append("price", parseFloat(price.value));

	// Thêm tệp ảnh vào FormData
	formData.append("image", file.files[0]);  // file.files[0] là tệp ảnh*/

	axios.post('../api/edit', formData,
		{
			headers: {
				"Content-Type": "multipart/form-data"
			}
		})
		.then(response =>{
			if (response.data.status === 'success') {
			        toastr.success(response.data.message, "Thông báo");
			    } else {
			        toastr.warning(response.data.message, "Thông báo");
			    }
			
		})
		.catch(error => alert('lỗi!'))

}
function checkNegative(input, fieldName) {
	input.addEventListener('input', function(event) {
		const value = parseFloat(this.value); // Dùng parseFloat để hỗ trợ số thập phân
		if (!isNaN(value) && value < 0) {
			alert(`${fieldName} không được là số âm!`);
			return;
		}
	});
}
function checkDecimal(input, fieldName) {
	input.addEventListener('input', function(event) {
		if (this.value.includes('.') || this.value.includes(',')) {
			alert(`${fieldName} không được chứa số thập phân!`);
			return;
		}
	});
}


document.addEventListener("DOMContentLoaded", function() {
	const selectElement = document.getElementById("product-categories");
	selectElement.addEventListener("change", function() {
		const selectedCategoryId = this.value;
		axios.get('../api/getSubCategory', {
			params: {
				categoryId: selectedCategoryId
			}
		})
			.then(resource => {
				updateSubject(resource.data.data);
				
			})
			.catch((error) => {
				console.log(error)
			})
	});
});

function updateSubject(subCategories) {
	
	// Làm sạch các option cũ
	subject.innerHTML = '';
	// Thêm các option từ dữ liệu trả về
	subCategories.forEach(item => {
		const option = document.createElement('option');
		option.value = item.id;
		option.text = item.name;
		subject.appendChild(option);
	});
}

