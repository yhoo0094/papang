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
.big_title {text-align: center;
font-size:50px;
}

</style>
<title>마이페이지</title>
</head>
<body>
	<div class="w3-content w3-container divmargin">
		<div class="w3-container">
			<div class="w3-large" align="center">
				<h3 class="big_title">구매내역</h3>
			</div>
			
				</br>
			    
			    
			  
					   <div>
					      <table class="table table-bordered table-hovers">
					         <tr style="background:rgb(249, 196, 94)">
					            <th width="250">이미지</th>
					            <th width="250">물품정보</th>
					            <th width="250" align="center">수량</th>
					            <th width="500">가격</th>
					            <th width="500">구매일자</th>
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
					   
					   전체 수량 <input> 전체 가격 <input>
					   
				
		</div>
	</div>
	
	
	



</body>

</html>