$(document).ready(function() {
    $("#create-new-item-button").on("click", function(evt) {
        var list = $(this).data("list");
        $("#list-title").val(list);
        $("#add-bucket-list-item").modal("show");
    });
    $("#private-item-form").on("submit", function(evt) {
        evt.preventDefault();
        var list = $("#list-title").val();
        var lat = $("#lat").val();
        var lon = $("#lon").val();
        var title = $("#title").val();
        var image = $("#image").val();
        var tourLink = $("#tour-link").val();
        var description = $("#description").val();

        $.post("/fileupload", image, function(result) {
            $.post("/add-item/process", {"title": title, "tour_link": tourLink, 
                                "image": result, "latitude": lat, 
                                "longitude": lon, "description": description,
                                "list": list}, function(result) {
                      if (response === "Item Added") {
                        $("#add-bucket-list-item").modal("hide");
                      } else {
                        console.log("You already have a list with that title");
                      }
            });
        });
    });
});
