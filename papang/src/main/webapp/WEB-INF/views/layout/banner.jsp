<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

.w-100 {
	height: 600px;
    width: 80%;
	
	<!-- 슬라이드 사진크기 -->
	display: block;
}
.w-101 {
	height: 400px;
    width: 40%;
    float: left;
	
	<!-- 슬라이드 사진크기 -->
	display: block;
}
.carousel-control-prev1 {
    left: 0;
}
.carousel-control-next1 {
    right: 0;
}
.carousel-control-next1, .carousel-control-prev1 {
    position: absolute;
    top: 0;
    bottom: 0;
    z-index: 1;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    width: 25%;
    color: #fff;
    text-align: center;
    opacity: 0.5;
    transition: opacity .15s ease;
}
.carousel-inner1 {
	position: relative;
    width: 100%;
    overflow: hidden;
    left: 190px;
}
.a {
	width:300px; 
	height:450px;  
	float:left;
	background-color: black;
	text-align: center;
	color: white;
	border: none;
}
h1 {
	font-size: 45px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
}

.carousel-inner{
	margin-top: 5%;
	float:right;
	width:10%;
	height:700px;
	margin-right: 40px;
}	
.carousel-inner {
     width: 10% !important;
}
</style>
 
</head>
<body>
	<!-- 첫번째 슬라이드 -->

	<div align="center" id="carouselExampleControls" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<c:forEach items="${bannerlist}" var="banner" varStatus='i'>
				<c:if test="${i.index eq 0 }">
					<div class="carousel-item active">
					<a href="${pageContext.request.contextPath}/marketList/itemBoard">
						<img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/Banner/사이드배너1.png">
					</a>
					</div>
				</c:if>
				<c:if test="${i.index ne 0 && banner.ban_category eq '사이드배너'}">	
					<div class="carousel-item">
					 <a href="${banner.ban_link}"><img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/Banner/${banner.ban_pic}"></a>	
					</div>
				</c:if> 
				 	
			</c:forEach>
		
	</div>
	
		<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"> 
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
			<span class="sr-only">Previous</span>
		</a> 
		<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"> 
			<span class="carousel-control-next-icon" aria-hidden="true"></span> 
			<span class="sr-only">Next</span>
		</a>
	</div>
	
	
</body>
</html>