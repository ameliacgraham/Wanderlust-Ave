$(document).ready(function() {
    $("#register-button").on("click", function(evt) {
        $("#registration-modal").modal("show");
    });
    $("#register-submit").on("submit", function(evt) {
        evt.preventDefault();
        var email = $("#email").val();
        var password = $("#password").val();
        var firstName = $("#first-name").val();
        var lastName = $("#last-name").val();
        var username = $("#username").val();
        $.post("/register", {"email": email, "password": password, "first_name": firstName,
                          "last_name": lastName, "username": username},
            function() {$("#registraton-modal").modal("hide");
            });
        });
});
