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
<title></title>
</head>
<body>
	<div>
		<div>
			<div class="w3-large" align="center">
				<h3 class="big_title">신고 현황</h3>
			</div>
			
				</br>
			    
			    
			  
					   <div class="content_div">
					      <table class="table table-bordered table-hovers">
					         <tr style="background:rgb(249, 196, 94)">
					            <th width="100" align="center">번호</th>
					            <th width="500">신고사유</th>
					            <th width="150" align="center">처리결과</th>
					            <th width="250">처리된날짜</th>
					            <th width="150">신고ID</th>
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