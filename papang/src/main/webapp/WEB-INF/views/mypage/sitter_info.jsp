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
		<td width="400" align="center" height="70"><select class="input_middle">
                        <option>대구</option>
                        <option>서울</option>
                        <option>부산</option>                       
            </select></td>
	
	</tr>
	<tr  width="400" align="center" height="70">
		<td>희망연봉</td>
		<td><select class="input_middle">
                        <option>100</option>
                        <option>200</option>
                        <option>300</option>                       
            </select></td>	
            
	</tr>
	
	
	
	<tr  width="400" align="center" height="70">
		<td><button type="submit" id="joinBtn"
							class="btnYellow bMedium">사진 변경</button></td>
		<td>희망연령대 </td>
		<td colspan="2"><select class="input_middle" >
                        <option>10개월</option>
                        <option>11개월</option>
                        <option>12개월</option>                       
            </select>개월</td>	
            
	</tr>
	
	
	
	<tr  width="400" align="center" height="70">
		<td>
			급여지급일
		</td>
		
		<td class="theader" colspan="2">
			<input type="date"/>
		</td>
	
	</tr>
	<tr  width="400" align="center" height="70">
		<td>
			휴무일
		</td>
		
		<td class="theader" colspan="2">
		<label><input type="checkbox" name="color" value="blue"> 월</label>
      <label><input type="checkbox" name="color" value="blue"> 회</label>
      <label><input type="checkbox" name="color" value="blue"> 수</label>
      <label><input type="checkbox" name="color" value="blue"> 목</label>
      <label><input type="checkbox" name="color" value="blue"> 금</label>
      <label><input type="checkbox" name="color" value="blue"> 토</label>
      <label><input type="checkbox" name="color" value="blue"> 일</label>
	</td>
	</tr>	
	
	<tr  width="400" align="center" height="70">
		<td>
			특이사항
		</td>
		
		<td class="theader" colspan="2">
		열심히 할게요
		</td>
	
	</tr>
	
		<tr  width="400" align="center" height="70">
		<td>
			계좌번호
		</td>
		
		<td class="theader" colspan="2">
		<select class="input_middle">
                        <option>대구은행</option>
                        <option>신한은행</option>
                        <option>부산은행</option>                       
            </select>
        <input type="text"/>
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