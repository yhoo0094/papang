<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<style type="text/css">
.communityFormTitle {
	padding: 1%;
}

.communityFormType {
	width: 100%;
	border: none;
}

.sirenImg {
	width: 30px;
	height: 30px;
	margin-bottom: 10px
}

.insertBtn {
	height: 126px;
	width: 126px;
}

.communityFormTxtarea {
	width: 100%;
	height: 100%;
	border: none;
}

.communityFormTable {
	width: 100%;
	border: solid gray 1px;
	border-collapse: collapse;
}
.note-resizebar{display: none;}
</style>

</head>
<body>
	<div align="center" class="communityFormTitle strongYellow">
		<h3>커뮤니티 글 등록하기</h3>
	</div>
	<br>
	<div align="center" class="communityFormDiv">
		<form:form action="communityFormInsert" modelAttribute="communityVO">
			<table class="communityFormTable" border="1">
				<tr>
					<td align="center" width="20%" class="strongYellow">제목</td>
					<td class="whiteBackground" width="80%">
						<form:input path="com_title" type="text" class="communityFormType"/>
					</td>
				</tr>
				<tr>
					<td align="center" class="strongYellow">분류</td>
					<td class="whiteBackground">
						<form:select path="com_category" class="communityFormType">
							<option value="정보">정보
							<option value="일상">일상
							<option value="질문">질문
						</form:select>
					</td>
				</tr>
				<tr>
					<td align="center" class="strongYellow" style="padding-bottom: 7px">내용</td>
					<td class="whiteBackground"><form:textarea id="summernote"  path="com_content"
							class="communityFormTxtarea" rows="20" cols="102" name="comm"></form:textarea></td>
				</tr>
			</table>
			<br>
			<div align="center">
				<button type="submit" id="submitBtn" class="btnYellow bMedium">제출하기</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" id="gobackBtn" class="btnGray bMedium">취소</button>
			</div>
		</form:form>
		
		<br>
		<div align="left">
			<b style="font-size: 20px;">댓글 쓰기</b>
		</div>
		<table style="width: 100%">
			<tr>
				<td width="90%"><textarea rows="5" cols="102" name="comm"
						style="width: 100%"></textarea></td>
				<td align="center" width="10%" style="padding: 0 0 5px 0"><button
						class="btnYellow insertBtn">등록하기</button></td>
			</tr>
		</table>
		<br>
		<div align="left">
			<b style="font-size: 20px;">댓글 목록</b>
		</div>
		<table style="width: 100%">
			<tr>
				<td align="center" width="10%">
					<div>아이디</div>
				</td>
				<td width="90%">
					<div>
						댓글 내용&nbsp; <img class="sirenImg" alt="사이렌사진"
							src="${pageContext.request.contextPath}/resources/images/siren.png"
							width="1%" height="1%"> <span style="font-size: 8px">신고하기</span>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<script>
		//여기 아래 부분
		$('#summernote').summernote({
			height : 500, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
		});
	</script>
</body>
