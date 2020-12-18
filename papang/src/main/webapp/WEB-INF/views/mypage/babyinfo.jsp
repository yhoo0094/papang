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
.input_small {width: 400px; height: 40px; padding: 8px;border: none;border-bottom: 1px solid #ccc;}
.input_middle {}
.input_big {}
.divmargin {margin-top: 150px;}
.big_title {text-align: left;
font-size:50px;
}

</style>
<title>마이페이지</title>
</head>
<body>
	<div class="w3-content w3-container divmargin">
		<div class="w3-container">
			<div class="w3-large" align="center">
				<h3 class="big_title">아기정보 관리</h3>
			</div>
			
				</br>
			    <button align="center">추가</button><button>삭제</button></br>
			    
			  
					   <div>
					      <table class="table table-bordered table-hovers">
					         <tr>
					            <th width="250">선택</th>
					            <th width="250">이름</th>
					            <th width="250" align="center">성별</th>
					            <th width="500">생년월일</th>
					         </tr>
					         <c:forEach var="review" items="${reviews }">
					            <tr>
					               <td>1</td>
					               <td>2</td>
					               <td>3</td>
					               <td>4</td>               
					            </tr>
					            <tr>
					               <td>1</td>
					               <td>2</td>
					               <td>3</td>
					               <td>4</td>               
					            </tr>
					         </c:forEach>
					      </table>
					   </div>  
					   </br>
					   </br>
					   
			<div style="background:rgb(249, 196, 94)">    					    
			<label style="font-size:20px;margin:30px">아이 이름 　</label><input class="input_small" type="text" id="id"
							name="id"></br>
			<label style="font-size:20px;margin:30px">아이 성별 선택　</label>
			<select class="input_small" id="room_address" name="room_address" placeholder="생년월일을 입력해주세요" >
                        <option>남</option>
                        <option>여</option>
                        <option>예정</option>
                        
           </select>		
           <br>
			<label style="font-size:20px;margin:30px">아이 출생년도　　</label><input class="input_small" type="date" id="id"
							name="id"></br>
			

			</div>		
		</div>
	</div>
	
	
	



</body>

</html>