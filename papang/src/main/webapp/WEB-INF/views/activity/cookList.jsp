<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/active/css/cookList.css"/>
<style type="text/css">
.communityFormTitle {
	padding: 1%;
}

.sitterBoardInputSize {
	width: 40%;
}

.sitterProfileImg {
	width: 100%;
	height: 100%;
	display: block;
	border-radius: 10px;
}

thead, #dataTable_filter, #dataTable_length {
	display: none;
}

.dataTableTr {
	display: inline;
	width: 50%;
}

.dataTableDisplayBlock {
	display: block;
	width: 20%;
}

.TableInTheDataTable td {
	border-top: none;
	vertical-align: middle;
	padding: 3px 11px;
}

.dataTableTr .sitterDiv {
	padding: 6px;
	border-radius: 10px;
}

.communityFormFilter {
	width: 100%;
	border-radius: 20px;
	background-color: #ff971d;
}

.dataTableTr>td {
    width: 260px;border: none;
}
.button {
 display: inline-block;border-radius: 4px;background-color:#e8505b;border: none;color: #FFFFFF;font-weight:bold;text-align: center;
 			font-size: 23px;padding: 17px;width: 270px;transition: all 0.5s;cursor: pointer;margin: 5px;}
.button span {cursor: pointer;display: inline-block;position: relative;transition: 0.5s;}
.button span:after {content: '\00bb';position: absolute;opacity: 0;top: 0;right: -20px;transition: 0.5s;}
.button:hover span {padding-right: 25px;}
.button:hover span:after {opacity: 1;right: 0;}
.button_div {display: inline;height: 70px;width: 59%;}
.typewrite {color:rgb(249, 196, 94);/* margin-left: 190px; */ }
.typewrite:hover {text-decoration: none; color:rgb(249, 196, 94);}
.header_div{margin: 80px -180px 40px 0px;}
.search_btn{transition-duration: 0.4s;} 
.search_btn:hover{background-color:#e8505b;color:white;}
.table{margin: 4rem 0 1rem 0;}

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
    
    $('#regbtn').on('click',function() {
    	location.href="cookForm"
	})
    
};


	



</script>
</head>
<body>
	<div class="Bigtitle">아빠와 요리해요</div>
	<div class="search_div" align="center">
		<button class="search_btn" id="search1">이유식 만들기</button>
		<button class="search_btn" id="search2">아이와 함께 요리해요</button>
		<button class="search_btn" id="search3">비건아이로 키우기</button>
		<button class="search_btn" id="search4">육식동물 아이</button>
	</div>
	
	<!-- test -->

	<div class="header_div">	
	<div class="title_div">
		<h1 class="moveTitle">
  			<a href="" class="typewrite" data-period="2000" data-type='[ "아이와 함께 하는 즐거운 요리 ", "나만의 요리를 직접 만들어 보세요 !"]'  >
    			<span class="wrap"></span>
 			 </a>
		</h1>
	</div>
	
	<div class="button_div">
		<button class="button" id="regbtn" style="vertical-align:middle"><span>나만의 새 요리 만들기</span></button>
	</div>	
	</div>
	<div id="cook_div">
		<table class="table" id="dataTable">
			<thead>
				<tr>
					<th>가</th>
				</tr>
			</thead>
			<tbody>
				<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
			<span class="author"> 
				<a href="#"> 
					<img src="${pageContext.request.contextPath}/resources/images/active/${member.mbr_pic}"></a> 
				<a href="#">DBVALUE</a>
				<a href="#">DBVALUE</a>
				<a href="#">DBVALUE</a>
				<a href="#">DBVALUE</a>
			</span>
				<!-- 시간,좋아요,공유 -->
				<div class="option">
					<div class="time">
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<tr class="dataTableTr">
					<td>
						<ol class="lst_recipe cool_recipes">
			<li>
			<a class="call_recipe thmb" href="#"> <img src="${pageContext.request.contextPath}/resources/images/active/pic01.jpg"></a> 
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
						<a href="">조회 100회</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like">평점 4</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
</body>
