<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/active/css/cookList.css"/>
<link rel = "preconnect"href = "https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<style>
	.cook_content{background-color:rgb(249, 196, 94);width: 70%; border-radius: 10px;margin: 40px 10px 10px 170px;height: 100%;}
	.cView_title{height: 120px;padding:20px;}
    .btnRed{font-size: 18px;}
    .in_title{border: none;width: 100%;height: 30px;border-radius: 5px;}
</style>

<body>
<!-- 전체 div 시작 -->
<div>
	<div class="Bigtitle">아빠와 요리해요 > 글 등록</div>	
		<div class="cook_content">
		
		<div class="cView_title">
			<input class="in_title">
		</div>
		<div>
			<textarea id="summernote"
							class="communityFormTxtarea" rows="20" cols="102" name="comm"></textarea>
		</div>
	</div>
</div>
<!--전체 div 끝 --> 


<script>
		//여기 아래 부분
		$('#summernote').summernote({
			height : 500, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
		});
	</script>
</body>
</html>