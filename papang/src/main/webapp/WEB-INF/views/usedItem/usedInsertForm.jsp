<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
.FormTitle {
	padding: 1%;
}

.FormType {
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

.FormTxtarea {
	width: 100%;
	height: 100%;
	border: none;
}

.FormTable {
	width: 100%;
	border: solid gray 1px;
	border-collapse: collapse;
}
</style>
<div align="center" class="FormTitle strongYellow">
	<h3>중고장터 글 등록</h3>
</div>
<br>
<div align="center" class="FormDiv">
	<form id="frm" name="frm" action="#">
		<table class="FormTable" border="1">
			<tr>
				<td align="center" width="20%" class="strongYellow">제목</td>
				<td class="whiteBackground" width="80%"><input type="text"
					name="used_title" class="FormType"></td>
			</tr>
			<tr>
				<td align="center" class="strongYellow">지역</td>
				<td class="whiteBackground"><select name="used_loc"
					class="FormType">
						<option value='택배' selected>택배</option>
						<option value='서울'>서울</option>
						<option value='부산'>부산</option>
						<option value='대구'>대구</option>
						<option value='인천'>인천</option>
						<option value='광주'>광주</option>
						<option value='대전'>대전</option>
						<option value='울산'>울산</option>
						<option value='강원'>강원</option>
						<option value='경기'>경기</option>
						<option value='경남'>경남</option>
						<option value='경북'>경북</option>
						<option value='전남'>전남</option>
						<option value='전북'>전북</option>
						<option value='제주'>제주</option>
						<option value='충남'>충남</option>
						<option value='충북'>충북</option>
				</select></td>
			</tr>
			<tr>
				<td align="center" width="20%" class="strongYellow">가격</td>
				<td class="whiteBackground" width="80%"><input type="text"
					name="used_price" class="FormType"></td>
			</tr>
			<tr>
				<td align="center" class="strongYellow" style="padding-bottom: 7px">내용</td>
				<td class="whiteBackground"><textarea
						class="FormTxtarea" rows="20" cols="102" name="used_content"></textarea></td>
			</tr>
			<tr>
				<td align="center" width="20%" class="strongYellow" style="padding-bottom: 7px">사진</td>
				<td class="whiteBackground" width="80%"><input type="text"
					name="used_pic" class="FormType" style="width:80%"><button type="button" class="btnGray" style="width:20%">찾기</button></td>
			</tr>
		</table>
		<br>
		<div align="center">
			<button type="submit" id="submitBtn" class="btnYellow bMedium">제출하기</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" id="gobackBtn" class="btnGray bMedium">취소</button>
		</div>
	</form>
</div>