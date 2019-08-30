function drawGraph(id, appName) {
    let url = (!id) ? `/admin/analytics/api/userCount` : `/admin/analytics/api/userCount?app=${id}`;
    appName = (!appName) ? 'Applications' : appName;
    $.ajax({
        url: url,
        method: 'GET',
        success: res => { 
            var ctx = document.getElementById('chart1').getContext('2d');
            ctx.canvas.width = 1000;
            ctx.canvas.height = 300;

            let formattedData = [];

            for(let i = 0;i < res.length; i++) {
                let mDate = moment(res[i]['date'], 'YYYY-MM-DD');
                formattedData.push({ x: mDate, y: res[i]['count'] });
            }

            window.chartColors = {"red":"rgb(78,115,223)","orange":"rgb(255, 159, 64)","yellow":"rgb(255, 205, 86)","green":"rgb(75, 192, 192)","blue":"rgb(54, 162, 235)","purple":"rgb(153, 102, 255)","grey":"rgb(201, 203, 207)"};

            var color = Chart.helpers.color;
            var cfg = {
                type: 'line',
                data: {
                    datasets: [{
                        label:  `Use Count / App / Day (${appName})`,
                        backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
                        borderColor: window.chartColors.red,
                        data: formattedData,
                        type: 'line',
                        fill: false,
                        lineTension: 0,
                        borderWidth: 2
                    }]
                },
                options: {
                    scales: {
                        xAxes: [{
                            type: 'time',
                            distribution: 'series',
                            ticks: {
                                source: 'data',
                                autoSkip: true
                            }
                        }],
                        yAxes: [{
                            scaleLabel: {
                                display: true,
                                labelString: 'User Count'
                            },
                            ticks: {
                                beginAtZero: true,
                                stepSize: 1
                            }
                        }]
                    },
                    tooltips: {
                        intersect: false,
                        mode: 'index',
                        callbacks: {
                            label: function(tooltipItem, myData) {
                                var label = myData.datasets[tooltipItem.datasetIndex].label || '';
                                if (label) {
                                    label += ': ';
                                }
                                label += tooltipItem.yLabel;
                                return label;
                            }
                        }
                    }
                }
            };

            var chart = new Chart(ctx, cfg);
        },
        error: err => { console.log(err); }
    });
}

$(document).ready(function() {
    let appSelect = document.getElementById('applicationSelect');
    appSelect.addEventListener('change', event => {
        let appId = appSelect.options[appSelect.selectedIndex].value;
        let appName = appSelect.options[appSelect.selectedIndex].text;
        drawGraph(appId, appName)
    });

    drawGraph(null, null);
});
