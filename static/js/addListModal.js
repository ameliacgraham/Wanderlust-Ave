$(document).ready(function() {
    $("#create-new-list-button").on("click", function(evt) {
        $("#add-bucket-list").modal("show");
    });
    $("#list-modal").on("submit", function(evt) {
        evt.preventDefault();
        var listTitle = $("#list-title").val();
        var email = $("#email").val();
        $.post("/my-lists", {"title": listTitle, "email": email},
            function(response) {
              if (response === "List Added") {
                $("#add-bucket-list").modal("hide");
              } else if (response === "Please choose a title for your list") {
                console.log("Title can not be empty");
              }
                else {
                console.log("You already have a list with that title");
                }
            });
        });
});
