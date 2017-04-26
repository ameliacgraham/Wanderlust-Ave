$(document).ready(function() {
    $("#login-button-modal").on("click", function(evt) {
        $("#login-modal").modal("show");
    });
    $("#login-submit").on("submit", function(evt) {
        evt.preventDefault();
        var email = $("#email").val();
        var password = $("#password").val();
        $.post("/login", {"email": email, "password": password},
            function() {$("#login-modal").modal("hide");
            window.location.assign("/");
            });
        });
});


