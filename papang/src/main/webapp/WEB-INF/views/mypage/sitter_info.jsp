<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-input{}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
.input_small {width: 200px; height: 40px; padding: 8px;border: none;border-bottom: 1px solid #ccc;}
.input_middle {}
.input_big {}
.divmargin {margin-top: 150px;}
.big_title {text-align: center;
font-size:50px;
}
.mid_title {text-align: left;
font-size:30px;
}
.small_title {text-align: right;
font-size:20px;
}
table,td {border : 1px solid black;}
.div{margin-left: 361px;}
.btn {width: 310px; height: 51px; background-color: red;}
.theader {height: 30px; width: 30px;border:1px solid black;}
td {margin : 10px;}
p {
    margin-top: 0;
    margin-bottom: 1rem;
}
.content_div{width: 90%;
    margin: 0px 0px 0px 200px;}
    .w3-large {
    margin: 0 0 60px 230px;
}
table tbody tr td {
  font-size: 24px;
}

</style>
<title>월급확인</title>
</head>
<body>
<div class="w3-large" align="center">
<h3 class="big_title">시터정보조회</h3>
</div>
<div class="content_div">
<table >
	<tr  width="400" align="center">
		<td class="theader" rowspan="2" height="140"  >
			<img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg">
		</td>
		<td width="400" align="center" height="70">지역</td>
		<td width="400" align="center" height="70">
		    <select id="location1" name="location1" class="input_middle">
                        <option value="${ sitterVO.sit_loc}">${ sitterVO.sit_loc}</option>
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
							<option value="대전">대전</option>
							<option value="대구">대구</option>
							<option value="부산">부산</option>
							<option value="울산">울산</option>
							<option value="광주">광주</option>
							<option value="강원">강원</option>
							<option value="세종">세종</option>
							<option value="충북">충북</option>
							<option value="충남">충남</option>
							<option value="경북">경북</option>
							<option value="경남">경남</option>
							<option value="전북">전북</option>
							<option value="경남">경남</option>
							<option value="전남">전남</option>
							<option value="제주">제주</option>                       
            </select></td>
	
	</tr>
	<tr  width="400" align="center" height="70">
		<td>희망연봉</td>
		<td> <input type="text" value="${ sitterVO.sit_pay}"/></td>	
            
	</tr>
	
	
	
	<tr  width="400" align="center" height="70">
		<td><button type="submit" id="joinBtn"
							class="btnYellow bMedium">사진 변경</button></td>
		<td>희망연령대 </td>
		<td colspan="2"><select id="location1" name="location1" class="input_middle">
                        <option value="${ sitterVO.sit_age}">${ sitterVO.sit_age}</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							                    
        </select></td>	
            
	</tr>
	
	
	
	<tr  width="400" align="center" height="70">
		<td>
			급여지급일
		</td>
		
		<td class="theader" colspan="2">
			<input type="date" value="${sitterVO.sit_payday}"/>
		</td>
	
	</tr>
	<tr  width="400" align="center" height="70">
		<td>
			휴무일
		</td>
		

	
	<form name = "form1">
	<td class="theader" colspan="2">
       <input type = "checkbox" name = "writer" value = "월" > <label>월</label></input>
       <input type = "checkbox" name = "writer" value = "화" > <label>화</label></input>
       <input type = "checkbox" name = "writer" value = "수" > <label>수</label></input>
       <input type = "checkbox" name = "writer" value = "목" > <label>목</label></input>
       <input type = "checkbox" name = "writer" value = "금" > <label>금</label></input>
       <input type = "checkbox" name = "writer" value = "토" > <label>토</label></input>
       <input type = "checkbox" name = "writer" value = "일" > <label>일</label></input>
</td>
</form>
	</tr>	
	
	<tr  width="400" align="center" height="70">
		<td>
			특이사항
		</td>
		
		<td class="theader" colspan="2">
		<input type="text" value="${ sitterVO.sit_note}"/>
		</td>
	
	</tr>
	
		<tr  width="400" align="center" height="70">
		<td>
			계좌번호
		</td>
		
		
		<td class="theader" colspan="2"><select name="mbr_bank" id="mbr_bank">
		 							<option value="${ memberVO.mbr_bank}">${ memberVO.mbr_bank}</option>
									<option value="경남은행">경남은행</option>
									<option value="광주은행">광주은행</option>
									<option value="국민은행">국민은행</option>
									<option value="기업은행">기업은행</option>
									<option value="농협중앙회">농협중앙회</option>
									<option value="농협회원조합">농협회원조합</option>
									<option value="대구은행">대구은행</option>
									<option value="도이치은행">도이치은행</option>
									<option value="부산은행">부산은행</option>
									<option value="산업은행">산업은행</option>
									<option value="상호저축은행">상호저축은행</option>
									<option value="새마을금고">새마을금고</option>
									<option value="수협중앙회">수협중앙회</option>
									<option value="신한금융투자">신한금융투자</option>
									<option value="신한은행">신한은행</option>
									<option value="신협중앙회">신협중앙회</option>
									<option value="외환은행">외환은행</option>
									<option value="우리은행">우리은행</option>
									<option value="우체국">우체국</option>
									<option value="전북은행">전북은행</option>
									<option value="제주은행">제주은행</option>
									<option value="카카오뱅크">카카오뱅크</option>
									<option value="케이뱅크">케이뱅크</option>
									<option value="하나은행">하나은행</option>
									<option value="한국씨티은행">한국씨티은행</option>
									<option value="HSBC은행">HSBC은행</option>
									<option value="SC제일은행">SC제일은행</option>
							</select>
        <input type="text" value="${ memberVO.mbr_account}" />
		</td>
	
	</tr>
</table>
	
	
	<p class="w3-center">
						<button type="submit" id="joinBtn"
							class="btnYellow bMedium">변경</button>
						<button type="submit" id="joinBtn2"
							class="btnGray bMedium">취소</button>
					</p>
</div>


</body>

</html>