window.addEventListener('DOMContentLoaded', (event) => {
	update();
	previewImage(event);
});
const links = document.querySelectorAll('.sidebar a');
const forms = document.querySelectorAll('.form-box');

links.forEach(link => {
	link.addEventListener('click', (e) => {
		e.preventDefault();
		links.forEach(l => l.classList.remove('active'));
		forms.forEach(f => f.classList.remove('active'));
		link.classList.add('active');
		const formId = link.getAttribute('data-form');
		document.getElementById(formId).classList.add('active');
	});
});

function previewImage(event) {
	const file = event.target.files[0];
	const reader = new FileReader();
	reader.onload = function(e) {
		const imgElement = document.getElementById('profile-image');
		imgElement.src = e.target.result;
	};
	if (file) {
		reader.readAsDataURL(file);
	}
}
//Hàm để thay đổi type của input và cập nhật icon
function togglePasswordVisibility(inputId) {
	const passwordField = document.getElementById(inputId);
	const icon = document.getElementById(inputId + '-icon');

	if (passwordField.type === 'password') {
		passwordField.type = 'text';
		icon.classList.remove('bi-eye-slash');
		icon.classList.add('bi-eye');
	} else {
		passwordField.type = 'password';
		icon.classList.remove('bi-eye');
		icon.classList.add('bi-eye-slash');
	}
}
function update(){
    let form = document.getElementById('details-form');
    form.addEventListener("submit", (event) => {
        event.preventDefault(); // Ngăn form tự động gửi GET

        const formData = new FormData(form);

        axios.post('/BOOK_STORE/upload', formData, {
            headers: {
                "Content-Type": "multipart/form-data"
            }
        })
        .then(response => {
            if (response.data.status === 'success') {
                toastr.success(response.data.message, "Thông báo");
            } else {
                toastr.warning(response.data.message, "Thông báo");
            }
        })
        .catch(error => {
            alert('lỗi!');
        });
    });
}

/**
 * 
 */