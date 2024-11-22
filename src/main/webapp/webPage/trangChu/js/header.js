// JavaScript để thêm lớp scrolled vào header khi cuộn
window.addEventListener('scroll', function() {
    const header = document.querySelector('.header');
    if (window.scrollY > 50) { // Khi cuộn qua 50px
        header.classList.add('scrolled');
    } else {
        header.classList.remove('scrolled');
    }
});

document.addEventListener("DOMContentLoaded", function() {
    fetch("webPage/trangChu/js/header.js")
        .then(response => response.text())
        .then(data => {
            document.getElementById("header-placeholder").innerJSP = data;
        })
        .catch(error => console.error("Error loading header:", error));
});
