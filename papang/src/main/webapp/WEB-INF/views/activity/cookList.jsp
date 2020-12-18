<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/active/css/cookList.css"/>
<style>
.center_div{border:3px solid black; width: 80%;margin-left: 10%;}
.box_div {border : 1px solid black;width: 80%;}
icon_img {display: inline;}
</style>

<body>
<!-- 전체 div 시작 -->
<div>
		
	<div class="Bigtitle">아빠와 요리해요</div>
	<div align="right">
		<button class="regi_btn btnYellow bSamll" >글 등록</button>
	</div>
	
	<!-- box -->
	<div class="box_div" >
	<dd>
		<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/pic01.jpg"></a> 
			<span class="author"> 
				<a href="#"> <img src="${pageContext.request.contextPath}/resources/images/siren.png"></a> 
				<a href="#">DBVALUE</a>
				<a href="#">DBVALUE</a>
				<a href="#">DBVALUE</a>
				<a href="#">DBVALUE</a>
			</span>
				<!-- 시간,좋아요,공유 -->
				<div class="option">
					<div class="time">
					<img  class="icon_img" alt="" src="${pageContext.request.contextPath}/resources/images/clock.png">
						<a href="">00분</a>
					</div>
					<div class="like">
						<form action="/bookmarks" method="post">
						<img  class="icon_img" alt="" src="${pageContext.request.contextPath}/resources/images/heart.png">
							<button type="submit" class="btn_like">좋아요</button>
						</form>
					</div>
					<div class="share">
					<img  class="icon_img" alt="" src="${pageContext.request.contextPath}/resources/images/heart.png">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
	</dd>
	<dd>
		<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/pic01.jpg"></a> 
			<span class="author"> 
				<a href="#"> <img src="${pageContext.request.contextPath}/resources/images/siren.png"></a> 
				<a href="#">DBVALUE</a>
				<a href="#">DBVALUE</a>
				<a href="#">DBVALUE</a>
				<a href="#">DBVALUE</a>
			</span>
				<!-- 시간,좋아요,공유 -->
				<div class="option">
					<div class="time">
						<a href="">00분</a>
					</div>
					<div class="like">
						<form action="/bookmarks" method="post">
							<button type="submit" class="btn_like">좋아요</button>
						</form>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
	</dd>
	<dd>
		<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/pic01.jpg"></a> 
			<span class="author"> 
				<a href="#"> <img src="${pageContext.request.contextPath}/resources/images/siren.png"></a> 
				<a href="#">DBVALUE</a>
				<a href="#">DBVALUE</a>
				<a href="#">DBVALUE</a>
				<a href="#">DBVALUE</a>
			</span>
				<!-- 시간,좋아요,공유 -->
				<div class="option">
					<div class="time">
						<a href="">00분</a>
					</div>
					<div class="like">
						<form action="/bookmarks" method="post">
							<button type="submit" class="btn_like">좋아요</button>
						</form>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
	</dd>
	</div>
	<!-- box 끝 -->	
</div>
<!--전체 div 끝 --> 
</body>
</html>