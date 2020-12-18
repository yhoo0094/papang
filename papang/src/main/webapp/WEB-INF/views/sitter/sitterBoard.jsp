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
</style>
</head>
<body>
	<div class="temt">
		<br>
		<div align="center" class="communityFormTitle strongYellow">
			<h3>베이비시터 리스트</h3>
		</div>
		<br>
		<div align="center" class="communityFormTitle strongYellow">
			<table style="width: 50%">
				<tr>
					<td align="center">날짜</td>
					<td align="left"><input type="date">~<input
						type="date">
					</td>
					<td align="center">시급</td>
					<td align="left">
						<input type="number" step="1000" placeholder="최소금액">
						 ~ 
						<input type="number" step="1000" placeholder="최대금액">
					</td>
				</tr>
				
				<tr>
					<td align="center">별점</td>
					<td align="left">
					<select>
							<option value="★★★★★">★★★★★
							<option value="★★★★">★★★★
							<option value="★★★">★★★
							<option value="★★">★★
							<option value="★" selected="selected">★
					</select> ~ <select>
							<option value="★★★★★">★★★★★
							<option value="★★★★">★★★★
							<option value="★★★">★★★
							<option value="★★">★★
							<option value="★">★
					</select>
					</td>
					<td align="center">제재횟수</td>
					<td align="left">
						<input type="number" placeholder="제재횟수">회 이하
					</td>
				</tr>
				<tr>
					<td align="center">지역</td>
					<td align="left">
						<select id="location1" name="location1" class="loactionin">
							<option>선택하세요</option>
							<option value="서울"> 서울</option>
							<option value="경기" >경기</option>
							<option value="인천" >인천</option>
							<option value="대전" >대전</option>
							<option value="대구" >대구</option>
							<option value="부산" >부산</option>
							<option value="울산" >울산</option>
							<option value="광주" >광주</option>
							<option value="강원" >강원</option>
							<option value="세종" >세종</option>
							<option value="충북" >충북</option>
							<option value="충남" >충남</option>
							<option value="경북" >경북</option>
							<option value="경남" >경남</option>
							<option value="전북" >전북</option>
							<option value="경남" >경남</option>
							<option value="전남" >전남</option>
							<option value="제주" >제주</option>
						</select>
					</td>
					<td align="center">
						<button type="submit">검색</button>
					</td>
					<td align="center">
						<button type="submit">취소</button>
					</td>
				</tr>
				
					
			</table>
		</div>
	</div>
</body>
