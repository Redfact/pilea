new Chart(document.getElementById("mixed-chart"), {
  type: 'bar',
  data: {
    labels: ["Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Août","Septembre","Octobre","Novembre","Décembre"],
    datasets: [{
        label: "Prix",
        type: "line",
        borderColor: "#48bb78",
        data: [<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>],
        fill: false
      }, {
        label: "Volume",
        type: "bar",
        backgroundColor: "rgba(0,0,0,0.2)",
        backgroundColorHover: "#3e95cd",
        data: [<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>,<%= rand(1000) %>]
      }
    ]
  },
  options: {
    title: { display: false },
    legend: { display: false }
  }
})