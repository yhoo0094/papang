<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>  
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>  
<script type="text/javascript">
window.onload = function() {
    var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	$('#year').val(year);
	$('#month').val(month);
	ajax2();
	if($('#month').val()*1<10){
		var date7 = $('#year').val().substring(2,4)+'/0'+$('#month').val();
		ajax(date7);
		}else{
			var date8 = $('#year').val().substring(2,4)+'/'+$('#month').val();
			ajax(date8);
		}
	
	$('#next').on('click',function(){
		if($('#month').val()*1 == 12){
			$('#year').val($('#year').val()*1+1);
			$('#month').val('01');
			
			var date1 = $('#year').val().substring(2,4)+'/'+$('#month').val();
			ajax(date1);
			
		}else{
			$('#month').val($('#month').val()*1+1);
			if($('#month').val()*1<10){
			var date2 = $('#year').val().substring(2,4)+'/0'+$('#month').val();
			ajax(date2);
			}else{
				var date3 = $('#year').val().substring(2,4)+'/'+$('#month').val();
				ajax(date3);
			}
			
		} 
		
		
	});
	
	$('#prev').on('click',function(){
		if($('#month').val()*1 == 1){
			$('#year').val($('#year').val()*1-1);
			$('#month').val(12);
			var date4 = $('#year').val().substring(2,4)+'/'+$('#month').val();
			ajax(date4);
		}else{
			$('#month').val($('#month').val()*1-1);
			if($('#month').val()*1<10){
				var date5 = $('#year').val().substring(2,4)+'/0'+$('#month').val();
				ajax(date5);
				}else{
					var date6 = $('#year').val().substring(2,4)+'/'+$('#month').val();
					ajax(date6);
				}
		} 
		
		
	});
	
	
	
	
}

function ajax(date){
	
	$.ajax({
		url : '../sitterinfoselect',
		type : 'GET',
		//contentType:'application/json;charset=utf-8',
		dataType : 'json',
		data : {
			monthsitter : date
		},
		error : function(xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success : sitterinfoselect
	});
}


function sitterinfoselect(data){
	
	$("#chartContainer").CanvasJSChart({ 
		title: { 
			text: "시터 매출 현황",
			fontSize: 24
		}, 
		axisY: { 
			title: "" 
		}, 
		data: [ 
		{ 
			type: "bar", 
			toolTipContent: "{label}: {y} 원", 
			dataPoints: data
		} 
		] 
	});
}

function ajax2(){
	
	$.ajax({
		url : '../sitterinfoselect2',
		type : 'GET',
		//contentType:'application/json;charset=utf-8',
		dataType : 'json',
		error : function(xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success : sitterinfoselect2Result
	});
}

function sitterinfoselect2Result(data) {

	$("#dataTable tbody").empty();
	$.each(data, function(idx, item) {
		$('<tr>')
		.append($('<td>').html(item.sit_mbr_id))
		.append($('<td>').html(item.srv_date))
		.append($('<td>').html(comma(item.srv_pay)))
				.appendTo('#dataTable tbody');
	});

	$('#dataTable').DataTable();
}

</script>   
  <h1 class="mt-4">시터 월별 매출 현황</h1>
  <div class='calenderMenu' align = 'center'>
  <button type='button' id='prev' class='buttonclass'><</button>&nbsp;&nbsp;
  <span class='calenderY'><input type='text' id='year' style="width:50px; border: none"></span>년 <span class='calenderM'><input type='text' id='month' style="width:30px; border: none"></span>월
  &nbsp;&nbsp;<button type='button' id='next' class='buttonclass'>></button>
  </div>
  <br>
  <div id="chartContainer" style="width: 100%; height: 300px"></div>
  <br>
  <bt>
  <div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 시터 일별 매출 현황
	</div>
	<div class="card-body">

		<div class="table-responsive">

			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>시터 아이디</th>
						<th>돌봄 일자</th>
						<th>돌봄 금액</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
</div>
  
  