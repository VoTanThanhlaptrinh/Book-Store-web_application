// js/footer.js
document.addEventListener("DOMContentLoaded", function() {
    fetch("webPage/trangChu/js/footer.js")
        .then(response => response.text())
        .then(data => {
            document.getElementById("footer-placeholder").innerJSP = data;
        })
        .catch(error => console.error("Error loading footer:", error));
});
