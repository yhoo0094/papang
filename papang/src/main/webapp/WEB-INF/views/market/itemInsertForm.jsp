<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="${pageContext.request.contextPath}/resources/summernote/js/summernote/summernote-lite.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/summernote/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/summernote/css/summernote/summernote-lite.css">

<h1 class="mt-4">판매상품 등록</h1>


<script>
	$(document).ready(function() {
		//여기 아래 부분
		$('#pro_detail').summernote({
			height : 300, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정

		});
	});
</script>
<form id='frm' name='frm' method='post' action='${pageContext.request.contextPath}/market/itemInsert'>
	<div align="center">
			<table class="table" style="width: 100%">
				<tbody>
					<tr>
						<td align="center" style="width: 10%">상품명</td>
						<td><input name="pro_name" type="text" style="width: 100%"></td>
					</tr>
					<tr>
						<td align="center" style="width: 10%">가격</td>
						<td><input name="pro_price" type="text" style="width: 100%"></td>
					</tr>
					<tr>
						<td align="center" style="width: 10%">기업코드</td>
						<td><input name="pro_cc" type="text" style="width: 100%"></td>
					</tr>
					<tr>
						<td align="center" style="width: 10%">대표사진</td>
						<td>
							<input type="text" id="pro_pic" name="pro_pic" value="image">
						</td>
					</tr>
				</tbody>
			</table>

			<textarea id="pro_detail" name="pro_detail"></textarea>
			<input type="submit" value="등록하기"> &nbsp;&nbsp; <input
				type="reset" value=" 취  소 ">
		</div>
		</form>