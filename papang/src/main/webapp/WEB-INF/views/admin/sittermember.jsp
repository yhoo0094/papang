<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/json.min.js"></script>
<script type="text/javascript">
	$(function() {
		memberList();
		//nqSelect();
		//nqDelete();
		//nqUpdate();
		memberUpdate();
		$("#filter").on('change', function() {
			memberList();
		});

	});

	//사용자 삭제 요청
	function nqDelete() {
		//삭제 버튼 클릭
		$('body').on('click', '#btnDelete', function() {
			var nq_no = $(this).closest('tr').find('#hidden_nq_no').val();
			var result = confirm(nq_no + " 번 글을 정말로 삭제하시겠습니까?");
			if (result) {
				$.ajax({
					url : '../nq/' + nq_no,
					type : 'DELETE',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					error : function(xhr, status, msg) {
						console.log("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(xhr) {
						console.log(xhr.result);
						nqList();
						$('#form1').each(function() {
							alert("삭제되었습니다");
							this.reset();
							$('.note-editable').html("");
							$('#la').html("선택한 파일 없음");
						});
					}
				});
			}//if
		}); //삭제 버튼 클릭
	}//nqDelete

	//사용자 목록 조회 요청
	function memberList() {
		var filter = $("#filter").val()
		$.ajax({
			url : '../member',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			data : {
				mbr_author : filter
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : memberListResult
		});
	}//userList

	//사용자 목록 조회 응답
	function memberListResult(data) {
		$("#dataTable tbody").empty();
		$
				.each(
						data,
						function(idx, item) {
							$('<tr>')
									.append($('<td>').html(item.mbr_id))
									.append($('<td>').html(item.mbr_name))
									.append($('<td>').html(item.mbr_nick))
									.append(
											$('<td>')
													.html(
															"<select class='author' id='author"+item.mbr_id+"'><option value='시터'>시터</option><option  value='회원'>회원</option></select>"))
									.append($('<td>').html(item.mbr_phone))
									.append($('<td>').html(item.mbr_status))
									.append($('<td>').html(item.rcnt))
									.append(
											$('<td>')
													.html(
															'<button id=\'btnSelect\'>조회</button> <button id=\'btnDelete\'>탈퇴</button>'))
									.appendTo('#dataTable tbody');
					 $("#author"+item.mbr_id).val(item.mbr_author).prop("selected",
									true); 
						});

		$('#dataTable').DataTable();
	}//userListResult

	function memberUpdate() {
		//수정 버튼 클릭
		$("body").on('change', '.author', function() {
			var author = $(".author").val();
			var id = $(this).parent().parent().children().eq(0).html();
			$.ajax({
				url : "../member",
				type : 'PUT',
				dataType : 'json',
				data : JSON.stringify({
					mbr_id : id ,mbr_author : author
				}),
				contentType : 'application/json',
				success : function(data) {
					memberList();
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});
		});

	}//userUpdate
</script>
<h1 class="mt-4">시터/회원 관리</h1>
<br>
<div align="left">
	분류 <select id='filter'>
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
				<th>아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>권한</th>
				<th>휴대폰</th>
				<th>활동상태</th>
				<th>제재횟수</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
</div>

<script>
	//사용자 수정 요청
</script>