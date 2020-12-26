<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/active/css/cookList.css"/>
<style>
	td{width:94px; height:100px; border:1px solid black;text-align: center;font-size: 16px;}
	.vacc_table{display: inline;}
	.content{margin: 10px 0 0 0;}
	th{background-color: rgb(249, 196, 94);border :1px solid black;font-size: 16px;}
	.vacc_title {background-color: rgb(249, 196, 94);}
	.vacc_prev{background-color: #f9c0c0;}
	.vacc_prev:hover{background-color:#ec5858;transition-duration: 1s;}
	.ex_div {width: 16px;height: 16px;;display: inline-block;margin: 0 12px 0 0;border-radius: 4px;}
	.prev{background-color: #f9c0c0}
	.reg{background-color:#98d6ea;}
 .Bigtitle {margin: 20px 0 40px 168px;}
</style>
</head>
<body>
	 <div class="Bigtitle"> 예방접종스 페이지스</div>
	 
	 <div class="ex_div prev"></div>작성 가능
	 <div class="ex_div reg"></div>작성 완료
	 <div class="content">
		 <table class="vacc_table">
		 <tbody>
		 	<tr>
		 		<td class="vacc_title">대상감염병</td>
		 		<td class="vacc_title">백신 종류 및 방법</td>
		 		<th>0 개월</th>
		 		<th>1 개월</th>
		 		<th>2 개월</th>
		 		<th>4 개월</th>
		 		<th>6 개월</th>
		 		<th>12 개월</th>
		 		<th>15 개월</th>
		 		<th>18 개월</th>
		 		<th>24 개월</th>
		 		<th>36 개월</th>
		 		<th>만 4세</th>
		 		<th>만 6세</th>
		 		<th>만 11세</th>
		 		<th>만 12세</th>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title">결핵</td>
		 		<td class="vacc_title">BCG(피내용)</td>
		 		<td class="vacc_prev">1회 {DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title">B형간염</td>
		 		<td class="vacc_title">Hepβ(유전자재조합)</td>
		 		<td class="vacc_prev">1차 {DBVALUE}</td>
		 		<td class="vacc_prev">2차 {DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev">3차 {DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 	</tr>
		 	<tr>
		 		<td  class="vacc_title" rowspan="2" >디프테리아ㆍ파상풍ㆍ백일해</td>
		 		<td class="vacc_title">DTaP</td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev">1차 {DBVALUE}</td>
		 		<td class="vacc_prev">2차 {DBVALUE}</td>
		 		<td class="vacc_prev">3차 {DBVALUE}</td>
		 		<td></td>
		 		<td class="vacc_prev" colspan="2">추 4차 {DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev" colspan="2">추 5차 {DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title">Tdap</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev" colspan="2">추 6차 {DBVALUE}</td>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title">폴리오</td>
		 		<td class="vacc_title">IPV</td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev">1차 {DBVALUE}</td>
		 		<td class="vacc_prev">2차 {DBVALUE}</td>
		 		<td class="vacc_prev">3차 {DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev" colspan="2">추 4차 {DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title">b형헤모필루스 인플루엔자</td>
		 		<td class="vacc_title">Hib</td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev">1차 {DBVALUE}</td>
		 		<td class="vacc_prev">2차 {DBVALUE}</td>
		 		<td class="vacc_prev">3차 {DBVALUE}</td>
		 		<td class="vacc_prev" colspan="2">추 4차 {DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title" rowspan="2">폐렴구균</td>
		 		<td class="vacc_title">PCV</td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev">1차 {DBVALUE}</td>
		 		<td class="vacc_prev">2차 {DBVALUE}</td>
		 		<td class="vacc_prev">3차 {DBVALUE}</td>
		 		<td class="vacc_prev" colspan="2">추 4차 {DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title">PPSV</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev" colspan="6"> 고위험군에 한하여 접종 {DBVALUE}</td>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title">홍역ㆍ유행성이하선염ㆍ풍진</td>
		 		<td class="vacc_title">MMR</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev" colspan="2"">1차 {DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev" colspan="2">2차 {DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title">수두</td>
		 		<td class="vacc_title">VAR</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev" colspan="2">1회 {DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title">A형간염</td>
		 		<td class="vacc_title">HepA</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev" colspan="3">1회 {DBVALUE}</td>
		 		<td class="vacc_prev" colspan="2">2차 1차접종 6개월 후</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title" rowspan="2">일본뇌염</td>
		 		<td class="vacc_title">IJEV(불활성화 백신)	</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev" colspan="4">1차 {DBVALUE}</td>
		 		<td class="vacc_prev"> 3차 1차 접종 후 12개월 후</td>
		 		<td></td>
		 		<td class="vacc_prev">추 4차{DBVALUE}</td>
		 		<td></td>
		 		<td class="vacc_prev">추 5차{DBVALUE}</td>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title">LJEV(햄스터 신장세포 유래 약독화 생백신)</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev" colspan="4">1차{DBVALUE}</td>
		 		<td class="vacc_prev">2차 1차 접종 후 12개월 후</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title">사람유두종바이러스 감염증</td>
		 		<td class="vacc_title">HPV</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev">1~2차 {DBVALUE}</td>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title">인플루엔자</td>
		 		<td class="vacc_title">IIV</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev" colspan="7">우선접종권장 대상자{DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 	</tr>
		 	<tr>
		 		<td class="vacc_title" rowspan="2">로타바이러스 감염증</td>
		 		<td class="vacc_title">RV1</td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev">1차 {DBVALUE}</td>
		 		<td class="vacc_prev">2차 {DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 	</tr>
		 		<tr>
		 		<td class="vacc_title">RV5</td>
		 		<td></td>
		 		<td></td>
		 		<td class="vacc_prev">1차 {DBVALUE}</td>
		 		<td class="vacc_prev">2차 {DBVALUE}</td>
		 		<td class="vacc_prev">3차 {DBVALUE}</td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 		<td></td>
		 	</tr>
		 	</tbody>
		 </table>
	 </div>
</body>
</html>