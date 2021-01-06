<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/active/css/cookList.css"/>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous"/>

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
	padding: 30px;
}

.comm_img {
	    width: auto;
    height: auto;
	display: inline-block;
}

.commtext {height: 300px;width: 570px;border-radius: 0 8px 8px 0;border: none;}

.comm_imgdiv {
	display: inline-block;
	float: left;
}

.comm_btn_div {
	margin: 20px 0 0 0;
}

.img{width: auto;height: auto;}
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

/* h1[alt="Simple"] {
	color: white;
}

a[href], a[href]:hover {
	color: grey;
	font-size: 0.5em;
	text-decoration: none
} */

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
.back{color: rgb(249, 196, 94);font-size: 35px;font-weight: bold;}
.back:focus, .back:hover {
    color:  rgb(238, 140, 140);
    text-decoration: none;
}
.btnDiv{margin: 30px 0 0 0;}
.btnUpdate{margin-left: 10px;}
body {background-color: #fff5d2;}
</style>
<script>
$(()=>{
	var starNum =$('.c_star').text();
	var addDiv = $('.star_div');
	for(var i=0;i<starNum;i++){
		addDiv.append('<img class="star" src="${pageContext.request.contextPath}/resources/images/active/star.png">')
    }
	
	cacInsert();
	//후기 사진 바로 띄우기

	$("#uf").on('change',function(e) {
		var files = e.target.files;
		var arr = Array.prototype.slice.call(files);
			for (var i = 0; i < files.length; i++) {    
				if (!checkExtension(files[i].name, files[i].size)) {
						return false;
				}
			}
		preview(arr);

	});
	/* var a = ${actcommList}
	if(a.length ==0) {
		$('#test').css('display','none'); */
	//}
	


//후기 사진 바로 띄우기
function checkExtension(fileName, fileSize) {
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 20971520; //20MB

			if (fileSize >= maxSize) {
				alert('파일 사이즈 초과');
				$("input[type='file']").val(""); //파일 초기화
				return false;
			}

			if (regex.test(fileName)) {
				alert('업로드 불가능한 파일이 있습니다.');
				$("input[type='file']").val(""); //파일 초기화
				return false;
			}
			return true;
		}

		function preview(arr) {arr.forEach(function(f) {
						//파일명이 길면 파일명...으로 처리
						var fileName = f.name;
						if (fileName.length > 10) {
							fileName = fileName.substring(0, 7) + "...";
						}
						//div에 이미지 추가
						var str = '<div style="display: inline-flex; padding: 10px;"><li>';
						str += '<span>' + fileName + '</span><br>';
						//이미지 파일 미리보기
						if (f.type.match('image.*')) {
							var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
							reader.onload = function(e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
								//str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
								$('#img').attr('src', e.target.result);
								$('#img').attr('style','width:300px; height: 300px');
							}
							reader.readAsDataURL(f);
						} else {
							$('#img').attr('src', e.target.result);
							$('#img').attr('style','width:300px; height:300px');
						}
					});//arr.forEach
					}		
		});	
			
	
//후기 등록 요청
function cacInsert() {
	//등록 버튼 클릭
	$('#btnInsert').on('click', function() {
		var form = $('#form1')[0];
   		var formData = new FormData(form);
		$.ajax({
			url : "../cacInsert",
			type : 'POST',
			dataType : 'json',
			data : formData,
			contentType : false,
		    processData : false ,
			success :function(vo) {
				/* console.log(vo) */		
				location.href="${pageContext.request.contextPath}/activity/cookView?cook_no="+${cookVO.cook_no}
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
	<div class="Bigtitle"><a class="back" href="${pageContext.request.contextPath}/activity/cookList">아빠와 요리해요</a> > 따라해보세요</div>
	<div class="cook_content">
		<div class="cView_title">
			<p class="c_title">${cookVO.cook_title}</p>
			<p class="c_star">	&#128512;&#128512;&#128512;&#128512;&#128512; DBVALUE</p>
		</div>
		<div class="cView_image" align="center" id="cView_image">${cookVO.cook_content}
		</div>
	</div>
	<div class="btnDiv" align="center">
			<c:if test="${user.mbr_id eq cookVO.mbr_id}">
						<button type="button" class="btnGray bMedium btnDelide" id="btnInsert1">삭제</button>
						<button type="button" class="btnRed bMedium btnUpdate" id="btnInsert2">수정</button>
			</c:if>
		</div>
		
		
		<%-- <div id="test">
		<p class="comm_title">후기</p>
		<div class="comm_div">
			<c:forEach items="${actcommList}" var="actcomm">
				<div class="comment">
					<img
						src="${pageContext.request.contextPath}/images/actCom/${actcomm.ac_pic}">
				</div>
			</c:forEach>
			</div>
		</div>--%>
	
	<p class="comm_title">후기작성</p>
		
		<form id="form1">
			<div class="comm_content">
			 <input id="pc_no" name="pc_no" type="hidden" value="${cookVO.cook_no}">
				<div class="comm_imgdiv">
					<img id="img" class="sitterProfileImg" style="width:300px; height: 300px;">
				</div>
				<input type="hidden" value="${user.mbr_id}" name="mbr_id">
				<input type="hidden" value="${cookVO.cook_no}" name="ac_no">
				<input type="hidden" value="${cookVO.cook_category}" name="ac_category">
				<textarea class="commtext" name="ac_content"></textarea>
			<input class="comm_img"  type="file" name="uploadFile" id="uf"> 
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
					<button type="button" class="btnRed bMedium" id="btnInsert">후기등록</button>
				</div>
			</div>
		</form>
	<!-- 화면 끝 -->
</div>
</body>
</html>