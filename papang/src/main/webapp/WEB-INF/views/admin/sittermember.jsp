<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/json.min.js"></script>
<script type="text/javascript">
	$(function() {
		nqList();
		nqSelect();
		nqDelete();
		nqUpdate();

		$("#filter").on('change',function(){
			nqList();
		});
		
	});

	
	
	//사용자 삭제 요청
	function nqDelete() {
	//삭제 버튼 클릭
	$('body').on('click','#btnDelete',function(){
	var nq_no = $(this).closest('tr').find('#hidden_nq_no').val();
	var result = confirm(nq_no +" 번 글을 정말로 삭제하시겠습니까?");
	if(result) {
	$.ajax({
	url:'../nq/'+nq_no,  
	type:'DELETE',
	contentType:'application/json;charset=utf-8',
	dataType:'json',
	error:function(xhr,status,msg){
	console.log("상태값 :" + status + " Http에러메시지 :"+msg);
	}, success:function(xhr) {
	console.log(xhr.result);
	nqList();
	$('#form1').each(function() {
		alert("삭제되었습니다");
		this.reset();
		$('.note-editable').html("");
		$('#la').html("선택한 파일 없음");
	});
	}
	});      }//if
	}); //삭제 버튼 클릭
	}//nqDelete
	

	//사용자 수정 요청
	function nqUpdate() {
	//수정 버튼 클릭
	
	$('#btnUpdate').on('click',function(){
	var form = $('#form1')[0];
	var formData = new FormData(form);

	$.ajax({ 
	url: "../nq", 
	type: 'PUT', 
	dataType: 'json', 
	data: formData,
	contentType : false,
    processData : false,
	success: function(data) { 
	nqList();
	$('#form1').each(function() {
		this.reset();
		$('.note-editable').html("");
		$('#la').html("선택한 파일 없음");
		alert("수정되었습니다");
	});
	},
	error:function(xhr, status, message) { 
	alert(" status: "+status+" er:"+message);
	}
	});
	});//수정 버튼 클릭
	}//userUpdate
	 

	

	//사용자 목록 조회 요청
	function nqList() {
		var filter=$("#filter").val()
		$.ajax({
			url : '../member',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			data: {mbr_author : filter},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : nqListResult
		});
	}//userList
	
	//사용자 목록 조회 응답
	function nqListResult(data) {
		$("#dataTable tbody").empty();
		$.each(data, function(idx, item) {
			$('<tr>').append($('<td>').html(item.nq_no)).append(
					$('<td>').html(item.nq_category)).append(
					$('<td>').html(item.nq_title)).append(
					$('<td>').html('<button id=\'btnSelect\'>조회</button>'))
					.append(
							$('<td>').html(
									'<button id=\'btnDelete\'>삭제</button>'))
					.append(
							$('<input type=\'hidden\' id=\'hidden_nq_no\'>')
									.val(item.nq_no)).appendTo('#dataTable tbody');
		});
		$('#dataTable').DataTable();
	}//userListResult
	
	
</script>
<h1 class="mt-4">시터/맴버 관리</h1>
<br>
<div align="left">분류
<select id='filter'>
		<option selected value=''>전체</option>
		<option value="시터">시터</option>
		<option value="회원">회원</option>
</select>
</div>
<div align="center">

		<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>권한</th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>휴대폰</th>
						<th>계좌</th>
						<th>월급</th>
						<th>관리</th>
					</tr>
				</thead>	
				<tbody></tbody>
			</table>
</div>