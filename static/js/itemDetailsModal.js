$(document).ready(function() {
    $(".private-item").on("click", function(evt) {
        var title = $(this).data("title");
        var lat = $(this).data("lat");
        var lon = $(this).data("lon");
        var id = $(this).data("id");
        var tour = $(this).data("tour")
        var complete = $(this).data("complete")
        var country = $(this).data("country")
        var address = $(this).data("address")
        var image = $(this).data("image");
        var listId = $(this).data("listid");

        $("#details").html(function() {
            $("#address-details").text("Address: ");
            $("#edit-address-details").text("Address: ")
            $("#title-details").text("");
            $("#edit-title-details").text("");
            $("#tour-link-details").text("");
            $("#edit-tour-link-details").text("");
            $("#completed").text("");
            $("#edit-checked-off-details").val("");
        })

        $("#details").html(function() {
            $("#address-details").append(address);
            $("#edit-address-details").append(address);
            $("#title-details").append(title);
            $("#edit-title-details").append(title);
            $("#edit-tour-link-details").val(tour);
            $("#completed").append(complete);
            $("#image-details").attr("src",image);
            $("#edit-image-details").attr("src",image);
        });
        $("#private-item-details").modal("show");
        $("#edit-button").on("click", function(evt) {
            $("#item-details").hide();
            $("#edit-item-details").show();
        });
        $("#save-button").on("click", function(evt) {
            evt.preventDefault();
            $("#edit-item-id").val(id);
            $("#edit-details-form").submit();
            $("#edit-item-details").hide();
            $("#item-details").show();

        $("#private-item-details").on("hidden.bs.modal", function(){
            $("#edit-item-details").hide();
            $("#item-details").show();
            });
        })
        $("#delete-button").on("click", function(evt) {
            evt.preventDefault();
            $("#item-id").val(id);
            $("#delete-form").submit();
        })
    });
});

