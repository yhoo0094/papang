<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<style type="text/css">
.temt {
	padding: 100px;
}

.communityFormTitle {
	padding: 1%;
}

.communityFormType {
	width: 100%;
	border: none;
}

.communityFormCont{
	padding: 80% 0% 58% 0%;
}

.sirenImg{
	width: 30px;
	height: 30px;
	margin-bottom: 10px
}

textarea {
	border: none;
}

.insertBtn {
    height: 126px;
    width: 126px;
}
</style>
</head>
<body>
	<div class="temt">
		<br>
		<div align="center" class="communityFormTitle strongYellow">
			<h3>커뮤니티 글 등록하기</h3>
		</div>
		<br>
		<div class="backgroundDiv">
			<div align="center" class="communityFormDiv">
				<form id="frm" name="frm" action="#">
					<table style="width: 100%">
							<tr>
								<td align="center" width="20%"><div class="strongYellow">제목</div></td>
								<td width="80%"><input type="text" name="title"
									class="communityFormType"></td>
							</tr>
							<tr><td></td></tr>
							<tr>
								<td align="center"><div class="strongYellow">분류</div></td>
								<td><select name="type" class="communityFormType">
										<option value="정보">정보
										<option value="일상">일상
										<option value="질문">질문
								</select></td>
							</tr>
							<tr><td></td></tr>
							<tr>
								<td align="center" style="padding-bottom: 7px"> 
									<div class="strongYellow communityFormCont"> 
										<div>내용</div>
									</div> 	
								</td>
								<td height="100%"><textarea rows="20" cols="102" name="comm"
										style="width: 100%; height: 100%"></textarea></td>
							</tr>
					</table>
					<br>
					<div align="center">
						<button type="submit" id="submitBtn" class="btnYellow bMedium">제출하기</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" id="gobackBtn" class="btnGray bMedium">취소</button>
					</div>
				</form>
				<br>
				<div align="left">
				<b style="font-size: 20px;">댓글 쓰기</b>
				</div>
				<table style="width: 100%">
						<tr>
							<td width="90%"><textarea rows="5" cols="102" name="comm"
										style="width: 100%"></textarea></td>
							<td align="center" width="10%"><button class="btnYellow insertBtn">등록하기</button></td>
						</tr>
				</table>
				<br>
				<div align="left">
				<b style="font-size: 20px;">댓글 목록</b>
				</div>
				<table style="width: 100%">
						<tr>
							<td align="center" width="10%"> <div>아이디</div></td>
							<td width="90%">
								<div>
									댓글 내용&nbsp;
									<img class="sirenImg" alt="사이렌사진" src="${pageContext.request.contextPath}/resources/images/siren.png" width="1%" height="1%">
									<span style="font-size: 8px">신고하기</span> 
								</div>
							</td>
						</tr>
				</table>
			</div>
		</div>
	</div>

</body>
