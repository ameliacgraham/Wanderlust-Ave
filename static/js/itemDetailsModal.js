$(document).ready(function() {
    $(".private-item").on("click", function(evt) {
        var title = $(this).data("title");
        var lat = $(this).data("lat");
        var lon = $(this).data("lon");
        var id = $(this).data("id");
        var tour = $(this).data("tour")
        var complete = $(this).data("complete");
        $("#details").html(function() {
        return "<p>" + title + "<br><br>Latitude: " + lat + "<br>Longitude: " +
         lon + "<br>Tour Link: " + tour + "<br><br><input type='submit' id='edit-button' value='Edit Item'></p>";
        });
        $("#private-item-details").modal("show");
    });
//     $("#edit-button").submit(function(evt) {
//         evt.preventDefault();
//         $("private-item-details").modal("hide");
//         });
});

