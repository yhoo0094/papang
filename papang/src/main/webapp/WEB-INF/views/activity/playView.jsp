<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/active/css/cookList.css" />
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous"/>
<style>
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
.cook_content {
	background-color: rgb(249, 196, 94);
	width: 70%;
	border-radius: 10px;
	margin: 40px 10px 10px 170px;
	height: 100%;
}

.cView_title {
	height: 120px;
	padding: 20px;
	display: inline-block; 	
}

.cView_comment {
	height: 220px;
	padding: 0 0 20px 0px;
	margin: 0px 10px 10px 0px;
	border-radius: 10px;
	font-size: 20px;
	height: 100%;
}

.comment {
	height: 30px;
	font-size: 18px;
	height: 100%;
	display: inline-block;
}

.c_title {
	display: inline-block;
	font-size: 30px;
}

.c_star {
	display: inline-block;
	font-size: 25px;
}

._image {
	width: 410px;
	height: 420px;
	border-radius: 10px;
}

.comm_title {
	margin: 50px 10px 10px 170px;
	font-weight: bold;
	font-size: 30px;
}

.comm_div {
	margin: 5px 10px 10px 170px;
	width: 70%;
	height: 100%;
}

.comment>img {
	width: 180px;
	height: 180px;
}

padding
:
 
20px
 
20px
 
20px
 
20px
;
}
.comm_btn_div {
	margin-top: 20px;
}

.btnRed {
	font-size: 18px;
}

.comm_how {
	font-weight: bold;
	font-size: 20px;
	margin: 0px 10px 10px 180px;
}

.cView_image {
	height: 100%;
	padding-bottom: 30px;
}

.comm_content {
	background-color: rgb(249, 196, 94);
	width: 70%;
	border-radius: 10px;
	margin: 10px 10px 10px 170px;
	height: 100%;
	padding: 20px 20px 20px 20px;
	border: 1px solid black;
}

.comm_img {
	width: 270px;
	height: 270px;
	display: inline-block;
}

.commtext {
	height: 270px;
	width: 620px;
	border-radius: 0 8px 8px 0;
	border: none;
}

.comm_imgdiv {
	display: inline-block;
	float: left;
}

.comm_btn_div {
	margin: 20px 0 0 0;
}

.star {
	width: 30px;
	height: 30px;
}

.starp, .star_div {
	display: inline-block;
}

.c_star {
	visibility: hidden;
}

@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

h1[alt="Simple"] {
	color: white;
}

a[href], a[href]:hover {
	color: grey;
	font-size: 0.5em;
	text-decoration: none
}

.starrating>input {
	display: none;
} /* Remove radio buttons */
.starrating>label:before {
	content: "\f005"; /* Star */
	margin: 2px;
	font-size: 8em;
	font-family: FontAwesome;
	display: inline-block;
}

.starrating>label {
	color: #EDEDED; /* Start color when not clicked */
}

.starrating>input:checked ~ label {
	color: #ffca08;
} /* Set yellow color when star checked */
.starrating>input:hover ~ label {
	color: #ffca08;
} /* Set yellow color when star hover */
.starrating>label:before {
	font-family: FontAwesome;
}

.container {
	font-family: FontAwesome;
}
</style>
<script>
$(()=>{
	var starNum =$('.c_star').text()
	var addDiv = $('.star_div')
	for(var i=0;i<starNum;i++){
		addDiv.append('<img class="star" src="${pageContext.request.contextPath}/resources/images/active/star.png">')
    }
	acInsert();
	
	});
//후기 등록 요청
function acInsert() {
	//등록 버튼 클릭
	$('#btnInsert').on('click', function() {
		var form = $('#form1')[0];
   		var formData = new FormData(form);
		$.ajax({
			url : "../acInsert",
			type : 'POST',
			dataType : 'json',
			data : formData,
			contentType : false,
		    processData : false ,
			success : function(response) {
				if (response.result == true) {
					window.history.back();
					//nqList();
					//location.reload();
					$('#form1').each(function() {
						this.reset();
						//$('#la').html("선택한 파일 없음");
						alert("등록되었습니다");
					});
				}
			},
			error : function(xhr, status, message) {
				alert("status: " + status + " er:" + message);
			}
		});
	});//등록 버튼 클릭
}//후기Insert


</script>
</head>
<body>
	<div>
		<h3>아이디: ${user.mbr_id}</h3>
		<div class="Bigtitle">아빠와 놀아요 > 따라해보세요</div>
		<div class="cook_content">
			<div class="cView_title">
				<div class="c_title" id="c_title">${playVO.play_title}</div>
				<div class="c_star" id="c_star">${acrate.ROUNDRATE}</div>
			</div>
			<div class="star_div"></div>
			<div class="cView_image" align="center" id="cView_image">${playVO.play_content}
			</div>
		</div>

		<p class="comm_title">후기</p>

		<div class="comm_div">
			<c:forEach items="${actcommList}" var="actcomm">
				<div class="comment">
					<img
						src="${pageContext.request.contextPath}/images/actCom/${actcomm.ac_pic}">
				</div>
			</c:forEach>
		</div>


		<p class="comm_title">후기작성</p>
		
		<form id="form1">
		<div class="comm_content">
		<input id="pc_no" name="pc_no" type="hidden" value="${playVO.play_no}">
			<div class="comm_imgdiv">
				<input class="comm_img" type="file" name="uploadFile">
				<input type="hidden" value="${user.mbr_id}" name="mbr_id">
			</div>
			<textarea class="commtext" name="ac_content">
		</textarea>
		
				<div class="container" id="starDiv">
			<div
				class="starrating risingstar d-flex justify-content-center flex-row-reverse">
				<input type="radio" id="star5" name="ac_rate" value="5" />
				<label for="star5" title="5 star"></label>
				<input type="radio" id="star4" name="ac_rate" value="4" />
				<label for="star4" title="4 star"></label>
				<input type="radio" id="star3" name="ac_rate" value="3" />
				<label for="star3" title="3 star"></label>
				<input type="radio" id="star2" name="ac_rate" value="2" />
				<label for="star2" title="2 star"></label>
				<input type="radio" id="star1" name="ac_rate" value="1" />
				<label for="star1" title="1 star"></label>
			</div>
		</div>
			<div class="comm_btn_div" align="center">
				<button type="submit" class="btnRed bMedium" id="btnInsert">후기등록</button>
			</div>
		</div>
		</form>
		<!-- 화면 끝 -->
	</div>

</body>
</html>