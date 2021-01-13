<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>  
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>  
<script type="text/javascript">
window.onload = function() {
	$("#chartContainer").CanvasJSChart({ 
		title: { 
			text: "시터 매출 현황",
			fontSize: 24
		}, 
		axisY: { 
			title: "Sales in billion USD" 
		}, 
		data: [ 
		{ 
			type: "bar", 
			toolTipContent: "{label}: {y} billion USD", 
			dataPoints: [ 
				{ label: "2001", y: 6   }, 
				{ label: "2002", y: 6.9 }, 
				{ label: "2003", y: 7   }, 
				{ label: "2004", y: 7.3 },
				{ label: "2005", y: 6.9 }, 
				{ label: "2006", y: 7.3 }, 
				{ label: "2007", y: 9.5 }, 
				{ label: "2008", y: 11.7}, 
				{ label: "2009", y: 10.1}, 
				{ label: "2010", y: 17.1} 
			] 
		} 
		] 
	});
}
</script>   
  <h1 class="mt-4">시터 매출 현황</h1>
  <div id="chartContainer" style="width: 100%; height: 300px"></div>
  