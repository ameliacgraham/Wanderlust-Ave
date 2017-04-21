$(document).ready(function() {
    $("#create-new-list-button").on("click", function(evt) {
        $("#add-bucket-list").modal("show");
    });
    $("#list-modal").on("submit", function(evt) {
        evt.preventDefault();
        var listName = $("#list-name").val();
        var email = $("#email").val();
        $.post("/my-lists", {"title": listName, "email": email},
            function(response) {
              if (response.list_id) {
                $("#list-links").append('<li><a href="/my-lists/' + response.list_id + '">' + listName + "</a></li>")
                $("#add-bucket-list").modal("hide");
              } else if (response === "Please choose a title for your list") {
                console.log("Title can not be empty");
              }
                else {
                console.log(listName);
                console.log(response);
                console.log("You already have a list with that title");
                }
            });
        });
});