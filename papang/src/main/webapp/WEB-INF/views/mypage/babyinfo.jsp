<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.input_small {width: 400px; height: 40px; padding: 8px;border: none;border-bottom: 1px solid #ccc;}
.input_middle {width: 80px; height: 40px; padding: 8px;border: none;border-bottom: 1px solid #ccc;}
.input_big {}
.divmargin {margin-top: 150px;}
.big_title {text-align: center;
font-size:50px;
}
.mid_title {text-align: right;
font-size:25px;


}
#hi input[id="cb1"] + label {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #bcbcbc;
	cursor: pointer;
}
.label {font-size:20px;margin:30px;width:200px;}
.td_content {font-size:22px;}
.table-bordered {text-align: center;}
.btnYellow {font-size:22px;}
input[type=checkbox]{width: 20px;height: 20px;}
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
.btnRed {
    background-color: #ff8080;
    border: none;
    font-weight: bold;
    width: 60px; 
    height: 40px;
    font-size: 28px;
    margin-bottom: 10px;
}
#fim2{
    margin: 0 0 0 193px;
}

#aa{
        width: 1287px;
}
</style>
<title>마이페이지</title>
</head>
<body>
 
	<div>
	
	<form id="fim" name="fim" action="babyinfodelete" method="post">
		<div>
			<div class="w3-large" align="center">
				<h3 class="big_title">아기정보 관리</h3>
			</div>
			<div class="content_div">
				<br>
			    
			 
					   <button type="submit" class="btnRed bSmall pull-right" id="selectBtn">삭제</button>
					   
					      <div align="right">
			
		</div>
		<br>
			<table class="table" id="example-table-3">
				<thead>
					<tr class="tableTrTh">
						<th width="15%" class="tableTh">선택</th>
						<th width="15%" class="tableTh">넘버</th>
						<th width="15%" class="tableTh">아기 이름</th>
						<th width="15%" class="tableTh">성별</th>
						<th width="15%" class="tableTh">태어난 날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="co5" items="${cos5}">
					<tr>
						 
						<td align="center"><input value="${co5.chi_no}" type="checkbox" name="user_CheckBox" ></td>
						<td align="center">${co5.chi_no}</td>
						<td align="center">${co5.chi_name}</td>
						<td align="center">${co5.chi_gender}</td>
						<td align="center">${co5.chi_birth}</td>
					</tr>
				</c:forEach>	
					
					
				</tbody>
			</table>
			
		
					   <br>  
					   <br>
			<!-- <button style="font-size:22px">추가</button>	 -->
			<%--  <button class="btnRed bSmall">추가</button>
				    
			<div style="background:rgb(249, 196, 94)">    					    
			<label class="label">아이 이름</label>
			<input class="input_small" type="text" id="id" name="id"></br>
			<label class="label">아이 성별선택</label>
			<select class="input_middle" id="room_address" name="room_address">
                        <option>남</option>
                        <option>여</option>
                        <option>예정</option>                       
            </select>		
           <br>
			<label class="label">아이 출생년도</label>
			<input class="input_small" type="date" id="id" name="id"  value="${ member.id }">
			</div>		 --%>
		</div>
	</div>
	</form>
	
	  <form id="fim2" name="fim2" action="babyinfoinsert" method="post">
			  <button type="submit" class="btnRed bSmall">추가</button>
				    
			<div id="aa" style="background:rgb(249, 196, 94)">    					    
			<label class="label">아이 이름</label>
			<input class="input_small" type="text" id="chi_name" name="chi_name"></br>
			<label class="label">아이 성별선택</label>
			<select class="input_middle" id="chi_gender" name="chi_gender">
                        <option value="남">남</option>
                        <option value="여">여</option>
                        <option value="예정">예정</option>                       
            </select>		
           <br>
			<label class="label">아이 출생년도</label>
			<input class="input_small" type="date" id="chi_birth" name="chi_birth">
			<label class="label">SNS 수신 알림</label>
			<select class="input_middle" id="chi_sns" name="chi_sns">
                        <option value="동의">동의</option>
                        <option value="비동의">비동의</option>               
            </select>
			</div>	
	  </form>			 
</div>	
	

</body>

<script>
$("#selectBtn").click(function(){ 
	
	
	var rowData = new Array();
	var tdArr = new Array();
	var cnt = $("input[name=user_CheckBox]:checked").length;
	var checkbox = $("input[name=user_CheckBox]:checked");
	
	// 체크된 체크박스 값을 가져온다
	
	 if(cnt == 0){
         alert("선택된 글이 없습니다.");
     }
	 else { 
		checkbox.each(function(i) {


		// checkbox.parent() : checkbox의 부모는 <td>이다.
		// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
		var tr = checkbox.parent().parent().eq(i);
		var td = tr.children();
		
		// 체크된 row의 모든 값을 배열에 담는다.
		rowData.push(tr.text());
		   
		// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
		var no = td.eq(1).text()
		
		 	
		// 가져온 값을 배열에 담는다.
		tdArr.push(no);
		$("#ex3_Result3").html(tdArr);
		
	/* 	$.ajax({ 
            url : "mapage/babyinfo",
            type : 'POST',
            data : {
               
            	tdArr:tdArr
                
            },
            error{
               alert("실패");
            },
            success : function(data) {
               alert("전송되었습니다.");
               location.replace("checkbox")
            }
         }); */
	});
	  
	 }
	
	
		
});
</script>

</html>