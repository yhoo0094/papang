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
.input_small {width: 400px; height: 30px; padding: 8px;border: none;border-bottom: 1px solid #ccc;}
.input_middle {width: 100; height: 30px; padding: 8px;border: none;border-bottom: 1px solid #ccc;}
.input_big {}
.divmargin {margin-top: 150px;}
.big_title {text-align: left;
font-size:50px;
}  
.mid_title {text-align: left;
font-size:35px;
}
.small_title {text-align: left;
font-size:20px;
}

</style>
<title></title>
</head>
<body>
	<div class="w3-content w3-container divmargin">
		<div class="w3-container">
			<div class="w3-large" align="center">
				<h3 class="big_title">돌봄 신청 내역</h3>
			</div>
			
				</br>
			    
			    
			  
					   <div>
					      <table class="table table-bordered table-hovers">
					         <tr style="background:rgb(249, 196, 94)">
					            <th width="200" align="center">번호</th>
					            <th width="300">이름</th>
					            <th width="300" align="center">성별</th>
					            <th width="300">생년월일</th>
					           
					         </tr>
					         <c:forEach var="review" items="${reviews }">
					            <tr> 
					               <td align="center">1</td>
					               <td align="center">2</td>
					               <td align="center">3</td>
					               <td align="center">4</td>
					                           
					            </tr>
					            <tr> 
					               <td align="center">1</td>
					               <td align="center">2</td>
					               <td align="center">3</td>
					               <td align="center">4</td>
					                           
					            </tr>
					            
					            
					         </c:forEach>
					      </table>
					   </div>  
					   </br>
					   </br>
				 	   
				<h4 class="mid_title">신청 상세</h3>	
				<br>
				
				<div style="background:rgb(249, 196, 94)"> 
					<label style="font-size:20px;margin:20px">신청현황　</label><input class="input_middle" type="text" id="id"

							name="id" readonly value="승인">
			    </br>
				<label style="font-size:20px;margin:20px">담당자　　</label><input class="input_middle" type="text" id="id"
							name="id" readonly value="${ member.id }">
				</br>
				<label style="font-size:20px;margin:20px">신청자　　</label><input class="input_middle" type="text" id="id"
							name="id"  value="${ member.id }">
				<br>
				<label style="font-size:20px;margin:20px">신청자 주소</label><input class="input_small" type="password" id="id"
							name="id"  value="${ member.id }">
				</div>		
		</div>
	</div>
	
	
	



</body>

</html>