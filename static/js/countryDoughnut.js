createCountries()
function createCountries() {

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
    .value(function(d) { return d.num_of_items; });

var svg = d3.select("body").append("svg")
    .attr("width", 0)
    .attr("height", 0)
    .attr("id", "country-svg")
  .append("g")
    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

d3.json("/country-tallies.json", function(error, data) {
  if (error) throw error;
  console.log(data);
  // $("#max-country").append(data.max_country[0])
  $("#max-country-info #max-country").append(data.max_country[0]);

  // var mostItems = Object.keys(data).reduce(function(a, b){ return data[a] > data[b] ? a : b });
  // console.log(mostItems);

  var g = svg.selectAll(".arc")
      .data(pie(data.countries))
    .enter().append("g")
      .attr("class", "arc");

  g.append("path")
      .attr("d", arc)
      .attr("id", function(d) {return d.data.country})
      .attr("class", "country-arc")
      .style("fill", function(d) { console.log(d.data.country); return color(d.data.country); })
      .on("click", function(d) {
            var country = d.data.country;
            console.log(country);
            $("#country-name-user").val(country);
            // console.log($("#country-name").val());
            $("#country-user-items-form").submit();
            });;


 var logo = g.append("circle")
        .attr("cx", 2)
        .attr("cy", 3)
        .attr("r", radius - 62 )
        .style("fill", "url(#globe-doughnut)");

  g.append("text")
      .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
      .attr("dy", ".35em")
      .text(function(d) { return d.data.country; });
    });

function type(d) {
  d.num_of_items = +d.num_of_items;
  return d;
}
}