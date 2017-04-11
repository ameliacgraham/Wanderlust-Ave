$(document).ready(function() {
    $("#login-button").on("click", function(evt) {
        $("#login-modal").modal("show");
    });
    $("#login-submit").on("submit", function(evt) {
        evt.preventDefault();
        var email = $("#email").val();
        var password = $("#password").val();
        $.post("/login", {"email": email, "password": password},
            function() {$("#add-private-item").modal("hide");
            });
        });
});
