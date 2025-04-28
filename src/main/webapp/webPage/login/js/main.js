(function($) {

    $(".toggle-password").click(function() {

        $(this).toggleClass("zmdi-eye zmdi-eye-off");
        var input = $($(this).attr("toggle"));
        if (input.attr("type") == "text") {
          input.attr("type", "password");
        } else {
          input.attr("type", "text");
        }
      });
	  window.addEventListener('DOMContentLoaded', () => {
	      showServerMessage();
	  });
})(jQuery);


function showServerMessage() {
    const messageInput = document.getElementById('server-message');
    if (messageInput) {
        const message = messageInput.value;
        const type = messageInput.dataset.type;
        
        if (type === "success") {
            toastr.success(message, "Thông báo");
        } else if (type === "error") {
            toastr.warning(message, "Thông báo");
        }
    }
}