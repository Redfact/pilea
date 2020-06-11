new Chart(document.getElementById("line-chart-ethereum"), {
  type: 'line',
  data: {
    labels: ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"],
    datasets: [{
        label: "Prix",
        borderColor: "#48bb78",
        data: [<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>],
        fill: false
      }
    ]
  },
  options: {
    title: { display: false },
    legend: { display: false },
    scales: {
        xAxes: [{
          display: true,
          ticks: {
            callback: function(dataLabel) {
              return null;
            }
          }
        }],
        yAxes: [{
            display: true,
            ticks: {
            callback: function(dataLabel) {
              return null;
            }
          }
        }]
      }
  }
});