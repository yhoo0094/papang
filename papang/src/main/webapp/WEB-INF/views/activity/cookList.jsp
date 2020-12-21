<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/active/css/cookList.css"/>
<style>
.button {
 display: inline-block;
    border-radius: 4px;
    background-color: #f4511e;
    border: none;
    color: #FFFFFF;
    font-weight:bold;
    text-align: center;
    font-size: 18px;
    padding: 17px;
    width: 270px;
    transition: all 0.5s;
    cursor: pointer;
    margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
</style>
<body>
<!-- 전체 div 시작 -->
<div>
		
	<div class="Bigtitle">아빠와 요리해요</div>
	<div class="search_div" align="center">
		<button class="search_btn" id="search1">이유식 만들기</button>
		<button class="search_btn" id="search2">아이와 함께 요리해요</button>
		<button class="search_btn" id="search3">비건아이로 키우기</button>
		<button class="search_btn" id="search4">육식동물 아이</button>
	</div>
	<div class="title_div" align="right">
		<button class="button" style="vertical-align:middle"><span>나만의 요리 만들기 !</span></button>
	</div>
	
	<!-- box -->
	<div class="box_div" >
		<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
			<span class="author"> 
				<a href="#"> 
					<img src="${pageContext.request.contextPath}/resources/images/active/siren.png"></a> 
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
							<button type="submit" class="btn_like">좋아요</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
		<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
			<span class="author"> 
				<a href="#"> 
					<img src="${pageContext.request.contextPath}/resources/images/active/siren.png"></a> 
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
							<button type="submit" class="btn_like">좋아요</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
		<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
			<span class="author"> 
				<a href="#"> 
					<img src="${pageContext.request.contextPath}/resources/images/active/siren.png"></a> 
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
							<button type="submit" class="btn_like">좋아요</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
			<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
			<span class="author"> 
				<a href="#"> 
					<img src="${pageContext.request.contextPath}/resources/images/active/siren.png"></a> 
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
							<button type="submit" class="btn_like">좋아요</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
	</div>
	<!-- box 끝 -->	
</div>
<!--전체 div 끝 --> 
</body>
</html>