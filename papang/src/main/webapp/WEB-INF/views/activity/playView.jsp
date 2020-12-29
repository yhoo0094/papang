<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/active/css/cookList.css"/>
<style>
	.cook_content{background-color:rgb(249, 196, 94);width: 70%; border-radius: 10px;margin: 40px 10px 10px 170px;height: 100%;}
	.cView_title{height: 120px;padding:20px;}
	/* .cView_image{height: 430px;} */
	.cView_comment{height:220px;padding: 0 0 20px 0px;margin: 0px 10px 10px 0px;border-radius: 10px;font-size: 20px;height: 100%;}
	.comment{height: 30px;font-size: 18px;height: 100%;}
	.c_title{display: inline-block;font-size: 30px;}
	.c_star{display:inline-block;font-size: 25px;}
	._image{width: 410px;height: 420px;border-radius: 10px;}
	.comm_title{margin: 50px 10px 10px 170px;font-weight: bold;font-size: 30px;}
	.comm_div{margin: 5px 10px 10px 170px;width: 70%;height: 100%;}
	.comment>img{width: 180px;height: 180px;}
    padding: 20px 20px 20px 20px;}
    .comm_btn_div{margin-top:20px;}
    .btnRed{font-size: 18px;}
    .comm_how{font-weight: bold;font-size: 20px;margin: 0px 10px 10px 180px;}
    .cView_image{height: 100%;padding-bottom: 30px;}
 
 /* 테스트  */
    .comm_content{background-color: rgb(249, 196, 94);
    width: 70%;
    border-radius: 10px;
    margin: 10px 10px 10px 170px;
    height: 100%;
    padding: 20px 20px 20px 20px;
    border:1px solid black;
}

.comm_img{width: 270px;height: 270px;display: inline-block;}
.commtext{height: 270px;
    width: 620px;
    border-radius: 0 8px 8px 0;
    border: none;}
.comm_imgdiv{display: inline-block;float: left;}    
.comm_btn_div{margin: 20px 0 0 0;}
</style>
</head>
<body>
<div>
	<div class="Bigtitle">아빠와 놀아요 > 따라해보세요</div>
	<div class="cook_content">
		<div class="cView_title">
			<p class="c_title">꼭꼭숨어라 머리카락보인다 ${playVO.play_title}</p>
			<p class="c_star">	&#128512;&#128512;&#128512;&#128512;&#128512; DBVALUE</p>
		</div>
		<div class="cView_image" align="center">
		     ${playVO.play_content}
			 <%-- <img class="_image" src="${pageContext.request.contextPath}/resources/images/active/playexam.JPG"> --%> 
		</div>
	</div>
	
	<p class="comm_title">후기</p>
	<div class="comm_div">
		<div class="comment">
			<img src="${pageContext.request.contextPath}/resources/images/active/${actcommList.ac_pic}">
			<img src="${pageContext.request.contextPath}/resources/images/active/playexam.JPG">
			<img src="${pageContext.request.contextPath}/resources/images/active/playexam.JPG">
			<img src="${pageContext.request.contextPath}/resources/images/active/playexam.JPG">
			<img src="${pageContext.request.contextPath}/resources/images/active/playexam.JPG">
		</div> 
	</div>
	
	<p class="comm_title">후기작성</p>
	<div class="comm_content">
		<div class="comm_imgdiv">
			<input class="comm_img" type="file">
		</div>
		<textarea class="commtext">
		</textarea>
		<div class="comm_btn_div"align="center">
	 	<button class="btnRed bMedium">후기등록</button>
	 </div>
	</div>
	
	
	<!-- 화면 끝 -->
</div>
</body>
</html>