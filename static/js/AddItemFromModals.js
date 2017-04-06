$(document).ready(function() {
    $(".add").on("click", function(evt) {
        var publicId = $(this).data("id");
        $("#public-id").val(publicId);
        $("#add-private-item").modal("show");
    });
    $("#public-item-modal").on("submit", function(evt) {
        evt.preventDefault();
        var listTitle = $("#list-title").val();
        var listId = $("#list-id").val();
        var id = $("#public-id").val();
        $.post("/add-item/public", {"title": listTitle, "id": id, "list_id": listId},
            function() {$("#add-private-item").modal("hide");
            });
        });
});

// var listId = $(this).data("list")
// $("#list-id").val()