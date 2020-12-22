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
			   <button class="btnYellow bSmall">삭제</button>
			   </br>
			    
			  
					   <div>
					      <table class="table table-bordered table-hovers">
					         <tr style="background:rgb(249, 196, 94)">
					            <th width="250">선택</th>
					            <th width="250">이름</th>
					            <th width="250" align="center">성별</th>
					            <th width="500">생년월일</th>
					         </tr>
					         <c:forEach var="review" items="${reviews}">
					            <tr  >
					               <td class="td_content"> <label><input type="checkbox"></label></td>
					               <td class="td_content">2</td>
					               <td class="td_content">3</td>
					               <td class="td_content">4</td>               
					            </tr>
					            <tr>
					               <td class="td_content">
					               			<input type="checkbox" name="color">
					               	</td>
					               <td class="td_content">2</td>
					               <td class="td_content">3</td>
					               <td class="td_content">4</td>              
					            </tr>
					         </c:forEach>
					      </table>
					   </div>  
					   </br>  
					   </br>
			<button style="font-size:22px">추가</button>		   
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
			</div>		
		</div>
	</div>
	
	
	



</body>

</html>