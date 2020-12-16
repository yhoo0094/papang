<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Hello World</title>
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
  </body>
</html>