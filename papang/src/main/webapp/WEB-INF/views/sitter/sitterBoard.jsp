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
.sitterBoardInputSize{
	width: 160px;
}

.fc-month-button, .fc-agendaWeek-button, .fc-agendaDay-button, .fc-listWeek-button, .fc-prevYear-button, .fc-nextYear-button{
	display: none;
}
</style>
<script type="text/javascript">
	$(()=>{
		$('.fc-today-button').trigger("click");
	})
</script>
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
					<td align="center" width="6%">날짜</td>
					<td align="left"><input type="date" class="sitterBoardInputSize"> ~ <input
						type="date" class="sitterBoardInputSize">
					</td>
					<td align="center" width="10%">시급</td>
					<td align="left">
						<input type="number" class="sitterBoardInputSize" step="1000" placeholder="최소금액">
						 ~ 
						<input type="number" class="sitterBoardInputSize" step="1000" placeholder="최대금액">
					</td>
				</tr>
				
				<tr>
					<td align="center">별점</td>
					<td align="left">
					<select class="sitterBoardInputSize">
							<option value="★★★★★">★★★★★
							<option value="★★★★">★★★★
							<option value="★★★">★★★
							<option value="★★">★★
							<option value="★" selected="selected">★
					</select> ~ <select class="sitterBoardInputSize">
							<option value="★★★★★">★★★★★
							<option value="★★★★">★★★★
							<option value="★★★">★★★
							<option value="★★">★★
							<option value="★">★
					</select>
					</td>
					<td align="center">제재횟수</td>
					<td align="left">
						<input type="number" placeholder="제재횟수" class="sitterBoardInputSize"> 회 이하
					</td>
				</tr>
				<tr>
					<td align="center">지역</td>
					<td align="left">
						<select id="location1" name="location1" class="loactionin sitterBoardInputSize">
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
					<td align="center" colspan="2">
						<button type="submit" class="fc-button fc-state-default bSamll">검색</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="bSamll fc-button fc-state-default">초기화</button>
					</td>
				</tr>
			</table>
		</div>
		
		<div>
			<div id="calendar"></div>
		</div>
	</div>
</body>
