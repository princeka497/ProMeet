<%@ page import="java.util.*" %>
<%@ page import="promeet_web.dao.AdminDao" %>


<style>
#monthlyChart {
  max-width: 400px;
  min-height: 350px;
  margin:20px;
  background-color: cyan;
}
</style>

<%
    AdminDao dao1 = new AdminDao();
    LinkedHashMap<String, Integer> yearMonthMap = dao1.getMonthlyContactCounts();

    String labels = "";
    String values = "";

    for (Map.Entry<String, Integer> entry : yearMonthMap.entrySet()) {
        labels += "'" + entry.getKey() + "',";   // e.g., '2025-01'
        values += entry.getValue() + ",";
    }

    // Remove trailing commas
    if (!labels.isEmpty()) labels = labels.substring(0, labels.length() - 1);
    if (!values.isEmpty()) values = values.substring(0, values.length() - 1);
%>



<div style="width: 100%; overflow-x: auto;">
    <canvas id="monthlyChart"></canvas>
</div>








<script>
window.addEventListener('load', function () {
    const ctx1 = document.getElementById('monthlyChart').getContext('2d');
    new Chart(ctx1, {
        type: 'bar',
        data: {
            labels: [<%= labels %>],
            datasets: [{
                label: 'Contacts per Month',
                data: [<%= values %>],
                backgroundColor: 'rgba(54, 162, 235, 0.6)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1,
                maxBarThickness: 50
            }]
        },
        options: {
            scales: {
                x: {
                    categoryPercentage: 1.0,
                    barPercentage: 0.4
                },
                y: {
                    beginAtZero: true,
                    max: 10,
                    ticks: {
                        stepSize: 0.5
                    }
                }
            }
        }
    });
});

</script>