$.ajax({
  url: '/admin/home/pie',
  method: 'GET',
  success: response => {
    var ctx = document.getElementById('pie-chart').getContext('2d');
    let dChart = new Chart(ctx, {
      type: 'pie',
      // type: 'doughnut',
      data: {
        labels: ['android', 'iPhone'],
        datasets: [{
          data: [response['android'], response['iPhone']],
          backgroundColor: ['#78c257', '#36a2eb']
        }]
      }
    });
  }
});