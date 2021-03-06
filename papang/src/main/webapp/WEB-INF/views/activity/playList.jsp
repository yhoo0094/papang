<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/active/css/cookList.css"/>
<style type="text/css">
.communityFormTitle {padding: 1%;}
.sitterBoardInputSize {width: 40%;}
.sitterProfileImg {width: 100%;height: 100%;display: block;border-radius: 10px;}
thead, #dataTable_filter, #dataTable_length {display: none;}
.dataTableTr {display: inline;width: 50%;}
.dataTableDisplayBlock {display: block;width: 20%;}
.TableInTheDataTable td {border-top: none;vertical-align: middle;padding: 3px 11px;}
.dataTableTr .sitterDiv {padding: 6px;border-radius: 10px;}
.communityFormFilter {width: 100%;border-radius: 20px;background-color: #ff971d;}
.dataTableTr>td {width: 260px; border: none;}
.button {display: inline-block;border-radius: 4px;background-color:#e8505b;border: none;color: #FFFFFF;font-weight:bold;text-align: center;
		font-size: 23px;padding: 17px;width: 270px;transition: all 0.5s;cursor: pointer;margin: 5px;}
.button span {cursor: pointer;display: inline-block;position: relative;transition: 0.5s;}
.button span:after {content: '\00bb';position: absolute;opacity: 0;top: 0;right: -20px;transition: 0.5s;}
.button:hover span {padding-right: 25px;}
.button:hover span:after {opacity: 1;right: 0;}
.button_div {display: inline;height: 70px;width: 59%;margin-left: 58px;}
.typewrite {color:rgb(249, 196, 94);/* margin-left: 190px; */ }
.typewrite:hover {text-decoration: none; color:rgb(249, 196, 94);}
.header_div{margin: 80px -180px 40px 0px;}
.center_div {min-height: 0px;}
.cook_div{border: 1px solid black;width: 80%;margin: 0 0 0 10%;}
.dataTable{border :#fff5d2;}
.table{margin: 4rem 0 1rem 0;}
.search_btn{transition-duration: 0.4s;} 
.search_btn:hover{background-color:#e8505b;color:white;}
.playno_hidden{display: none;}
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
.sample_image:hover {
    -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.05);
    transition-duration: 0.5s;
}
</style>
<script>

//후기버튼 클릭 이벤트


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
    
  //글등록 버튼 이벤트
	$('#regbtn').on('click',function() {
		var mbr_id = '${user.mbr_id}';
		
		console.log(mbr_id);
		
		if(mbr_id == null || mbr_id == "") {
			alert('로그인 후 사용가능합니다');
			location.href="${pageContext.request.contextPath}/member/loginForm"
		} else {
		location.href="playForm"
		}
	})
	
	//제목 클릭시 리스트 돌아가기
	$('#Bigtitle').on('click',function() {
		location.href="playList"
	})
	
	
	

};



</script>
<script>

</script>
</head>
<body>
	<div class="Bigtitle" id="Bigtitle">아빠와 함께 놀아요</div>
	<div class="search_div" align="center">
		<button class="search_btn" id="search1">예비 파파</button>
		<button class="search_btn" id="search2">만0 ~ 1세</button>
		<button class="search_btn" id="search3">만 2세</button>
		<button class="search_btn" id="search4">만3 ~ 6세</button>
	</div>
	
	<!-- test -->

	<div class="header_div">	
	<div class="title_div">
		<h1 class="moveTitle">
  			<a href="" class="typewrite" data-period="2000" data-type='[ "아이와 함께 하는 즐거운 놀이 ", "아빠! 아이와 함께 놀아요 !"]'  >
    			<span class="wrap"></span>
 			 </a>
		</h1>
	</div>
		<!-- box -->
	<div class="button_div">
		<button class="button" id="regbtn" style="vertical-align:middle"><span>나만의 새 놀이 만들기</span></button>
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
			<!-- foreach돌기 -->
			<c:forEach items="${playlist}" var="play" varStatus="status">
			
		
			
				<tr class="dataTableTr fadein" > 
					<td class="playno_hidden">${play.PLAY_NO}</td>
					<td class="box sample_image">
							<ol class="lst_recipe cool_recipes" >
			<li>
			<a class="call_recipe thmb" href="#"> 
				<img class="badimg"  id='${play.PLAY_NO}' src="" alt="대표 사진이 없습니다">
			</a> 
			<span class="author"> 
				<a href="#"><img src="${pageContext.request.contextPath}/images/memberimage/${play.MBR_PIC}"></a> 
				<p>${play.MBR_ID}</p>
				<div class="nonediv">
				<p>글번호 :</p><p class="play_no">${play.PLAY_NO}</p>
				</div>
				<p class="titleFont">${play.PLAY_TITLE}</p>
				<p class="linebb"></p><p class="play_category linebb">${play.PLAY_CATEGORY}</p>
				
			</span>
				<!-- 시간,좋아요,공유 -->
				<div class="option">
					<div class="time">
						<a class="count" style="width: 100%;">조회 ${play.PLAY_HIT}</a>
					</div>
					<div class="like">
							<button type="submit" class="btn_like" id="acBtn">후기</button>
					</div>
					<div class="share">
						<a class="call-share">공유</a>
					</div>
				</div>
		</ol>
					</td>
				</tr>
					<script>
						var sentence = '${play.PLAY_CONTENT}';
						console.log('======');
						console.log(sentence);
						var start = sentence.indexOf('src="');
						var end = sentence.indexOf('"', start+5);
						var list = sentence.substring(start+5, end);
						console.log(list);
						$('#${play.PLAY_NO}').attr('src',list);
			</script>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
	
	

</body>
