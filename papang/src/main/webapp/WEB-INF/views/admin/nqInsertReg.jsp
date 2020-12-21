<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="${pageContext.request.contextPath}/resources/summernote/js/summernote/summernote-lite.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/summernote/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/summernote/css/summernote/summernote-lite.css">

<h1 class="mt-4">공지사항/자주묻는 질문 등록</h1>


<script>
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			height : 300, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정

		});
	});
</script>
<table class="table">

	<div align="center">
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
					<td><input type="text" style="width: 100%"></td>
				</tr>
				<tr>
					<td align="center" style="width: 10%"><br> <br> <br>첨부파일</td>
					<td>
						<table style="width: 100%">
							<tr>
								<td align="center"><br> <br> <br>마우스로 파일을
									끌어놓으세요.<br> <br> <br> <br></td>
							</tr>
							<tr>
								<td align="center"><button>내 PC</button>
									<button>WE드라이브</button></td>
							</tr>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<form method="post">
			<textarea id="summernote" name="editordata"></textarea>
		</form>
	</div>