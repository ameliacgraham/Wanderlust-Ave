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

        $("#details").html(function() {
            $("#address-details").text("Address: ");
            $("#title-details").text("");
        })

        $("#details").html(function() {
            $("#address-details").append(address);
            $("#title-details").append(title);
            $("#image-details").attr("src",image);
        });
        $("#private-item-details").modal("show");
        $("#edit-button").on("click", function(evt) {
            $("#private-item-details").modal("hide");
        });
    });
});

