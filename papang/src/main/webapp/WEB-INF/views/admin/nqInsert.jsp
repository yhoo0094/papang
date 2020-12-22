<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/json.min.js"></script>
<script type="text/javascript">
	$(function() {
		nqList();

		nqSelect();

		//userDelete();

		nqInsert();

		//userUpdate();

		init();
	});

	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click', function() {
			$('#form1').each(function() {
				this.reset();
				$('#contenttd').html("");
				$('#summernote').summernote('undo')
			});
		});
	}//init
	/*
	//사용자 삭제 요청
	function userDelete() {
	//삭제 버튼 클릭
	$('body').on('click','#btnDelete',function(){
	var userId = $(this).closest('tr').find('#hidden_userId').val();
	var result = confirm(userId +" 사용자를 정말로 삭제하시겠습니까?");
	if(result) {
	$.ajax({
	url:'users/'+userId,  
	type:'DELETE',
	contentType:'application/json;charset=utf-8',
	dataType:'json',
	error:function(xhr,status,msg){
	console.log("상태값 :" + status + " Http에러메시지 :"+msg);
	}, success:function(xhr) {
	console.log(xhr.result);
	userList();
	}
	});      }//if
	}); //삭제 버튼 클릭
	}//userDelete
	 */
	//사용자 조회 요청
	function nqSelect() {
		//조회 버튼 클릭
		$('body').on('click', '#btnSelect', function() {
			var nq_no = $(this).closest('tr').find('#hidden_nq_no').val();
			//특정 사용자 조회
			$.ajax({
				url : '../nq/' + nq_no,
				type : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : nqSelectResult
			});
		}); //조회 버튼 클릭
	}//userSelect

	//사용자 조회 응답
	function nqSelectResult(nq) {
		console.log(nq);
		$('select:text[name="nq_category"]').val(nq.nq_category).prop(
				"selected", true);
		$('input:text[name="nq_title"]').val(nq.nq_title);
		$('input:text[name="nq_file"]').val(nq.nq_file);
		$('#contenttd').html(nq.nq_content);
	}//userSelectResult

	/*
	//사용자 수정 요청
	function userUpdate() {
	//수정 버튼 클릭
	$('#btnUpdate').on('click',function(){
	var id = $('input:text[name="id"]').val();
	var name = $('input:text[name="name"]').val();
	var password = $('input:text[name="password"]').val();
	var role = $('select[name="role"]').val();		
	$.ajax({ 
	url: "users", 
	type: 'PUT', 
	dataType: 'json', 
	data: JSON.stringify({ id: id, name:name,password: password, role: role }),
	contentType: 'application/json',
	success: function(data) { 
	userList();
	},
	error:function(xhr, status, message) { 
	alert(" status: "+status+" er:"+message);
	}
	});
	});//수정 버튼 클릭
	}//userUpdate
	 */
	//사용자 등록 요청
	function nqInsert() {
		//등록 버튼 클릭
		$('#btnInsert').on('click', function() {
			$("#form1")

			$.ajax({
				url : "../nq",
				type : 'POST',
				dataType : 'json',
				//data: JSON.stringify({ id: id, name:name,password: password, role: role }),
				data : JSON.stringify($("#form1").serializeObject()),
				contentType : 'application/json',
				success : function(response) {
					if (response.result == true) {
						nqList();
						$('#form1').each(function() {
							this.reset();
							$('#contenttd').html("");
							$('#summernote').summernote('undo')
						});
						$('#summernote').summernote('undo')
					}
				},
				error : function(xhr, status, message) {
					alert("status: " + status + " er:" + message);
				}
			});
		});//등록 버튼 클릭
	}//userInsert

	//사용자 목록 조회 요청
	function nqList() {
		$.ajax({
			url : '../nq',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : nqListResult
		});
	}//userList

	//사용자 목록 조회 응답
	function nqListResult(data) {
		$("#tb tbody").empty();
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
									.val(item.nq_no)).appendTo('#tb tbody');
		});//each
	}//userListResult
</script>
<h1 class="mt-4">공지사항/자주묻는 질문 관리</h1>
<br>

<script
	src="${pageContext.request.contextPath}/resources/summernote/js/summernote/summernote-lite.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/summernote/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/summernote/css/summernote/summernote-lite.css">




<script>
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			height : 500, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정

		});
	});
</script>
<form id="form1" class="form-horizontal">
	<div align="center" id="mdiv" style="width: 100%">


		<table class="table" style="width: 100%">
			<tbody>
				<tr>
					<td align="center" style="width: 10%">분류</td>
					<td><select name="nq_category">
							<option value="공지사항">공지사항</option>
							<option value="자주묻는 질문" selected>자주묻는 질문</option>
					</select></td>
				</tr>
				<tr>
					<td align="center" style="width: 10%">제목</td>
					<td><input name="nq_title" type="text" style="width: 100%"></td>
				</tr>
				<tr>
					<td align="center" style="width: 10%">첨부파일</td>
					<td><input type="text" id="nq_file" name="nq_file"
						value="image"></td>
				</tr>
			</tbody>
		</table>
		<table style="width: 100%" border="1">

			<tr>
				<td align="center" style="width: 10%">내용</td>
				<td id="contenttd" style="width: 90%"></td>
			</tr>

			<tbody></tbody>
		</table>
		<br>
	</div>
	<div align="center">
		<textarea id="summernote" name="nq_content"></textarea>
		<br> <input type="button" class="btn btn-primary" value="등록"
			id="btnInsert" /> <input type="button" class="btn btn-primary"
			value="수정" id="btnUpdate" /> <input type="button"
			class="btn btn-primary" value="초기화" id="btnInit" />
	</div>

</form>
<br>
<br>
<div align="center">

	<table class="table text-center" style="width: 100%" id="tb">
		<thead>
			<tr>
				<th class="text-center">글번호</th>
				<th class="text-center">분류</th>
				<th class="text-center">제목</th>
				<th class="text-center">조회</th>
				<th class="text-center">삭제</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
</div>




