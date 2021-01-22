
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/active/css/cookList.css" />
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
	width: 260px;
	border: none;
}

.button {
	display: inline-block;
	border-radius: 4px;
	background-color: #e8505b;
	border: none;
	color: #FFFFFF;
	font-weight: bold;
	text-align: center;
	font-size: 23px;
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

.button_div {
	display: inline;
	height: 70px;
	width: 59%;
	margin-left: 58px;
}

.typewrite {
	color: rgb(249, 196, 94); /* margin-left: 190px; */
}

.typewrite:hover {
	text-decoration: none;
	color: rgb(249, 196, 94);
}

.header_div {
	margin: 80px -180px 40px 0px;
}

.search_btn {
	transition-duration: 0.4s;
}

.search_btn:hover {
	background-color: #e8505b;
	color: white;
}

.table {
	margin: 4rem 0 1rem 0;
}
.titleFont{font-size: 18px;}
.cookno_hidden{display: none;}
.linebb{display: inline-block;}
.nonediv{display: none;}
.count{width: 100%;}

.fadein {animation: fadein 2s;}
@keyframes fadein {
    from {opacity:0;}
    to {opacity:1;}
}

@-webkit-keyframes fadein { /* Safari and Chrome */
    from {opacity:0;}
    to {opacity:1;}
}

.hideme{opacity:0;}

}
.famImage{width: 420px;height: 350px;}
.Bigtitle {
    margin: 20px 0 0 38px;
}
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

		this.el.innerHTML = '<span class="wrap">' + this.txt + '</span>';

		var that = this;
		var delta = 200 - Math.random() * 100;

		if (this.isDeleting) {
			delta /= 2;
		}

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
		for (var i = 0; i < elements.length; i++) {
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

		//글등록 버튼 이벤트
		$('#regbtn').on('click',function() {
		var mbr_id = '${user.mbr_id}';
		
		console.log(mbr_id);
		
		if(mbr_id == null || mbr_id == "") {
			alert('로그인 후 사용가능합니다');
			location.href="${pageContext.request.contextPath}/member/loginForm"
		} else {
		location.href="cookForm"
		}
	})
	
	//제목 클릭시 리스트 돌아가기
	$('#Bigtitle').on('click',function() {
		location.href="cookList"
	})

	};
</script>
</head>
<body>
	<div class="Bigtitle" id="Bigtitle">아빠와 요리해요</div>
	<div class="search_div" align="center">
		<button class="search_btn" id="c_search1" value="이유식">이유식 만들기</button>
		<button class="search_btn" id="c_search2"  value="아이와함께">아이와 함께 요리해요</button>
		<button class="search_btn" id="c_search3" value="비건아이">비건아이로 키우기</button>
		<button class="search_btn" id="c_search4" value="육식아이">육식 아이</button>
	</div>


	<div class="header_div">
		<div class="title_div">
			<h1 class="moveTitle">
				<a href="" class="typewrite" data-period="2000"
					data-type='[ "아이와 함께 하는 즐거운 요리 ", "나만의 요리를 직접 만들어 보세요 !"]'> <span
					class="wrap"></span>
				</a>
			</h1>
		</div>

		<div class="button_div">
			<button class="button" id="regbtn" style="vertical-align: middle">
				<span>나만의 새 요리 만들기</span>
			</button>
		</div>
	</div>
	<div id="cook_div">
		<table class="table" id="dataTable">
			<thead>
				<tr>
					<th>가</th>
					<th>나</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${cookList}" var="cook">
				<tr class="dataTableTr fadein">
					<td class="cookno_hidden">${cook.COOK_NO}</td>
					<td class="c_box">
						<ol class="lst_recipe cool_recipes">
							<li>
							
							<a class="call_recipe thmb" href="#">
							<img id="${cook.COOK_NO}" src=""></a>
							 
								<span class="author"> 
								<a href="#">
								<!-- 회원이미지--> 
									<img src="${pageContext.request.contextPath}/images/memberimage/${cook.MBR_PIC}">
								</a>
								 	<p>${cook.MBR_ID}</p>
									<p class="titleFont">${cook.COOK_TITLE}</p>
								 	<div class="nonediv">
										<p>글번호 :</p><p class="cook_no">${cook.COOK_NO}</p>
									</div>
									<p class="linebb">카테고리: </p><p class="play_category linebb">${cook.COOK_CATEGORY}</p> 
							</span> <!-- 시간,좋아요,공유 -->
								<div class="option">
									<div class="time">
										<a class="count" href="" style="width: 100%;">조회  ${cook.COOK_HIT}</a>
									</div>
									<div class="like">
										<button type="button" class="btn_like" id="acBtn">후기</button>
									</div>                                                                                                                                                                                                                                                             
									<div class="share">
										<a class="call-share">공유</a>
									</div>
								</div>
						</ol>
					</td>
				</tr>
				<script>
					var sentence = '${cook.COOK_CONTENT}';
					console.log('======');
					/* console.log(sentence); */
					var start = sentence.indexOf('src="');
					var end = sentence.indexOf('"', start+5);
					var list = sentence.substring(start+5, end);
					/* console.log(list); */
					$('#${cook.COOK_NO}').attr('src',list);
					console.log(${cook.MBR_PIC});
				</script>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
