const { default: axios } = require("axios");

/**
 * 
 */
const form = document.getElementById('myAwesomeDropzone');
form.addEventListener("submit", (event) => update(event));
function update(event) {
	event.preventDefault();
	const file = document.getElementById("file")
	const name = document.getElementById("product-name");
	const category = document.getElementById("product-categories");
	const author = document.getElementById("product-author");
	const language = document.getElementById("product-language");
	const page = document.getElementById("product-page");
	const py = document.getElementById("product-py");
	const description = document.getElementById("description");
	const id = document.getElementById("product-id");
	const quantity = document.getElementById("product-stock");
	const price = document.getElementById("product-price");

	checkNegative(page, "Số trang");
	checkNegative(py, "Năm xuất bản");
	checkNegative(id, "ID sản phẩm");
	checkNegative(quantity, "Số lượng");
	checkNegative(price, "Giá");

	const data = new FormData();
	formData.append("name", name.value);
	formData.append("category", category.value);
	formData.append("author", author.value);
	formData.append("language", language.value);
	formData.append("description", description.value);
	formData.append("page", parseInt(page.value));
	formData.append("py", parseInt(py.value));
	formData.append("id", parseInt(id.value));
	formData.append("quantity", parseInt(quantity.value));
	formData.append("price", parseFloat(price.value));

	// Thêm tệp ảnh vào FormData
	formData.append("image", file.files[0]);  // file.files[0] là tệp ảnh

	axios.post('/api/edit', data,
		{
			headers: {
				"Content-Type": "multipart/form-data"
			}
		})
		.then(resource => alert('Thành công'))
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