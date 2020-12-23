<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/active/css/cookList.css"/>
<style>
	.cook_content{background-color:rgb(249, 196, 94);width: 70%; border-radius: 10px;margin: 40px 10px 10px 170px;}
	.cView_title{height: 120px;padding:20px;}
	.cView_image{height: 430px;}
	.cView_comment{height:220px;padding: 20px;margin: 30px 10px 10px 0px;border-radius: 10px;}
	.comment{height: 30px;font-size: 18px;}
	.c_title{display: inline-block;font-size: 30px;}
	.c_star{display:inline-block;font-size: 25px;}
	._image{width: 410px;height: 420px;border-radius: 10px;}
	.comm_title{font-size: 20px;}
</style>
</head>
<body>
<div>
	<div class="Bigtitle">아빠와 요리해요 > 따라해보세요</div>
	<div class="cook_content">
		<div class="cView_title">
			<p class="c_title">그대로 멈춰라 DBVLUE</p>
			<p class="c_star">	&#128512;&#128512;&#128512;&#128512;&#128512; DBVALUE</p>
		</div>
		<div class="cView_image" align="center">
			<img class="_image" src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg">
		</div>
		<div class="cView_comment">
			<p class="comm_title">놀이방법</p>
			<div class="comment">
			 1. 집에서 커다란 이불을 준비해요
			 2. 이불이 있나요 ? 나는 극세사가 좋아요
			 3. 극세사는 좋ㅇ느데 춥네요
			</div>
		</div>
		
	</div>
	<!-- 화면 끝 -->
</div>
</body>
</html>