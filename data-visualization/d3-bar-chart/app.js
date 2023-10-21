const container_id = document.getElementById("container");
const container_width = parseInt(
  window.getComputedStyle(container_id).getPropertyValue("width").replace("px", "")
);
const container_height = parseInt(
  window.getComputedStyle(container_id).getPropertyValue("height").replace("px", "")
);
const padding = 25;

fetch("https://raw.githubusercontent.com/freeCodeCamp/ProjectReferenceData/master/GDP-data.json")
  .then((response) => response.json())
  .then((data) => {
    const xScale = d3
      .scaleTime() // Use a time scale for dates
      .domain([
        new Date(data.data[0][0]), // Start date
        new Date(data.data[data.data.length - 1][0]) // End date
      ])
      .range([0, container_width - padding - 15]);

    const yScale = d3
      .scaleLinear()
      .domain([
        d3.min(data.data, (d) => d[1]),
        d3.max(data.data, (d) => d[1]),
      ])
      .nice()
      .range([container_height, 0]);

    const svg = d3
      .select("#container")
      .append("svg")
      .attr("width", container_width)
      .attr("height", container_height);

    svg
      .selectAll("rect")
      .data(data.data)
      .enter()
      .append("rect")
      .attr("x", (d, i) => xScale(new Date(d[0])) + padding + 15)
      .attr("y", (d, i) => yScale(d[1]) - padding)
      .attr("width", 2)
      .attr("height", (d) => container_height - yScale(d[1]));

    // Append a group for the x-axis and position it at the bottom
    svg
      .append("g")
      .attr("transform", `translate(40, ${container_height - padding})`)
      .call(d3.axisBottom(xScale)
        .ticks(d3.timeYear.every(5)) // Display ticks every 5 years
        .tickFormat(d3.timeFormat("%Y"))); // Format tick values as years

    // Append a group for the left-side y-axis
    svg
      .append("g")
      .attr("transform", `translate(${padding + 15}, -25)`)
      .call(d3.axisLeft(yScale));
  })
  .catch((error) => {
    console.log(error);
  });
