<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
    $(function() {
    var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	$('#year').val(year);
	$('#month').val(month);
	
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
	
	
	
	
});

function ajax(date){
	
	$.ajax({
		url : '../monthpay',
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
	console.log(data);
	
}


</script>

  <h1 class="mt-4">시터 월급 관리</h1>
  