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
  <script>
$(() => {
	
	/* 장터 단건조회 페이지 이동 */
	$('.mainBox').on('click',function() {
		var prono=$(this).find('.pro_no').text(); 
		location.href= "${pageContext.request.contextPath}/market/itemDetail?pro_no="+prono;
		
	});
	/* 서비스소개 활동 연결 */
	$('.mainact').on('click',function() {
		location.href= "${pageContext.request.contextPath}/activity/playList";
	});
	
	/* 서비스소개 마켓 연결 */
	$('.mainmarket').on('click',function() {
		location.href= "${pageContext.request.contextPath}/marketList/itemBoard";
		});
		
	/* 서비스소개 시터 연결 */
	$('.mainsit').on('click',function() {
		location.href= "${pageContext.request.contextPath}/sitter/board";
	});
	
	
	
});

</script>

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
    
    
      <div class="col-lg-4 mb-4 mainsit"  align="center">
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
		</figure>
      </div>
      
      
      <div class="col-lg-4 mb-4 mainmarket"  align="center">
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
			</figure>
      </div>
      
      
      <div class="col-lg-4 mb-4 mainact"  align="center">
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
			</figure>
      </div>
      
    </div>
    <!-- /.row -->

<hr/>
    <!-- Portfolio Section -->
    <h2 class="fontTitle">파파존스 SHOP</h2>
	
    <div class="row">
    <c:forEach items="${products}" var="product">
      <div class="col-lg-4 col-sm-6 portfolio-item mainBox">
        <div class="card h-100">
        <p class="pro_no">${product.pro_no}</p>
          <a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/market/${product.pro_pic}" alt="상품 사진이없습니다"></a>
          <div class="card-body">
          
          <div class="proNameDiv">
            <h4 class="card-title">
              <a class="card_title2" href="#">${product.pro_name}</a>
            </h4>
         </div>
          
          <div class="proPriceDiv">
            <p class="card-text">
       		 &#8361;${product.pro_price}
            </p>
          </div>
            
          </div>
        </div>
      </div>
	</c:forEach>
    </div>
    <!-- /.row -->


<hr/>
    <!-- Features Section -->
    <div class="row">
      <div class="col-lg-6">
        <h2>서비스 소개</h2>
        <p>파파존스는 고객님의 편리를 위해 항상 노력하겠습니다.</p>
        <ul>
          <p><strong>주요 서비스</strong></p>
          <li>베이비시터 예약</li>
          <li>파파존스 SHOP</li>
          <li>육아 정보</li>
          <li>육아 예방접종 일지 캘린더</li>
        </ul>
        <p>믿고 맏길 수 있는 베이비시터 서비스 제공. 100% 순면 무형광 제작된 파파존스 핸드메이드 상품 판매.초보 육아대디를 위한 유용한 정보 제공.육아 예방접종 일지 등록 제공.</p>
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