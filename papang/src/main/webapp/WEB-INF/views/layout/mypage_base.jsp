<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Modern Business - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/main/css/modern-business.css" rel="stylesheet">
  <style>
/* 레이아웃 */
	.fixed-top {height: 100px;background-color: rgb(249, 196, 94);}
	 body {background-color: #fff5d2;}
	.py-5 {background-color: rgb(249, 196, 94);position:static;bottom:0;width: 100%;}
	html {font-family: 'Spoqa Han Sans',sans-serif;}
/* 버튼css */
	.btnYellow {background-color: rgb(249, 196, 94);border:none;}
	.btnRed {background-color: #ff8080; border:none;}
	.btnGray {background-color: #EDEDED;border:none;}
	.bSamll {width:70px; height: 30px;}
	.bMedium {width: 150px; height: 60px; font-weight: bold;}
	.bBig {width: 200px; height: 120px; font-weight: bold;}
	.fcolor {color: #444;font-weight: bold;}
/* left */
	* {margin: 0;padding: 0;}
	body {margin: 20px auto;}
	li {list-style: none;}
/* lnb */
	#lnb {position:fixed;width:370px;display: inline-block;float: left; margin-top: 20px;}
	#lnb h1 {height: 40px;text-align: center;font-size: 20px;line-height: 1.8;letter-spacing: -2px;background-color: rgb(249, 196, 94);}
	#lnb>ul>li {border-bottom: 1px solid #dcdcdc;}
	#lnb>ul>li>a {display: block;padding: 14px 35px 14px 15px;color: inherit;font-size: 14px;background: #f5f2ec
			url(https://t1.daumcdn.net/cfile/tistory/2417E04D570C5C0225) no-repeat
			95% 15px;}
	#lnb>ul>li a:hover {color: #d91c1b;background-color: #f5f2ec;}
	#lnb>ul>li.on>a {color: #d91c1b;background: #f5f2ec url('https://t1.daumcdn.net/cfile/tistory/257B794F570C5C0D1A') no-repeat 95% 14px;}
	#lnb>ul>li ul {display: none;}
	#lnb>ul>li>ul>li>a {display: block;padding: 0 25px 14px 14px;color: #inherit;font-size: 12px;background: #f5f2ec url('https://t1.daumcdn.net/cfile/tistory/2417E04D570C5C0225') no-repeat 95% 1px;}
	#lnb>ul>li>ul>li>a {color: #d91c1b;background-color: #f5f2ec;}
	#lnb>ul>li>ul>li.on a {color: #d91c1b;background: #f5f2ec url('https://t1.daumcdn.net/cfile/tistory/257B794F570C5C0D1A') no-repeat 95% 3px;}
	#lnb>ul>li>ul li ul {display: none;padding-bottom: 8px;background-color: #f5f2ec;}
	#lnb>ul>li>ul li li a {display: block;padding: 0 25px 10px 22px;color: #666;font-size: 12px;background-color: #f5f2ec;}
	#lnb>ul>li>ul>li li a:hover {color: #d91c1b;}
	#lnb>ul li.noDepth a {background-image: none !important;}
	.w3-margin-top {margin-top: 16px!important;display: inline-block;width: 100%;margin-left: 490px;}
	.left_div {margin-top: 50px;}
	.center_div {margin-top: 50px;margin-left: 490px;min-height:690px;}
	
</style>

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.html">Start Bootstrap</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="about.html">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="services.html">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">Contact</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Portfolio
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="portfolio-1-col.html">1 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-2-col.html">2 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-3-col.html">3 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-4-col.html">4 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Blog
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
              <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
              <a class="dropdown-item" href="blog-post.html">Blog Post</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Other Pages
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
              <a class="dropdown-item" href="full-width.html">Full Width Page</a>
              <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
              <a class="dropdown-item" href="faq.html">FAQ</a>
              <a class="dropdown-item" href="404.html">404</a>
              <a class="dropdown-item" href="pricing.html">Pricing Table</a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="left_div" align="left">
	  <tiles:insertAttribute name="left"/>
  </div>
  
  <div class="center_div"> 
  <tiles:insertAttribute name="body"/> <!-- body -->
  </div>
  <!-- /.container -->

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/main/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
</body>
  <!-- Footer -->
 <footer class="py-5">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>

</html>
