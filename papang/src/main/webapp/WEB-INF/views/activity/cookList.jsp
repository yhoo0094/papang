<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.center_div {margin-top: 140px;min-height: 690px;}
.Bigtitle{color:rgb(249, 196, 94); font-size: 30px; font-weight: bold;margin-left: 230px;}
.regi_btn {margin-right: 390px;}
.table {border: 3px solid black;}
.tImage {width: 250px; height:250px;border:1px solid black;}
.boxContent{width: 250px; height:250px;border:1px solid black;}
.box_Scontent{border:1px solid black;text-align: center;margin: 0;}
</style>
</head>
<body>
	<div class="center_div">
		
		<div class="Bigtitle">
			아빠와 요리해요
		</div>
		
		<div align="right">
			<button class="regi_btn btnYellow bSamll" >글 등록</button>
		</div>
		
		<div class="box">
		<div>
			<img class="tImage" src="${pageContext.request.contextPath}/resources/images/papang_logo.png">
		</div>
		<div class="boxContent">
			<p class="box_Scontent">DBVALUE</p>
			<p class="box_Scontent">DBVALUE</p>
			<p class="box_Scontent">DBVALUE</p>
			<p class="box_Scontent">DBVALUE</p>
			<p class="box_Scontent">DBVALUE</p>
		</div>
		</div>
		
	</div> <!--전체 div 끝 -->
	
	
	
</body>
</html>