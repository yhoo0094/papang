<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
    $(function() {
    var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	$('#year').val(year);
	$('#month').val(month);
	
	monthSelect();
	ajax3();
 	$('#pwbtn').on('click',function(){
 		if($('#pw').val() !='' && $('#pw').val() !=null){
 		if($('#pw_hidden').val()==$('#pw').val()){
 			alert('비밀번호 확인 됬습니다.');
 		}else{
 			alert('비밀번호 틀렸습니다.');
 			$('#pw').focus();
 		}
 		}else{
 			alert('비밀번호 입력해주세요.');
 			$('#pw').focus();
 		}
 	});
	     
	
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
	
	$('#year2').val(year);
	$('#month2').val(month);
	
	if($('#month2').val()*1<10){
		var date7 = $('#year2').val().substring(2,4)+'/0'+$('#month2').val();
		ajax2(date7);
		}else{
			var date8 = $('#year2').val().substring(2,4)+'/'+$('#month2').val();
			ajax2(date8);
		}
	
	$('#next2').on('click',function(){
		if($('#month2').val()*1 == 12){
			$('#year2').val($('#year2').val()*1+1);
			$('#month2').val('01');
			
			var date1 = $('#year').val().substring(2,4)+'/'+$('#month2').val();
			ajax2(date1);
			
		}else{
			$('#month2').val($('#month2').val()*1+1);
			if($('#month2').val()*1<10){
			var date2 = $('#year2').val().substring(2,4)+'/0'+$('#month2').val();
			ajax2(date2);
			}else{
				var date3 = $('#year2').val().substring(2,4)+'/'+$('#month2').val();
				ajax2(date3);
			}
			
		} 
		
		
	});
	
	$('#prev2').on('click',function(){
		if($('#month2').val()*1 == 1){
			$('#year2').val($('#year2').val()*1-1);
			$('#month2').val(12);
			var date4 = $('#year2').val().substring(2,4)+'/'+$('#month2').val();
			ajax2(date4);
		}else{
			$('#month2').val($('#month2').val()*1-1);
			if($('#month2').val()*1<10){
				var date5 = $('#year2').val().substring(2,4)+'/0'+$('#month2').val();
				ajax2(date5);
				}else{
					var date6 = $('#year2').val().substring(2,4)+'/'+$('#month2').val();
					ajax2(date6);
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
	
	$("#dataTable tbody").empty();
	$.each(data,function(idx, item) {
						$('<tr>')
					    .append($('<td>').html(item.SIT_MBR_ID))
						.append($('<td>').html(item.SRV_DATE))
						.append($('<td>').html(item.MBR_BANK))
						.append($('<td>').html(item.MBR_ACCOUNT))
						.append($('<td>').html(comma(item.SRV_PAY)))
						.append($('<td>').html(comma(item.COMPANY)))
						.append($('<td>').html(
						'<button id=\'btnSelect\' class=\'buttonclass\'>조회</button>'))
				        .appendTo('#dataTable tbody');
					});

	$('#dataTable').DataTable();
	
}


function ajax2(date){
	
	$.ajax({
		url : '../resultmonthpayone',
		type : 'GET',
		//contentType:'application/json;charset=utf-8',
		dataType : 'json',
		data : {
			monthsitter : date
		},
		error : function(xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success : resultmonthpayoneselect
	});
}


function resultmonthpayoneselect(data){
	console.log('*******************');
	console.log(data);

	$("#dataTable2 tbody").empty();
	$.each(data,function(idx, item) {
						$('<tr>')
					    .append($('<td>').html(item.SIT_MBR_ID))
						.append($('<td>').html(item.SRV_DATE))
						.append($('<td>').html(item.MBR_BANK))
						.append($('<td>').html(item.MBR_ACCOUNT))
						.append($('<td>').html(comma(item.SRV_PAY)))
						.append($('<td>').html(comma(item.COMPANY)))
						.append($('<td>').html(comma(item.MONTH_DATE)))
				        .appendTo('#dataTable2 tbody');
					});

	$('#dataTable2').DataTable(); 
	
}
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//사용자 조회 요청
function monthSelect() {
	//조회 버튼 클릭
	$('body').on('click', '#btnSelect', function() {
		var sit_mbr_id = $(this).parent().parent().children().eq(0).html();
	
		console.log(sit_mbr_id);
		//특정 사용자 조회
		$.ajax({
			url : '../monthpayone/' + sit_mbr_id,
			type : 'GET',
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : monthSelectResult
		}); 
	}); //조회 버튼 클릭
}//nqSelect
 function monthSelectResult(month) {
	console.log(month[0]);
	$('#sit_mbr_id').val(month[0].SIT_MBR_ID);
	$('#mbr_bank').val(month[0].MBR_BANK);
	$('#mbr_account').val(month[0].MBR_ACCOUNT);
	$('#srv_pay').val(month[0].SRV_PAY);
	$('#srv_pay2').val(comma(month[0].SRV_PAY));
	
} 


 function formCheck() {
     var f = document.frm;
     if (f.product_name.value == "") {
        alert("상품명을 입력하세요");
        f.product_name.focus();
        return false;
     }
     return true;
     alert("상품등록이 완료되었습니다");
  }
 
	function monthinsert(){
		//등록 버튼 클릭
		var id =$("#sit_mbr_id").val();
		var pay =$("#srv_pay").val();
		if($('#pw').val() !='' && $('#pw').val() !=null){
	 		if($('#pw_hidden').val()==$('#pw').val()){
	 			alert('비밀번호 확인 됬습니다.');
	 			$.ajax({ 
				    url: "../monthinsert",  
				    type: 'POST',  
				    dataType: 'json', 
				    data: JSON.stringify({ sit_mbr_id: id,srv_pay: pay}),
				    //data :$("#form1").serialize(),
				    contentType: 'application/json', 
				    success: function(response) {
				    	if(response.sit_mbr_id != null) {
				    		alert("입금 되었습니다.");
				    		ajax3();
				    		if($('#month2').val()*1<10){
				    			var date7 = $('#year2').val().substring(2,4)+'/0'+$('#month2').val();
				    			ajax2(date7);
				    			}else{
				    				var date8 = $('#year2').val().substring(2,4)+'/'+$('#month2').val();
				    				ajax2(date8);
				    			}
				    		$('#form1').each(function() {
								this.reset();
							});
				    		return true;
				    	}
				    }, 
				    error:function(xhr, status, message) { 
				        alert("이번달 입금내역이 있습니다.");
				    } 
				 }); 
	 		}else{
	 			alert('비밀번호 틀렸습니다.');
	 			$('#pw').focus();
	 			 return false;
	 		}
	 		}else{
	 			alert('비밀번호 입력해주세요.');
	 			$('#pw').focus();
	 			 return false;
	 		}
	 	
			 
	}//userInsert 
	function ajax3(){
		
		$.ajax({
			url : '../allsum',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data){
				$('#allsum').val(comma(data));
			}
		});
	}
</script>

  <h1 class="mt-4">시터 월급 관리</h1>
 

<form id="form1" class="form-horizontal">
	<div align="center">

		<table class="table">
			<tbody>
				<tr>
					<td align="center" rowspan="2">출금계좌번호</td>
					<td>국민 638102-04-223891</td>
					
				</tr>
				<tr>
				<td>출금 가능액 <input type=text name='allsum' id='allsum' style="border: none;color: red" readonly="readonly"></td>
				</tr>
				<tr>
					<td align="center">시터 ID</td>
					<td><input type=text name='sit_mbr_id' id='sit_mbr_id'></td>
				</tr>
				
				<tr>
					<td align="center">입금은행</td>
					<td><input type=text name='mbr_bank' id='mbr_bank'></td>
				</tr>
				
				<tr>
					<td align="center">입금계좌</td>
					<td><input type=text name='mbr_account' id='mbr_account'></td>
				</tr>

				<tr>
					<td align="center">이체금액</td>
					<td align="left"><input type=text name='srv_pay2' id='srv_pay2'><input type=hidden name='srv_pay' id='srv_pay'> 
					<button type="button" data-toggle="modal" data-target="#exampleModal1" >계산기</button></td>
				</tr>
				<tr>
					<td align="center">계좌 비밀번호</td>
					<td align="left"><input type=text name='pw' id='pw'>
					<input type="button" value="비밀번호 검사"
					id="pwbtn" />
					<input type=hidden name='pw_hidden' id='pw_hidden' value='1234'></td>
				</tr>
	
			</tbody>
		</table>
		<div align="center">
			<input type="button" class='buttonclass' value="입금"
				id="btnInsert"  onclick="return monthinsert()"/> <input type="button"
				class='buttonclass' value="초기화" id="btnInit" />

		</div>
		</div>
		</form>
		<br>
		<br>
		
		<div class="row">
	<div class="col-xl-6">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i>급여 내역
			</div>
			<div class='calenderMenu' align='center'>
					<button type='button' id='prev' class='buttonclass'><</button>
					&nbsp;&nbsp; <span class='calenderY'><input type='text'
						id='year' style="width: 50px; border: none"></span>년 <span
						class='calenderM'><input type='text' id='month'
						style="width: 30px; border: none"></span>월 &nbsp;&nbsp;
					<button type='button' id='next' class='buttonclass'>></button>
				</div>
			<div class="card-body" style="height: 400px">
				<table class="table table-bordered" id="dataTable" cellspacing="0">
					<thead>
						<tr>
							<th>시터 ID</th>
							<th>급여 달</th>
							<th>은행</th>
							<th>계좌번호</th>
							<th>월급</th>
							<th>기업 이윤</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col-xl-6">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> 출금 내역
			</div>
			<div class='calenderMenu' align='center'>
					<button type='button' id='prev2' class='buttonclass'><</button>
					&nbsp;&nbsp; <span class='calenderY'><input type='text'
						id='year2' style="width: 50px; border: none"></span>년 <span
						class='calenderM'><input type='text' id='month2'
						style="width: 30px; border: none"></span>월 &nbsp;&nbsp;
					<button type='button' id='next2' class='buttonclass'>></button>
				</div>
			<div class="card-body" style="height: 400px">
				<table class="table table-bordered" id="dataTable2" cellspacing="0">
					<thead>
						<tr>
							<th>시터 ID</th>
							<th>급여 달</th>
							<th>은행</th>
							<th>계좌 번호</th>
							<th>월급</th>
							<th>기업 이윤</th>
							<th>지급일</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- Modal 후기 리스트-->
	<div class="modal fade" id="exampleModal1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<p class="modal-title" id="exampleModalLabel">계산기</p>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<span id="reservationNumTd" style="display: none;"></span>
				</div>
				<div class="modal-body" align="center">
					<jsp:include page="calculater.jsp"></jsp:include>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->





         


