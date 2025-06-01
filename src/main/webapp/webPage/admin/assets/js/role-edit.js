
document.getElementById("form").addEventListener("submit", function(e) {
	e.preventDefault(); // ngăn form gửi đi nếu cần xử lý bằng JS

	const checkedValues = [];
	const checkboxes = this.querySelectorAll('input[type="checkbox"]');

	checkboxes.forEach(cb => {
		if (cb.checked) {
			console.log(cb.value);
			checkedValues.push(cb.value);
		}
	});

	const id = document.getElementById("userId").value;
	axios.post("/BOOK_STORE/root/grant", { permissions: checkedValues, userId: id }, {
		headers: { "Content-Type": "application/json" },
	}).then(response => {
		if (response.data.status === 'success') {
			toastr.success(response.data.message);
		} else {
			toastr.warning(response.data.message);
		}
	}).catch(error => toastr.error(error));
});
