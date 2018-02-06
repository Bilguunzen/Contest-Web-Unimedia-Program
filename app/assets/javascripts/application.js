// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require Chart.bundle
//= require chartkick


// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
google.charts.setOnLoadCallback(drawChart1);
// Draw the chart and set the chart values
function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Language', 'Number'],
  ["C++", parseInt("<%=Submission.where(language: 'GNU G++ 14 6.4.0').size %>")],
  ['0', 0],
  ['0', 0],
  ['0', 0],
  ['0', 0],
  ['0', 0],
  ['Ruby', parseInt("<%=Submission.where.not(language: 'GNU G++ 14 6.4.0').size %>")]
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'Languages', 'width':550, 'height':400};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}

function drawChart1() {
  var data = google.visualization.arrayToDataTable([
  ['Status', 'Number'],
  ['0', 0],
  ['Error', parseInt("<%=Submission.where.not(status: 'Runned').size %>")],
  ['0', 0],
  ["Runned", parseInt("<%=Submission.where(status: 'Runned').size %>")]
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'Submission Status', 'width':550, 'height':400};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart1'));
  chart.draw(data, options);
}

google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

  var data = new google.visualization.DataTable();
  data.addColumn('number', 'X');
  data.addColumn('number', 'Users');

  data.addRows([
    [0, 0],   [1, 10],  [2, 23],  [3, 17],  [4, 18],  [5, 9],
    [6, 11],  [7, 27],  [8, 33],  [9, 40],  [10, 32], [11, 35],
    [12, 30], [13, 40], [14, 42], [15, 47], [16, 44], [17, 48],
    [18, 52], [19, 54], [20, 42], [21, 55], [22, 56], [23, 57],
    [24, 60], [25, 50], [26, 52], [27, 51], [28, 49], [29, 53],
    [30, 55], [31, 60], [32, 61], [33, 59], [34, 62], [35, 65],
    [36, 62], [37, 58], [38, 55], [39, 61], [40, 64], [41, 65],
    [42, 63], [43, 66], [44, 67], [45, 69], [46, 69], [47, 70],
    [48, 72], [49, 68], [50, 66], [51, 65], [52, 67], [53, 70],
    [54, 71], [55, 72], [56, 73], [57, 75], [58, 70], [59, 68],
    [60, 64], [61, 60], [62, 65], [63, 67], [64, 68], [65, 69],
    [66, 70], [67, 72], [68, 75], [69, 80]
  ]);

  var options = {
    hAxis: {
      title: 'Time by days'
    },
    vAxis: {
      title: 'Active Users'
    }
  };

  var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

  chart.draw(data, options);
}