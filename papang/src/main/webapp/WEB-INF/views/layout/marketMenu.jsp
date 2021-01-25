<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style type="text/css">
	/* 마이페이지 메뉴 */
/* 마이페이지 네비 */
/* lnb */
* {margin: 0;padding: 0;}  
li {list-style: none;} 
a {}
#lnb {  /*큰 노란 빠*/
	position: fixed;
	width: 10%;
	display: inline-block;
	float: left;
	margin-top: 20px;
	margin-left: 50px;
}

/* #lnb h1 {  /*대분류 */
	height: 70px;
	text-align: center;
	font-size: 40px;
	line-height: 1.7;
	letter-spacing: -2px;
	background-color: rgb(249, 196, 94);
} */

#lnb>ul>li {
	border-bottom: 1px solid #dcdcdc;
}

#lnb>ul>li>a {
	display: block;
	padding: 14px 35px 14px 15px;
	color: inherit;
	/*부제*/
	font-size: 20px;
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
<!-- h1 -->
		<ul>
			<li><a href="#none">상품판매</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/marketList/itemBoard">전체목록</a></li>
<c:if test='${empty admin.ad_id}'>
					<li><a href="${pageContext.request.contextPath}/marketList/cart">장바구니</a></li>
</c:if>
				</ul></li>
			<li><a href="#none">중고장터</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/marketList/usedOnSaleBoard">판매중 상품</a></li>
					<li><a href="${pageContext.request.contextPath}/marketList/usedBoard">전체상품</a></li>
				</ul></li>
		</ul>
	</div>
</body>