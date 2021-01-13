<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
	.center_div{
		display: none;
	}

</style>

</head>
<body>
	
	<header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <c:forEach  var="banner" items="${bannerlist}" varStatus='i'>
 		<c:if test="${banner.ban_category eq '이미지슬라이드'}">
        <li data-target="#carouselExampleIndicators" data-slide-to="${i.index+1}"></li>
        </c:if>
        </c:forEach>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active"  style="background-image: url('${pageContext.request.contextPath}/resources/images/Banner/상단배너1.jpg')">
       
          <div class="carousel-caption d-none d-md-block">
            <h3>First Slide</h3>
            <p>This is a description for the first slide.</p>
          </div>
        </div>
    	<c:forEach  var="banner" items="${bannerlist}">
    	<c:if test="${banner.ban_category eq '이미지슬라이드'}">
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div onclick="location.href='${banner.ban_link}'" class="carousel-item" style="background-image: url('${pageContext.request.contextPath}/resources/images/Banner/${banner.ban_pic}')">
          <div class="carousel-caption d-none d-md-block">
           <%--  <h3>${banner.ban_pic_name}</h3> --%>
          </div>
        </div>
        </c:if>
        </c:forEach>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">

    <h1 class="my-4">파파존스 서비스를 소개합니다</h1>

    <!-- Marketing Icons Section -->
    <div class="row">
    
    
      <div class="col-lg-4 mb-4"  align="center">
       <figure class="snip1200">
		  		  <img src="${pageContext.request.contextPath}/resources/images/main/메인미니1.png" />
		  <figcaption>
		    <p>어머니의 마음과 전문가의 
		    <br/>
		    손길이 함게합니다.
            <br/>
             	파파존스는 언제 어디서나
            <br/>
             	 우리아이들과
             <br/>	
             	 행복한 돌봄을 만들어 갑니다!</p>
		    <div class="heading">
		      <h2>시터<span> 서비스</span></h2>
		    </div>
		  </figcaption>
		  <a href="#"></a>
		</figure>
      </div>
      
      
      <div class="col-lg-4 mb-4"  align="center">
            <figure class="snip1200">
					  <img src="${pageContext.request.contextPath}/resources/images/main/미니메인2.jpg" />
			  <figcaption>
			    <p>엄마의 마음으로, 
	            <br/>
	            우리아이가 안전한 세상을 꿈꿉니다.
	            <br/>
	            100% 순면제작, 무형광 
	            <br/>
	            제품을 만나보세요</p>
			    <div class="heading">
			      <h2>파파존스<span> SHOP</span></h2>
			    </div>
			  </figcaption>
			  <a href="#"></a>
			</figure>
      </div>
      
      
      <div class="col-lg-4 mb-4"  align="center">
            <figure class="snip1200">
			  <img src="${pageContext.request.contextPath}/resources/images/main/미니메인3.jpg" />
			  <figcaption>
			    <p>새로운 놀이 아이디어가 필요할 때.
            	<br/>
            	놀면서 아이 성장발달을 
            	<br/>
            	도와주고 싶을 때. 
            	<br/>
            	파파존스의 놀이 패키지를
            	 <br/>
            	 만나보세요!</p>
			    <div class="heading">
			      <h2>육아대디<span> 첫 걸음</span></h2>
			    </div>
			  </figcaption>
			  <a href="#"></a>
			</figure>
      </div>
      
    </div>
    <!-- /.row -->

<hr/>
    <!-- Portfolio Section -->
    <h2 class="fontTitle">파파존스 SHOP</h2>

    <div class="row">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project One</a>
            </h4>
            <p class="card-text">
          dddddddddddddddddddd
            </p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Two</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Three</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Four</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Five</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Six</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->


<hr/>
    <!-- Features Section -->
    <div class="row">
      <div class="col-lg-6">
        <h2>Modern Business Features</h2>
        <p>The Modern Business template by Start Bootstrap includes:</p>
        <ul>
          <li>
            <strong>Bootstrap v4</strong>
          </li>
          <li>jQuery</li>
          <li>Font Awesome</li>
          <li>Working contact form with validation</li>
          <li>Unstyled page elements for easy customization</li>
        </ul>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
      </div>
      <div class="col-lg-6">
        <img class="img-fluid rounded" src="http://placehold.it/700x450" alt="">
      </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Call to Action Section -->
    <div class="row mb-4">
      <div class="col-md-8">
        <p>대구광역시 중구 국채보상로 537 5층  |   대표번호 : (053)421-2460 |  사업자번호 : 573-33-00097  | 
			<br>
	  		신고번호 제2021-3219632   |   대표: 강은선 김상민 문선애 조영래 최재영
  		</p>
      </div>
      <div class="col-md-4">
        
        <a class="btn" href="#"><img class="topnav" src="${pageContext.request.contextPath}/resources/images/main/topnav.png"/></a>
      </div>
    </div>

  </div>
  </body>
</html>