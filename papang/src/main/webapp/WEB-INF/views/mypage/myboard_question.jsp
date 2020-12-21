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
<title></title>
</head>
<body>
	<div class="w3-content w3-container divmargin">
		<div class="w3-container">
			<div class="w3-large" align="center">
				<h3 class="big_title">내글보기</h3>
			</div>
			
				</br>
			    
			    
			  
					   <div>
					      <table class="table table-bordered table-hovers">
					         <tr style="background:rgb(249, 196, 94)">
					            <th width="100" align="center">번호</th>
					            <th width="500">제목</th>
					            <th width="150" align="center">작성자</th>
					            <th width="250">작성일</th>
					            <th width="100">조회수</th>
					         </tr>
					         <c:forEach var="review" items="${reviews }">
					            <tr> 
					               <td align="center">1</td>
					               <td align="center">2</td>
					               <td align="center">3</td>
					               <td align="center">4</td>
					               <td align="center">5</td>                
					            </tr>
					            
					         </c:forEach>
					      </table>
					   </div>  
					   </br>
					   </br>
					   
					  
					   
				
		</div>
	</div>
	
	
	



</body>

</html>