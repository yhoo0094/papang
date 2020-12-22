<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/active/css/cookList.css"/>
<link rel = "preconnect"href = "https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<style>
.button {
 display: inline-block;border-radius: 4px;background-color:#e8505b;border: none;color: #FFFFFF;font-weight:bold;text-align: center;
 			font-size: 23px;padding: 17px;width: 270px;transition: all 0.5s;cursor: pointer;margin: 5px;}
.button span {cursor: pointer;display: inline-block;position: relative;transition: 0.5s;}
.button span:after {content: '\00bb';position: absolute;opacity: 0;top: 0;right: -20px;transition: 0.5s;}
.button:hover span {padding-right: 25px;}
.button:hover span:after {opacity: 1;right: 0;}
.button_div {display: inline;height: 70px;width: 59%;}
.typewrite {color:rgb(249, 196, 94);margin-left: 260px; }
.typewrite:hover {text-decoration: none; color:rgb(249, 196, 94);}
.header_div{margin: 120px 0px 40px 0px;}
</style>
<script>
var TxtType = function(el, toRotate, period) {
    this.toRotate = toRotate;
    this.el = el;
    this.loopNum = 0;
    this.period = parseInt(period, 10) || 2000;
    this.txt = '';
    this.tick();
    this.isDeleting = false;
};

TxtType.prototype.tick = function() {
    var i = this.loopNum % this.toRotate.length;
    var fullTxt = this.toRotate[i];

    if (this.isDeleting) {
    this.txt = fullTxt.substring(0, this.txt.length - 1);
    } else {
    this.txt = fullTxt.substring(0, this.txt.length + 1);
    }

    this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

    var that = this;
    var delta = 200 - Math.random() * 100;

    if (this.isDeleting) { delta /= 2; }

    if (!this.isDeleting && this.txt === fullTxt) {
    delta = this.period;
    this.isDeleting = true;
    } else if (this.isDeleting && this.txt === '') {
    this.isDeleting = false;
    this.loopNum++;
    delta = 500;
    }

    setTimeout(function() {
    that.tick();
    }, delta);
};

window.onload = function() {
    var elements = document.getElementsByClassName('typewrite');
    for (var i=0; i<elements.length; i++) {
        var toRotate = elements[i].getAttribute('data-type');
        var period = elements[i].getAttribute('data-period');
        if (toRotate) {
          new TxtType(elements[i], JSON.parse(toRotate), period);
        }
    }
    // INJECT CSS
    var css = document.createElement("style");
    css.type = "text/css";
    css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
    document.body.appendChild(css);
};
</script>
<body>
<!-- 전체 div 시작 -->
<div>
		
	<div class="Bigtitle">아빠와 함께 놀아요</div>
	<div class="search_div" align="center">
		<button class="search_btn" id="search1">예비 파파</button>
		<button class="search_btn" id="search2">만0 ~ 1세</button>
		<button class="search_btn" id="search3">만 2세</button>
		<button class="search_btn" id="search4">만3 ~ 6세</button>
	</div>
	
	<!-- test -->

	<div class="header_div">	
	<div class="title_div">
		<h1>
  			<a href="" class="typewrite" data-period="2000" data-type='[ "아이와 함께 하는 즐거운 놀이 ", "아빠! 아이와 함께 놀아요 !"]'  >
    			<span class="wrap"></span>
 			 </a>
		</h1>
	</div>
	
	<div class="button_div">
		<button class="button" style="vertical-align:middle"><span>나만의 새 놀이 만들기</span></button>
	</div>	
	</div>
	<!-- box -->
	<div class="box_div" >
		<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/playexam.JPG"></a> 
			<span class="author"> 
				<a href="#"> 
					<img src="${pageContext.request.contextPath}/resources/images/active/boyfriend.png"></a> 
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
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/playexam.JPG"></a> 
			<span class="author"> 
				<a href="#"> 
					<img src="${pageContext.request.contextPath}/resources/images/active/boyfriend.png"></a> 
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
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/playexam.JPG"></a> 
			<span class="author"> 
				<a href="#"> 
					<img src="${pageContext.request.contextPath}/resources/images/active/boyfriend.png"></a> 
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
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/playexam.JPG"></a> 
			<span class="author"> 
				<a href="#"> 
					<img src="${pageContext.request.contextPath}/resources/images/active/boyfriend.png"></a> 
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