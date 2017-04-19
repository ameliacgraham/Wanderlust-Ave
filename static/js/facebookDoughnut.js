createFriends()
function createFriends(){

var width = 960,
    height = 500,
    radius = Math.min(width, height) / 2;

var color = d3.scale.ordinal()
    .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#7a9cdd", "#7abfdd", "#7addc6"]);

var arc = d3.svg.arc()
    .outerRadius(radius - 10)
    .innerRadius(radius - 70);

var pie = d3.layout.pie()
    .sort(null)
    .value(function(d) { return d.common_items; });

var svg = d3.select("body").append("svg")
    .attr("width", 0)
    .attr("height", 0)
    .attr("id", "friend-svg")
  .append("g")
    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

d3.json("/friend-tallies.json", function(error, data) {
  if (error) throw error;
  $("#max-friend-info #max-friend").append(data.max_friend[0]);

  var g = svg.selectAll(".arc")
      .data(pie(data.items_tally))
    .enter().append("g")
      .attr("class", "arc");

  g.append("path")
      .attr("d", arc)
      .attr("id", function(d) {return d.data.name})
      .attr("data-fbid", function(d) {return d.data.id})
      .attr("class", "country-arc")
      .style("fill", function(d) { console.log(d.data.name); return color(d.data.name); })
      .on("click", function(d) {
            var friend = d.data.id;
            console.log(friend);
            $("#facebook-id").attr("action", "/profile/" + friend)
            $("#friend-email").val(friend);
            // console.log($("#country-name").val());
            $("#facebook-email-form").submit();
            });


 var logo = g.append("circle")
        .attr("cx", 2)
        .attr("cy", 3)
        .attr("r", radius - 62 )
        .style("fill", "url(#globe-facebook)");

  g.append("text")
      .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
      .attr("dy", ".35em")
      .text(function(d) { return d.data.name; });
});

function type(d) {
  d.common_items = +d.common_items;
  return d;
}
}