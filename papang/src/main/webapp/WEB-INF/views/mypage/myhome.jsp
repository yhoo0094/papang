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
* {margin: 0;padding: 0;}
body {margin: 20px auto;}
li {list-style: none;}
 /* lnb */
#lnb {position:fixed;width:370px;display: inline-block;float: left; margin-top: 20px;}
#lnb h1 {height: 40px;text-align: center;font-size: 20px;line-height: 1.8;letter-spacing: -2px;background-color: rgb(249, 196, 94);}

#lnb>ul {
	
}

#lnb>ul>li {
	border-bottom: 1px solid #dcdcdc;
}

#lnb>ul>li>a {
	display: block;
	padding: 14px 35px 14px 15px;
	color: inherit;
	font-size: 14px;
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
	font-size: 12px;
	background: #f5f2ec
		url('https://t1.daumcdn.net/cfile/tistory/2417E04D570C5C0225')
		no-repeat 95% 1px;
}

#lnb>ul>li>ul>li>a {
	color: #d91c1b;
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
    margin-top: 16px!important;
    display: inline-block;
    width: 100%;
    margin-left: 490px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	/* lnb */
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
</script>


<title>마이페이지</title>
</head>
<body>
	   	<div id="lnb">
		<h1>마이페이지</h1>
		<ul>
			<li><a href="#none">내정보관리</a>
				<ul>
					<li><a href="#none">회원정보 수정</a></li>
					<li><a href="#none">회원 탈퇴</a></li>
					<li><a href="#none">아이정보 관리</a></li>

				</ul></li>
			<li><a href="#none">장터이용내역</a>
				<ul>
					<li><a href="#none">장바구니</a></li>
					<li><a href="#none">구매내역</a></li>
					<li><a href="#none">판매내역</a></li>
					<li><a href="#none">배송현황조회</a></li>
				</ul></li>
			<li><a href="#none">게시물</a>
				<ul>
					<li><a href="#none">내 게시물</a></li>
					<li><a href="#none">댓글</a></li>
					<li><a href="#none">신고현황</a></li>
					<li><a href="#none">Q&A</a></li>
				</ul></li>
			<li><a href="#none">시터정보</a>
				<ul>
					<li><a href="#none">월급확인</a></li>
					<li><a href="#none">시터정보조회</a></li>
				</ul></li>
		</ul>
	</div>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>회원 정보 변경</h3>
			</div>
			<div>
				<form id="myForm" action="../member/update_mypage.do" method="post">
					<p>
						<label>이름</label> <input class="w3-input" type="text" id="id"
							name="id" readonly value="${ member.id }">
					</p>
					<p>
						<label>아이디</label> <input class="w3-input" type="text" id="id"
							name="id" readonly value="${ member.id }">
					</p>
					<p>
						<label>생년월일</label> <input class="w3-input" type="date"
							id="email" name="email" value="${ member.email }" required>
					</p>
					<p class="w3-center"></p>
					<input type="hidden" name="id" value="${ member.id }">
					<p>
						<label>Password</label> <input class="w3-input" id="old_pw"
							name="old_pw" type="password" required>
					</p>
					<p>
						<label>New Password</label> <input class="w3-input" id="pw"
							name="pw" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p>
						<label>닉네</label> <input class="w3-input" type="password"
							id="pw2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn"
							class="btnYellow bMedium">변경</button>
						<button type="submit" id="joinBtn2"
							class="btnGray bMedium">취소</button>
					</p>
				</form>
			</div>
		</div>
	</div>



</body>

</html>