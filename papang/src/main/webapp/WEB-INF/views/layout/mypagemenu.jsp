<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<head>
<style type="text/css">
	/* 마이페이지 메뉴 */
/* 마이페이지 네비 */
/* lnb */
* {margin: 0;padding: 0;}  
li {list-style: none;} 
a {}
#lnb {  /*마이페이지적힌 노랜 빠*/
	position: fixed;
	width: 450px;
	display: inline-block;
	float: left;
	margin-top: 20px;
}

#lnb h1 {  /*마이페이지 */
	height: 70px;
	text-align: center;
	font-size: 40px;
	line-height: 1.7;
	letter-spacing: -2px;
	background-color: rgb(249, 196, 94);
}

#lnb>ul>li {
	border-bottom: 1px solid #dcdcdc;
}

#lnb>ul>li>a {
	display: block;
	padding: 14px 35px 14px 15px;
	color: inherit;
	/*부제*/
	font-size: 30px;
	background: #f5f2ec
		url(https://t1.daumcdn.net/cfile/tistory/2417E04D570C5C0225) no-repeat
		95% 15px;
}

#lnb>ul>li a:hover {
	color: #d91c1b;
	background-color: #f5f2ec;
}

#lnb>ul>li.on>a {
	color: #d91c1b;
	background: #f5f2ec
		url('https://t1.daumcdn.net/cfile/tistory/257B794F570C5C0D1A')
		no-repeat 95% 14px;
}

#lnb>ul>li ul {
	display: none;
}

#lnb>ul>li>ul>li>a {
	display: block;
	padding: 0 25px 14px 14px;
	color: #inherit;
	font-size: 25px;
	background: #f5f2ec
		url('https://t1.daumcdn.net/cfile/tistory/2417E04D570C5C0225')
		no-repeat 95% 1px;
}

#lnb>ul>li>ul>li>a { /*부제 색깔 */
	color: #55595c;
	background-color: #f5f2ec;
}

#lnb>ul>li>ul>li.on a {
	color: #d91c1b;
	background: #f5f2ec
		url('https://t1.daumcdn.net/cfile/tistory/257B794F570C5C0D1A')
		no-repeat 95% 3px;
}

#lnb>ul>li>ul li ul {
	display: none;
	padding-bottom: 8px;
	background-color: #f5f2ec;
}

#lnb>ul>li>ul li li a {
	display: block;
	padding: 0 25px 10px 22px;
	color: #666;
	font-size: 12px;
	background-color: #f5f2ec;
}

#lnb>ul>li>ul>li li a:hover {
	color: #d91c1b;
}
 
#lnb>ul li.noDepth a {
	background-image: none !important;
}

.w3-margin-top {
	margin-top: 16px !important;
	display: inline-block;
	width: 100%;
	margin-left: 490px;
}
</style>

</head>

<body>
<script>
	/* lnb */
	$(()=>{
		(function($) {
			var lnbUI = {
				click : function(target, speed) {
					var _self = this, $target = $(target);
					_self.speed = speed || 300;

					$target.each(function() {
						if (findChildren($(this))) {
							return;
						}
						$(this).addClass('noDepth');
					});

					function findChildren(obj) {
						return obj.find('> ul').length > 0;
					}

					$target
							.on('click', 'a',
									function(e) {
										e.stopPropagation();
										var $this = $(this), $depthTarget = $this
												.next(), $siblings = $this.parent()
												.siblings();

										$this.parent('li').find('ul li')
												.removeClass('on');
										$siblings.removeClass('on');
										$siblings.find('ul').slideUp(250);

										if ($depthTarget.css('display') == 'none') {
											_self.activeOn($this);
											$depthTarget.slideDown(_self.speed);
										} else {
											$depthTarget.slideUp(_self.speed);
											_self.activeOff($this);
										}

									})

				},
				activeOff : function($target) {
					$target.parent().removeClass('on');
				},
				activeOn : function($target) {
					$target.parent().addClass('on');
				}
			};

			// Call lnbUI
			$(function() {
				lnbUI.click('#lnb li', 300)
			});

		}(jQuery));
	})	
</script>
	<div id="lnb">
		<h1>마이페이지</h1>
		<ul>
			<li><a href="#none">내정보관리</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/mypage/myhome">회원정보 수정</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/notjoin">회원 탈퇴</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/babyinfo">아이정보 관리</a></li>

				</ul></li>
			<li><a href="#none">장터이용내역</a>
				<ul>
					<li><a href="#none">장바구니</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/market_buyinfo">구매내역</a></li>
					<li><a href="#none">판매내역</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/market_deli">배송현황조회</a></li>
				</ul></li>
			<li><a href="#none">게시물</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/mypage/myboard_question">내 게시물</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/myboard_answer">댓글</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/myboard_police">신고현황</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/myboard_qna">Q&A</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/myboard_care">돌봄신청내역</a></li>
				</ul></li>
			<li><a href="#none">시터정보</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/mypage/sitter_money">월급확인</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/sitter_info">시터정보조회</a></li>
				</ul></li>
		</ul>
	</div>
</body>