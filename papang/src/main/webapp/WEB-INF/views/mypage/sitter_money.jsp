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
.big_title {text-align: left;
font-size:50px;
}
.mid_title {text-align: left;
font-size:30px;
}
.small_title {text-align: right;
font-size:20px;
}


</style>
<title>월급확인</title>
</head>
<body>
	<div class="w3-content w3-container divmargin">
		<div class="w3-container">
			<div class="w3-large" align="center">
				<h3 class="big_title">월급확인</h3>
			</div>
			
				</br>
			    
			    <select class="input_small" id="room_address" name="room_address" >
                        <option>어</option>
                        <option>떻</option>
                        <option>게</option>                       
            </select>
			  
					   <div>
					      <table class="table table-bordered table-hovers">
					         <tr style="background:rgb(249, 196, 94)">
					            <th width="250">지급항목</th>
					            <th width="350">지급액</th>
					            <th width="250" align="center">지급일</th>
					            <th width="250">성명</th>
					            <th width="350">계좌번호</th>
					         </tr>
					         <c:forEach var="review" items="${reviews }">
					            <tr> 
					               <td>1</td>
					               <td>2</td>
					               <td>3</td>
					               <td>4</td>
					               <td>5</td>                
					            </tr>
					            
					         </c:forEach>
					      </table>
					   </div>  
					   </br>
					   </br>
					   </br>
					   </br>
					   
					   <h3 class="mid_title">내역</h3>
					  <div>
					      <table class="table table-bordered table-hovers">
					         <tr style="background:rgb(249, 196, 94)">
					            <th width="250">시작일</th>
					            <th width="350">종료일</th>
					            <th width="250" align="center">금액</th>
					            <th width="250">고객명</th>
					          
					         </tr>
					         <c:forEach var="review" items="${reviews }">
					            <tr> 
					               <td>1</td>
					               <td>2</td>
					               <td>3</td>
					               <td>4</td>
					                            
					            </tr>					            
					         </c:forEach>
					      </table>
					   </div>
					   
<br>
<br>
					   <label style="font-size:20px;margin:20px">총금액</label><input class="small_title" type="text" id="id"
							name="id"  value="${ member.id }">
				</div>	
					   
				        페이징???~~~~~~
		</div>
	</div>
	
	
	



</body>

</html>