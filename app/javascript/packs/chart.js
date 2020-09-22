$(function () {
  var histories = gon.change_histories;
  console.log(histories);

  var ctx = document.getElementById("player_chart").getContext("2d");
  var chart = new Chart(ctx, {
    type: "line",

    data: {
      labels: [
        "9/1",
        "",
        "",
        "",
        "",
        "",
        "",
        "9/8",
        "",
        "",
        "",
        "",
        "",
        "",
        "9/15",
        "",
        "",
        "",
        "",
        "",
        "",
        "9/22",
        "",
        "",
        "",
        "",
        "",
        "",
        "9/29",
      ],
      datasets: [
        {
          label: "My First dataset",
          backgroundColor: "rgba(56, 66, 60, 1)",
          borderColor: "rgba(5, 255, 0, 1)",
          data: [
            0,
            10,
            5,
            2,
            20,
            30,
            45,
            0,
            10,
            5,
            2,
            20,
            30,
            45,
            0,
            10,
            5,
            2,
            20,
            30,
            45,
            0,
            10,
            5,
            2,
            20,
            30,
            45,
            10,
          ],
        },
      ],
    },

    options: {
      maintainAspectRatio: false,
      legend: {
        display: false,
      },
      scales: {
        yAxes: [
          {
            position: "right",
            ticks: {
              fontColor: "white",
              fontSize: 10,
            },
          },
        ],
        xAxes: [
          {
            ticks: {
              fontColor: "white",
              fontSize: 10,
            },
          },
        ],
      },
      layout: {
        padding: {
          left: 20,
          right: 10,
          top: 20,
          bottom: 10,
        },
      },
    },
  });
});
